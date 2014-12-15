using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

public partial class Admin_Usersaccountrequest : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    int reqid,userId;
    int temp1, temp2;
    Boolean success;


    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void BtnRegisterCand_Click1(object sender, EventArgs e)
    {
      
        try
        {

            db1.sqlcmd = new SqlCommand("uspApprovedAccountRequest");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@RequestID", Convert.ToInt32(tbxreqid.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@FirstName", Convert.ToString(ViewState["fname"]));
                db1.sqlcmd.Parameters.AddWithValue("@LastName", Convert.ToString(ViewState["lname"]));
                db1.sqlcmd.Parameters.AddWithValue("@CNIC", Convert.ToInt64(ViewState["cnic"]));
                db1.sqlcmd.Parameters.AddWithValue("@Email", Convert.ToString(tbxemail.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@Party", Convert.ToString(ViewState["party"]));
                db1.sqlcmd.Parameters.AddWithValue("@partyjoiningdate", Convert.ToDateTime(ViewState["partyjoiningdate"]));
                db1.sqlcmd.Parameters.AddWithValue("@Constituency", Convert.ToString(ViewState["constituency"]));
                db1.sqlcmd.Parameters.Add("@tempvar", SqlDbType.Int);
                db1.sqlcmd.Parameters["@tempvar"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@tempvar2", SqlDbType.Int);
                db1.sqlcmd.Parameters["@tempvar2"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@tempvar3", SqlDbType.Int);
                db1.sqlcmd.Parameters["@tempvar3"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteScalar();
                userId = Convert.ToInt32(db1.sqlcmd.Parameters["@tempvar"].Value);
                temp1 = Convert.ToInt32(db1.sqlcmd.Parameters["@tempvar2"].Value);
                temp2 = Convert.ToInt32(db1.sqlcmd.Parameters["@tempvar3"].Value);
                success = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);
                db1.sqlcon.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
        finally
        {
            if (userId == 0 & success == false)
            {
                lbloperationstatus.Text = " Operation Un-Successfull";
                lbloperationstatus.Visible = true;
            }
            else
            {
                db1.sqlcon.Close();
                SendActivationEmail(userId);
                SetFieldToNull();
                lbloperationstatus.Text = " Operation Successfull";
                lbloperationstatus.Visible = true;

                Response.Redirect("../Admin/Usersaccountrequest.aspx");
            }
        }
    }


   
    protected void btnreject_Click(object sender, EventArgs e)
    {

        reqid = Convert.ToInt32(tbxreqid.Text);
        try
        {

            db1.sqlcmd = new SqlCommand("uspRejectaccountrequest");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@reqid", reqid);
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
            Response.Write(ex);
        }
        finally
        {
            if (success == true)
            {
                //OperationSuccessfull
                db1.sqlcon.Close();
                SendRejectionemail();
                SetFieldToNull();
                Response.Redirect("../Admin/Usersaccountrequest.aspx");
            }
            else
            {
                //Operation UnSuccessfull
                db1.sqlcon.Close();

                ;
            }

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
                db1.sqlcmd.Parameters.AddWithValue("@UserId", userId);
                db1.sqlcmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteNonQuery();
                db1.sqlcon.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
        finally
        {
            db1.sqlcon.Close();
            try
            {

                using (MailMessage mm = new MailMessage("temp5052@gmail.com", tbxemail.Text))
                {
                    mm.Subject = "Account Activation";
                    string body = "Hello " + Convert.ToString(ViewState["fname"]) + " " + Convert.ToString(ViewState["lname"]);
                    body += "Your account informatin against the following information is beening approved. <br />";
                    body += "Name : " + Convert.ToString(ViewState["fname"]) + " " + Convert.ToString(ViewState["lname"]);
                    body += "<br />Email : " + Convert.ToString(tbxemail.Text) + " <br />";
                    body += "NIC : " + Convert.ToInt64(ViewState["cnic"]) + " <br />";
                    body += "Party : " + Convert.ToString(ViewState["party"]) + " <br />";
                    body += "Joins on : " + Convert.ToDateTime(ViewState["partyjoiningdate"]) + " <br />";
                    body += "Constituency : " + Convert.ToString(ViewState["constituency"]) + " <br />";
                    body += "Account Request Date : " + Convert.ToDateTime(ViewState["accountreqdate"]) + " <br />";
                    body += "<br /><br />Please click the following link to activate your account";
                    body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("Usersaccountrequest.aspx", "../Registration/Useraccountactivation.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>";
                    body += "<br /><br />Instruction: <br />";
                    body += "1. Upon visiitng the link build up your profile first then you are all ready to login. <br />";
                    body += "2. After successfull login, you must purchase an account to avail the services of this website. <br />";
                    body += "2. Upon buliding your profile successfully, you will also recieve an email of your detial informatin, kep that information safe in your email or some where else. <br />";
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

            }

        }


    }



   private void  SendRejectionemail()
    {

        using (MailMessage mm = new MailMessage("temp5052@gmail.com", tbxemail.Text))
        {
            mm.Subject = "Account Disapproval";
            string body = "Hello " + Convert.ToString(ViewState["fname"]) + " " + Convert.ToString(ViewState["lname"]);
            body += "Your account informatin against the following information is beening rejected. <br />";
            body += "Name : " + Convert.ToString(ViewState["fname"]) + " " + Convert.ToString(ViewState["lname"]);
            body += "<br />Email : " + Convert.ToString(tbxemail.Text) + " <br />";
            body += "NIC : " + Convert.ToInt64(ViewState["cnic"]) + " <br />";
            body += "Party : " + Convert.ToString(ViewState["party"]) + " <br />";
            body += "Joins on : " + Convert.ToDateTime(ViewState["partyjoiningdate"]) + " <br />";
            body += "Constituency : " + Convert.ToString(ViewState["constituency"]) + " <br />";
            body += "Account Request Date : " + Convert.ToDateTime(ViewState["accountreqdate"]) + " <br />";
            body += "Rejection Reason : " + tbxcomments.Text.Trim() + " <br />";
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



    private void SetFieldToNull()
    {
        tbxreqid.Text = null;
        tbxemail.Text = null;
        tbxcomments.Text = null;
    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        tbxreqid.Text = GridView1.SelectedRow.Cells[1].Text;
        ViewState["fname"] = GridView1.SelectedRow.Cells[2].Text;
        ViewState["lname"] = GridView1.SelectedRow.Cells[3].Text;
        ViewState["cnic"] = GridView1.SelectedRow.Cells[4].Text;
        tbxemail.Text = GridView1.SelectedRow.Cells[5].Text;
        ViewState["constituency"] = GridView1.SelectedRow.Cells[6].Text;
        ViewState["party"] = GridView1.SelectedRow.Cells[7].Text;
        ViewState["partyjoiningdate"] = GridView1.SelectedRow.Cells[8].Text;
        ViewState["accountreqdate"] = GridView1.SelectedRow.Cells[9].Text;
        
    }



}
