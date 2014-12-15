<%@ Page Title="" Language="C#" MasterPageFile="~/AboutUs/Home.master" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="Login_ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; height: 100%; background-color: #f3f3f3; text-align: center; vertical-align: middle;">

        <div style="height: 350px; width: 50%; margin: 0 auto; text-align: center;">
            <%--1st Row--%>
            <div class="divLableStyle" style="width: 100%; text-align: center;">
                <asp:Label ID="Label7" runat="server" Text="Enter Your New Password" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="100%"></asp:Label>
            </div>
            <%--2nd Row--%>
            <div style="width: 30%; height: 30px; float: left; margin-top: 35px; text-align: right; line-height: normal; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                <asp:Label ID="Label1" runat="server" Text="Password" Height="30" ForeColor="Black"></asp:Label>
            </div>
            <div style="width: 60%; margin-top: 35px; float: left; margin-left: 10%; line-height: 30px; height: 30px; text-align: left;">
                <asp:TextBox ID="TxtBxPassword" runat="server" CssClass="TextBoxClass" TextMode="Password" ToolTip="Enter Your Email Address" Height="25px" Width="200px" AutoCompleteType="Disabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="TxtBxPassword" ErrorMessage="Please Enter Password" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="TxtBxPassword" ValidationExpression="(?=^.{5,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{:;'?/>.<,])(?!.*\s).*$" ErrorMessage="Password must be 5-15 characters long with at least one numeric,</br>one upper case character and one special character." Text="*" Font-Names="Calibri" ForeColor="Red" Font-Size="12px"></asp:RegularExpressionValidator>
            </div>

            <%--3rd Row--%>
            <div style="width: 30%; height: 30px; float: left; margin-top: 15px; text-align: right; line-height: normal; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                <asp:Label ID="Label2" runat="server" Text="Retype Password" Height="30"></asp:Label>
            </div>
            <div style="width: 60%; margin-top: 15px; float: left; margin-left: 10%; line-height: 30px; height: 30px; text-align: left;">
                <asp:TextBox ID="TxtBxConfirmedPassword" runat="server" CssClass="TextBoxClass" TextMode="Password" ToolTip="Enter Your Email Address" Height="25px" Width="200px" AutoCompleteType="Disabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="valgroupsubmit"  runat="server" Display="None" ControlToValidate="TxtBxConfirmedPassword" ErrorMessage="Please Enter Retype Password" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="TxtBxConfirmedPassword" ValidationExpression="(?=^.{5,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{:;'?/>.<,])(?!.*\s).*$" ErrorMessage="Password must be 5-15 characters long with at least one numeric,</br>one upper case character and one special character." Text="*" Font-Names="Calibri" ForeColor="Red" Font-Size="12px"></asp:RegularExpressionValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="valgroupsubmit" ControlToValidate="TxtBxConfirmedPassword" ControlToCompare="TxtBxPassword" Type="String" Operator="Equal" ErrorMessage="Password did not match" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:CompareValidator>
            </div>
            <%--5th Row--%>
            <div class="divLableStyle" style="width: 30%;"></div>
            <div class="divTextBoxStyle" style="width: 65%;">
                <asp:Button ID="BtnSubmit" runat="server" Text="Reset" ValidationGroup="valgroupsubmit" CssClass="BtnClass" Height="35" Width="90" OnClick="BtnSubmit_Click1" />
            </div>
            <%--Validation Summary--%>
         .<br />
            <div style="width: 100%; height: 30px; text-align: left; margin-top: 30px;">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Names="Calibri" ForeColor="Red" Font-Size="Small" HeaderText="Warnings........" />



            </div>















        </div>




    </div>
</asp:Content>

