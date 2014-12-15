<%@ Page Title="" Language="C#" MasterPageFile="~/User/Users.master" AutoEventWireup="true" CodeFile="viewnotificationdetails.aspx.cs" Inherits="User_viewnotificationdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style type="text/css">
        .divlabeltext {
            text-align: right;
            font-family: 'Carrois Gothic';
            font-size: 13px;
            font-weight: lighter;
            font-style: normal;
            font-variant: small-caps;
            text-transform: uppercase;
            color: #000000;
        }
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
        <div style="width: 99.8%; height: 450px; border: 1px ridge black; text-align: center; vertical-align: middle;">
        <%-- Div Heading--%>
        <div style="width: 100%; height: 30px; line-height: 30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none; background-color: #000000;">
            <asp:Label ID="Lblevent" runat="server" Text="Notification Details"></asp:Label>
        </div>

<div style="width: 98%; height: 550px; margin: 0 auto; margin-top: 40px;">
<%--1st Row--%>
  <div class="divlabeltext" style="width: 12%; height: 50px; float: left; margin-top: 10px;">
                <asp:Label ID="lblbody" runat="server" Text="Body"></asp:Label></div>
            <div style="width: 80%; height: 50px; float: left; line-height:20px; margin-left: 6.5%; margin-top: 10px; text-align:left;">
                <asp:TextBox ID="tbxbody" runat="server" Width="90%" Height="50px"></asp:TextBox></div>
           <asp:RequiredFieldValidator ID="RequiredFieldValidatorbody" ValidationGroup="valgroupupdate" runat="server" Display="Dynamic" ControlToValidate="tbxbody"  ErrorMessage="There is not text to update" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorbody" alidationGroup="valgroupupdate" runat="server" Display="Dynamic" ControlToValidate="tbxbody" ValidationExpression="^.{1,250}$" ErrorMessage="Max. 250 Characters" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
    <%--7th Row--%>
            <div style="width: 100%; height: 25px; line-height: 25px; float: left; margin-top: 30px; text-align: center; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Button ID="btnUpdate" runat="server" CssClass="BtnClass" alidationGroup="valgroupupdate" Text="Update" Width="80px" Height="25px" OnClick="btnUpdate_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btndelete" runat="server" CssClass="BtnClass"  Text="Delete" Width="80px" Height="25px" OnClick="btndelete_Click" CausesValidation="False" />
            </div>





</div>
</div></asp:Content>

