using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;
using System.Security.Cryptography;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class UserHomePage : System.Web.UI.Page
{
    String UserName, recentlogin;
    int UserID;
    Boolean success;
    DBClass db1 = new DBClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null & Session["UserID"] != null & Session["recentlogin"] != null)
        {
            ViewState["UserName"] = Convert.ToString(Session["UserName"]);
            ViewState["UserID"] = Convert.ToInt32(Session["UserID"]);
            recentlogin = Convert.ToString(Session["recentlogin"]);
            Session["UserName"] = ViewState["UserName"];
            Session["UserID"] = ViewState["UserID"];
        }
        UpdateSubscriptions();
    }


    private void GetSuscriptionetials()
    {    
        Boolean HasSubscrip;
        try
        {
            db1.sqlcmd = new SqlCommand("uspCheckSubscription");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@Userid", Convert.ToInt32(ViewState["UserID"]));
                db1.sqlcmd.Parameters.Add("@HasSubscrip", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@HasSubscrip"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                int success = Convert.ToInt32(db1.sqlcmd.ExecuteScalar());
                HasSubscrip = Convert.ToBoolean(db1.sqlcmd.Parameters["@HasSubscrip"].Value);
                ViewState["HasSubscrip"] = HasSubscrip;
            }
        }
        catch (Exception ex)
        {
            
        }
        finally {
            db1.sqlcon.Close();
        }
    }


    private void UpdateSubscriptions()
    {
        try
        {
            db1.sqlcmd = new SqlCommand("uspCheckUserSubscriptionstatus");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@Userid", Convert.ToInt32(ViewState["UserID"]));
                db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteScalar();
                success = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);
            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
            if (success == true)
            {
                db1.sqlcon.Close();
            }
            else
            {
                db1.sqlcon.Close();
            }

        }
    }

}