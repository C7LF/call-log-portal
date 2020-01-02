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
                string sql = "SELECT aspnet_Users.UserId, UserName, PhoneNumber FROM aspnet_Users, User_Details WHERE aspnet_Users.UserId = User_Details.UserID";
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

    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        this.SearchCustomers();
    }

    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        String UserId = GridView1.DataKeys[e.RowIndex].Value.ToString();
        string name = (row.FindControl("txtUserName") as TextBox).Text;
        string phone = (row.FindControl("txtPhoneNumber") as TextBox).Text;
        string query = "UPDATE User_Details SET PhoneNumber=@PhoneNumber WHERE User_Details.UserID=@UserId";
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Parameters.AddWithValue("@UserId", UserId);
                cmd.Parameters.AddWithValue("@PhoneNumber", phone);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        GridView1.EditIndex = -1;
        this.SearchCustomers();
    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridView1.EditIndex = -1;
        this.SearchCustomers();
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
        {
            (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
        }
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.SearchCustomers();
    }

}