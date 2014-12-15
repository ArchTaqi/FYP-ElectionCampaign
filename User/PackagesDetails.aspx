<%@ Page Title="" Language="C#" MasterPageFile="~/User/Users.master" AutoEventWireup="true" CodeFile="PackagesDetails.aspx.cs" Inherits="User_PackagesDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:99.8%; height:500px; border:1px ridge black; text-align:center; vertical-align:middle;">
<%--Heading--%>
<div style="width:100%; height: 30px; margin: 0 auto; float: left; text-align:center; vertical-align:middle; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 1em; top: 20px; background-color: #000000;"><p style="font-family: Calibri; font-weight: bold; font-style: normal; font-variant: small-caps; font-size:x-large; color:white;">Package Plans</p></div>
        <asp:SqlDataSource ID="sqldspackages" runat="server" ConnectionString="<%$ ConnectionStrings:ECII(Old) %>" SelectCommand="uspUserGetPackagesDetails" SelectCommandType="StoredProcedure"></asp:SqlDataSource>



<div style="width:100%; height:auto; float:left; ">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="sqldspackages" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" GridLines="Horizontal" PageSize="5" Width="100%" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="MaxNotification" HeaderText="MaxNotification" SortExpression="MaxNotification" />
            <asp:BoundField DataField="MaxVideos" HeaderText="MaxVideos" SortExpression="MaxVideos" />
            <asp:BoundField DataField="MaxArticles" HeaderText="MaxArticles" SortExpression="MaxArticles" />
            <asp:BoundField DataField="MaxEvent" HeaderText="MaxEvent" SortExpression="MaxEvent" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="white" ForeColor="Black"  HorizontalAlign="center" Font-Names="Calibri" Font-Bold="True" Font-Size="Small" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>  

   

</div>






</div></asp:Content>

