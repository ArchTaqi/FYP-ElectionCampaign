using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Login_Login : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    int Userid, usercount, role;
    string Username, salt, recentlogin;
    Boolean uservalid, success;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                db1.sqlcmd = new SqlCommand("uspGetSalt");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@Email", TxtBxEmail.Text.Trim());
                    db1.sqlcmd.Parameters.Add("@salt", SqlDbType.VarChar, 50);
                    db1.sqlcmd.Parameters["@salt"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                    db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Connection = db1.sqlcon;
                    db1.sqlcon.Open();
                    db1.sqlcmd.ExecuteScalar();
                    salt = Convert.ToString(db1.sqlcmd.Parameters["@salt"].Value);
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
                    db1.sqlcon.Close();
                    string hashpassword = CreatePasswordHash(TxtBxPassword.Text.Trim(), salt);
                    try
                    {

                        db1.sqlcmd = new SqlCommand("uspGetLogin");
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                            db1.sqlcmd.Parameters.AddWithValue("@Email", TxtBxEmail.Text.Trim());
                            db1.sqlcmd.Parameters.AddWithValue("@Password", hashpassword);
                            db1.sqlcmd.Parameters.Add("@UserID", SqlDbType.Int);
                            db1.sqlcmd.Parameters.Add("@role", SqlDbType.Int);
                            db1.sqlcmd.Parameters.Add("@Username", SqlDbType.VarChar, 10);
                            db1.sqlcmd.Parameters.Add("@LastLoginDate", SqlDbType.VarChar, 20);
                            db1.sqlcmd.Parameters.Add("@userValid", SqlDbType.Bit);
                            db1.sqlcmd.Parameters["@userValid"].Direction = ParameterDirection.Output;
                            db1.sqlcmd.Parameters["@UserID"].Direction = ParameterDirection.Output;
                            db1.sqlcmd.Parameters["@role"].Direction = ParameterDirection.Output;
                            db1.sqlcmd.Parameters["@Username"].Direction = ParameterDirection.Output;
                            db1.sqlcmd.Parameters["@LastLoginDate"].Direction = ParameterDirection.Output;
                            db1.sqlcmd.Connection = db1.sqlcon;
                            db1.sqlcon.Open();
                            db1.sqlcmd.ExecuteNonQuery();
                            uservalid = (Boolean)db1.sqlcmd.Parameters["@userValid"].Value;
                            Userid = (int)db1.sqlcmd.Parameters["@UserID"].Value;
                            role = (int)db1.sqlcmd.Parameters["@role"].Value;
                            Username = (string)db1.sqlcmd.Parameters["@Username"].Value;
                            recentlogin = (string)db1.sqlcmd.Parameters["@LastLoginDate"].Value;
                        }
                    }
                    catch (Exception ex) { Response.Write(ex.Message); }
                    finally
                    {
                        if (uservalid == true)// comparing users from table 
                        {
                            if (role == 0)
                            {
                                Session["UserName"] = Username;
                                Session["UserID"] = Userid;
                                Session["recentlogin"] = recentlogin;
                                Response.Redirect("../Admin/Admin.aspx");  //for sucsseful login
                            }
                            if (role == 1)
                            {
                                Session["UserName"] = Username;
                                Session["UserID"] = Userid;
                                Session["recentlogin"] = recentlogin;
                                Response.Redirect("../User/UserHomePage.aspx");  //for sucsseful login
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Invalid Login Details.Please Try agian." + "');", true);
                            db1.sqlcon.Close();
                            LblError.Visible = true;
                        }
                    }

                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Invalid Login Details.Please Try agian." + "');", true);
                    db1.sqlcon.Close();
                    LblError.Visible = true;
                }
            }

        }
        else
        {

            //Page Validation Does not Occurs Successfully.
        }
    }

    protected void BtnForgetPassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Login/ForgetPassword.aspx");  
    }

    private static string CreatePasswordHash(string pwd, string salt)
    {
        string saltAndPwd = String.Concat(pwd, salt);
        string hashedPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(saltAndPwd, "sha1");
        return hashedPwd;
    }
}