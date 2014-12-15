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

public partial class Registration_Requestaccount : System.Web.UI.Page
{
    String Firstname, Lastname, email;
    Int64 cnic;
    Int32 reqid;
    Boolean success;
    DBClass db1 = new DBClass();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DDDistrict.DataSource = GetData("uspGetDistrict", null);
            DDDistrict.DataBind();

            DDParty.DataSource = GetData("uspGetPartyName", null);
            DDParty.DataBind();

            ListItem lstitemDistrict = new ListItem("Select District in which You Represent Your Party", "-1");
            DDDistrict.Items.Insert(0, lstitemDistrict);

            ListItem lstitemparties = new ListItem("Select Party You Belong", "-1");
            DDParty.Items.Insert(0, lstitemparties);

        }
    }

    protected void lnkbtnlogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login/Login.aspx");
    }

    protected void lnkbtnsignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/Requestaccount.aspx"); 
    }

    protected void lnkbtnhome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AboutUs/HomePage.aspx");
    }

    protected void lnkbtnaboutus_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AboutUs/Aboutus.aspx");
    }

    protected void lnkbtnteam_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AboutUs/OurTeam.aspx");
    }

    protected void lnkbtncontactus_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AboutUs/Contactus.aspx");
    }

    protected void lnkbtncompanynews_Click(object sender, EventArgs e)
    {

    }

    protected void lnkbtnfb_Click(object sender, EventArgs e)
    {

    }

    protected void lnkbtngplus_Click(object sender, EventArgs e)
    {

    }

    protected void lnkbtntwitter_Click(object sender, EventArgs e)
    {

    }

    protected void lnkbtnytube_Click(object sender, EventArgs e)
    {

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

    protected void DDDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDDistrict.SelectedIndex == 0)
        {
            DDConstituency.SelectedIndex = 0;
            DDConstituency.Enabled = false;
        }
        else
        {
            DDConstituency.Enabled = true;
            SqlParameter sqlparamater = new SqlParameter("@DisID", DDDistrict.SelectedValue);
            DataSet ds = GetData("uspGetConstituencyAgainstDistrict", sqlparamater);
            DDConstituency.DataSource = ds;
            DDConstituency.DataBind();
            ListItem lstitemDDDistrict = new ListItem("Select Constituency", "-1");
            DDConstituency.Items.Insert(0, lstitemDDDistrict);

        }
    }

    protected void BtnClear_Click(object sender, EventArgs e)
    {
        setClearallTextField();
    }

    private void setClearallTextField()
    {
        tbxfirstname.Text = null;
        tbxlastname.Text = null;
        tbxnic.Text = null;
        tbxemail.Text = null;
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid) // returns true if all the validation controls pass successfuly.
        {
            cnic = Convert.ToInt64(tbxnic.Text);
            email = tbxemail.Text;
            Firstname = tbxfirstname.Text;
            Lastname = tbxlastname.Text;
            try
            {

                db1.sqlcmd = new SqlCommand("uspAccountRequest");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@FirstName", Firstname);
                    db1.sqlcmd.Parameters.AddWithValue("@LastName", Lastname);
                    db1.sqlcmd.Parameters.AddWithValue("@CNIC", cnic);
                    db1.sqlcmd.Parameters.AddWithValue("@Email", email);
                    db1.sqlcmd.Parameters.AddWithValue("@Party", DDParty.SelectedValue);
                    DateTime parsed;
                    if (DateTime.TryParseExact(tbxpartyjoinson.Text, "dd-MM-yyyy", CultureInfo.CurrentCulture, DateTimeStyles.None, out parsed))
                    {
                        db1.sqlcmd.Parameters.AddWithValue("@PartyJoiningDate", parsed);
                    }

                    db1.sqlcmd.Parameters.AddWithValue("@Constituency", DDConstituency.SelectedValue);
                    db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                    db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Connection = db1.sqlcon;
                    db1.sqlcon.Open();
                    reqid = Convert.ToInt32(db1.sqlcmd.ExecuteScalar());
                    success = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);
                    string message = string.Empty;
                    switch (reqid)
                    {
                        case -1:
                            message = "Supplied email address has already been used.";
                            break;
                        case -2:
                            message = "Supplied CNIC has already been used.";
                            break;
                        case -3:
                            message = "Supplied email address has already been used.";
                            break;
                        case -4:
                            message = "Supplied CNIC has already been used.";
                            break;
                        default:
                            message = "Request Sent successful.\\nYour Request Id is : " + reqid.ToString();
                            break;
                    }
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
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
                    setClearallTextField();
                    string message = "Your request has ben submitted, your request id is " + reqid + " Your will soon get an email about your request";
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "message" + "');", true);
                    Response.AddHeader("REFRESH", "10;URL=~/Registration/Requestaccount.aspx");
                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    db1.sqlcon.Close();
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Failure" + "');", true);

                }

            }
        }
        else
        {
        }
    }


}