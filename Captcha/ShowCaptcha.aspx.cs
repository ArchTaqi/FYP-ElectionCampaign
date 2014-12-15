using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;

public partial class ShowCaptcha : System.Web.UI.Page
{
   protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCaptcha_Click(object sender, EventArgs e)
    {
        if (Session["CaptchaCode"] != null && txtCaptcha.Text == Session["CaptchaCode"].ToString())
        {

            lblMessage.ForeColor = Color.Green;

            lblMessage.Text = "Captcha code validated successfully!!";

        }

        else
        {

            lblMessage.ForeColor = Color.Red;

            lblMessage.Text = "Captcha code is wrong!!";

        }
    }
}
