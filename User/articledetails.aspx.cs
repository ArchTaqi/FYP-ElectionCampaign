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

public partial class User_articledetails : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    Boolean success;
    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["articleid"] = Convert.ToInt32(Request.QueryString["ID"]);
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
            LoadArticleData();
        }
    }


    private void LoadArticleData()
    {
        try{
            db1.sqlcmd = new SqlCommand("uspgetspecificarticledetails");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@articleid", Convert.ToInt32(ViewState["articleid"]));
                db1.sqlcmd.Parameters.Add("@Title", SqlDbType.VarChar, 50);
                db1.sqlcmd.Parameters["@Title"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Body", SqlDbType.VarChar, 1000);
                db1.sqlcmd.Parameters["@Body"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Categories", SqlDbType.VarChar, 30);
                db1.sqlcmd.Parameters["@Categories"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@PublishedOn", SqlDbType.DateTime);
                db1.sqlcmd.Parameters["@PublishedOn"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@UpdatedOn", SqlDbType.DateTime);
                db1.sqlcmd.Parameters["@UpdatedOn"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@countlikes", SqlDbType.BigInt);
                db1.sqlcmd.Parameters["@countlikes"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteScalar();
                ViewState["Title"] = Convert.ToString(db1.sqlcmd.Parameters["@Title"].Value);
                ViewState["body"] = Convert.ToString(db1.sqlcmd.Parameters["@Body"].Value);
                ViewState["Category"] = Convert.ToString(db1.sqlcmd.Parameters["@Categories"].Value);
                ViewState["PublishedOn"] = Convert.ToString(db1.sqlcmd.Parameters["@PublishedOn"].Value);
                ViewState["UpdatedOn"] = Convert.ToString(db1.sqlcmd.Parameters["@UpdatedOn"].Value);
                ViewState["likes"] = db1.sqlcmd.Parameters["@countlikes"].Value;
                success = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);

            }}
        catch(Exception ex)
        {
            Response.Write(ex);
        }

       finally{

            if(success == true)
            {
                tbtitle.Text = Convert.ToString(ViewState["Title"]);
                tbbody.Text = Convert.ToString(ViewState["body"]);
                tbcategory.Text = Convert.ToString(ViewState["Category"]);
                lblpublishedon.Text = Convert.ToString(ViewState["PublishedOn"]);
                if (Convert.ToString(ViewState["UpdatedOn"]) == Convert.ToString(System.DateTime.Now))
                {
                    lblupdatedon.Text = "Not Yet Updatedd";

                }
                else
                { lblupdatedon.Text = Convert.ToString(ViewState["UpdatedOn"]); }
                
                if (Convert.ToInt64(ViewState["likes"]) == 1)
                {
                    lbllikes.Text = "0";
                }
                else
                { lbllikes.Text = Convert.ToString(Convert.ToInt64(ViewState["likes"])); }
                
                db1.sqlcon.Close();

            }
            else
            {

            }

        }

        }



    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        
        try
        {
            db1.sqlcmd = new SqlCommand("uspuserupdatearticle");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@articleid", Convert.ToInt32(ViewState["articleid"]));
                db1.sqlcmd.Parameters.AddWithValue("@Body", Convert.ToString(tbbody.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@Title", Convert.ToString(tbtitle.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@Categories", Convert.ToString(tbcategory.Text.Trim()));
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
            db1.sqlcmd = new SqlCommand("uspuserdeletearticles");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@articleid", Convert.ToInt32(ViewState["articleid"]));
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