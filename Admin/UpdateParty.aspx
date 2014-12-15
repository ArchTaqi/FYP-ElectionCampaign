<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.master" AutoEventWireup="true" CodeFile="UpdateParty.aspx.cs" Inherits="Admin_UpdateParty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:99.6%; height:500px; border:1px ridge black; text-align:center; vertical-align:middle;">

<%-- Div Heading--%>
<div style="width:100%; height: 30px; margin:0 auto; vertical-align:central; text-align:center; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 2em; background-color: #000000;"><p style="font-family: Calibri; font-weight: bold; font-style: normal; font-variant: small-caps; font-size:x-large; color:white;">Update Party</p></div>

        <asp:SqlDataSource ID="dqlds" runat="server" ConnectionString="<%$ ConnectionStrings:ECII(Old)ConnectionString %>" DeleteCommand="DELETE FROM [TblParty] WHERE [PartyId] = @PartyId" InsertCommand="INSERT INTO [TblParty] ([PartyName], [PartyLeader], [PartyAddress], [PartyDescription]) VALUES (@PartyName, @PartyLeader, @PartyAddress, @PartyDescription)" SelectCommand="SELECT [PartyId], [PartyName], [PartyLeader], [PartyAddress], [PartyDescription] FROM [TblParty] ORDER BY [PartyId]" UpdateCommand="UPDATE [TblParty] SET [PartyName] = @PartyName, [PartyLeader] = @PartyLeader, [PartyAddress] = @PartyAddress, [PartyDescription] = @PartyDescription WHERE [PartyId] = @PartyId">
            <DeleteParameters>
                <asp:Parameter Name="PartyId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PartyName" Type="String" />
                <asp:Parameter Name="PartyLeader" Type="String" />
                <asp:Parameter Name="PartyAddress" Type="String" />
                <asp:Parameter Name="PartyDescription" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PartyName" Type="String" />
                <asp:Parameter Name="PartyLeader" Type="String" />
                <asp:Parameter Name="PartyAddress" Type="String" />
                <asp:Parameter Name="PartyDescription" Type="String" />
                <asp:Parameter Name="PartyId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
<div style="width:100%; height:auto; float:left; ">      
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="dqlds" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" GridLines="Horizontal" Height="300px" Width="100%" AutoGenerateColumns="False" DataKeyNames="PartyId" PageSize="5">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="PartyId" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="PartyId" />
            <asp:BoundField DataField="PartyName" HeaderText="Name" SortExpression="PartyName" />
            <asp:BoundField DataField="PartyLeader" HeaderText="Leader" SortExpression="PartyLeader" />
            <asp:BoundField DataField="PartyAddress" HeaderText="Address" SortExpression="PartyAddress" />
            <asp:BoundField DataField="PartyDescription" HeaderText="Description" SortExpression="PartyDescription" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>

</div>

</div></asp:Content>

