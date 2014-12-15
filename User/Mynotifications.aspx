<%@ Page Title="" Language="C#" MasterPageFile="~/User/Users.master" AutoEventWireup="true" CodeFile="Mynotifications.aspx.cs" Inherits="User_Mynotifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 99.8%; height: 700px; border: 1px ridge black; text-align: center; vertical-align: middle;">
        <%-- Div Heading--%>
        <div style="width: 100%; height: 30px; line-height: 30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none; background-color: #000000;">
            <asp:Label ID="Label11" runat="server" Text="My Notifications"></asp:Label>
        </div>

        <%--1st Panel--%>
        <div style="width: 100%; height: 80px; margin: 0 auto; margin-top: 10px;">
            <div style="width: 100%; height: 40px; text-align: center">
                <asp:Label ID="Label2" runat="server" Text="Select the consittuecy to see the notification against that consitutency" ForeColor="Black" Font-Names="Calibri" Font-Size="Medium"></asp:Label>

            </div>
            <div style="width: 30%; height: 40px; float: left; text-align: right;">
                <asp:Label ID="Label12" runat="server" Text="Select Constituency" ForeColor="Black" Font-Names="Calibri" Font-Size="Medium"></asp:Label><asp:Label ID="Label1" runat="server" Text="*" ForeColor="#FF3300" Font-Names="Calibri" Font-Size="Medium"></asp:Label>
            </div>
            <div style="width: 60%; height: 40px; float: left; text-align: left; margin-left: 10%;">
                <asp:DropDownList ID="ddltargetconstituency" runat="server" AutoPostBack="True" Width="50%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your District in Which You Represent you Party" DataTextField="Code" DataValueField="ConstID"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="ddltargetconstituency" ValidationGroup="valgroupview" ErrorMessage="Please Input Article Category" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
            </div>
            <div style="width: 100%; height: 40px; text-align: center">
                <asp:Button ID="btnview" runat="server" Text="View" ValidationGroup="valgroupview" BackColor="#EEEEEE" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black" Height="30px" Width="100px" OnClick="btnview_Click" />

            </div>

        </div>



        <%--2nd Panel--%>
        <div style="width: 100%; height: 500px; float: left; margin-top: 50px;">
            <%-- Div Heading--%>
            <div style="width: 100%; height: 30px; line-height: 30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none; background-color: #000000;">
                <asp:Label ID="Label3" runat="server" Text="Notification List"></asp:Label>
            </div>
            <asp:GridView ID="gvnotifications" runat="server" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CaptionAlign="Top" CellPadding="4" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center" Width="100%" OnSelectedIndexChanged="gvnotifications_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField SelectText="Show Details" ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>






            <%--<asp:DataList id="DataList1"  style=" width:100%; Height:500px;" runat="server"
   BorderColor="#DEBA84" BorderStyle="None" 
   CellSpacing="2" BackColor="#DEBA84" 
   CellPadding="3" GridLines="Both" BorderWidth="1px"
     OnEditCommand="Edit_Command" 
     OnCancelCommand="Cancel_Command" 
     OnUpdateCommand="Update_Command"
     OnDeleteCommand="Delete_Command" 
     DataKeyField="NotificationId" RepeatColumns="3" RepeatDirection="Horizontal" >

    <HeaderTemplate>
      Notifications
   </HeaderTemplate>
    <ItemTemplate>
      <table border=1>
      <tr><td><b>ID : </b></td>
         <td>'<%# DataBinder.Eval(Container.DataItem, "NotificationId") %>'  </td></tr>
      <tr><td><b>Text : </b></td>
         <td>'<%# DataBinder.Eval(Container.DataItem, "Body") %>'  </td></tr>
      <tr><td><b>Posted On : </b></td>
         <td>'<%# DataBinder.Eval(Container.DataItem, "PostedOn") %>' </td></tr>
          <tr><td><b>Updated On : </b></td> 
         <td>'<%# DataBinder.Eval(Container.DataItem, "UpdatedOn") %>' </td></tr>
           <tr><td><b>Likes : </b></td>
         <td>'<%# DataBinder.Eval(Container.DataItem, "countlikes") %>' </td></tr>
      </table>
        <asp:LinkButton Text="Edit" CommandName="Edit" 
                      Runat="server" ID="edit" />
      <asp:LinkButton Text="Delete" CommandName="Delete" 
                      Runat="server" ID="delete" />
        <edititemtemplate> 
      <table border=1>
      <tr><td><b>Title : </b></td>
         <td><asp:TextBox Text='<%# DataBinder.Eval(Container.DataItem, "Body") %>'  runat="server"  ID="Body"/>
         </td></tr></table>
      <asp:LinkButton Text="Cancel" CommandName="Cancel" Runat="server" ID="cancel" > </asp:LinkButton>
      <asp:LinkButton Text="Update" CommandName="Update"  Runat="server" ID="update" > </asp:LinkButton>
   </edititemtemplate>

   </ItemTemplate>
   <SelectedItemStyle Font-Bold="True" ForeColor="White"
       BackColor="#738A9C">
   </SelectedItemStyle>

   <ItemStyle ForeColor="#8C4510" BackColor="#FFF7E7">
   </ItemStyle>

   <FooterStyle ForeColor="#8C4510" BackColor="#F7DFB5">
   </FooterStyle>

   <HeaderStyle Font-Bold="True" ForeColor="White" 
       BackColor="black">
   </HeaderStyle>
				
</asp:DataList>--%>
        </div>



    </div>
</asp:Content>

