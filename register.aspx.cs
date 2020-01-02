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

public partial class register : System.Web.UI.Page
{

    public string constrr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        MembershipUser NewUser = Membership.GetUser(CreateUserWizard1.UserName);
        Guid newuserid = (Guid)NewUser.ProviderUserKey;

        TextBox PhoneNumber = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("PhoneNumber");

        using(SqlConnection myConnection = new SqlConnection(constrr))
        {
            SqlCommand mycommand = new SqlCommand("new_user", myConnection);
            mycommand.CommandType = CommandType.StoredProcedure;

            mycommand.Parameters.Add("@PhoneNumber", SqlDbType.VarChar).Value = PhoneNumber.Text;
            mycommand.Parameters.Add("@userid", SqlDbType.UniqueIdentifier).Value = newuserid;

            myConnection.Open();
            mycommand.ExecuteNonQuery();
            myConnection.Close();
        }

    }
}