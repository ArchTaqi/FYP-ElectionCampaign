using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Globalization;

public partial class Registration_Useraccountactivation : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    int userId;
    string email, FileName, Username, Userfname, Userlname, hash, password, pincode, constituency;
    string fathername, dob, workphone, province, city, officeaddress, partyname, partyjoinson, haspassword;
    string filenamewithoutextension, fileextension;
    Boolean success,success2 ; 

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            try
            {
                string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();
                db1.sqlcmd = new SqlCommand("uspConfirmUserActivation");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                    db1.sqlcmd.Parameters.Add("@UserID", SqlDbType.Int);
                    db1.sqlcmd.Parameters.Add("@UserEmail", SqlDbType.VarChar, 50);
                    db1.sqlcmd.Parameters.Add("@FirstName", SqlDbType.VarChar, 20);
                    db1.sqlcmd.Parameters.Add("@LastName", SqlDbType.VarChar, 20);
                    db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                    db1.sqlcmd.Parameters["@UserID"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Parameters["@UserEmail"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Parameters["@FirstName"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Parameters["@LastName"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Connection = db1.sqlcon;
                    db1.sqlcon.Open();
                    db1.sqlcmd.ExecuteScalar();
                    userId = Convert.ToInt32(db1.sqlcmd.Parameters["@UserID"].Value);
                    email = Convert.ToString(db1.sqlcmd.Parameters["@UserEmail"].Value);
                    Userfname = Convert.ToString(db1.sqlcmd.Parameters["@FirstName"].Value);
                    Userlname = Convert.ToString(db1.sqlcmd.Parameters["@LastName"].Value);
                    success = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);
                    if (success == true)
                    {
                        lblerror.Text = " Account Activated";
                        lblerror.Visible = true;
                    }
                    else
                    {
                        lblerror.Text = " Account not Activated";
                        lblerror.Visible = true;
                        BttnSumbit.Visible = false;
                        tbxfathername.Visible = false;
                        tbxdob.Visible = false;
                        tbxpincode.Visible = false;
                        tbxworkphone.Visible = false;
                        tbxofficeadress.Visible = false;
                        tbxpassword.Visible = false;
                        tbxrepassword.Visible = false;
                        
                        DDCity.Enabled = false;
                        DDProvince.Enabled = false;


                    }

                    ViewState["userId"] = userId;
                    ViewState["email"] = email;
                    ViewState["Username"] = Username;
                    ViewState["Userfname"] = Userfname;
                }
            }
            catch (Exception ex)
            { Response.Write(ex.Message); }
            finally { db1.sqlcon.Close(); }
        }
        if (!IsPostBack)
        {
            DDProvince.DataSource = GetData("uspGetProvinces", null);
            DDProvince.DataBind();

            ListItem lstitemProvince = new ListItem("Select State", "-1");
            DDProvince.Items.Insert(0, lstitemProvince);

            ListItem lstitemCities = new ListItem("Select City", "-1");
            DDCity.Items.Insert(0, lstitemCities);
            DDCity.Enabled = false;
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

    protected void DDProvince_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDProvince.SelectedIndex == 0)
        {
            DDCity.SelectedIndex = 0;
            DDCity.Enabled = false;
        }
        else
        {
            DDCity.Enabled = true;
            SqlParameter sqlparamater = new SqlParameter("@ProvinceId", DDProvince.SelectedValue);
            DataSet ds = GetData("uspGetCitiesAgainstProvince", sqlparamater);
            DDCity.DataSource = ds;
            DDCity.DataBind();
            ListItem lstitemProvince = new ListItem("Select City", "-1");
            DDCity.Items.Insert(0, lstitemProvince);

        }
    }

    protected void cvfu1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        String fileName = fu1.PostedFile.FileName;
        if (fu1.HasFile)
        {
            string fileExt = System.IO.Path.GetExtension(fu1.FileName);

            if (fileExt.ToLower() == ".jpeg" || fileExt.ToLower() == ".jpg" || fileExt.ToLower() == ".gif" || fileExt.ToLower() == ".png" || fileExt.ToLower() == ".bitmap")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

    }

    protected void BttnSumbit_Click(object sender, EventArgs e)
    {
        userId = Convert.ToInt32(ViewState["userId"]);
        email = Convert.ToString(ViewState["email"]);
        Username = Convert.ToString(tbxusername.Text.Trim());
        fathername = tbxfathername.Text.Trim();
        workphone = tbxworkphone.Text.Trim();
        officeaddress = tbxofficeadress.Text.Trim();
        city = DDCity.SelectedItem.Text;
        province = DDProvince.SelectedItem.Text;
        password = tbxrepassword.Text.Trim();
        //string salt = GenerateSalt(8);
        pincode = Convert.ToString(tbxpincode.Text);
        string salt = CreateSalt(8);
        string haspassword = CreatePasswordHash(tbxrepassword.Text.Trim(), salt);

        string message = string.Empty;
        try
        {

            if (fu1.PostedFile != null)
            {
                FileName = Path.GetFileName(fu1.PostedFile.FileName);
                filenamewithoutextension = Path.GetFileNameWithoutExtension(fu1.FileName);
                fileextension = Path.GetExtension(fu1.FileName);
                filenamewithoutextension = Username + fileextension;
                //Save files to disk
                fu1.SaveAs(Server.MapPath("http://decsys.somee.com/Media/UsersPhotos/" + filenamewithoutextension));
            }
            db1.sqlcmd = new SqlCommand("uspSetUserPassword");

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@Password", haspassword);
                db1.sqlcmd.Parameters.AddWithValue("@UserID", userId);
                db1.sqlcmd.Parameters.AddWithValue("@Username", Username);
                db1.sqlcmd.Parameters.AddWithValue("@Fathername", fathername);
                db1.sqlcmd.Parameters.AddWithValue("@Salt", salt);
                DateTime parsed;
                if (DateTime.TryParseExact(tbxdob.Text.Trim(), "dd-MM-yyyy", CultureInfo.CurrentCulture, DateTimeStyles.None, out parsed))
                {
                    db1.sqlcmd.Parameters.AddWithValue("@DOB", parsed);
                }
                //db1.sqlcmd.Parameters.AddWithValue("@DOB", dob);
                db1.sqlcmd.Parameters.AddWithValue("@WorkPhone", workphone);
                db1.sqlcmd.Parameters.AddWithValue("@Avatar", filenamewithoutextension);
                db1.sqlcmd.Parameters.AddWithValue("@AvatarPath", "http://decsys.somee.com/Media/UsersPhotos/" + filenamewithoutextension);
                db1.sqlcmd.Parameters.AddWithValue("@Pincode", pincode);
                db1.sqlcmd.Parameters.AddWithValue("@OfficeProvince", DDProvince.SelectedItem.ToString());
                db1.sqlcmd.Parameters.AddWithValue("@OfficeCity", DDCity.SelectedItem.Text);
                db1.sqlcmd.Parameters.AddWithValue("@OfficeAddress", officeaddress);
                db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteScalar();
                success2 = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            if (success2 == true)
            {
                db1.sqlcon.Close();
                message = "Registration Completed, Click Ok and You Will be Redirct to the Login Page";
                SendActivationEmail();
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                SetFieldtonull();
            }
            else
            {
                db1.sqlcon.Close();
                message = "Registration Failed";
            }
          
        }
    }

    private void SendActivationEmail()
    {

        using (MailMessage mm = new MailMessage("temp5052@gmail.com", email))
        {
            mm.Subject = "Account Activated";
            string body = "Hello " + Username + ",";
            body += "<br /><br />Please Save This Information.";
            body += "<br />Full Name : " + Userfname + " " + Userlname;
            body += "<br />User Name : " + Username;
            body += "<br />Email : " + email;
            body += "<br />Password : " + password;
            body += "<br />Fathername : " + fathername;
            body += "<br />DOB : " + dob;
            body += "<br />Pincode : " + pincode;
            body += "<br />Workphone : " + workphone;
            body += "<br />Office Address : " + officeaddress + " , " + city + " , " + province;
            body += "<br />Your Party Name : " + partyname;
            body += "<br />The Constituency in which you represent Your Party : " + constituency;
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

    private void SetFieldtonull()
    {
        tbxfathername.Text = null;
        tbxdob.Text = null;
        tbxpincode.Text = null;
        tbxworkphone.Text = null;
        tbxofficeadress.Text = null;
        tbxpassword.Text = null;
        tbxrepassword.Text = null;
        
        DDCity.Enabled = false;
        DDProvince.Enabled = false;
    }

}