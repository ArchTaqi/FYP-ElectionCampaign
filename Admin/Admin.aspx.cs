using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.Page
{
    String UserName, recentlogin;
    int UserID;
    DBClass db1 = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null & Session["UserID"] != null & Session["recentlogin"] != null)
        {
            UserName = Convert.ToString(Session["UserName"]);
            UserID = Convert.ToInt32(Session["UserID"]);
            recentlogin = Convert.ToString(Session["recentlogin"]);
            Session["UserName"] = UserName;
            Session["UserID"] = UserID;
        }


    }
}