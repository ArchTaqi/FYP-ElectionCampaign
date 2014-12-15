using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class User_viewnotificationdetails : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    Boolean success;

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["notifictid"] = Convert.ToInt32(Request.QueryString["ID"]);
        if (Session["UserName"] != null && Session["UserID"] != null)
        {
            //Retrieving UserName from Session
            ViewState["UserName"] = Convert.ToString(Session["UserName"]);
            ViewState["UserID"] = Convert.ToInt32(Session["UserID"]);
            Session["UserName"] = Convert.ToString(ViewState["UserName"]);
            Session["UserID"] = Convert.ToInt32(ViewState["UserID"]);

        }

        if (!IsPostBack)
        {

            LoadNotificationData();
        }
    }


    protected void LoadNotificationData()
    {
        try
        {
            db1.sqlcmd = new SqlCommand("uspgetuserspecficnotification");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@notificid", Convert.ToInt32(ViewState["notifictid"]));
                db1.sqlcmd.Parameters.Add("@Body", SqlDbType.VarChar, 250);
                db1.sqlcmd.Parameters["@Body"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Postedon", SqlDbType.DateTime);
                db1.sqlcmd.Parameters.Add("@Updatedon", SqlDbType.DateTime);
                db1.sqlcmd.Parameters["@Postedon"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters["@Updatedon"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@likes", SqlDbType.BigInt);
                db1.sqlcmd.Parameters["@likes"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteScalar();
                ViewState["Body"] = Convert.ToString(db1.sqlcmd.Parameters["@Body"].Value);
                ViewState["Postedon"] = Convert.ToString(db1.sqlcmd.Parameters["@Postedon"].Value);
                ViewState["Updatedon"] = Convert.ToString(db1.sqlcmd.Parameters["@Updatedon"].Value);
                ViewState["likes"] = Convert.ToString(db1.sqlcmd.Parameters["@likes"].Value);
                success = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);
                }

            }
       
        catch (Exception ex)
        {
            Response.Write(ex);
        }

        finally
        {

            if (success == true)
            {
                tbxbody.Text = Convert.ToString(ViewState["Body"]);
                //lblpublishedon.Text = Convert.ToString(Convert.ToDateTime(ViewState["PostedOn"]).ToString("D"));
                //lblpublishedon.Visible = true;
                //if (DateTime.Now == Convert.ToDateTime(ViewState["UpdatedOn"]))
                //{
                //    lblupdatedon.Text = " Not yet updated";
                //    lblupdatedon.Visible = true;
                //}
                //else
                //{
                //    lblupdatedon.Text = Convert.ToString(Convert.ToDateTime(ViewState["UpdatedOn"]).ToString("D"));
                //    lblupdatedon.Visible = true;
                //}
                //if (Convert.ToInt64(ViewState["countlikes"]) == 100000002)
                //{ lbllikes.Text = "0";
                //lbllikes.Visible = true;
                //}
                //else
                //{
                //    lbllikes.Text = Convert.ToString(ViewState["countlikes"]);
                //    lbllikes.Visible = true;
                //}
           
                db1.sqlcon.Close();

            }
            else
            {
                Response.Write("Error");
            }

        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
       
 try
            {
                db1.sqlcmd = new SqlCommand("uspuserupdatenotification");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@notificaitonid", Convert.ToInt32(ViewState["notifictid"]));
                    db1.sqlcmd.Parameters.AddWithValue("@Body", Convert.ToString(tbxbody.Text.Trim()));
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
                Response.Write(ex);
            }
            finally
            {
                if (success == true)
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Updatation Successfull" + "');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Updatation Un-Successfull" + "');", true);
                }
            }
        
    }


    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            db1.sqlcmd = new SqlCommand("Uspdeletespecificnotification");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@notificid", Convert.ToInt32(ViewState["notifictid"]));
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
            Response.Write(ex);
        }
        finally
        {
            if (success == true)
            {
                Response.Write("Deleteiton Successfull");
                Response.Redirect("../User/Mynotifications.aspx");
            }
            else
            {
                Response.Write("Deleteiton Un-Successfull");
            }
        }
    }

}