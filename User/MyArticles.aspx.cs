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

public partial class User_MyArticles : System.Web.UI.Page
{
    DBClass db1 = new DBClass();


    protected void Page_Load(object sender, EventArgs e)
    {
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

            SqlParameter sqlparamater = new SqlParameter("@userid", Convert.ToInt32(ViewState["UserID"]));
            DataSet ds = GetData("uspGetUsertargetconstituencies", sqlparamater);
            ddltargetconstituency.DataSource = ds;
            ddltargetconstituency.DataBind();
            ListItem lstitemDistrict = new ListItem("Select the Constituency", "-1");
            ddltargetconstituency.Items.Insert(0, lstitemDistrict);
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


    protected void btnview_Click(object sender, EventArgs e)
    {

        string strCon = ConfigurationManager.ConnectionStrings["ECII(Old)"].ConnectionString;
        using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {

                using (SqlCommand cmd = new SqlCommand())
                {

                    Sqlcon.Open();

                    cmd.Connection = Sqlcon;

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.CommandText = "uspGetUserArticles";
                    cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(ViewState["UserID"]));
                    cmd.Parameters.AddWithValue("@constid", ddltargetconstituency.SelectedValue);
                    SqlDataAdapter SqlAda = new SqlDataAdapter(cmd);

                    DataSet ds = new DataSet();

                    SqlAda.Fill(ds);

                    gvarticles.DataSource = ds;

                    gvarticles.DataBind();

                }

            }

        }



    protected void gvarticles_SelectedIndexChanged(object sender, EventArgs e)
    {
        int articleid = Convert.ToInt32(gvarticles.SelectedRow.Cells[1].Text);
        Response.Redirect("../User/articledetails.aspx?ID=" + articleid);
    }
}