<%@ Page Title="" Language="C#" MasterPageFile="~/User/Users.master" AutoEventWireup="true" CodeFile="Videodetails.aspx.cs" Inherits="User_Videodetails" %>

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
        <div style="width: 99.8%; height: 900px; border: 1px ridge black; text-align: center; vertical-align: middle;">
        <%-- Div Heading--%>
        <div style="width: 100%; height: 30px; line-height: 30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none; background-color: #000000;">
            <asp:Label ID="Lblevent" runat="server" Text="Video Details"></asp:Label>
        </div>

<div style="width:90%; height:800px; margin:0 auto; margin-top:50px; border:solid black thin;">
<%--1st Row--%>
<div style="width:100%; height:50px; line-height:25px; text-align:left;">
<asp:Label ID="lblvideotittle" runat="server" Font-Names="Calibri" Font-Size="Large" ForeColor="Black" Font-Bold="True"></asp:Label>
</div>

<%--Video iframe--%>
<div id="diviframe" runat="server" style="width:100%; height:500px;"></div>

<%--3rd Row--%>
<div style="width:100%; height:50px; margin-top:10px; line-height:25px; text-align:center">
<asp:TextBox ID="tbxurl" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbxcategory" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbxpostedon" runat="server" ReadOnly="True"></asp:TextBox>
</div>
<%--4th Row--%>
<div style="width:100%; height:100px; line-height:25px; text-align:center">
<asp:TextBox ID="tbxdescription" runat="server" width="80%" height="100px" TextMode="MultiLine"></asp:TextBox>
</div>
<%--5th Row--%>
<div style="width:100%; height:100px; line-height:25px; margin-top:10px; text-align:center">
<asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="BtnClass" Width="80px" Height="25px" CausesValidation="False" OnClick="btndelete_Click" />&nbsp;&nbsp;&nbsp;
<asp:Button ID="btnsave" runat="server" Text="Save" CssClass="BtnClass"  Width="80px" Height="25px" OnClick="btnsave_Click"/>
</div>
</div>



</div></asp:Content>

