using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LabelYD1.Text = getYesterdaysDate();
        LabelYD2.Text = getYesterdaysDate();
        LabelYD3.Text = getYesterdaysDate();
        LabelYD4.Text = getYesterdaysDate();


        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        MembershipUser currentUser = Membership.GetUser();
        Guid currentUserId = (Guid)currentUser.ProviderUserKey;

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                string sql = "SELECT [CallDate], [Duration], [CallTime], [CallerLineIdentity] FROM [Calllogs] WHERE Calllogs.NonChargedParty = (SELECT PhoneNumber FROM User_Details WHERE User_Details.UserID = @currentUserId) AND [CallDate] = @prevday";
                cmd.CommandText = sql;
                cmd.Parameters.AddWithValue("@currentUserId", Membership.GetUser().ProviderUserKey);
                cmd.Parameters.AddWithValue("@prevday", DateTime.Today.AddDays(-2));

                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        int count = 0;
        using (SqlConnection connection = new SqlConnection(constr))
        {
            using (SqlCommand cmd2 = new SqlCommand())
            {
                string sql2 = "SELECT COUNT(*) FROM [Calllogs] WHERE Calllogs.NonChargedParty = (SELECT PhoneNumber FROM User_Details WHERE User_Details.UserID = @currentUserId) AND [CallDate] = @prevday";
                cmd2.CommandText = sql2;
                cmd2.Parameters.AddWithValue("@currentUserId", Membership.GetUser().ProviderUserKey);
                cmd2.Parameters.AddWithValue("@prevday", DateTime.Today.AddDays(-2));
                cmd2.Connection = connection;
                connection.Open();
                count = (int)cmd2.ExecuteScalar();
                LabelTN1.Text = count.ToString();
            }
        }

        int countMissed = 0;
        foreach(GridViewRow row in GridView1.Rows)
        {

            if (Convert.ToInt32(row.Cells[2].Text.ToString()) <= 12)
            {
                countMissed++;
            }
        }
        LabelTN3.Text = countMissed.ToString();

        var distinctRows = (from GridViewRow row in GridView1.Rows
                            select row.Cells[0].Text.ToString()
                   ).Distinct().Count();
        LabelTN2.Text = distinctRows.ToString();
    }


    public string getYesterdaysDate()
    {

            String ydd = DateTime.Today.AddDays(-2).ToString("dd-MM-yyyy");
            return ydd;

    }
}