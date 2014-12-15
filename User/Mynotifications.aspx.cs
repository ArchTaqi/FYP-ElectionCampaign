using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class User_Mynotifications : System.Web.UI.Page
{
    DBClass db1 = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {
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
            SqlParameter sqlparamater = new SqlParameter("@userid", Convert.ToInt32(ViewState["UserID"]));
            DataSet ds = GetData("uspGetUsertargetconstituencies", sqlparamater);
            ddltargetconstituency.DataSource = ds;
            ddltargetconstituency.DataBind();
            ListItem lstitemDistrict = new ListItem("Select the Constituency", "-1");
            ddltargetconstituency.Items.Insert(0, lstitemDistrict);
           
        }
       
    }



    //public void LoadData()
    //{

    //    string strCon = ConfigurationManager.ConnectionStrings["ECII(Old)ConnectionString"].ConnectionString;
    //    using (SqlConnection Sqlcon = new SqlConnection(strCon))
    //    {

    //        using (SqlCommand cmd = new SqlCommand())
    //        {

    //            Sqlcon.Open();
    //            cmd.Connection = Sqlcon;
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.CommandText = "uspGetUsernotifications"; 
    //            cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(ViewState["UserID"]));
    //            cmd.Parameters.AddWithValue("@constid", ddltargetconstituency.SelectedValue);
    //            SqlDataAdapter SqlAda = new SqlDataAdapter(cmd);
    //            DataSet ds = new DataSet();
    //            SqlAda.Fill(ds);
    //            DataList1.DataSource = ds;
    //            DataList1.DataBind();

    //        }

    //    }
    //}


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

    //private void Edit_Command(object source, DataListCommandEventArgs e)
    //{
    //    // Set the DataList's EditItemIndex property to the
    //    // index of the DataListItem that was clicked
    //    DataList1.EditItemIndex = e.Item.ItemIndex;
    //    // Rebind the data to the DataList
    //    LoadData();

    //}

    //private void Cancel_Command(object source, DataListCommandEventArgs e)
    //{
    //    // Set the DataList's EditItemIndex property to -1
    //    DataList1.EditItemIndex = -1;
    //    // Rebind the data to the DataList
    //    LoadData();

    //}

    //private void Update_Command(object source, DataListCommandEventArgs e)
    //{

    //    // Read in the ProductID from the DataKeys collection
    //    int ID = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);
    //    // Read in the product name and price values
    //    TextBox Body = (TextBox)e.Item.FindControl("Body");
    //    string BodyValue = Body.Text;
       
    //    try{
    //        db1.sqlcmd = new SqlCommand("uspupdatenotification");
    //            using (SqlDataAdapter sda = new SqlDataAdapter())
    //            {
    //                db1.sqlcmd.CommandType = CommandType.StoredProcedure; 
    //                db1.sqlcmd.Parameters.AddWithValue("@notificaitonid", ID);
    //                db1.sqlcmd.Parameters.AddWithValue("@Body", BodyValue);
    //                db1.sqlcmd.Parameters.Add("@success", SqlDbType.VarChar, 50); 
    //                db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
    //                db1.sqlcmd.Connection = db1.sqlcon;
    //                db1.sqlcon.Open();
    //                db1.sqlcmd.ExecuteScalar();
    //                Boolean success = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);
    //            }

    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //    finally {
    //        DataList1.EditItemIndex = -1;
    //    LoadData();

    //    }

       

    //}


    //protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    //{
    //    // Read in the ProductID from the DataKeys collection
    //    int productID = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);
    //    // Delete the data
    //    try
    //    {
    //        db1.sqlcmd = new SqlCommand("uspupdatenotification");
    //        using (SqlDataAdapter sda = new SqlDataAdapter())
    //        {
    //            db1.sqlcmd.CommandType = CommandType.StoredProcedure;
    //            db1.sqlcmd.Parameters.AddWithValue("@notificaitonid", ID);
    //            db1.sqlcmd.Parameters.Add("@success", SqlDbType.VarChar, 50);
    //            db1.sqlcmd.Parameters["@success"].Direction = ParameterDirection.Output;
    //            db1.sqlcmd.Connection = db1.sqlcon;
    //            db1.sqlcon.Open();
    //            db1.sqlcmd.ExecuteScalar();
    //            Boolean success = Convert.ToBoolean(db1.sqlcmd.Parameters["@success"].Value);
    //        }

    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //    finally
    //    {
    //        DataList1.EditItemIndex = -1;
    //        LoadData();

    //    }
    //}



    protected void btnview_Click(object sender, EventArgs e)
    {
        string strCon = ConfigurationManager.ConnectionStrings["ECII(Old)"].ConnectionString;
        using (SqlConnection Sqlcon = new SqlConnection(strCon))
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                Sqlcon.Open();
                cmd.Connection = Sqlcon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "uspGetUsernotifications"; 
                cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(ViewState["UserID"]));
                cmd.Parameters.AddWithValue("@constid", ddltargetconstituency.SelectedValue);
                SqlDataAdapter SqlAda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                SqlAda.Fill(ds);
                gvnotifications.DataSource = ds;
                gvnotifications.DataBind();
    }}}

        
        protected void gvnotifications_SelectedIndexChanged(object sender, EventArgs e)
        {

            int notificid = Convert.ToInt32(gvnotifications.SelectedRow.Cells[1].Text);
            Response.Redirect("../User/viewnotificationdetails.aspx?ID=" + notificid);
        
        
        
        }


}