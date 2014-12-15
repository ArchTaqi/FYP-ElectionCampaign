using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.IO;


public partial class User_ViewEventDetails : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    Boolean success;
    string FileName, filenamewithoutextension, fileextension;

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["eventid"] = Convert.ToInt32(Request.QueryString["ID"]);
        if (Session["UserName"] != null && Session["UserID"] != null)
        {
            //Retrieving UserName from Session
            ViewState["UserName"] = Convert.ToString(Session["UserName"]);
            ViewState["UserID"] = Convert.ToInt32(Session["UserID"]);
            Session["UserName"] = Convert.ToString(ViewState["UserName"]);
            Session["UserID"] = Convert.ToInt32(ViewState["UserID"]);
        }

        if (!IsPostBack)
        {
            LoadEventData();
        }
        
}
    private void LoadEventData()
    {
        try
        {
            db1.sqlcmd = new SqlCommand("uspgetspecificeventdetails");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@eventid", Convert.ToInt32(ViewState["eventid"]));
                db1.sqlcmd.Parameters.Add("@Title", SqlDbType.VarChar, 50);
                db1.sqlcmd.Parameters["@Title"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Bannerurl", SqlDbType.VarChar, 2000);
                db1.sqlcmd.Parameters["@Bannerurl"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Startdate", SqlDbType.DateTime);
                db1.sqlcmd.Parameters["@Startdate"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Enddate", SqlDbType.DateTime);
                db1.sqlcmd.Parameters["@Enddate"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Starttime", SqlDbType.Time);
                db1.sqlcmd.Parameters["@Starttime"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Endtime", SqlDbType.Time);
                db1.sqlcmd.Parameters["@Endtime"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Venue", SqlDbType.VarChar, 300);
                db1.sqlcmd.Parameters["@Venue"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@City", SqlDbType.VarChar, 40);
                db1.sqlcmd.Parameters["@City"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Contact", SqlDbType.VarChar, 50);
                db1.sqlcmd.Parameters["@Contact"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Details", SqlDbType.VarChar, 2000);
                db1.sqlcmd.Parameters["@Details"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Publishedon", SqlDbType.DateTime);
                db1.sqlcmd.Parameters["@Publishedon"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@Updatedon", SqlDbType.DateTime);
                db1.sqlcmd.Parameters["@Updatedon"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@countlikes", SqlDbType.BigInt);
                db1.sqlcmd.Parameters["@countlikes"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Parameters.Add("@success", SqlDbType.Bit);
                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
                db1.sqlcmd.Connection = db1.sqlcon;
                db1.sqlcon.Open();
              object result= db1.sqlcmd.ExecuteScalar();
              if (result == System.DBNull.Value)
              { Response.Write("Event Searched but returned null value"); }
              else
              {
                  ViewState["Title"] = Convert.ToString(db1.sqlcmd.Parameters["@Title"].Value);
                  ViewState["Bannerurl"] = Convert.ToString(db1.sqlcmd.Parameters["@Bannerurl"].Value);
                  ViewState["Startdate"] = Convert.ToString(db1.sqlcmd.Parameters["@Startdate"].Value);
                  ViewState["Enddate"] = Convert.ToString(db1.sqlcmd.Parameters["@Enddate"].Value);
                  ViewState["Starttime"] = Convert.ToString(db1.sqlcmd.Parameters["@Starttime"].Value);
                  ViewState["Endtime"] = Convert.ToString(db1.sqlcmd.Parameters["@Endtime"].Value);
                  ViewState["Venue"] = Convert.ToString(db1.sqlcmd.Parameters["@Venue"].Value);
                  ViewState["City"] = Convert.ToString(db1.sqlcmd.Parameters["@City"].Value);
                  ViewState["Contact"] = Convert.ToString(db1.sqlcmd.Parameters["@Contact"].Value);
                  ViewState["Details"] = Convert.ToString(db1.sqlcmd.Parameters["@Details"].Value);
                  ViewState["Publishedon"] = Convert.ToString(db1.sqlcmd.Parameters["@Publishedon"].Value);
                  ViewState["Updatedon"] = Convert.ToString(db1.sqlcmd.Parameters["@Updatedon"].Value);
                  ViewState["countlikes"] = Convert.ToString(db1.sqlcmd.Parameters["@countlikes"].Value);
                  success = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);
              }

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
                imgevent.ImageUrl = Convert.ToString(ViewState["Bannerurl"]);
                tbxeventname.Text = Convert.ToString(ViewState["Title"]);
                tbxeventdetails.Text = Convert.ToString(ViewState["Details"]);
                tbxstartdate.Text = Convert.ToString(Convert.ToDateTime(ViewState["Startdate"]).ToString("D"));
                tbxenddate.Text = Convert.ToString(Convert.ToDateTime(ViewState["Enddate"]).ToString("D"));
                tbxstarttime.Text = Convert.ToString(Convert.ToDateTime(ViewState["Starttime"]).ToString("t"));
                tbxendtime.Text = Convert.ToString(Convert.ToDateTime(ViewState["Endtime"]).ToString("t"));
                tbxvenue.Text = Convert.ToString(ViewState["Venue"]);
                tbxcity.Text = Convert.ToString(ViewState["City"]);
                tbxcontact.Text = Convert.ToString(ViewState["Contact"]);
                lblpublishedon.Text = Convert.ToString(Convert.ToDateTime(ViewState["Publishedon"]).ToString("D"));
                if (Convert.ToString(ViewState["Updatedon"]) == Convert.ToString(System.DateTime.Now))
                {
                    lblupdatedon.Text = "Not Yet Updatedd";

                }
                else
                { lblupdatedon.Text = Convert.ToString(Convert.ToDateTime(ViewState["Updatedon"]).ToString("D")); }

                if (Convert.ToInt64(ViewState["countlikes"]) == 1)
                {
                    lbllikes.Text = "0";
                }
                else
                { lbllikes.Text = Convert.ToString(Convert.ToInt64(ViewState["likes"])); }
                
                db1.sqlcon.Close();

            }
            else
            {

            }

        }

    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        ViewState["neweventname"] = Convert.ToString(tbxeventname.Text.Trim());
        ViewState["newdetails"] = Convert.ToString(tbxeventdetails.Text.Trim());
        ViewState["newstartdate"] = Convert.ToString(tbxstartdate.Text.Trim());
        ViewState["newenddate"] = Convert.ToString(tbxenddate.Text.Trim());
        ViewState["newstarttime"] = Convert.ToString(tbxstarttime.Text.Trim());
        ViewState["newendtime"] = Convert.ToString(tbxendtime.Text.Trim());
        ViewState["newvenue"] = Convert.ToString(tbxvenue.Text.Trim());
        ViewState["newcity"] = Convert.ToString(tbxcity.Text.Trim());
        ViewState["newcontact"] = Convert.ToString(tbxcontact.Text.Trim());

        if (fu1.PostedFile != null)
        {
            FileName = Path.GetFileName(fu1.PostedFile.FileName);
            filenamewithoutextension = Path.GetFileNameWithoutExtension(fu1.FileName);
            fileextension = Path.GetExtension(fu1.FileName);
            filenamewithoutextension = tbxeventname.Text.Trim() + fileextension;
            //Save files to disk
            fu1.SaveAs(Server.MapPath("http://decsys.somee.com/Media/Events/" + filenamewithoutextension));
            ViewState["newbanner"] = Convert.ToString(filenamewithoutextension);
        }
        else
        {
            ViewState["newbanner"] = Convert.ToString(ViewState["Posterurl"]);
        }
        Response.Write(ViewState["neweventname"]);
        try
        {
            db1.sqlcmd = new SqlCommand("uspuserupdateevent");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@eventid", Convert.ToInt32(ViewState["eventid"]));
                db1.sqlcmd.Parameters.AddWithValue("@Bannerurl", "../Media/Events/" + Convert.ToString(ViewState["newbanner"]));
                db1.sqlcmd.Parameters.AddWithValue("@eventname", Convert.ToString(tbxeventname.Text.Trim()));
                db1.sqlcmd.Parameters.AddWithValue("@details", Convert.ToString(ViewState["newdetails"]));
                db1.sqlcmd.Parameters.AddWithValue("@startdate", Convert.ToDateTime(ViewState["newstartdate"]));
                db1.sqlcmd.Parameters.AddWithValue("@enddate", Convert.ToDateTime(ViewState["newenddate"]));
                db1.sqlcmd.Parameters.AddWithValue("@starttime", Convert.ToDateTime(ViewState["newstarttime"]));
                db1.sqlcmd.Parameters.AddWithValue("@endtime", Convert.ToDateTime(ViewState["newendtime"]));
                db1.sqlcmd.Parameters.AddWithValue("@venue", Convert.ToString(ViewState["newvenue"]));
                db1.sqlcmd.Parameters.AddWithValue("@city", Convert.ToString(ViewState["newcity"]));
                db1.sqlcmd.Parameters.AddWithValue("@contact", Convert.ToString(ViewState["newcontact"]));
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
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Updatation Successfull" + "');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Updatation Un-Successfull" + "');", true);
            }
        }
    }



    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            db1.sqlcmd = new SqlCommand("Uspdeletespecificevent");
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                db1.sqlcmd.CommandType = CommandType.StoredProcedure;
                db1.sqlcmd.Parameters.AddWithValue("@eventid", Convert.ToInt32(ViewState["eventid"]));
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
                Response.Write("Deleteiton Successfull");
                Response.Redirect("../User/MyEvents.aspx");
            }
            else
            {
                Response.Write("Deleteiton Un-Successfull");
            }
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
    
}