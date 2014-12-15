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


/// <summary>
/// Summary description for GetAccountRequests
/// </summary>
public class GetAccountRequests
{
      
        public int RequestID { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Int64 CNIC { get; set; }
        public string Email { get; set; }
        public string RequestDate { get; set; }
        public string IsAccepted { get; set; }

    
	public GetAccountRequests()
	{
		//
		// TODO: Add constructor logic here
		//
	}



    public static List<GetAccountRequests> RequestDetails()
    {
        String ConnString = ConfigurationManager.ConnectionStrings["ECII(Old)"].ConnectionString;
       SqlConnection sqlcon = new SqlConnection(ConnString);
       List<GetAccountRequests> List_StudentDetails = new List<GetAccountRequests>();
        try
        {
           SqlCommand sqlcmd = new SqlCommand("Select * from TblAccountRequest", sqlcon);
            sqlcon.Open();
            SqlDataReader rdr = sqlcmd.ExecuteReader();
            while (rdr.Read())
            {
                GetAccountRequests SD = new GetAccountRequests();
                SD.RequestID = Convert.ToInt32(rdr["RequestID"]);//column Name
                SD.UserName = rdr["UserName"].ToString();//column Name
                SD.FirstName = rdr["FirstName"].ToString();//column Name
                SD.LastName = rdr["LastName"].ToString();//column Name
                SD.CNIC = Convert.ToInt64(rdr["CNIC"]);//column Name
                SD.Email = rdr["Email"].ToString();//column Name
                SD.RequestDate = Convert.ToString(rdr["RequestDate"]);//column Name
                SD.IsAccepted = Convert.ToString(rdr["IsAccepted"]);//column Name
                List_StudentDetails.Add(SD);
            }

        }
        catch (Exception ex)
        {
            //your code
        }
        finally
        {
           sqlcon.Close();
        }

        return List_StudentDetails;

    }
}