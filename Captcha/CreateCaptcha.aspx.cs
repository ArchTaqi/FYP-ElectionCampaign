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
using System.Drawing.Imaging;
using System.Drawing;
using System.Text;

public partial class CreateCaptcha : System.Web.UI.Page
{
    Random rand = new Random();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CreateCaptchaImage();

        }


    }
    private void CreateCaptchaImage()
    {

        string code = GetRandomText();

        Bitmap bitmap = new Bitmap(200, 60, System.Drawing.Imaging.PixelFormat.Format32bppArgb);

        Graphics g = Graphics.FromImage(bitmap);

        Pen pen = new Pen(Color.Yellow);

        Rectangle rect = new Rectangle(0, 0, 200, 60);

        SolidBrush blue = new SolidBrush(Color.Honeydew);

        SolidBrush black = new SolidBrush(Color.Green);

        int counter = 0;

        g.DrawRectangle(pen, rect);

        g.FillRectangle(blue, rect);

        for (int i = 0; i < code.Length; i++)
        {

            g.DrawString(code[i].ToString(), new Font("Tahoma", 10 + rand.Next(15, 20), FontStyle.Italic), black, new PointF(10 + counter, 10));

            counter += 28;

        }

        DrawRandomLines(g);

        bitmap.Save(Response.OutputStream, ImageFormat.Gif);

        g.Dispose();

        bitmap.Dispose();



    }





    private void DrawRandomLines(Graphics g)
    {

        SolidBrush yellow = new SolidBrush(Color.Yellow);

        for (int i = 0; i < 20; i++)

        { g.DrawLines(new Pen(yellow, 1), GetRandomPoints()); }



    }



    private Point[] GetRandomPoints()
    {

        Point[] points = { new Point(rand.Next(0, 150), rand.Next(1, 150)), new Point(rand.Next(0, 200), rand.Next(1, 190)) };

        return points;

    }



    private string GetRandomText()
    {

        StringBuilder randomText = new StringBuilder();

        string alphabets = "012345679ACEFGHKLMNPRSWXZabcdefghijkhlmnopqrstuvwxyz@!#$%^*()_+";

        Random r = new Random();

        for (int j = 0; j <= 5; j++)

        { randomText.Append(alphabets[r.Next(alphabets.Length)]); }

        Session["CaptchaCode"] = randomText.ToString();
        string q = randomText.ToString();
        return Session["CaptchaCode"] as String;

    }
}