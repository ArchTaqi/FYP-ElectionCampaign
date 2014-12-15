using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Mysubscription : System.Web.UI.Page
{
    int UserID, SubscripID, CurrentSubscriptionid;
    String UserName;
    Boolean HasSubscrip, HasSubscripLife;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserID"] != null)
        {
            //Retrieving UserName from Session
            UserName = Convert.ToString(Session["UserName"]);
            ViewState["UserID"] = Convert.ToInt32(Session["UserID"]);
            if (Session["SubscripID"] != null && Session["HasSubscrip"] != null && Session["HasSubscripLife"] != null)
            {
                SubscripID = Convert.ToInt32(Session["SubscripID"]);
                HasSubscrip = Convert.ToBoolean(Session["HasSubscrip"]);
                HasSubscripLife = Convert.ToBoolean(Session["HasSubscripLife"]);
            }
            if (Convert.ToBoolean(Session["HasSubscrip"]) == true && Convert.ToBoolean(Session["HasSubscripLife"]) == true)
            {
                ViewState["CurrentSubscriptionid"] = SubscripID;
            }
            else
            {
                ViewState["CurrentSubscriptionid"] = 0;
            }
            Session["UserName"] = UserName;
            Session["UserID"] = Convert.ToInt32(ViewState["UserID"]);
            Session["SubscripID"] = SubscripID;
            Session["HasSubscrip"] = HasSubscrip;
            Session["HasSubscripLife"] = HasSubscripLife;
        }
    }


}