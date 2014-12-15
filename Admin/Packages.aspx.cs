using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;

public partial class Admin_Packages : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    Boolean success;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnadd_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            try
            {
                db1.sqlcmd = new SqlCommand("uspAddPackage");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@name", Convert.ToString(tbxpackagename.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@notification", Convert.ToInt64(tbxnotification.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@Videos", Convert.ToInt64(tbxvideos.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@Articles", Convert.ToInt64(tbxarticles.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@Event", Convert.ToInt64(tbxevents.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@Cost", Convert.ToDouble(tbxcost.Text.Trim()));
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
                Response.Write(ex.Message);
            }
            finally
            {
                if (success == true)
                {
                    setallfieldtonull();
                    Lblerror.Text = " New Package Successfully Added";
                    Lblerror.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                    Lblerror.Visible = true;
                    db1.sqlcon.Close();
                    Response.Redirect("Packags.aspx");
                }
                else
                {
                    Lblerror.Text = "Package could not be added";
                    Lblerror.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                    Lblerror.Visible = true;
                }
            }
        }
        else
        {
            //Page Validation Does not Occurs Successfully.
        }
    }

    private void setallfieldtonull()
    {
        tbxpackagename.Text = null;
        tbxpackagename.Text = null;
        tbxnotification.Text = null;
        tbxvideos.Text = null;
        tbxarticles.Text = null;
        tbxevents.Text = null;
        tbxcost.Text = null;
    }

    //Add a Label Control at the GridView footer to display page count
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[0].Text = "Page " + (GridView2.PageIndex + 1) + " of " + GridView2.PageCount;
        }
    }

    //Display GridView Paging even for a single page
    protected void GridView2_PreRender(object sender, EventArgs e)
    {
        GridView gv = (GridView)sender;
        GridViewRow gvr = (GridViewRow)gv.BottomPagerRow;
        if (gvr != null)
        {
            gvr.Visible = true;
        }
    }
}