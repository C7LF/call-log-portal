using Renci.SshNet;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_dashboard : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string GetActive()
    {
        return System.IO.Path.GetFileNameWithoutExtension(System.Web.HttpContext.Current.Request.Url.AbsolutePath).ToLower();
    }

    public string constrr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

    protected void Button1_Click(object sender, EventArgs e)
    {
        var localPath = @HttpContext.Current.Server.MapPath("~/cdrs/");
        var keyFile = new PrivateKeyFile(@HttpContext.Current.Server.MapPath("~/path-to.ppk"), "password");
        var keyFiles = new[] { keyFile };
        var username = "username";

        var methods = new List<AuthenticationMethod>();
        methods.Add(new PasswordAuthenticationMethod(username, "password"));
        methods.Add(new PrivateKeyAuthenticationMethod(username, keyFiles));


        var con = new ConnectionInfo("ftphost", 22, username, methods.ToArray());
        using (var client = new SftpClient(con))
        {
            client.Connect();

            var files = client.ListDirectory("/Cdrs/");
            foreach (var file in files)
            {
                if (file.Name.Contains("Daily") && file.Name.Contains("SIP") && file.Attributes.LastWriteTime.Date == DateTime.Today.AddDays(-1).Date)
                {
                    if (!File.Exists(localPath + file.Name))
                    {
                        //Debug.WriteLine(file);
                        using (var fs = new FileStream(localPath + file.Name, FileMode.Create))
                        {
                       
                            client.DownloadFile(file.FullName, fs);
                            fs.Close();
                        }
                        ReadFiles();
                    } else
                    {
                        Debug.WriteLine("File Already Exists!");
                    }
                }
            }
            
            client.Disconnect();
        }
    }

    public void ReadFiles()
    {

        var directory = new DirectoryInfo(@HttpContext.Current.Server.MapPath("~/cdrs/"));
        var myFile = directory.GetFiles()
             .OrderByDescending(f => f.LastWriteTime)
             .First();


        // Read File
        using (SqlConnection conn = new SqlConnection(constrr))
        {
            conn.Open();
            using (SqlTransaction transaction = conn.BeginTransaction())
            {

                String insertCommand = @"INSERT INTO Calllogs (CallType, CallCauseDefinitionRequired, CustomerIdentifier, NonChargedParty, CallDate, CallTime, Duration, BytesTransmitted, BytesReceived, Description, Chargecode, TimeBand, Salesprice, SalespricePreBundle, Extension, DDI, GroupingID, CallClass, Carrier, Recording, VAT, CountryofOrigin, Network, RetailTariffCode, RemoteNetwork, APN, DivertedNumber, Ringtime, RecordID, Currency, CallerLineIdentity, NetworkAccessReference, NGCSAccessCharge, NGCSServiceCharge, TotalBytesTransferred, UserID, OnwardBillingReference, ContractName, BundleName, BundleAllowance, DiscountReference, RoutingCode) ";
                insertCommand += @"VALUES (@callType, @callCauseDefinitionRequired, @customerIdentifier, @nonChargedParty, @callDate, @callTime, @duration, @bytesTransmitted, @bytesReceived, @description, @chargeCode, @timeBand, @salesPrice, @salespricePreBundle, @extension, @ddi, @groupingID, @callClass, @carrier, @recording, @vat, @countryofOrigin, @network, @retailTariffCode, @remoteNetwork, @apn, @divertedNumber, @ringtime, @recordID, @currency, @callerLineIdentity, @networkAccessReference, @nGCSAccessCharge, @nGCSServiceCharge, @totalBytesTransferred, @userID, @onwardBillingReference, @contractName, @bundleName, @bundleAllowance, @discountReference, @routingCode)";

                String[] fileContent = File.ReadAllLines(myFile.FullName);
                fileContent = fileContent.Skip(1).ToArray();
                
                                using (SqlCommand command = conn.CreateCommand())
                                {
                                    command.CommandText = insertCommand;
                                    command.CommandType = CommandType.Text;
                                    command.Transaction = transaction;

                                    // with quote ,(?=(?:[^']*'[^']*')*[^']*$)
                                    // with quote ,(?=(?:[^']*'[^']*')*[^']*$)|\"(?= (?:[^ ']*'[^ ']*') *[^ ']*$)

                                    foreach (String dataLine in fileContent)
                                    {
                            
                                        String[] columns = Regex.Split(dataLine, "\"(?<=[\"])(?=(?:[^']*'[^']*')*[^']*$)+,(?=(?:[^']*'[^']*')*[^']*$)");
                                        // Debug.WriteLine(columns[41].Replace("\"", ""));
                                        command.Parameters.Clear();
                        
                        command.Parameters.Add("callType", SqlDbType.VarChar).Value = columns[0].Replace("\"", ""); 
                        command.Parameters.Add("callCauseDefinitionRequired", SqlDbType.Int).Value = Convert.ToInt32(columns[1].Replace("\"", "")); 
                        command.Parameters.Add("customerIdentifier", SqlDbType.VarChar).Value = columns[2].Replace("\"", ""); 
                        command.Parameters.Add("nonChargedParty", SqlDbType.VarChar).Value = columns[3].Replace("\"", ""); 
                        command.Parameters.Add("callDate", SqlDbType.DateTime).Value = Convert.ToDateTime(columns[4].Replace("\"", "")).ToShortDateString(); 
                        command.Parameters.Add("callTime", SqlDbType.Time).Value = TimeSpan.Parse(columns[5].Replace("\"", "")); 
                        command.Parameters.Add("duration", SqlDbType.Int).Value = Convert.ToInt32(columns[6].Replace("\"", "")); 
                        command.Parameters.Add("bytesTransmitted", SqlDbType.VarChar).Value = columns[7].Replace("\"", ""); 
                        command.Parameters.Add("bytesReceived", SqlDbType.VarChar).Value = columns[8].Replace("\"", ""); 
                        command.Parameters.Add("description", SqlDbType.VarChar).Value = columns[9].Replace("\"", ""); 
                        command.Parameters.Add("chargeCode", SqlDbType.VarChar).Value = columns[10].Replace("\"", ""); 
                        command.Parameters.Add("timeBand", SqlDbType.Int).Value = Convert.ToInt32(columns[11].Replace("\"", "")); 
                        command.Parameters.Add("salesPrice", SqlDbType.VarChar).Value = columns[12].Replace("\"", ""); 
                        command.Parameters.Add("salespricePreBundle", SqlDbType.VarChar).Value = columns[13].Replace("\"", ""); 
                        command.Parameters.Add("extension", SqlDbType.VarChar).Value = columns[14].Replace("\"", ""); 
                        command.Parameters.Add("ddi", SqlDbType.VarChar).Value = columns[15].Replace("\"", ""); 
                        command.Parameters.Add("groupingID", SqlDbType.VarChar).Value = columns[16].Replace("\"", ""); 
                        command.Parameters.Add("callClass", SqlDbType.VarChar).Value = columns[17].Replace("\"", ""); 
                        command.Parameters.Add("carrier", SqlDbType.VarChar).Value = columns[18].Replace("\"", ""); 
                        command.Parameters.Add("recording", SqlDbType.VarChar).Value = columns[19].Replace("\"", "");
                        command.Parameters.Add("vat", SqlDbType.VarChar).Value = columns[20].Replace("\"", ""); 
                        command.Parameters.Add("countryofOrigin", SqlDbType.VarChar).Value = columns[21].Replace("\"", ""); 
                        command.Parameters.Add("network", SqlDbType.VarChar).Value = columns[22].Replace("\"", ""); 
                        command.Parameters.Add("retailTariffCode", SqlDbType.VarChar).Value = columns[23].Replace("\"", ""); 
                        command.Parameters.Add("remoteNetwork", SqlDbType.VarChar).Value = columns[24].Replace("\"", ""); 
                        command.Parameters.Add("apn", SqlDbType.VarChar).Value = columns[25].Replace("\"", ""); 
                        command.Parameters.Add("divertedNumber", SqlDbType.VarChar).Value = columns[26].Replace("\"", ""); 
                        command.Parameters.Add("ringtime", SqlDbType.VarChar).Value = columns[27].Replace("\"", ""); 
                        command.Parameters.Add("recordID", SqlDbType.VarChar).Value = columns[28].Replace("\"", ""); 
                        command.Parameters.Add("currency", SqlDbType.VarChar).Value = columns[29].Replace("\"", ""); 
                        command.Parameters.Add("callerLineIdentity", SqlDbType.VarChar).Value = columns[30].Replace("\"", ""); 
                        command.Parameters.Add("networkAccessReference", SqlDbType.VarChar).Value = columns[31].Replace("\"", ""); 
                        command.Parameters.Add("nGCSAccessCharge", SqlDbType.VarChar).Value = columns[32].Replace("\"", ""); 
                        command.Parameters.Add("nGCSServiceCharge", SqlDbType.VarChar).Value = columns[33].Replace("\"", ""); 
                        command.Parameters.Add("totalBytesTransferred", SqlDbType.VarChar).Value = columns[34].Replace("\"", ""); 
                        command.Parameters.Add("userID", SqlDbType.VarChar).Value = columns[35].Replace("\"", ""); 
                        command.Parameters.Add("onwardBillingReference", SqlDbType.VarChar).Value = columns[36].Replace("\"", ""); 
                        command.Parameters.Add("contractName", SqlDbType.VarChar).Value = columns[37].Replace("\"", ""); 
                        command.Parameters.Add("bundleName", SqlDbType.VarChar).Value = columns[38].Replace("\"", ""); 
                        command.Parameters.Add("bundleAllowance", SqlDbType.VarChar).Value = columns[39].Replace("\"", ""); 
                        command.Parameters.Add("discountReference", SqlDbType.VarChar).Value = columns[40].Replace("\"", ""); 
                        command.Parameters.Add("routingCode", SqlDbType.VarChar).Value = columns[41].Replace("\"", "");

                        command.ExecuteNonQuery();
                        
                    }
                }
                                transaction.Commit();

                                // Read FIle End
                                
            }
        }
        Response.Redirect(Request.RawUrl);
    }
}
    

