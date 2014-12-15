<%@ Page Title="" Language="C#" MasterPageFile="~/AboutUs/Home.master" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="AboutUs_Contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
      .BtnClass {
            background-color: #EEEEEE;
            /*background-color:rgb(153, 153, 153);*/
            border: rgb(153, 153, 153) 2px solid;
            font-family: Tahoma, Verdana, sans-serif;
            font-weight: lighter;
            color: black;
            font-size: 12px;
            font-style: normal;
            vertical-align: baseline;
            text-decoration: none;
            font-variant: normal;
            letter-spacing: normal;
            line-height: 13px;
            text-align: center;
            text-indent: 0px;
            text-transform: none;
            white-space: normal;
        }

            .BtnClass:focus {
                background-color: rgb(0, 0, 0);
                border: rgb(0, 0, 0) 5px solid;
                font-family: Tahoma, Verdana, sans-serif;
                font-weight: lighter;
                color: white;
                font-size: 12px;
                font-style: normal;
                vertical-align: baseline;
                text-decoration: none;
                font-variant: normal;
                letter-spacing: normal;
                line-height: 13px;
                text-align: center;
                text-indent: 0px;
                text-transform: none;
                white-space: normal;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="width: 99.6%; height: 100%;  text-align: center; vertical-align: middle;">
<%-- Div Heading--%>
<div style="width: 20%; height: 30px; margin:0 auto; line-height: 30px; font-family: Calibri; font-size: xx-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: black; ">
<asp:Label ID="Label11" runat="server" Text=" GET IN TOUCH" Font-Underline="True"></asp:Label></div>

<div style="width:100%; height:500px; margin:0 auto; margin-top:10px; ">
<%--Left Sub DIV--%>
<div style="width:30%; height:500px; margin:0 auto; float:left;  ">
<%--1st Row--%>
<div style="width:30%; height:30px; float:left; line-height:20px; text-align:right; margin-top:10px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/i_contact.png" Height="24" /></div>
<div style="width:60%; height:30px; float: left; line-height:20px; text-align:left; margin-top:10px; margin-left:5%; ">
    <asp:Label ID="Label4" runat="server" Text="decpk.official@gmail.com" Font-Names="Calibri" Font-Size="Small" ForeColor="Black"></asp:Label>   </div>
<%--2nd Row--%>
<div style="width:30%; height:30px; float:left; line-height:20px; text-align:right; margin-top:10px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/phone (1).png" Height="24" /></div>
<div style="width:60%; height:30px; float: left; line-height:20px; text-align:left; margin-top:10px; margin-left:5%; ">
    <asp:Label ID="Label5" runat="server" Text="03455097679" Font-Names="Calibri" Font-Size="Small" ForeColor="Black"></asp:Label>   </div>
<%--3rd Row--%>
<div style="width:30%; height:30px; float:left; line-height:20px; text-align:right; margin-top:20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/i_view_page.png" Height="24" /></div>
<div style="width:60%; height:30px; float: left; line-height:20px; text-align:left; margin-top:20px; margin-left:5%; ">
    <asp:Label ID="Label6" runat="server" Text="PMAS-ARID-UIIT Rawalpindi, Pakistan" Font-Names="Calibri" Font-Size="Small" ForeColor="Black"></asp:Label>   </div>
</div>


    <%--Right Sub DIV--%>
<div style="width:68%; height:500px; margin:0 auto; float:left; ">
<%--1st Row--%>
    <div style="width:30%; height:20px; float:left; line-height:20px; text-align:right; margin-top:20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
<asp:Label ID="Label1" runat="server"  Text="your Name" Height="30"></asp:Label><asp:Label ID="Label7" runat="server"  Text="*" Height="30" ForeColor="Red"></asp:Label>
</div>
<div style="width:60%; height:20px; float: left; line-height:20px; text-align:left; margin-top:20px; margin-left:5%; ">
<asp:TextBox ID="tbxname" runat="server" CssClass="TextBoxClass" Width="60%" TextMode="SingleLine" ToolTip="your Name" placeholder="E.g Taqi Hassan"  AutoCompleteType="Disabled" ></asp:TextBox>
<asp:RequiredFieldValidator ID="rvtbxname" runat="server" ControlToValidate="tbxname" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="your name is missing" Text="*" ForeColor="Red" Font-Names="Calibri" Font-Size="small"></asp:RequiredFieldValidator>   
</div>
<%--2nd Row--%>
<div style="width:30%; height:20px; float:left; line-height:20px; text-align:right; margin-top:20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
<asp:Label ID="Label2" runat="server"  Text="Email Address:" Height="30"></asp:Label><asp:Label ID="Label8" runat="server"  Text="*" Height="30" ForeColor="Red"></asp:Label>
</div>
<div style="width:60%; height:20px; float: left; line-height:20px; text-align:left; margin-top:20px; margin-left:5%; ">
<asp:TextBox ID="tbxemail" runat="server" CssClass="TextBoxClass" Width="60%" TextMode="SingleLine" ToolTip="Enter Your Email Address"  AutoCompleteType="Disabled" placeholder="E.g. username@domain.com"></asp:TextBox>
<asp:RequiredFieldValidator ID="rvemail" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="email is missing." Text="*" ControlToValidate="tbxemail" Font-Names="Calibri" Font-Size="small" ForeColor="Red" ></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="regexemail" runat="server" Display="None" ValidationGroup="valgroupsubmit" ControlToValidate="tbxemail"  ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" ErrorMessage="invalid email format" Text="*" Font-Names="Calibri" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>
</div>
<%--3rd Row--%>
<div style="width:30%; height:150px; float:left; line-height:20px; text-align:right; margin-top:20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
<asp:Label ID="Label3" runat="server"  Text="Message" Height="30"></asp:Label><asp:Label ID="Label9" runat="server"  Text="*" Height="30" ForeColor="Red"></asp:Label>
</div>
<div style="width:60%; height:150px; float: left; line-height:20px; text-align:left; margin-top:20px; margin-left:5%; ">
<asp:TextBox ID="tbxmessage" runat="server" CssClass="TextBoxClass" Width="90%" allowoverflow="false" TextMode="MultiLine" ToolTip="Enter Your Email Address"  AutoCompleteType="Disabled"  Height="150px" MaxLength="500" Font-Names="Calibri" Font-Size="small" ForeColor="Black"></asp:TextBox>
<asp:RequiredFieldValidator ID="rvmessage" runat="server" ValidationGroup="valgroupsubmit" Display="None" ErrorMessage="Please Enter Message" Text="*" ControlToValidate="tbxmessage" Font-Names="Calibri" Font-Size="small" ForeColor="Red" ></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="regexmessage" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxmessage" ValidationExpression="^.{20,500}$" ErrorMessage="your message can be between 20-500 characters." Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RegularExpressionValidator>
</div>
<%--4th Row--%>
<div style="width:30%; height:40px; float:left; line-height:20px; text-align:right; margin-top:20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;"></div>
<div style="width:60%; height:40px; float: left; line-height:20px; text-align:left; margin-top:20px; margin-left:5%; ">
<asp:Button ID="btnsubmit" runat="server" CssClass="BtnClass" Text="Submit" ValidationGroup="valgroupsubmit"  Height="35px" Width="100px" OnClick="btnsubmit_Click" /></div>

<div style="width:100%; height:20px; float:left; line-height:20px; text-align:left; padding-left:30px; margin-top:10px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
<asp:Label ID="lblerror" runat="server" Font-Names="Calibri" Font-Size="Medium" Visible="False" ForeColor="White"></asp:Label></div>

    <%--5th Row--%>
<div style="width:30%; height:40px; float:left; line-height:20px; text-align:right;  font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; color: #000000;"></div>
<div style="width:60%; height:40px; float: left; line-height:20px; text-align:left;  margin-left:5%; ">
<div style="width:100%; height:40px; float:left; line-height:15px; text-align:left; padding-left:30px;  font-family: Calibri; font-size: medium;  font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="valgroupsubmit" HeaderText="These information is missing..." Font-Size="Small" ForeColor="#FF3300" /></div>


    </div>


</div>
    
    
</div> </div></asp:Content>

