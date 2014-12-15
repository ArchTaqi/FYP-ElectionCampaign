<%@ Page Title="" Language="C#" MasterPageFile="~/User/Users.master" AutoEventWireup="true" CodeFile="MyArticles.aspx.cs" Inherits="User_MyArticles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="width: 99.8%; height: 700px; border: 1px ridge black; text-align: center; vertical-align: middle;">
        <%-- Div Heading--%>
        <div style="width: 100%; height: 30px; line-height: 30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none; background-color: #000000;">
            <asp:Label ID="Label11" runat="server" Text="My Articles"></asp:Label>
        </div>

        <%--1st Panel--%>

        <div style="width: 100%; height: 80px; margin: 0 auto; margin-top: 10px; ">
            <div style="width: 100%; height: 40px; text-align: center">
                <asp:Label ID="Label2" runat="server" Text="Select the consittuecy to see the articles against that consitutency" ForeColor="Black" Font-Names="Calibri" Font-Size="Medium"></asp:Label>

            </div>
            <div style="width: 30%; height: 40px; float: left; text-align: right;">
                <asp:Label ID="Label12" runat="server" Text="Select Constituency" ForeColor="Black" Font-Names="Calibri" Font-Size="Medium"></asp:Label><asp:Label ID="Label1" runat="server" Text="*" ForeColor="#FF3300" Font-Names="Calibri" Font-Size="Medium"></asp:Label>
            </div>
            <div style="width: 60%; height: 40px; float: left; text-align: left; margin-left: 10%;">
                <asp:DropDownList ID="ddltargetconstituency" runat="server" AutoPostBack="True" Width="50%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your District in Which You Represent you Party" DataTextField="Code" DataValueField="ConstID"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="ddltargetconstituency"  ValidationGroup="valgroupview" ErrorMessage="Please Input Article Category" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
            </div>
            <div style="width: 100%; height: 40px; text-align: center">
                <asp:Button ID="btnview" runat="server" Text="View" ValidationGroup="valgroupview" BackColor="#EEEEEE" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black" Height="30px" Width="100px" OnClick="btnview_Click" />

            </div>

        </div>


<%--2nd Panel--%>
<div style="width:100%; height:500px; margin-top:50px; float:left;">
        <%-- Div Heading--%>
        <div style="width: 100%; height: 30px; line-height: 30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none; background-color: #000000;">
            <asp:Label ID="Label3" runat="server" Text="Articles List"></asp:Label>
        </div>


<asp:GridView ID="gvarticles" runat="server" Font-Names="Calibri" Font-Size="Small" AllowPaging="True" AllowSorting="True"  HorizontalAlign="Justify" PageSize="20" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="gvarticles_SelectedIndexChanged">
    <Columns>
        <asp:CommandField SelectText="Show Details" ShowSelectButton="True" />
    </Columns>
    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" Height="20px" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>




</div>




   






    </div>
</asp:Content>

