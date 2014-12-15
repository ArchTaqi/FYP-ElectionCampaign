using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Users : System.Web.UI.MasterPage
{
    public String UserName, recentlogin;
    int UserID;
    DBClass db1 = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null & Session["UserID"] != null & Session["recentlogin"] != null)
        {
            UserName = Convert.ToString(Session["UserName"]);
            UserID = Convert.ToInt32(Session["UserID"]);
            recentlogin = Convert.ToString(Session["recentlogin"]);
        }
        else { }
        LblUserLogin.Text = UserName;
        LabelLastLogin.Text = recentlogin;

    }



    protected void logout_Click(object sender, EventArgs e)
    {
        try
        {
            Session.Abandon();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";
            Response.Redirect("../AboutUs/HomePage.aspx", true);
        }
        catch (Exception ex)
        {
            //Response.Write(ex.Message);
        }
        finally
        {
        }

    }


}
