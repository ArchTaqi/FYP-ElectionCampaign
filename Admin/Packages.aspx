<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.master" AutoEventWireup="true" CodeFile="Packages.aspx.cs" Inherits="Admin_Packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<link href="../StyleSheet/style.css" rel="stylesheet" />
     <style type="text/css">           
             
              .cssPager td
            {
                  padding-left: 4px;     
                  padding-right: 4px;    
              }
              .gridview{
    background-color:#fff;
   
   padding:2px;
   margin:2% auto;
   
   
}
              .gridview a{
  margin:auto 1%;
    border-radius:50%;
      background-color:#444;
      padding:5px 10px 5px 10px;
      color:#fff;
      text-decoration:none;
      -o-box-shadow:1px 1px 1px #111;
      -moz-box-shadow:1px 1px 1px #111;
      -webkit-box-shadow:1px 1px 1px #111;
      box-shadow:1px 1px 1px #111;
     
}
              .gridview a:hover{
    background-color:#1e8d12;
    color:#fff;
}
              .gridview span{
    background-color:#ae2676;
    color:#fff;
     -o-box-shadow:1px 1px 1px #111;
      -moz-box-shadow:1px 1px 1px #111;
      -webkit-box-shadow:1px 1px 1px #111;
      box-shadow:1px 1px 1px #111;

    border-radius:50%;
    padding:5px 10px 5px 10px;
}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div style="width:99.8%; background-color:white; height:825px; border:medium groove black; text-align:center; vertical-align:middle;">
<%-- Div Heading--%>
<div style="width:100%; height: 30px; margin:0 auto; vertical-align:central; text-align:center; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 2em; background-color: #000000;"><p style="font-family: Calibri; font-weight: bold; font-style: normal; font-variant: small-caps; font-size:x-large; color:white;">Packages</p></div>

<%--Add New Package--%>
<div style="width:90%; height:375px; margin:0 auto; margin-top:30px; border:black solid thin;">
<%-- Div Heading--%>
<div style="width:100%; height: 30px; margin:0 auto; vertical-align:central; text-align:center; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 2em; background-color: #000000;"><p style="font-family: Calibri; font-weight: bold; font-style: normal; font-variant: small-caps; font-size:x-large; color:white;">Add New One</p></div>
<div style="width:80%; height:10px; margin:0 auto;">
<asp:Label ID="Lblerror" runat="server" width="100%" Height="10px" Visible="False"></asp:Label></div>

    <%--1st Row--%>
<div style="width:20%; margin-left:10%; height:30px; float:left; line-height:30px; text-align:left; margin-top:20px;">
    <asp:Label ID="lblname" runat="server" Text="Name" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black"></asp:Label></div>
