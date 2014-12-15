using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Globalization;

public partial class PostEvent : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    int UserID, SubscripID;
    String UserName;
    Boolean HasSubscrip, HasSubscripLife;
    Boolean success;
    string FileName;
    string filenamewithoutextension, fileextension;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserID"] != null)
        {
            //Retrieving UserName from Session
            UserName = Convert.ToString(Session["UserName"]);
            ViewState["UserID"] = Convert.ToInt32(Session["UserID"]);
            Session["UserName"] = UserName;
            Session["UserID"] = Convert.ToInt32(ViewState["UserID"]);
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
        if (!IsPostBack)
        {

            SqlParameter sqlparamater = new SqlParameter("@userid", Convert.ToInt32(ViewState["UserID"]));
            DataSet ds = GetData("uspGetUsertargetconstituencies", sqlparamater);
            ddltargetconstituency.DataSource = ds;
            ddltargetconstituency.DataBind();
            ListItem lstitemDistrict = new ListItem("Select the Constituency", "-1");
            ddltargetconstituency.Items.Insert(0, lstitemDistrict);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            if (fu1.PostedFile != null)
            {
                FileName = Path.GetFileName(fu1.PostedFile.FileName);
                filenamewithoutextension = Path.GetFileNameWithoutExtension(fu1.FileName);
                fileextension = Path.GetExtension(fu1.FileName);
                filenamewithoutextension = TBEname.Text.Trim() + fileextension;
                //Save files to disk
                fu1.SaveAs(Server.MapPath("http://decsys.somee.com/Media/Events/" + filenamewithoutextension));
            }

            try
            {
                db1.sqlcmd = new SqlCommand("uspAddEvent");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                    db1.sqlcmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(ViewState["UserID"]));
                    db1.sqlcmd.Parameters.AddWithValue("@constid", ddltargetconstituency.SelectedValue);
                    db1.sqlcmd.Parameters.AddWithValue("@Title", Convert.ToString(TBEname.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@Details", Convert.ToString(TBDetails.Text.Trim()));
                    DateTime parsed;
                    if (DateTime.TryParseExact(TBstartdate.Text, "dd-MM-yyyy", CultureInfo.CurrentCulture, DateTimeStyles.None, out parsed))
                    {
                        db1.sqlcmd.Parameters.AddWithValue("@Startdate", parsed);
                    }
                    DateTime parsed2;
                    if (DateTime.TryParseExact(TBenddate.Text, "dd-MM-yyyy", CultureInfo.CurrentCulture, DateTimeStyles.None, out parsed2))
                    {
                        db1.sqlcmd.Parameters.AddWithValue("@Enddate", parsed2);
                    }
                    db1.sqlcmd.Parameters.AddWithValue("@Starttime", Convert.ToString(TBstarttime.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@Endtime", Convert.ToString(TBendtime.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@City", DDCity.SelectedItem.Text);
                    db1.sqlcmd.Parameters.AddWithValue("@Venue", Convert.ToString(TBvenue.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@Contact", Convert.ToString(TBcontact.Text.Trim()));
                    db1.sqlcmd.Parameters.AddWithValue("@Bannerurl", "http://decsys.somee.com/Media/Events/" + filenamewithoutextension);
                    db1.sqlcmd.Parameters.Add("@temp1", SqlDbType.Int);
                    db1.sqlcmd.Parameters["@temp1"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                    db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                    db1.sqlcmd.Connection = db1.sqlcon;
                    db1.sqlcon.Open();
                    int i = Convert.ToInt32(db1.sqlcmd.ExecuteScalar());
                    string message = string.Empty;
                    switch (i)
                    {
                        case -1:
                            message = "Supplied Poster name has already been used, Please Rename your Poster Name";
                            break;
                        case -2:
                            message = "Supplied event name has already been used.";
                            break;
                        default:
                            message = "Posted successful.\\nYour Event id is : " + i.ToString();
                            break;
                    }
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                }
                success = (bool)db1.sqlcmd.Parameters["@success"].Value;
                Int32 temp1 = (Int32)db1.sqlcmd.Parameters["@temp1"].Value;
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }

            finally
            {
                if (success == true)
                {
                    setallfieldempty();
                    Response.Redirect("../User/PostEvent.aspx");

                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "failure" + "');", true);
                }


            }
        }
        else
        {
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

    private void setallfieldempty()
    {
        TBvenue.Text = null;
        TBEname.Text = null;
        TBDetails.Text = null;
        TBcontact.Text = null;
        TBenddate.Text = null;
        TBendtime.Text = null;
        TBstartdate.Text = null;
        TBstarttime.Text = null;         
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
    
}