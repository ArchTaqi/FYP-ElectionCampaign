using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Administrator : System.Web.UI.MasterPage
{
    string UserName, recentlogin;
    int UserID;
    DBClass db1 = new DBClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null & Session["UserID"] != null)
        {
            UserName = Convert.ToString(Session["UserName"]);
            UserID = Convert.ToInt32(Session["UserID"]);
            recentlogin = Convert.ToString(Session["recentlogin"]);
        }
        else { }
        lnkbtnlogin.Text = UserName;
        lblrecentlogin.Text = recentlogin;
    }
    protected void lnkbtnlogin_Click(object sender, EventArgs e)
    {
       
    }
    protected void lnkbtnlogout_Click(object sender, EventArgs e)
    {
        try
        {
            Session.Abandon();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";
            Response.Redirect("~/Login/Login.aspx", true);
        }
        catch (Exception ex)
        {
            //Response.Write(ex.Message);
        }

        finally
        {

        }
    }
    protected void lnkbtnhome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AboutUs/HomePage.aspx");
    }
    protected void lnkbtnaboutus_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Admin/Usersaccountrequest.aspx");
    }
    protected void lnkbtnteam_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AboutUs/OurTeam.aspx");
    }
    protected void lnkbtncontactus_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AboutUs/Contactus.aspx");
    }
    protected void lnkbtncompanynews_Click(object sender, EventArgs e)
    {

    }
    protected void lnkbtnfb_Click(object sender, EventArgs e)
    {

    }
    protected void lnkbtngplus_Click(object sender, EventArgs e)
    {

    }
    protected void lnkbtntwitter_Click(object sender, EventArgs e)
    {

    }
    protected void lnkbtnytube_Click(object sender, EventArgs e)
    {

    }
}
