<%@ Page Title="" Language="C#" MasterPageFile="~/AboutUs/Home.master" AutoEventWireup="true" CodeFile="OurTeam.aspx.cs" Inherits="AboutUs_OurTeam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width: 99.6%; height: 100%;  text-align: center; vertical-align: middle;">
<%-- Div Heading--%>
<div style="width: 90%; height: 30px; margin:0 auto; line-height: 30px; font-family: Calibri; font-size: xx-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: black; ">
<asp:Label ID="Label11" runat="server" Text="What We Do and How Good We Are" Font-Underline="True"></asp:Label></div>


<%--1st Developer--%>
<div style="width:100%; height:240px; margin:0 auto; margin-top:20px;">
<%--Picture--%>
<div style="width:30%; height:100%; margin: 0 auto; float:left; line-height:100%; vertical-align:middle;">

<asp:Image ID="imgdeveloper1" runat="server" ImageUrl="~/Images/File0009.JPG" Height="200px"  BorderColor="Black" BorderStyle="Double" BorderWidth="5" Width="225px" />

</div>
<%--Developer's Details--%>
<div style="width:65%; height:100%; float:left; ">
    <%--1st Row--%>
<div style="width:98%; height:30px;   float:left; text-align:left; vertical-align:middle; line-height:30px; font-family: Calibri; font-size: x-large; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000; border-bottom-style: solid; border-bottom-width: thick; border-bottom-color: #000000;">
    <asp:Label ID="LblFullname" runat="server" Text="Muhammad Taqi Hassan Bukhari"></asp:Label>
</div>
    <%--1st Row--%>
<div style="width:98%;   float:left; text-align:left; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: x-large; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000; ">
<p style="font-family: Calibri; font-size: small; font-weight: lighter; font-style: normal; font-variant: normal; color: #000000; text-decoration: none; padding-left:10px;">I 'm a Computer Science Student. Most of the time, I 'm hovering over the Monitor Screen. I love to work on .NET platform, though VS is best friend :) In future, i love to be on Window Phone, Window 8.1 Apps and Iphone Developer.</p>
</div>
    <%--2nd Row--%>
</div>
</div>

<%--1st Developer--%>
<div style="width:100%; height:240px; margin:0 auto; margin-top:20px;">
<%--Picture--%>
<div style="width:30%; height:100%; margin: 0 auto; float:left; line-height:100%; vertical-align:middle;">

<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/maaz.jpg" Height="200px"  BorderColor="Black" BorderStyle="Double" BorderWidth="5" Width="225px" />

</div>
<%--Developer's Details--%>
<div style="width:65%; height:100%; float:left; ">
    <%--1st Row--%>
<div style="width:98%; height:30px;   float:left; text-align:left; vertical-align:middle; line-height:30px; font-family: Calibri; font-size: x-large; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000; border-bottom-style: solid; border-bottom-width: thick; border-bottom-color: #000000;">
    <asp:Label ID="Label1" runat="server" Text="Maaz Mohsin"></asp:Label>
</div>
    <%--1st Row--%>
<div style="width:98%;   float:left; text-align:left; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: x-large; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000; ">
<p style="font-family: Calibri; font-size: small; font-weight: lighter; font-style: normal; font-variant: normal; color: #000000; text-decoration: none; padding-left:10px;">I 'm a Computer Science Student. Most of the time, I 'm hovering over the Monitor Screen. I love to work on Android Platform, though eclipse is best friend :) In future, i love to be on Android Plateform and .Net.</p>
</div>
</div>
</div>


    <%--1st Developer--%>
<div style="width:100%; height:240px; margin:0 auto; margin-top:20px;">
<%--Picture--%>
<div style="width:30%; height:100%; margin: 0 auto; float:left; line-height:100%; vertical-align:middle;">

<asp:Image ID="Image2" runat="server" ImageUrl="~/Images/ahsan.jpg" Height="200px"  BorderColor="Black" BorderStyle="Double" BorderWidth="5" Width="225px" />

</div>
<%--Developer's Details--%>
<div style="width:65%; height:100%; float:left; ">
    <%--1st Row--%>
<div style="width:98%; height:30px;   float:left; text-align:left; vertical-align:middle; line-height:30px; font-family: Calibri; font-size: x-large; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000; border-bottom-style: solid; border-bottom-width: thick; border-bottom-color: #000000;">
    <asp:Label ID="Label2" runat="server" Text="Ahsan Aziz"></asp:Label>
</div>
    <%--1st Row--%>
<div style="width:98%;   float:left; text-align:left; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: x-large; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000; ">
<p style="font-family: Calibri; font-size: small; font-weight: lighter; font-style: normal; font-variant: normal; color: #000000; text-decoration: none; padding-left:10px;">I 'm a Computer Science Student. I love to work on HTML5, PHP, JAVA and Assembly. In future, i love to be on .Net and Android Platform.</p>
</div>
    <%--2nd Row--%>
<%--<div style="width:98%; height:30px; margin-top:5px;   float:left; text-align:left; vertical-align:middle; line-height:30px; font-family: Calibri; font-size: x-large; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000; ">

<asp:Label ID="Label1" runat="server" Text="Ms Sql" Width="60%" Height="30px" BackColor="black" Font-Size="Medium" Font-Names="Calibri" ForeColor="White"></asp:Label>
<asp:Label ID="Label3" runat="server" Text="60%" Width="39%" Height="30px" BackColor="#CCCCCC" Font-Size="Medium" Font-Names="Calibri" ForeColor="White"></asp:Label>
</div>
    <div style="width:98%; height:30px; margin-top:5px;   float:left; text-align:left; vertical-align:middle; line-height:30px; font-family: Calibri; font-size: x-large; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000; ">

<asp:Label ID="Label4" runat="server" Text="Ms Sql" Width="70%" Height="30px" BackColor="black" Font-Size="Medium" Font-Names="Calibri" ForeColor="White"></asp:Label>
<asp:Label ID="Label5" runat="server" Text="60%" Width="29%" Height="30px" BackColor="#CCCCCC" Font-Size="Medium" Font-Names="Calibri" ForeColor="White"></asp:Label>
</div>
    <div style="width:98%; height:30px; margin-top:5px;   float:left; text-align:left; vertical-align:middle; line-height:30px; font-family: Calibri; font-size: x-large; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000; ">

<asp:Label ID="Label6" runat="server" Text="Ms Sql" Width="60%" Height="30px" BackColor="black" Font-Size="Medium" Font-Names="Calibri" ForeColor="White"></asp:Label>
<asp:Label ID="Label7" runat="server" Text="60%" Width="39%" Height="30px" BackColor="#CCCCCC" Font-Size="Medium" Font-Names="Calibri" ForeColor="White"></asp:Label>
</div>--%>



</div>
</div>

</div>
</asp:Content>

