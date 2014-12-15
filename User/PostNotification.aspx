<%@ Page Title="" Language="C#" MasterPageFile="Users.master" AutoEventWireup="true" CodeFile="PostNotification.aspx.cs" Inherits="User_PostNotification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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

        .TextBoxClass {
            background-color: white;
            border: black solid thin;
            font-family: Calibri;
            font-size: 14px;
            font-weight: lighter;
            color: black;
        }

            .TextBoxClass:focus {
                background-color: white;
                border: rgb(48, 157, 207) solid thin;
                font-family: Calibri;
                font-size: 14px;
                font-weight: lighter;
                color: black;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 99.8%; height: 475px; border: 1px ridge black; text-align: center; vertical-align: middle;">
        <%-- Div Heading--%>
   <div style="width:100%; height:30px; float:left; line-height:30px; background-color: #000000; color: #FFFFFF; text-decoration: none; vertical-align: middle; text-align: center; text-indent: inherit; white-space: normal; text-transform: lowercase; font-variant: small-caps; font-style: normal; font-weight: lighter; font-size: large;">
<asp:Label ID="Label2" runat="server" Text="Post Notification" Font-Names="Calibri" Font-Size="XX-Large" ForeColor="White"></asp:Label>
   </div>    

<div style="width:99%; height:325px; margin:0 auto; margin-top:35px; text-align:center;">
<%--1st Row--%>
 <div style="width: 100%; height: 30px; float: left; vertical-align: central; text-align: center; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 2em; margin-top: 20px;">
            <asp:Label ID="LblWarning" runat="server" Font-Names="Calibri" Font-Size="medium" ForeColor="Black" Visible="False"></asp:Label>
</div>
    <%--2nd Row--%>
 <div style="width: 100%; height: 100px; float:left; text-align: center; vertical-align: middle;">
            <asp:TextBox ID="tbbody" runat="server" Width="90%" Height="100px" BackColor="White" BorderColor="Black" BorderStyle="Double" BorderWidth="5" Font-Names="Calibri" Font-Size="Large" ForeColor="Black" ToolTip="Type Your Notification Message and Hit Post" TextMode="MultiLine" MaxLength="200" Rows="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorbody" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbbody" Text="*" ErrorMessage="There is not text to post" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorbody" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbbody" ValidationExpression="^.{1,250}$" ErrorMessage="Notification can be only 250 Characters of length." Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
        </div>
    <%--3rd Row--%>
        <div style="width: 100%; height: 40px; float:left; margin-top:15px;  text-align: center; vertical-align: middle; padding-right: 10%;">
            <asp:Label ID="Label5" runat="server" Text="Posted For" ForeColor="Black" Font-Names="Calibri" Font-Size="Medium"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddltargetconstituency" runat="server" AutoPostBack="True" Width="30%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your District in Which You Represent you Party" DataTextField="Code" DataValueField="ConstID"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" ValidationGroup="valgroupsubmit" runat="server" ControlToValidate="ddltargetconstituency" Text="*" ErrorMessage="Please Input Article Category" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
        </div>
    <%--4th Row--%>
<div style="width: 100%; height: 40px; float:left; margin-top:10px;  text-align: center;">
            <asp:Button ID="ButPost" runat="server" CssClass="BtnClass " ValidationGroup="valgroupsubmit" Text="Post" BackColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="5" Font-Names="Calibri" Font-Size="Medium" ForeColor="White" Height="30px" Width="80px" OnClick="ButPost_Click" />
        </div>
    <%--5th Row--%>
 <div style="width: 90%; height: 40px; margin-top: 10px; text-align: left; padding-left: 10%;">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </div>
</div>
    </div>
</asp:Content>
