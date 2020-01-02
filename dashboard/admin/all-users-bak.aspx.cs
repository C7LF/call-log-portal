using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class dashboard_admin_all_users : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.SearchCustomers();
        }
    }
    private void SearchCustomers()
    {
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                string sql = "SELECT UserName, PhoneNumber FROM aspnet_Users, User_Details WHERE aspnet_Users.UserId = User_Details.UserID";
                if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                {
                    sql += " AND UserName LIKE @UserName + '%'";
                    cmd.Parameters.AddWithValue("@UserName", txtSearch.Text.Trim());
                }
                cmd.CommandText = sql;
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
    }
    protected void Search(object sender, EventArgs e)
    {
        this.SearchCustomers();
    }
}