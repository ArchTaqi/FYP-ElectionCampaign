using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

public partial class Admin_UserMessages : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    Boolean success;
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GVUsermessages_SelectedIndexChanged(object sender, EventArgs e)
    {
    
        ViewState["msgid"] = GVUsermessages.SelectedRow.Cells[1].Text;
        ViewState["Name"] = GVUsermessages.SelectedRow.Cells[2].Text;
        ViewState["email"] = GVUsermessages.SelectedRow.Cells[3].Text;
        ViewState["body"] = GVUsermessages.SelectedRow.Cells[4].Text;
        ViewState["Postedon"] = GVUsermessages.SelectedRow.Cells[5].Text;
        tbxmsgid.Text =Convert.ToString(ViewState["msgid"]) ;
        tbxemail.Text = Convert.ToString(ViewState["email"]);
        
    }


    protected void btnsendemail_Click(object sender, EventArgs e)
    {
        
        try
        {
            db1.sqlcmd = new SqlCommand("uspAdminrepliedusermessages");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@msgid", Convert.ToInt32(ViewState["msgid"]));
                db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteNonQuery();
                db1.sqlcon.Close();
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
                db1.sqlcon.Close();
                try
                {
                    using (MailMessage mm = new MailMessage("temp5052@gmail.com", tbxemail.Text))
                    {
                        mm.Subject = "Replied to Your Query on DEC";
                        string body = "Hello " + Convert.ToString(ViewState["Name"]) + ",<br /> <br />";
                        body += "This the replied message of your query that you asked on " + Convert.ToDateTime(ViewState["Postedon"]) + " <br />";
                        body += "Name : " + Convert.ToString(ViewState["Name"]) + " <br />";
                        body += "Question : " + Convert.ToString(ViewState["body"]) + " <br />";
                        body += "Answer : " + Convert.ToString(tbxanswer.Text.Trim()) + " <br />";
                        body += "<br /><br />Thanks <br /> Electoral Information System";
                        mm.Body = body;
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.EnableSsl = true;
                        NetworkCredential NetworkCred = new NetworkCredential("temp5052@gmail.com", "ZXCzxc210211");
                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = NetworkCred;
                        smtp.Port = 587;
                        smtp.Send(mm);
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Mail cannot be send, Please check your internet connection" + "');", true);
                }
                finally
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Email Send to User" + "');", true);
                    tbxmsgid.Text = null;
                    tbxemail.Text = null;
                    tbxanswer.Text = null;
                    Response.Redirect("../Admin/UserMessages.aspx");
                }
            }

            else
            {

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Operation Failed...." + "');", true);
            }

            db1.sqlcon.Close();

        }

    }

}