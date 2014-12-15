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
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class AboutUs_Contactus : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    Boolean success;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

        }
        lblerror.Visible = false;
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                db1.sqlcmd = new SqlCommand("uspSetusermessages");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@Name", tbxname.Text.Trim());
                    db1.sqlcmd.Parameters.AddWithValue("@email", tbxemail.Text.Trim());
                    db1.sqlcmd.Parameters.AddWithValue("@body", tbxmessage.Text.Trim());
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
                //Response.Write(ex.Message);
            }
            finally
            {
                if (success == true)
                {
                    lblerror.Text = "Your Message has been Submitted Successfully, We Will respond to your query within 2 working days. Thanks, have a nice day";
                    lblerror.BackColor = System.Drawing.Color.Green;
                    lblerror.Visible = true;
                    db1.sqlcon.Close();
                    setallfieldtonull();
                    Response.Redirect(Request.RawUrl);

                }

                else
                {
                    lblerror.Text = "Your Message has been not been Submitted,";
                    lblerror.BackColor = System.Drawing.Color.Green;
                    lblerror.Visible = true;
                    db1.sqlcon.Close();
                    Response.Redirect(Request.RawUrl);
                }


            }

        }
        else
        {
            //Page Validation failed;
        }
    }

    private void setallfieldtonull()
    {
        tbxname.Text = null;
        tbxemail.Text = null;
        tbxmessage.Text = null;

    }
}