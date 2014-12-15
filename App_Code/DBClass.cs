using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DBClass
/// </summary>
public class DBClass
{
    public SqlConnection sqlcon;
    public SqlCommand sqlcmd;
	public DBClass()
	{
		//
		// TODO: Add constructor logic here
		//

        String ConnString = ConfigurationManager.ConnectionStrings["ECII(Old)"].ConnectionString;
        sqlcon = new SqlConnection(ConnString);
    }
}