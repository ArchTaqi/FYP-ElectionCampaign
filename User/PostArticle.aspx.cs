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

public partial class PostArticles : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    int UserID, SubscripID;
    String UserName;
    Boolean HasSubscrip, HasSubscripLife;
    Boolean success;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserID"] != null)
        {
            //Retrieving UserName from Session
            UserName = Convert.ToString(Session["UserName"]);
            ViewState["UserID"] = Convert.ToInt32(Session["UserID"]);
            Session["UserName"] = UserName;
            Session["UserID"] = Convert.ToInt32(ViewState["UserID"]);
        }
        if (!IsPostBack)
        {
            SqlParameter sqlparamater = new SqlParameter("@userid", Convert.ToInt32(ViewState["UserID"]));
            DataSet ds = GetData("uspGetUsertargetconstituencies", sqlparamater);
            ddltargetconstituency.DataSource = ds;
            ddltargetconstituency.DataBind();
            ListItem lstitemDistrict = new ListItem("Select the Constituency", "-1");
            ddltargetconstituency.Items.Insert(0, lstitemDistrict);
        }
    }


    protected void BtnPost_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                db1.sqlcmd = new SqlCommand("uspAddArticle");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@PublishedBy", Convert.ToInt32(ViewState["UserID"]));
                    db1.sqlcmd.Parameters.AddWithValue("@constid", ddltargetconstituency.SelectedValue);
                    db1.sqlcmd.Parameters.AddWithValue("@Title", Convert.ToString(tbtitle.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@Body", Convert.ToString(tbbody.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@Author", Convert.ToString(tbauthor.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@Categories", Convert.ToString(tbcategory.Text.Trim()));
                    db1.sqlcmd.Parameters.Add("@temp1", SqlDbType.Int);
                    db1.sqlcmd.Parameters["@temp1"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                    db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Connection = db1.sqlcon;
                    db1.sqlcon.Open();
                    int i = Convert.ToInt32(db1.sqlcmd.ExecuteScalar());
                    string message = string.Empty;
                    switch (i)
                    {
                        case -1:
                            message = "Supplied Article name has already been used, Please Rename your Poster Name";
                            break;
                        default:
                            message = "Posted successful.\\nYour Article id is : " + i.ToString();
                            break;
                    }
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                }
                success = (bool)db1.sqlcmd.Parameters["@success"].Value;
                Int32 temp1 = (Int32)db1.sqlcmd.Parameters["@temp1"].Value;


            }


            catch (Exception ex)
            {
                Response.Write(ex);
            }

            finally
            {
                if (success == true)
                {
                    setallfieldempty();
                    Response.Redirect("../User/PostArticle.aspx");

                }
                else
                {
                    Response.Write("error");
                }


            }
        }
        else
        {
            // Validation occurs
        }
    }

    private DataSet GetData(string SpName, SqlParameter SPParameter)
    {
        SqlDataAdapter sqlda = new SqlDataAdapter(SpName, db1.sqlcon);
        sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
        if (SPParameter != null)
        {
            sqlda.SelectCommand.Parameters.Add(SPParameter);
        }
        DataSet ds = new DataSet();
        sqlda.Fill(ds);
        return ds;
    }

    private void setallfieldempty()
    {
        tbtitle.Text = null;
        tbbody.Text = null;
        tbauthor.Text = null;
        tbcategory.Text = null;
        ddltargetconstituency.Enabled = false;
    }
   
}