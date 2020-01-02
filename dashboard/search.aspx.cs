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

public partial class dashboard_search : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ButtonDownload.Visible = false;
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }

    protected void searchCalls_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            try
            {
                Label1.Text = "";
                string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                MembershipUser currentUser = Membership.GetUser();
                Guid currentUserId = (Guid)currentUser.ProviderUserKey;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        string sql = "SELECT [CallDate], [Duration], [CallTime], [CallerLineIdentity] FROM [Calllogs] WHERE Calllogs.NonChargedParty = (SELECT PhoneNumber FROM User_Details WHERE User_Details.UserID = @currentUserId) AND Calllogs.CallDate = @inputdate";
                        cmd.CommandText = sql;
                        cmd.Parameters.AddWithValue("@currentUserId", Membership.GetUser().ProviderUserKey);
                        cmd.Parameters.AddWithValue("@inputdate", TextBox1.Text);

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
                if (GridView1.Rows.Count != 0)
                {
                    ButtonDownload.Visible = true;
                } else
                {
                    Label1.Text = "No Results found..";
                }
            }
            catch
            {
                Label1.Text = "No Results found.";
            }
            }
        else
        {
            Label1.Text = "Please enter a date";
            ButtonDownload.Visible = false;
        }
    }


    protected void ButtonDownload_Click(object sender, EventArgs e)
    {
        string filename = String.Format("Results_{0}_{1}.xls", DateTime.Today.Month.ToString(), DateTime.Today.Year.ToString());
        if (!string.IsNullOrEmpty(GridView1.Page.Title))
            filename = "Export_" + DateTime.Today.ToString() + ".xls";

        HttpContext.Current.Response.Clear();

        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + filename);


        HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
        HttpContext.Current.Response.Charset = "";

        System.IO.StringWriter stringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);



        System.Web.UI.HtmlControls.HtmlForm form = new System.Web.UI.HtmlControls.HtmlForm();
        GridView1.Parent.Controls.Add(form);
        form.Controls.Add(GridView1);
        form.RenderControl(htmlWriter);

        HttpContext.Current.Response.Write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
        HttpContext.Current.Response.Write(stringWriter.ToString());
        HttpContext.Current.Response.End();
    }
}