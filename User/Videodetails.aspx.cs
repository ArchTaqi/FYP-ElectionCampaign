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

public partial class User_Videodetails : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    Boolean success;

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["videoid"] = Convert.ToInt32(Request.QueryString["ID"]);
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
            LoadVideoData();
        }

       
    }


    private void LoadVideoData()
    {
        try
        {
            db1.sqlcmd = new SqlCommand("uspgetuservideodetails");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@videoid", Convert.ToInt32(ViewState["videoid"]));
                db1.sqlcmd.Parameters.Add("@Title", SqlDbType.NVarChar, 100);
                db1.sqlcmd.Parameters["@Title"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@url", SqlDbType.NVarChar, 300);
                db1.sqlcmd.Parameters["@url"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Details", SqlDbType.NVarChar, 250);
                db1.sqlcmd.Parameters["@Details"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Category", SqlDbType.VarChar, 50);
                db1.sqlcmd.Parameters["@Category"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@PublishedOn", SqlDbType.DateTime);
                db1.sqlcmd.Parameters["@PublishedOn"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteScalar();
                ViewState["Title"] = Convert.ToString(db1.sqlcmd.Parameters["@Title"].Value);
                ViewState["url"] = Convert.ToString(db1.sqlcmd.Parameters["@url"].Value);
                ViewState["Details"] = Convert.ToString(db1.sqlcmd.Parameters["@Details"].Value);
                ViewState["Category"] = Convert.ToString(db1.sqlcmd.Parameters["@Category"].Value);
                ViewState["PublishedOn"] = Convert.ToString(db1.sqlcmd.Parameters["@PublishedOn"].Value);
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
                string url = Convert.ToString(ViewState["url"]);
                LiteralControl literal = new LiteralControl();
                string str = "http://player.vimeo.com/video/" + url + "?api=1&player_id=player_";
                literal.Text += "<div><iframe name='we' 'frameborder='0' scrolling='auto' height='500px' width='100%'  src='" + str  + "' style='left:0; background-color:#B8B8B8;'></iframe></div>";
                diviframe.Controls.Add(literal);

                lblvideotittle.Text = Convert.ToString(ViewState["Title"]);
                tbxurl.Text = Convert.ToString(ViewState["url"]);
                tbxcategory.Text = Convert.ToString(ViewState["Category"]);
                tbxpostedon.Text = Convert.ToString(Convert.ToDateTime(ViewState["PublishedOn"]).ToString("D"));
                tbxdescription.Text = Convert.ToString(ViewState["Details"]);
                
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Video cannot be playing, try connect to internet." + "');", true);
            }
        }
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            db1.sqlcmd = new SqlCommand("uspdeleteuservideo");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@videoid", Convert.ToInt32(ViewState["videoid"]));
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
                Response.Redirect("../User/Myvideos.aspx");
            }
            else
            {
                Response.Write("Deleteiton Un-Successfull");
            }
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                db1.sqlcmd = new SqlCommand("uspgetuserupdatevideo");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@userid", Convert.ToInt32(ViewState["UserID"]));
                    db1.sqlcmd.Parameters.AddWithValue("@videoid", Convert.ToInt32(ViewState["videoid"]));
                    db1.sqlcmd.Parameters.AddWithValue("@Title", Convert.ToString(lblvideotittle.Text));
                    db1.sqlcmd.Parameters.AddWithValue("@Url", Convert.ToString(tbxurl.Text));
                    db1.sqlcmd.Parameters.AddWithValue("@Details", Convert.ToString(tbxdescription.Text));
                    db1.sqlcmd.Parameters.AddWithValue("@Category", Convert.ToString(tbxcategory.Text));
                    db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                    db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Connection = db1.sqlcon;
                    db1.sqlcon.Open();
                    db1.sqlcmd.ExecuteScalar();
                    ViewState["url"] = Convert.ToString(db1.sqlcmd.Parameters["@url"].Value);
                    success = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);
                }
            }
            catch
            {

            }
            finally
            {
                if (success == true)
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Updattion Successfull" + "');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Updation Un-Successfull" + "');", true);
                }
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Page Validation Occurs" + "');", true);
        }
    }
}