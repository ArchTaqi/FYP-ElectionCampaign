<%@ Page Title="" Language="C#" MasterPageFile="../User/Users.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="width:99.8%; height:800px; border:1px ridge black; text-align:center; vertical-align:middle;">
<%-- Div Heading--%>
<div style="width:100%; height: 30px; margin: 0 auto; float:left; text-align:center; vertical-align:middle; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 1em; border-top-style: solid; border-top-width: medium; border-top-color: #000000; border-bottom-style: solid; border-bottom-width: medium; border-bottom-color: #000000; top: 20px; background-color: #000000;"><p style="font-family: Calibri; font-weight: bold; font-style: normal; font-variant: small-caps; font-size:x-large; color:white;">My Profile</p></div>
 
<%--1st Panel--%>
<div style="width:95%; height:260px; margin: 0 auto; margin-top:50px; ">
<div style="width:35%; height:250px; margin: 0 auto; float:left; text-align:center; vertical-align:middle; ">
<asp:Image ID="ImgAppUser" runat="server" ImageUrl="~/Images/Candidiate.png" Height="200px"  BorderColor="Black" BorderStyle="Double" BorderWidth="8" />
<div style="width:100%; height: 30px; margin: 0 auto; margin-top:8px; float:left; text-align:center; vertical-align:middle; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 1em; top: 20px; background-color: #000000;"><p style="font-family: Calibri; font-weight: bold; font-style: normal; font-variant: small-caps; font-size:x-large; color:white;"><asp:Label ID="LblUsername" runat="server" Text="Taqi125"></asp:Label></p></div>
</div>

<div style="width:63%; height:250px; margin: 0 auto;  border:medium groove black; float:right; ">
    <%--1st Row--%>
<div style="width:98%; height:30px; margin-top:15px;  float:left; text-align:center; vertical-align:middle; line-height:30px; font-family: Calibri; font-size: x-large; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <asp:Label ID="LblFullname" runat="server" Text="Muhammad Taqi Hassan Bukhari"></asp:Label>
</div>
    <%--2nd Row--%>
<div style="width:98%; height:20px; margin-top:20px; float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
 <asp:Label ID="Label1" runat="server" Text="If You Want Success, Vote For The Best. You live in this area. Vote for this area."></asp:Label>
</div>
    <%--3rd Row--%>
<div style="width:98%; height:20px; margin-top:55px; float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label2" runat="server" Text="E-Mail"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblEmail" runat="server" Text="taqi.official@gmail.com"></asp:Label> </div> 
</div>
    <%--4thRow--%>
<div style="width:98%; height:20px; margin-top:5px;  float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label3" runat="server" Text="Joined On"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblJoinedOn" runat="server" Text="Friday, 18 April 2014, 11:35 PM"></asp:Label> </div> 
</div>
    <%--5th Row--%>
<div style="width:98%; height:20px; margin-top:5px; float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label5" runat="server" Text="NIC"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblCnic" runat="server" Text="3740555526653"></asp:Label> </div> 
</div>

</div>

</div>

<%--2nd Heading--%>
<div style="width:100%; height: 30px; margin: 0 auto; margin-top:20px; float:left; text-align:center; vertical-align:middle; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 1em; top: 20px; background-color: #000000;"><p style="font-family: Calibri; font-weight: bold; font-style: normal; font-variant: small-caps; font-size:x-large; color:white;">More Details</p></div>

<%--2nd Panel--%>
<div style="width:95%; height:175px; margin: 0 auto; margin-top:60px; border:groove medium black;">
<%--1st Row--%>
<div style="width:98%; height:20px; margin-top:5px;  float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label7" runat="server" Text="Father Name"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblFathername" runat="server" Text="Syed Dilbeer Hussain"></asp:Label> </div> 
</div>
<%--2nd Row--%>
<div style="width:98%; height:20px; margin-top:5px;  float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label9" runat="server" Text="Date of Birth"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblDob" runat="server" Text="Syed Dilbeer Hussain"></asp:Label> </div> 
</div>
<%--3rd Row--%>
<div style="width:98%; height:20px; margin-top:5px;  float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label11" runat="server" Text="Work Phone"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblWorkphone" runat="server" Text="Syed Dilbeer Hussain"></asp:Label> </div> 
</div>
    <%--4th Row--%>
<div style="width:98%; height:20px; margin-top:5px;  float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label13" runat="server" Text="City/Province"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblCityProvince" runat="server" Text="Syed Dilbeer Hussain"></asp:Label> </div> 
</div>
    <%--5th Row--%>
<div style="width:98%; height:50px; margin-top:5px;  float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:50px; float:left; text-align:right;"><asp:Label ID="Label15" runat="server" Text="Office Address"></asp:Label>  </div>
    <div style="width:50%; height:50px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblofficeAddress" runat="server" Text="saleem zuberi is the most senior person in showbiz.he is writer,producer,actor,director,advertiser and so on.he has zuberi advertisment company."></asp:Label> </div> 
</div>
</div>


<%--3rd Heading--%>
<div style="width:100%; height: 30px; margin: 0 auto; margin-top:20px; float:left; text-align:center; vertical-align:middle; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 1em; top: 20px; background-color: #000000;"><p style="font-family: Calibri; font-weight: bold; font-style: normal; font-variant: small-caps; font-size:x-large; color:white;">Political Profile</p></div>

<%--3rd Panel--%>
<div style="width:95%; height:150px; margin: 0 auto; margin-top:60px; border:groove medium black;">
<%--1st Row--%>
<div style="width:98%; height:20px; margin-top:5px;  float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label4" runat="server" Text="Party Name"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblPartyname" runat="server" Text="Pakistan Muslim League"></asp:Label> </div> 
</div>
<%--2nd Row--%>
<div style="width:98%; height:20px; margin-top:5px;  float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label8" runat="server" Text="Joined On"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblPartyJoinedOn" runat="server" Text="08-08-1991"></asp:Label> </div> 
</div>
<%--3rd Row--%>
<div style="width:98%; height:20px; margin-top:5px;  float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label12" runat="server" Text="Constituency"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblConstituency" runat="server" Text="NA-51 Rawalpindi 1"></asp:Label> </div> 
</div>
    <%--4th Row--%>
<div style="width:98%; height:20px; margin-top:5px;  float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label16" runat="server" Text="District"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblDistrict" runat="server" Text="Rawalpindi"></asp:Label> </div> 
</div>
<%--5th Row--%>
<div style="width:98%; height:20px; margin-top:5px;  float:left; text-align:center; vertical-align:middle; line-height:20px; font-family: Calibri; font-size: medium; font-weight: bolder; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #000000;">
    <div style="width:40%; height:20px; float:left; text-align:right;"><asp:Label ID="Label18" runat="server" Text="Province"></asp:Label>  </div>
    <div style="width:50%; height:20px; float:right; text-align:left; margin-left:10%; font-family: Calibri; font-size: x-small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000;"><asp:Label ID="LblProvince" runat="server" Text="Punjab"></asp:Label> </div> 
</div>
</div>

</div>

</asp:Content>