<div style="width:60%; height:30px; float:left; margin-top:20px; line-height:30px; text-align:left;">
    <asp:TextBox ID="tbxpackagename" runat="server" Width="35%" Height="20px" line-height="25px" placehoder="Package name"></asp:TextBox> Between 1 to 30 Characters
    <asp:RequiredFieldValidator ID="rvname" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxpackagename" Text="*" ErrorMessage="Package Name is missing!!"></asp:RequiredFieldValidator>
    <%--<asp:RegularExpressionValidator ID="regexname" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxpackagename" ValidationExpression="^[a-zA-Z''-'\s]{1,25}$" Text="*"  ErrorMessage="Package name must be 1-25 characters, no special characters"></asp:RegularExpressionValidator>--%>
</div>
    <%--2nd Row--%>
<div style="width:20%; margin-left:10%; height:30px; float:left; text-align:left; line-height:30px;">
    <asp:Label ID="Label2" runat="server" Text="Notification Allowed" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black"></asp:Label></div>
<div style="width:12%; height:30px; float:left; line-height:30px; text-align:left;">
   <asp:TextBox ID="tbxnotification" runat="server" Width="100%" Height="20px" line-height="25px" placehoder="Max. Notification"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rvnotification" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxnotification" Text="*" ErrorMessage="max. allowed notification is missing!!"></asp:RequiredFieldValidator>
    <%--<asp:RegularExpressionValidator ID="regexnotification" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxnotification" ValidationExpression="^([0-9]{10})$" Text="*"  ErrorMessage="Allowd Notification must include integer value"></asp:RegularExpressionValidator>--%>
</div>
        <%--3rd Row--%>
<div style="width:20%; margin-left:10%; height:30px; float:left; text-align:left; line-height:30px;">
    <asp:Label ID="Label3" runat="server" Text="Videos Allowed" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black"></asp:Label></div>
<div style="width:12%; height:30px; float:left; line-height:30px; text-align:left;">
   <asp:TextBox ID="tbxvideos" runat="server" Width="100%" Height="20px" line-height="25px" placehoder="Max. Notification"></asp:TextBox> 
<asp:RequiredFieldValidator ID="rvvideos" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxvideos" Text="*" ErrorMessage="max. allowed videos is missing!!"></asp:RequiredFieldValidator>
    <%--<asp:RegularExpressionValidator ID="regexvideos" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxvideos" ValidationExpression="^([0-9]{10})$" Text="*"  ErrorMessage="Allowd videos must include integer value"></asp:RegularExpressionValidator>--%>

</div>
        <%--4th Row--%>
<div style="width:20%; margin-left:10%; height:30px; float:left; text-align:left; line-height:30px;">
    <asp:Label ID="Label4" runat="server" Text="Articles Allowed" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black"></asp:Label></div>
<div style="width:12%; height:30px; float:left; line-height:30px; text-align:left;">
   <asp:TextBox ID="tbxarticles" runat="server" Width="100%" Height="20px" line-height="25px" placehoder="Max. Articles"></asp:TextBox>
<asp:RequiredFieldValidator ID="rvarticles" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxarticles" Text="*" ErrorMessage="max. allowed articles is missing!!"></asp:RequiredFieldValidator>
    <%--<asp:RegularExpressionValidator ID="regexarticles" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxarticles" ValidationExpression="^([0-9]{10})$" Text="*"  ErrorMessage="Allowd articles must include integer value"></asp:RegularExpressionValidator>--%>
</div>

        <%--5th Row--%>
<div style="width:20%; margin-left:10%; height:30px; float:left; text-align:left; line-height:30px;">
    <asp:Label ID="Label5" runat="server" Text="Events Allowed" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black"></asp:Label></div>
<div style="width:12%; height:30px; float:left; line-height:30px; text-align:left;">
   <asp:TextBox ID="tbxevents" runat="server" Width="100%" Height="20px" line-height="25px" placehoder="Max. events"></asp:TextBox>
<asp:RequiredFieldValidator ID="rvevents" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxevents" Text="*" ErrorMessage="max. allowed events is missing!!"></asp:RequiredFieldValidator>
    <%--<asp:RegularExpressionValidator ID="regexevent" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxevents" ValidationExpression="^([0-9]{10})$" Text="*"  ErrorMessage="Allowd events must include integer value"></asp:RegularExpressionValidator>--%>
</div>
        <%--6th Row--%>
        <%--7th Row--%>
<div style="width:20%; margin-left:10%; height:30px; float:left; text-align:left; line-height:30px;">
    <asp:Label ID="Label6" runat="server" Text="Cost" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black"></asp:Label></div>
<div style="width:20%; height:30px; float:left; line-height:30px; text-align:left;">
       <asp:TextBox ID="tbxcost" runat="server" Width="60%" Height="20px" line-height="25px" placehoder="Max. Notification"></asp:TextBox><asp:Label ID="Label1" runat="server" Text="  Rs." Font-Names="Calibri" Font-Size="Medium" ForeColor="Black"></asp:Label>
<asp:RequiredFieldValidator ID="rvcost" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxcost" Text="*" ErrorMessage="max. allowed ally is missing!!"></asp:RequiredFieldValidator>
    <%--<asp:RegularExpressionValidator ID="regexcost" runat="server" ValidationGroup="valgroupsubmit"  Display="None" ControlToValidate="tbxcost" ValidationExpression="^([0-9]{10})$" Text="*"  ErrorMessage="Allowd ally must include integer value"></asp:RegularExpressionValidator>--%>
</div>

    <%--8th Row--%>
    <div style="width:80%; height:30px; margin:0 auto; float:left; line-height:30px; margin-top:15px; text-align:center;">
    <asp:Button ID="btnadd" runat="server" Text="Add" Width="100px" ValidationGroup="valgroupsubmit" Height="30px" BorderColor="Black" BackColor="#EEEEEE" Font-Size="Medium" Font-Names="Calibri" ForeColor="Black" BorderStyle="Solid" OnClick="btnadd_Click" />      
</div>

    <%--9th Row--%>
        <div style="width:80%; height:70px; margin:0 auto; float:left; line-height:15px; margin-top:15px; text-align:center;">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Names="Calibri" Font-Size="Small" HeaderText="Alert...." />
</div>

</div> 

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ECII(Old)ConnectionString %>"  SelectCommand="uspGetPackage" UpdateCommand="uspUpdatePackage" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
            <UpdateParameters>
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="MaxNotification" Type="Int32" />
                <asp:Parameter Name="MaxVideos" Type="Int32" />
                <asp:Parameter Name="MaxArticles" Type="Int32" />
                <asp:Parameter Name="MaxEvent" Type="Int32" />
                <asp:Parameter Name="Cost" Type="Double" />
                <asp:Parameter Name="PackageID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
<%--Package Grid View--%>
        <div style="width:90%; height:350px; margin:0 auto; margin-top:30px;  text-align:center; border:black thin solid; overflow:visible; ">
 <%-- Div Heading--%>
<div style="width:100%; height: 30px; margin:0 auto; vertical-align:central; text-align:center; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 2em; background-color: #000000;"><p style="font-family: Calibri; font-weight: bold; font-style: normal; font-variant: small-caps; font-size:x-large; color:white;">Update Packages</p></div>
            
        <asp:GridView ID="GridView2" runat="server"  GridLines="Horizontal"  AllowPaging="True"  CssClass="mGrid"  PagerStyle-CssClass="pgr"  AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PackageID" DataSourceID="SqlDataSource2" ForeColor="Black"   EnableSortingAndPagingCallbacks="True" Width="100%" Height="300px" PageSize="5" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle />
            <Columns>
                <asp:BoundField DataField="PackageID" HeaderText="PackageID" InsertVisible="False" ReadOnly="True" SortExpression="PackageID">
                </asp:BoundField>
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category">
                </asp:BoundField>
                <asp:BoundField DataField="MaxNotification" HeaderText="MaxNotification" SortExpression="MaxNotification">
                </asp:BoundField>
                <asp:BoundField DataField="MaxVideos" HeaderText="MaxVideos" SortExpression="MaxVideos">
                </asp:BoundField>
                <asp:BoundField DataField="MaxArticles" HeaderText="MaxArticles" SortExpression="MaxArticles">
                </asp:BoundField>
                <asp:BoundField DataField="MaxEvent" HeaderText="MaxEvent" SortExpression="MaxEvent">
                </asp:BoundField>
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost">
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageImageUrl="~/Images/First.png" LastPageImageUrl="~/Images/Last.png" NextPageImageUrl="~/Images/next.png" PreviousPageImageUrl="~/Images/Back.png" PageButtonCount="5" />
            <PagerStyle cssclass="gridview" BackColor="White"  ForeColor="black" HorizontalAlign="right" BorderStyle="None" Height="20px" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>

    </div>




</div>


</asp:Content>

