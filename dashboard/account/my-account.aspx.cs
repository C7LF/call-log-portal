using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_account_my_account : BasePage
{
    public string constrr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(constrr))
        {
            string result = "SELECT PhoneNumber FROM User_Details WHERE User_Details.UserID = @currentUserId";
            SqlCommand showresult = new SqlCommand(result, conn);
            showresult.Parameters.AddWithValue("@currentUserId", Membership.GetUser().ProviderUserKey);

            conn.Open();
            LblPhoneNumber.Text = showresult.ExecuteScalar().ToString();
            conn.Close();
        }
    }


}
