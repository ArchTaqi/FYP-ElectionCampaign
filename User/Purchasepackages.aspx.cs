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
using System.IO;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;
using System.Globalization;

public partial class User_Purchasepackages : System.Web.UI.Page
{

    DBClass db1 = new DBClass();
    Boolean succcess;

    int UserID, SubscripID, CurrentSubscriptionid;
    String UserName;
    Boolean HasSubscrip, HasSubscripLife;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserID"] != null )
        {
            //Retrieving UserName from Session
            UserName = Convert.ToString(Session["UserName"]);
            ViewState["UserID"] = Convert.ToInt32(Session["UserID"]);
            if (Session["SubscripID"] != null && Session["HasSubscrip"] != null && Session["HasSubscripLife"] != null)
            {
                SubscripID = Convert.ToInt32(Session["SubscripID"]);
                HasSubscrip = Convert.ToBoolean(Session["HasSubscrip"]);
                HasSubscripLife = Convert.ToBoolean(Session["HasSubscripLife"]);
            }
            if (Convert.ToBoolean(Session["HasSubscrip"]) == true && Convert.ToBoolean(Session["HasSubscripLife"]) == true)
            {
                ViewState["CurrentSubscriptionid"] = SubscripID;
            }
            else
            {
                ViewState["CurrentSubscriptionid"] = 0;
            }
            Session["UserName"] = UserName;
            Session["UserID"] = Convert.ToInt32(ViewState["UserID"]);
            Session["SubscripID"] = SubscripID;
            Session["HasSubscrip"] = HasSubscrip;
            Session["HasSubscripLife"] = HasSubscripLife;
        }


        if (!IsPostBack)
        {
            DDDistrict.DataSource = GetData("uspGetDistrict", null);
            DDDistrict.DataBind();
            ListItem lstitemDistrict = new ListItem("Select District", "-1");
            DDDistrict.Items.Insert(0, lstitemDistrict);

            ddpackages.DataSource = GetData("uspGetPackages", null);
            ddpackages.DataBind();
            ListItem lstitemddpackages = new ListItem("Select Package", "-1");
            ddpackages.Items.Insert(0, lstitemddpackages);


                DDProvince.DataSource = GetData("uspGetProvinces", null);
                DDProvince.DataBind();

                ListItem lstitemProvince = new ListItem("Select State", "-1");
                DDProvince.Items.Insert(0, lstitemProvince);

                ListItem lstitemCities = new ListItem("Select City", "-1");
                DDCity.Items.Insert(0, lstitemCities);
                DDCity.Enabled = false;
           
        }
       
    }

    protected void btnpay_Click(object sender, EventArgs e)
    {

        try
        {
            db1.sqlcmd = new SqlCommand("uspPurchasepackage");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@userid", Convert.ToInt32(ViewState["UserID"]));
                db1.sqlcmd.Parameters.AddWithValue("@const", Convert.ToInt32(DDConstituency.SelectedValue));
                db1.sqlcmd.Parameters.AddWithValue("@package", Convert.ToInt32(ddpackages.SelectedValue));
                db1.sqlcmd.Parameters.AddWithValue("@cardno", Convert.ToInt64(tbxcardnumber.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@PayMethod", Convert.ToString(ddcardtype.Text));
                DateTime parsed;
                if (DateTime.TryParseExact(tbxexpirationdate.Text.Trim(), "dd-MM-yyyy", CultureInfo.CurrentCulture, DateTimeStyles.None, out parsed))
                {
                    db1.sqlcmd.Parameters.AddWithValue("@expdate", parsed);
                }
                db1.sqlcmd.Parameters.AddWithValue("@ccv", Convert.ToInt32(tbxccv.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@cardholdername", Convert.ToString(tbxcardholdername.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@address", Convert.ToString(tbxaddress.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@city", Convert.ToInt32(DDCity.SelectedValue));
                db1.sqlcmd.Parameters.AddWithValue("@zipcode", Convert.ToInt32(tbxzipcode.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@phonenumber", Convert.ToString(tbxphonenumber.Text.Trim()));
                db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@temp1", SqlDbType.Int);
                db1.sqlcmd.Parameters["@temp1"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                db1.sqlcmd.ExecuteScalar();
                succcess = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);
                Int32 temp1 = Convert.ToInt32(db1.sqlcmd.Parameters["@temp1"].Value);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
        finally
        {

            if (succcess == true)
            {
                db1.sqlcon.Close();
                Response.Redirect(Request.RawUrl);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Operation Successfull" + "');", true);
            }
            else
            {
                db1.sqlcon.Close();
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Operation Un-Successfull" + "');", true);

            }


        }




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


    
}