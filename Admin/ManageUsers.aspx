<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Admin_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; height: auto; margin: 0 auto;">

<div style="width:100%; height:30px; margin:0 auto; text-align:center; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; background-color: #000000;">
    <asp:Label ID="Label1" runat="server" Text="All Registered Users"></asp:Label>
</div>



        <div style="width: 100%; height: 500px; margin: 0 auto;  text-align: left; overflow:scroll;">
          
            <asp:SqlDataSource ID="sqlusers" runat="server" ConnectionString="<%$ ConnectionStrings:ECII(Old)ConnectionString %>" DeleteCommand="DELETE FROM [TblUser] WHERE [UserId] = @UserId" InsertCommand="INSERT INTO [TblUser] ([UserName], [Email], [NIC], [CreatedDate], [IsActive], [LastLoginDate], [PinCode]) VALUES (@UserName, @Email, @NIC, @CreatedDate, @IsActive, @LastLoginDate, @PinCode)" SelectCommand="SELECT [UserId], [UserName], [Email], [NIC], [CreatedDate], [IsActive], [LastLoginDate], [PinCode] FROM [TblUser] ORDER BY [UserId]" UpdateCommand="UPDATE [TblUser] SET [UserName] = @UserName, [Email] = @Email, [NIC] = @NIC, [CreatedDate] = @CreatedDate, [IsActive] = @IsActive, [LastLoginDate] = @LastLoginDate, [PinCode] = @PinCode WHERE [UserId] = @UserId">
                <DeleteParameters>
                    <asp:Parameter Name="UserId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="NIC" Type="Int64" />
                    <asp:Parameter Name="CreatedDate" Type="DateTime" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:Parameter Name="LastLoginDate" Type="DateTime" />
                    <asp:Parameter Name="PinCode" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="NIC" Type="Int64" />
                    <asp:Parameter Name="CreatedDate" Type="DateTime" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:Parameter Name="LastLoginDate" Type="DateTime" />
                    <asp:Parameter Name="PinCode" Type="Int32" />
                    <asp:Parameter Name="UserId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="sqlusers" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" GridLines="Horizontal" Width="100%">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>

    </div>


    </div>
</asp:Content>

