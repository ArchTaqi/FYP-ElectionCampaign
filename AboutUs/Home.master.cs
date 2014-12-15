using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AboutUs_Home : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkbtnlogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login/Login.aspx");
    }
    protected void lnkbtnsignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/Requestaccount.aspx"); 
    }
    protected void lnkbtnhome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AboutUs/HomePage.aspx");
    }
    protected void lnkbtnaboutus_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AboutUs/Aboutus.aspx");
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
