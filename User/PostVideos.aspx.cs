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

public partial class PostVideos : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    String UserName;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write(ViewState["UserID"]);
        Response.Write(ddltargetconstituency.SelectedItem);
        Response.Write(ViewState[TBVname.Text.Trim()]);
        Response.Write(ViewState[TBVDesc.Text.Trim()]);
        Response.Write(ViewState[TBCategory.Text.Trim()]);
        Response.Write(ViewState[tbxvideourl.Text.Trim()]);
        try
        {
            db1.sqlcmd = new SqlCommand("uspAddVideos");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(ViewState["UserID"]));
                db1.sqlcmd.Parameters.AddWithValue("@constid", ddltargetconstituency.SelectedValue);
                db1.sqlcmd.Parameters.AddWithValue("@Title", Convert.ToString(TBVname.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@Details", Convert.ToString(TBVDesc.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@Category", Convert.ToString(TBCategory.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@Url", Convert.ToString(tbxvideourl.Text.Trim()));
                db1.sqlcmd.Parameters.Add("@temp1", SqlDbType.Int);
                db1.sqlcmd.Parameters["@temp1"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@temp2", SqlDbType.Int);
                db1.sqlcmd.Parameters["@temp2"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteScalar();
                success = (bool)db1.sqlcmd.Parameters["@success"].Value;
                Int32 temp1 = (Int32)db1.sqlcmd.Parameters["@temp1"].Value;
                Int32 temp2 = (Int32)db1.sqlcmd.Parameters["@temp2"].Value;
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
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Your Video has been posted successfully"  + "');", true);
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Opps! looks like you dont have enough balance to post videos" + "');", true);
            }

            db1.sqlcon.Close();


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

}