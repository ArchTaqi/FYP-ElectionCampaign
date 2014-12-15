using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

public partial class Admin_AddParty : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    string FileName, Filename1;
    int UserID;
    String UserName;
    string filenamewithoutextension1, fileextension1, filenamewithoutextension2, fileextension2;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserID"] != null)
        {
            //Retrieving UserName from Session
            UserName = Convert.ToString(Session["UserName"]);
            UserID = Convert.ToInt32(Session["UserID"]);
            Session["UserName"] = UserName;
            Session["UserID"] = UserID;
        }

    }

    protected void BtnAddParty_Click1(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int userId = 0;
            string message = string.Empty;
            try
            {
                if (fu1.PostedFile != null)
                {
                    FileName = Path.GetFileName(fu1.PostedFile.FileName);
                    filenamewithoutextension1 = Path.GetFileNameWithoutExtension(fu1.FileName);
                    fileextension1 = Path.GetExtension(fu1.FileName);
                    filenamewithoutextension1 = TxtBxPartyName.Text.Trim() + "Symbol" + fileextension1;
                    //Save files to disk
                    fu1.SaveAs(Server.MapPath("http://decsys.somee.com/Media/PartiesPhotos/" + filenamewithoutextension1));
                }
                if (fu2.PostedFile != null)
                {
                    Filename1 = Path.GetFileName(fu2.PostedFile.FileName);
                    filenamewithoutextension2 = Path.GetFileNameWithoutExtension(fu2.FileName);
                    fileextension2 = Path.GetExtension(fu2.FileName);
                    filenamewithoutextension2 = TxtBxPartyName.Text.Trim() + "Flag" + fileextension2;
                    //Save files to disk
                    fu2.SaveAs(Server.MapPath("http://decsys.somee.com/Media/PartiesPhotos/" + filenamewithoutextension2));
                }

                db1.sqlcmd = new SqlCommand("UspAddParty");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@PartyName", TxtBxPartyName.Text.Trim());
                    db1.sqlcmd.Parameters.AddWithValue("@PartyLeader", TxtBxPLeader.Text.Trim());
                    db1.sqlcmd.Parameters.AddWithValue("@PartyAddress", TxtBxPAdress.Text.Trim());
                    db1.sqlcmd.Parameters.AddWithValue("@PartyLogo", filenamewithoutextension1);
                    db1.sqlcmd.Parameters.AddWithValue("@PartyLogoPath ", "http://decsys.somee.com/Media/PartiesPhotos/" + filenamewithoutextension1);
                    db1.sqlcmd.Parameters.AddWithValue("@PartyFlag", filenamewithoutextension2);
                    db1.sqlcmd.Parameters.AddWithValue("@PartyFlagPath", "http://decsys.somee.com/Media/PartiesPhotos/" + filenamewithoutextension2);
                    db1.sqlcmd.Parameters.AddWithValue("@PartyDescription", TxtBoxPartyDescription.Text.Trim());
                    db1.sqlcmd.Connection = db1.sqlcon;
                    db1.sqlcon.Open();
                    userId = Convert.ToInt32(db1.sqlcmd.ExecuteScalar());
                    //Image1.ImageUrl = "~/ShowImage.ashx?id=" + id;
                    switch (userId)
                    {
                        case -1:
                            message = "Party Name already exists.\\nPlease choose a different Party Name.";
                            break;
                        case -2:
                            message = "A Party Logo of this name is already exists.\\nPlease Rename your Picture.";
                            break;
                        case -3:
                            message = "A Party Flag of this name is already exists.\\n Please Rename your Pictures.";
                            break;
                        default:
                            message = "Registration successful.\\nParty Id: " + userId.ToString();
                            break;
                    }
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex);
            }
            finally
            {
                TxtBxPartyName.Text = null;
                TxtBoxPartyDescription.Text = null;
                db1.sqlcon.Close();
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }


        }

        else
        {
            //Validation Failed
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

    protected void cvfu2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        String fileName = fu2.PostedFile.FileName;
        if (fu2.HasFile)
        {
            string fileExt = System.IO.Path.GetExtension(fu2.FileName);

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

}