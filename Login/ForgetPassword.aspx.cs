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
using System.Net.Mail;
using System.Net;

public partial class Login_ForgetPassword : System.Web.UI.Page
{
    int usercount, userid;
    string username;
    DBClass db1 = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                db1.sqlcmd = new SqlCommand("uspValidateForgetPassword");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@Email", TxtBxEmail.Text.Trim());
                    db1.sqlcmd.Parameters.AddWithValue("@PinCode", Convert.ToInt32(TxtBxPincode.Text.Trim()));
                    db1.sqlcmd.Parameters.Add("@userid", SqlDbType.Int);
                    db1.sqlcmd.Parameters.Add("@username", SqlDbType.VarChar, 20);
                    db1.sqlcmd.Parameters["@userid"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Parameters["@username"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Connection = db1.sqlcon;
                    db1.sqlcon.Open();
                    usercount = (Int32)db1.sqlcmd.ExecuteScalar();
                    userid = Convert.ToInt32(db1.sqlcmd.Parameters["@userid"].Value);
                    username = Convert.ToString(db1.sqlcmd.Parameters["@username"].Value);
                }
            }
            catch (Exception ex)
            {
                setTextFieldClear();
                Lblwarning.Text = "Invalid Details! Please Enter Your Correct Details.<br /> Check Your Email For Your Details that you have recieved on the time of Reistering.";
                Lblwarning.Visible = true;
            }
            finally
            {

                if (usercount == 1)
                {
                    if (userid == -1 || username == "null")
                    {
                        setTextFieldClear();
                        Lblwarning.Text = "Invalid Details! Please Enter Your Correct Details.<br /> Check Your Email For Your Details that you have recieved on the time of Reistering.";
                        Lblwarning.Visible = true;
                    }
                    else
                    {
                        db1.sqlcon.Close();
                        SendActivationEmail(userid);
                        setTextFieldClear();
                        Lblwarning.Text = "An Email has been sent to you, Please Check and Reset your Password";
                        Lblwarning.Visible = true;
                    }
                }
                else
                {
                    setTextFieldClear();
                    Lblwarning.Text = "Invalid Details! Please Enter Your Correct Details. Check Your Email For Your Details that you have recieved on the time of Reistering.";
                    Lblwarning.Visible = true;
                }

            }

        }
        else
        {
            //Validation fails
        }
    }


    private void SendActivationEmail(int userId)
    {
        string activationCode = Guid.NewGuid().ToString();
        try
        {
            db1.sqlcmd = new SqlCommand("uspUserActivation");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@UserId", userid);
                db1.sqlcmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            
        }
        finally
        {
            db1.sqlcon.Close();

            using (MailMessage mm = new MailMessage("temp5052@gmail.com", TxtBxEmail.Text))
            {
                mm.Subject = "Reset Password";
                string body = "Hello " + username + ",";
                body += "<br /><br />Please click the following link to reset your password";
                body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("ForgetPassword.aspx", "ResetPassword.aspx?ActivationCode=" + activationCode) + "'>Click here to reset your password.</a>";
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


    }


    private void setTextFieldClear()
    {
        TxtBxEmail.Text = null;
        TxtBxPincode.Text = null;

    }

}