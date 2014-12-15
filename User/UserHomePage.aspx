<%@ Page Title="" Language="C#" MasterPageFile="../User/Users.master" AutoEventWireup="true" CodeFile="UserHomePage.aspx.cs" Inherits="UserHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="width:99.8%; height:525px; border:1px ridge black; text-align:center; vertical-align:middle;">
<%-- Div Heading--%>
<div style="width:100%; height: 30px; float:left; vertical-align:central; text-align:center; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 2em; border-top-style: solid; border-top-width: medium; border-top-color: #000000; border-bottom-style: solid; border-bottom-width: medium; border-bottom-color: #000000; top: 20px; background-color: #000000;"><p style="font-family: Calibri; font-weight: bold; font-style: normal; font-variant: small-caps; font-size:large; color:white;">Welcome To Digitalized Electroid Campaign</p></div>
<div style="width:100%; height: 30px; float:left; vertical-align:central; text-align:center; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 2em; margin-top:30px;"> <asp:Label ID="LblHasSubscription" runat="server" Font-Names="Calibri" Font-Size="medium" ForeColor="Black" Visible="False"></asp:Label> </div>
<div style="width:100%; height: 30px; float:left; vertical-align:central; text-align:center; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 2em; margin-top:30px;"> <asp:Label ID="LblSubscriptionExpire" runat="server" Font-Names="Calibri" Font-Size="medium" ForeColor="Black" Visible="False"></asp:Label> </div>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/EIC Logo.png" Height="300" />   


</div>
</asp:Content>

