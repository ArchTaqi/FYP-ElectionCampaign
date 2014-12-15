<%@ Page Title="" Language="C#" MasterPageFile="~/AboutUs/Home.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login_Login" %>

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
    <div style="width: 99.8%; height: 100%; border: 1px ridge black; text-align: center; vertical-align: middle;">

<%-- Div Heading--%>
<div style="width: 40%; height: 30px; margin:0 auto; line-height: 30px; font-family: Calibri; font-size: xx-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: black; ">
<asp:Label ID="Label11" runat="server" Text="DEC SECURE WEB LOGIN" Font-Underline="True"></asp:Label></div>


         <%--Error Message--%>
<div style="width: 80%; height: 20px; margin:0 auto; text-align: center; line-height: 20px; margin-top: 10px; font-family: 'Carrois Gothic'; font-size: x-large; font-weight: bold; font-style: normal; font-variant: small-caps;">
<asp:Label ID="LblError" runat="server" Text=" Invalid Login Detils Please Try Again "  Font-Size="Small" ForeColor="White" BackColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Names="Calibri" Height="20px" Visible="False"></asp:Label>
</div>


    <%--Login Panel--%>
<div style="width:70%; height:350px; margin:0 auto; margin-top:10px; ">
         <%--1st Row--%>
<div style="width: 100%; height: 60px; float: left; text-align: center; line-height: 30px; margin-top: 10px; font-family: 'Carrois Gothic'; font-size: x-large;  font-style: normal; font-variant: small-caps;">
                <asp:Label ID="Label1" runat="server" Text="AUTHENTICATION REQUIRED"  Font-Size="Large" ForeColor="Black" Width="100%" Font-Bold="True"></asp:Label>
<asp:Label ID="Label5" runat="server" Text="Please enter your Login ID and password to continue."  Font-Size="small" ForeColor="Black" Width="100%"></asp:Label>                      
</div>


<%--2nd Row--%>
<div style="width:30%; height:20px; float:left; line-height:20px; text-align:right; margin-top:20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
<asp:Label ID="Label2" runat="server"  Text="Email Address:" Height="30"></asp:Label> <asp:Label ID="Label6" runat="server"  Text="*" Height="30" ForeColor="#FF3300"></asp:Label>
</div>
<div style="width:60%; height:20px; float: left; line-height:20px; text-align:left; margin-top:20px; margin-left:5%; ">
<asp:TextBox ID="TxtBxEmail" runat="server" CssClass="TextBoxClass" Width="60%" TextMode="SingleLine" ToolTip="Enter Your Email Address"  AutoCompleteType="Disabled" placeholder="E.g. username@domain.com"></asp:TextBox>
<asp:RequiredFieldValidator ID="rvemail" runat="server" Display="Dynamic" ErrorMessage="enter your email"  ControlToValidate="TxtBxEmail" validationgroup="valgrouplogin" Font-Names="Calibri" Font-Size="small" ForeColor="Red" ></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="revemail" runat="server" Display="Dynamic" validationgroup="valgrouplogin" ControlToValidate="TxtBxEmail"  ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" ErrorMessage="invalid email format"  Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RegularExpressionValidator>
</div>

<%--3rd Row--%>
<div style="width: 30%; height:20px; float:left; line-height:20px; text-align:right; margin-top:20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
<asp:Label ID="Label4" runat="server"  Text="Password:" Height="30"></asp:Label> <asp:Label ID="Label7" runat="server"  Text="*" Height="30" ForeColor="#FF3300"></asp:Label>
</div>
<div style="width:60%; height:20px; float: left; line-height:20px; text-align:left; margin-top:20px; margin-left:5%; ">
<asp:TextBox ID="TxtBxPassword" runat="server" CssClass="TextBoxClass" Width="60%" TextMode="Password" ToolTip="enter your password"  AutoCompleteType="Disabled" ></asp:TextBox>
<asp:RequiredFieldValidator ID="rvPassword" runat="server" Display="Dynamic" validationgroup="valgrouplogin" ControlToValidate="TxtBxPassword" ErrorMessage="Please Enter Password"  Font-Names="Calibri" Font-Size="small" ForeColor="Red" ></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="revPassword" runat="server" Display="Dynamic" validationgroup="valgrouplogin"  ControlToValidate="TxtBxPassword" ValidationExpression="(?=^.{5,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{:;'?/>.<,])(?!.*\s).*$" ErrorMessage="invalid password format"  Font-Names="Calibri" ForeColor="Red" Font-Size="small"></asp:RegularExpressionValidator> 
</div>
<%--3rd Row--%>
<div style="width: 30%; height:20px; float: left; line-height: 20px; text-align:right; margin-top:2px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
</div>
<div style="width:60%; height:20px; float:left; line-height:20px; text-align:left; margin-top:2px; margin-left:5%; ">
    <asp:Label ID="Label3" runat="server" Text="5-15 char long with at least one numeric, one uppercase and one special char." Font-Names="Calibri" Font-Size="X-Small" ForeColor="Black"></asp:Label>
</div>
<%--4th Row--%>
<div style="width:30%; height:40px; float:left; line-height:40px;"></div>
<div style="width:60%; height:40px; float: left; line-height:40px; text-align:left; margin-top:20px; margin-left: 5%;">
    <asp:Button ID="BtnLogin" runat="server" Text="Login" CssClass="BtnClass" validationgroup="valgrouplogin"  Height="35px" Width="100px" OnClick="BtnLogin_Click"   /> 
    <a href="ForgetPassword.aspx" style="font-family:'Carrois Gothic'; font-size: small; font-weight: lighter; font-style: normal; font-variant: normal; text-transform: none; color: #000000; text-decoration: none;">Forget Password?</a>
</div>

<%--5th Row--%>
<div style="width:100%; height:20px; float:right; line-height:20px; text-align:center; margin-top:20px; font-family:'Carrois Gothic'; font-size: small; font-weight: lighter; font-style: normal; font-variant: normal; word-spacing: 0.1em;">
If You are not a register user, <a href="../Registration/Requestaccount.aspx" style="font-family:'Carrois Gothic'; font-size: small; font-weight: lighter; font-style: normal; font-variant: normal; text-transform: none; color: #FF0000; text-decoration: none;"> Click Here</a> to Request Account</div>



<%--Validation Summary--%>
         .<br />
         <div style="width:100%; height:30px; text-align:left;  margin-top:30px; padding-left:10px;">
<%--<asp:ValidationSummary ID="vs" runat="server" validationgroup="valgrouplogin"  Font-Names="Calibri" ForeColor="Red" Font-Size="Small" HeaderText="Warnings........" />--%>



         </div>
</div>
</div>
</asp:Content>

