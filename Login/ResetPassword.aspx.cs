using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;
using System.Security.Cryptography;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Login_ResetPassword : System.Web.UI.Page
{
    string email, emaill, AppUsername;
    int usercount, userId;
    DBClass db1 = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            try
            {
                string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();
                db1.sqlcmd = new SqlCommand("uspConfirmresetPassword");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                    db1.sqlcmd.Parameters.Add("@UserID", SqlDbType.Int);
                    db1.sqlcmd.Parameters.Add("@UserEmail", SqlDbType.VarChar, 50);
                    db1.sqlcmd.Parameters.Add("@UserName", SqlDbType.VarChar, 20);
                    db1.sqlcmd.Parameters["@UserID"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Parameters["@UserEmail"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Parameters["@UserName"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Connection = db1.sqlcon;
                    db1.sqlcon.Open();
                    db1.sqlcmd.ExecuteScalar();
                    userId = Convert.ToInt32(db1.sqlcmd.Parameters["@UserID"].Value);
                    emaill = Convert.ToString(db1.sqlcmd.Parameters["@UserEmail"].Value);
                    AppUsername = Convert.ToString(db1.sqlcmd.Parameters["@UserName"].Value);
                    ViewState["userId"] = userId;
                    ViewState["email"] = emaill;
                    ViewState["AppUsername"] = AppUsername;
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
            }
            finally
            {
                db1.sqlcon.Close();

            }
        }
    }

    private static string CreateSalt(int size)
    {
        // Generate a cryptographic random number using the cryptographic 
        // service provider
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        byte[] buff = new byte[size];
        rng.GetBytes(buff);
        // Return a Base64 string representation of the random number
        return Convert.ToBase64String(buff);


    }

    private static string CreatePasswordHash(string pwd, string salt)
    {
        string saltAndPwd = String.Concat(pwd, salt);
        string hashedPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(saltAndPwd, "sha1");
        return hashedPwd;
    }

    protected void BtnSubmit_Click1(object sender, EventArgs e)
    {
        email = Convert.ToString(ViewState["email"]);
        if (TxtBxPassword.Text.Trim() == TxtBxConfirmedPassword.Text.Trim())
        {
            string salt = CreateSalt(8);
            string hashpassword = CreatePasswordHash(TxtBxConfirmedPassword.Text.Trim(), salt);
            db1.sqlcmd = new SqlCommand("uspResetPassword");
            try
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@Email", email);
                    db1.sqlcmd.Parameters.AddWithValue("@Password", hashpassword);
                    db1.sqlcmd.Parameters.AddWithValue("@salt", salt);
                    db1.sqlcmd.Connection = db1.sqlcon;
                    db1.sqlcon.Open();
                    usercount = (Int32)db1.sqlcmd.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
            }
            finally
            {
                TxtBxPassword.Text = null;
                TxtBxConfirmedPassword.Text = null;

                if (usercount == 1)
                {

                    Response.Redirect("../Login/Login.aspx");  //for sucsseful login
                }
                else
                {
                    db1.sqlcon.Close();

                    //Response.Redirect("ResetPassword.aspx");
                }
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + " Password Does Not Match. Please Enter the Same Password in Both Field." + "');", true);
        }
    }
}