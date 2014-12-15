<%@ Page Title="" Language="C#" MasterPageFile="~/AboutUs/Home.master" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="Login_ForgetPassword" %>

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
    <div style="width: 100%; height: 100%; background-color:#f3f3f3;  text-align: center; vertical-align: middle; "> 

        <div  style="height: 350px; width:50%; margin:0 auto; text-align: center;">
            <%--1st Row--%>
            <div style="width: 100%; height: 30px; float: left; text-align: center; line-height: 30px; margin-top: 10px; font-family: Calibri; font-size: small; font-weight: lighter; font-style: normal; font-variant: normal;">
                <asp:Label ID="Label7" runat="server" Text="The Passowrd Can not be Recovered, It can only be Reset. To Reset Your Password Please Enter the following Detials Corectly that you filled up at the time of Registration." Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="100%"></asp:Label>
            </div>

            <%--2nd Row--%>
            <div style="width: 30%; height: 30px; float: left; margin-top: 35px; text-align: right; line-height: normal; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                <asp:Label ID="Label1" runat="server" Text="Email Address : " Height="30" ForeColor="Black"></asp:Label> <asp:Label ID="Label6" runat="server"  Text="*" Height="30" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 60%; margin-top: 35px; float: left; margin-left: 10%; line-height: 30px; height: 30px; text-align: left;">
                <asp:TextBox ID="TxtBxEmail" runat="server" CssClass="TextBoxClass" Width="60%" TextMode="Email" ToolTip="Enter Your Email Address" AutoCompleteType="Disabled" placeholder="E.g. username@domain.com"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvemail" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="TxtBxEmail" ErrorMessage="Please Enter Your Email" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revemail" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="TxtBxEmail" ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" ErrorMessage="invalid email format, user standard email format i.e abc@domain.com" Text="*" Font-Names="Calibri" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <%--3rd Row--%>
            <div style="width: 30%; height: 30px; float: left; margin-top: 15px; text-align: right; line-height: normal; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                <asp:Label ID="Label2" runat="server" Text="Pin Code:" Height="30"></asp:Label> <asp:Label ID="Label3" runat="server"  Text="*" Height="30" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 60%; margin-top: 15px; float: left; margin-left: 10%; line-height: 30px; height: 30px; text-align: left;">
                <asp:TextBox ID="TxtBxPincode" runat="server" CssClass="TextBoxClass" Width="60%" TextMode="SingleLine" ToolTip="Enter Your Email Address" AutoCompleteType="Disabled" placeholder="E.g. 123456"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvPincode" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="TxtBxPincode" ErrorMessage="Please Enter Pincode" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPincode" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="TxtBxPincode" ValidationExpression="^([0-9]{6})$" ErrorMessage="Pin Code must be only 6 digits" Text="*" Font-Names="Calibri" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <%--5th Row--%>
            <div style="width: 30%; height: 50px; float: left; margin-top: 15px; text-align: right; line-height: normal; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;"></div>
            <div style="width: 50%; margin-top: 15px; float: left; margin-left: 10%; line-height: 50px; height: 50px; text-align: left;">
                <asp:Button ID="BtnSubmit" runat="server" Text="Submit" ValidationGroup="valgroupsubmit" CssClass="BtnClass" Height="40" Width="100" OnClick="BtnSubmit_Click" />
            </div>

            <%--6th Row--%>
            <div style="width: 100%; height: 30px; float: left; margin-top: 15px; text-align: center; line-height: normal; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                <asp:Label ID="Lblwarning" runat="server" Height="30" ForeColor="#D50000" Visible="False"></asp:Label>
            </div>

            <%--Validation Summary--%>
         .<br />
            <div style="width: 100%; height: 30px; text-align: left;">
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="valgroupsubmit" runat="server" Font-Names="Calibri" ForeColor="Red" Font-Size="Small" HeaderText="These Information are missing........" />



            </div>



        </div>


</div>
</asp:Content>

