<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.master" AutoEventWireup="true" CodeFile="UserMessages.aspx.cs" Inherits="Admin_UserMessages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%; height:auto; margin:0 auto;">
<%--Heading--%>
<%--<div style="width:100%; height:30px; line-height:30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; background-color: #000000; text-align:center;">
    <asp:Label ID="Label1" runat="server" Text="User Messages"></asp:Label>
</div>--%>

<%--Response Panel--%>
<div style="width:80%; height:300px; margin:0 auto; margin-top:20px; border:black thin solid;" >
<div style="width:100%; height:30px; line-height:30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; background-color: #000000; text-align:center;">
    <asp:Label ID="Label4" runat="server" Text="Response"></asp:Label>
</div>
<%--1st Row--%>
<div style="width:12%; height:30px; margin-top:10px; text-align:right; float:left;">
    <asp:Label ID="Label2" runat="server" Text="Message ID" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black" Font-Bold="True"></asp:Label>
</div>
<div style="width:30%; height:30px; margin-left:5%; margin-top:10px; text-align:left; float:left;">
    <asp:TextBox ID="tbxmsgid" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" ReadOnly="True" Width="80%" Height="20px"></asp:TextBox>   
</div>
<div style="width:12%; height:30px; margin-left:5%; margin-top:10px; text-align:right; float:left;">
    <asp:Label ID="Label3" runat="server" Text="Email" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black" Font-Bold="True"></asp:Label>
</div>
<div style="width:30%; height:30px; margin-left:5%;  margin-top:10px; text-align:left; float:left;">
    <asp:TextBox ID="tbxemail" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" ReadOnly="True" Width="80%" Height="20px"></asp:TextBox>   
</div>
<%--2nd Row--%>
<div style="width:12%; height:150px; margin-top:10px; text-align:right; float:left;">
    <asp:Label ID="Label5" runat="server" Text="Answer" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black" Font-Bold="True"></asp:Label>
</div>
<div style="width:83%; height:150px; margin-left:5%; margin-top:10px; line-height:20px; text-align:left; float:left;">
    <asp:TextBox ID="tbxanswer" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="Black"  Width="92%" Height="150px" TextMode="MultiLine"></asp:TextBox>   
</div>

<%--3rd Row--%>
<div style="width:100%; height:40px; margin-top:30px; text-align:center; float:left;">
    <asp:Button ID="btnsendemail" runat="server" Text="Send Email" Width="100px" Height="30px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" BackColor="#EEEEEE" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" OnClick="btnsendemail_Click" />   
</div>
</div>
<%--User Messages--%>
<div style="width:100%; height:500px; margin:0 auto; margin-top:20px; overflow:visible;" >
<div style="width:100%; height:30px; line-height:30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; background-color: #000000; text-align:center;">
    <asp:Label ID="Label6" runat="server" Text="Messages"></asp:Label>
</div>
    <asp:GridView ID="GVUsermessages" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" GridLines="Horizontal" Height="300px" PageSize="5" Width="100%" OnSelectedIndexChanged="GVUsermessages_SelectedIndexChanged">
        <Columns>
            <asp:CommandField SelectText="Select" ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
            <asp:BoundField DataField="body" HeaderText="Question" SortExpression="body" />
            <asp:BoundField DataField="Postedon" HeaderText="Asked On" SortExpression="Postedon" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="left" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>


</div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ECII(Old)ConnectionString %>" SelectCommand="UspAdminGetUserMessages" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


</div></asp:Content>

