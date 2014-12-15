using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
public partial class UserProfile : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    String UserFirstname, Userlastname, Fullname, Useremail, Userjoinon, UserFathername, UserDOb;
    String UserWorkphone, UserCity, UserProvince, UserOfficeAddress, Partyname, Partyjoiningdate, constituencycode, constituencyname, district, distprovince;
    Int64 AppUsernic;

    int UserID, SubscripID, CurrentSubscriptionid;
    String UserName;
    Boolean HasSubscrip, HasSubscripLife;

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
        GetAppUserProfile();
    }

    public void GetAppUserProfile()
    {
        try
        {
            db1.sqlcmd = new SqlCommand("uspGetUserProfile");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@UserID", UserID);
                db1.sqlcmd.Parameters.Add("@UserName", SqlDbType.VarChar, 20);
                db1.sqlcmd.Parameters["@UserName"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                db1.sqlcmd.Parameters["@Email"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@NIC", SqlDbType.BigInt);
                db1.sqlcmd.Parameters["@NIC"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@CreatedDate", SqlDbType.VarChar, 20);
                db1.sqlcmd.Parameters["@CreatedDate"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@FirstName", SqlDbType.VarChar, 20);
                db1.sqlcmd.Parameters["@FirstName"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@LastName", SqlDbType.VarChar, 20);
                db1.sqlcmd.Parameters["@LastName"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@FatherName", SqlDbType.VarChar, 30);
                db1.sqlcmd.Parameters["@FatherName"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@DateofBirth", SqlDbType.VarChar, 20);
                db1.sqlcmd.Parameters["@DateofBirth"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@OfficeAddress", SqlDbType.VarChar, 500);
                db1.sqlcmd.Parameters["@OfficeAddress"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@AvatarFilePath", SqlDbType.VarChar, 500);
                db1.sqlcmd.Parameters["@AvatarFilePath"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@City", SqlDbType.VarChar, 15);
                db1.sqlcmd.Parameters["@City"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Proivnce", SqlDbType.VarChar, 15);
                db1.sqlcmd.Parameters["@Proivnce"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@WorkPhone", SqlDbType.VarChar, 25);
                db1.sqlcmd.Parameters["@WorkPhone"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@PartyName", SqlDbType.VarChar, 50);
                db1.sqlcmd.Parameters["@PartyName"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@JoiningDate", SqlDbType.VarChar, 20);
                db1.sqlcmd.Parameters["@JoiningDate"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@ConstCode", SqlDbType.VarChar, 25);
                db1.sqlcmd.Parameters["@ConstCode"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@ConstName", SqlDbType.VarChar, 25);
                db1.sqlcmd.Parameters["@ConstName"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@DistrictName", SqlDbType.VarChar, 25);
                db1.sqlcmd.Parameters["@DistrictName"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@DistrictProvince", SqlDbType.VarChar, 25);
                db1.sqlcmd.Parameters["@DistrictProvince"].Direction = ParameterDirection.Output;


                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteScalar();
                UserName = (string)db1.sqlcmd.Parameters["@UserName"].Value;
                UserFirstname = (string)db1.sqlcmd.Parameters["@FirstName"].Value;
                Userlastname = (string)db1.sqlcmd.Parameters["@LastName"].Value;
                UserFathername = (string)db1.sqlcmd.Parameters["@FatherName"].Value;
                Useremail = (string)db1.sqlcmd.Parameters["@Email"].Value;
                UserDOb = (string)db1.sqlcmd.Parameters["@DateofBirth"].Value;
                Userjoinon = (string)db1.sqlcmd.Parameters["@CreatedDate"].Value;
                UserWorkphone = (string)db1.sqlcmd.Parameters["@WorkPhone"].Value;
                UserCity = (string)db1.sqlcmd.Parameters["@City"].Value;
                UserProvince = (string)db1.sqlcmd.Parameters["@Proivnce"].Value;
                UserOfficeAddress = (string)db1.sqlcmd.Parameters["@OfficeAddress"].Value;
                AppUsernic = (Int64)db1.sqlcmd.Parameters["@NIC"].Value;
                ImgAppUser.ImageUrl = (string)db1.sqlcmd.Parameters["@AvatarFilePath"].Value;
                Partyname = (string)db1.sqlcmd.Parameters["@PartyName"].Value;
                Partyjoiningdate = (string)db1.sqlcmd.Parameters["@JoiningDate"].Value;
                constituencycode = (string)db1.sqlcmd.Parameters["@ConstCode"].Value;
                constituencyname = (string)db1.sqlcmd.Parameters["@ConstName"].Value;
                district = (string)db1.sqlcmd.Parameters["@DistrictName"].Value;
                distprovince = (string)db1.sqlcmd.Parameters["@DistrictProvince"].Value;
            }
        }
        catch (Exception ex) { Response.Write(ex.Message); }
        finally
        {
            LblFullname.Text = UserFirstname + "  " + Userlastname;
            LblUsername.Text = UserName;
            LblEmail.Text = Useremail;
            LblJoinedOn.Text = Userjoinon;
            LblCnic.Text = Convert.ToString(AppUsernic);
            LblFathername.Text = UserFathername;
            LblDob.Text = UserDOb;
            LblWorkphone.Text = UserWorkphone;
            LblCityProvince.Text = UserCity + " | " + UserProvince;
            LblofficeAddress.Text = UserOfficeAddress;
            LblPartyname.Text = Partyname;
            LblPartyJoinedOn.Text = Partyjoiningdate;
            LblConstituency.Text = constituencycode + " - " + constituencyname;
            LblDistrict.Text = district;
            LblProvince.Text = distprovince;
            db1.sqlcon.Close();
        }
    }

}