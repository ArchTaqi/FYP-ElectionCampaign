using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class User_PostNotification : System.Web.UI.Page
{
        DBClass db1 = new DBClass();
        String UserName, strnotification;
        int UserID, SubscripID, CurrentSubscriptionid; 
        Boolean success;

    
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

            SqlParameter sqlparamater = new SqlParameter("@userid", Convert.ToInt32(ViewState["UserID"]));
            DataSet ds = GetData("uspGetUsertargetconstituencies", sqlparamater);
            ddltargetconstituency.DataSource = ds;
            ddltargetconstituency.DataBind();
            ListItem lstitemDistrict = new ListItem("Select the Constituency", "-1");
            ddltargetconstituency.Items.Insert(0, lstitemDistrict);
        }
    }

  
    private DataTable GetData()
    {

        db1.sqlcmd = new SqlCommand("uspGetNotification");
        using (SqlDataAdapter sda = new SqlDataAdapter(db1.sqlcmd))
        {
            DataTable dt = new DataTable();
            db1.sqlcmd.CommandType = CommandType.StoredProcedure;
            db1.sqlcmd.Parameters.AddWithValue("@PostedBy", UserID);
            db1.sqlcmd.Parameters.AddWithValue("@SubcriptionId", SubscripID);
            db1.sqlcmd.Connection = db1.sqlcon;
            db1.sqlcon.Open();
            db1.sqlcmd.ExecuteReader();
            db1.sqlcon.Close();
            sda.Fill(dt);
            return dt;
        }

//alternative 1
        //db1.sqlcmd = new SqlCommand();
        //SqlDataAdapter da = new SqlDataAdapter();
        //DataTable dt = new DataTable();
        //db1.sqlcmd.Connection = db1.sqlcon;
        //db1.sqlcon.Open();
        //try
        //{
        //    db1.sqlcmd = new SqlCommand("uspGetNotificaion", db1.sqlcon);
        //    db1.sqlcmd.Parameters.Add(new SqlParameter("@EMPLOYEENO", UserID));
        //    db1.sqlcmd.CommandType = CommandType.StoredProcedure;
        //    da.SelectCommand = db1.sqlcmd;
        //    da.Fill(dt);
        //    return dt;         
        //}
        //catch (Exception x)
        //{        
        //}
        //finally
        //{
        //    db1.sqlcmd.Dispose();
        //    db1.sqlcon.Close();
        //}
        //return dt;
//alternative 2
        //using (SqlConnection con = new SqlConnection())
        //{
        //    db1.sqlcmd.Connection = db1.sqlcon;
        //    db1.sqlcon.Open();
        //    if (db1.sqlcon.State == ConnectionState.Closed)
        //    {
        //        db1.sqlcmd.Connection = db1.sqlcon;
        //        db1.sqlcon.Open();
        //    }
        //    using (SqlCommand cmd = new SqlCommand())
        //    {
        //        DataTable dt = new DataTable();

        //        cmd.Connection = con;
        //        cmd.CommandText = "Select * from HolidaysDetails Where Deleted='N'";
        //        cmd.ExecuteReader();
        //        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //        con.Close();
        //        sda.Fill(dt);
        //        return dt;
        //    }
        //}

    }
 

    protected void ButPost_Click(object sender, EventArgs e)
    {
        Response.Write(ddltargetconstituency.SelectedValue);
        strnotification = tbbody.Text;
        try
        {
            db1.sqlcmd = new SqlCommand("uspAddNotification");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@PublishedBy", Convert.ToInt32(ViewState["UserID"]));
                db1.sqlcmd.Parameters.AddWithValue("@constid", ddltargetconstituency.SelectedValue);
                db1.sqlcmd.Parameters.AddWithValue("@Body", Convert.ToString(tbbody.Text.Trim()));
                db1.sqlcmd.Parameters.Add("@temp1", SqlDbType.Int);
                db1.sqlcmd.Parameters["@temp1"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
                int i = Convert.ToInt32(db1.sqlcmd.ExecuteScalar());
                string message = string.Empty;
                message = "Posted successful.";
                LblWarning.Text = message;
                LblWarning.Visible = true;
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
                db1.sqlcon.Close();
                setallfieldempty();
                Response.Redirect(Request.RawUrl);

            }
            else
            {
                Response.Write("Error Occured");
            }


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

    private void setallfieldempty()
    {
        tbbody.Text = null;
    }
}