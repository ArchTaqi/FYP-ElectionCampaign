<%@ Page Title="" Language="C#" MasterPageFile="~/AboutUs/Home.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="AboutUs_HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width: 100%; height: 100%; background-color:#f3f3f3;  text-align: center; vertical-align: middle; ">

<div style="width:100%; height:500px; margin:0 auto; float:left; background-color:#f3f3f3;">
    <%--left panel--%>
<div style="width:60%; height:500px; margin:0 auto; float:left; text-align:left; ">
<h1 style="font-family: Calibri; font-size: x-large; font-weight:bold; font-style: normal; font-variant: small-caps; text-transform: uppercase; padding-left: 10px; color: #000000">Why Digitilized Electroid Campaign?</h1>
<p style="font-family: Calibri; line-height:30px; text-align:justify; font-size: small; font-weight: normal; font-style: normal; font-variant: normal; text-transform: none; color: #000000; text-decoration: none; padding-left: 50px">
In our society, most of the people complain about their interaction with their politicians. Some people even didn’t know about the politicians in their or other constituency.  On the other hand, there are limited ways that a politician can interact directly with people. Most of the time, print media is used to interact with the people but this communication is usally one way.
</p>
<h1 style="font-family: Calibri; font-size: x-large; font-weight:bold; font-style: normal; font-variant: small-caps; text-transform: uppercase; padding-left: 10px; color: #000000"> The Solution "Digitilized Electroid Campaign" ?</h1>
<p style="font-family: Calibri; line-height:30px; text-align:justify; font-size: small; font-weight: normal; font-style: normal; font-variant: normal; text-transform: none; color: #000000; text-decoration: none; padding-left: 50px">
We have provided an interface to both public and politicians for communication in the form of text notifications, video, messages, articles and events they are organizing i.e convention etc. On the other hand public using their android mobile can search politicians with reference to constituency, parties, cities and view their latest alert and provide feedback.
</p>
    <p style="font-family: Calibri; line-height:30px; text-align:justify; font-size: small; font-weight: normal; font-style: normal; font-variant: normal; text-transform: none; color: #000000; text-decoration: none; padding-left: 50px">
It is an application with the concept of providing cheap way of advertising in Elections. The intention is to provide the candidates a digitized way of ruining their election campaign.</p>
</div>
    <%--right panel--%>
<div style="width:40%; height:500px; margin:0 auto; float:left;">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/EIC Logo.png" Height="500px" />

</div>

</div>

</div>
</asp:Content>

