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

public partial class dashboard_call_logs : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        MembershipUser currentUser = Membership.GetUser();
        Guid currentUserId = (Guid)currentUser.ProviderUserKey;

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                string sql = "SELECT [CallDate], [Duration], [CallTime], [CallerLineIdentity] FROM [Calllogs] WHERE Calllogs.NonChargedParty = (SELECT PhoneNumber FROM User_Details WHERE User_Details.UserID = @currentUserId)";
                cmd.CommandText = sql;
                cmd.Parameters.AddWithValue("@currentUserId", Membership.GetUser().ProviderUserKey);

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

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }

    protected void gridViewSorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dataTable = GridView1.DataSource as DataTable;
        string sortExpression = e.SortExpression;
        string direction = string.Empty;

        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);

            if (SortDirection == SortDirection.Ascending)
            {
                SortDirection = SortDirection.Descending;
                direction = " DESC";
            }
            else
            {
                SortDirection = SortDirection.Ascending;
                direction = " ASC";
            }

            DataTable table = GridView1.DataSource as DataTable;
            table.DefaultView.Sort = sortExpression + direction;

            GridView1.DataSource = table;
            GridView1.DataBind();

        }
    }

    public SortDirection SortDirection
    {
        get
        {
            if (ViewState["SortDirection"] == null)
            {
                ViewState["SortDirection"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["SortDirection"];
        }
        set
        {
            ViewState["SortDirection"] = value;
        }
    }
}