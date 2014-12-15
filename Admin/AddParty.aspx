<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.master" AutoEventWireup="true" CodeFile="AddParty.aspx.cs" Inherits="Admin_AddParty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
.divlabel{
width:25%;   height:30px;  margin-top:20px; float:left; text-align:right; vertical-align:middle; line-height:30px;
 font-family: 'Carrois Gothic';  font-size: 13px;
font-weight: lighter; font-style: normal;
font-variant: small-caps; text-transform: uppercase;
color: #000000;
}
.divTextBox {
width:60%;  height:30px;  margin-top:20px; margin-left:15%;  float:left; text-align:left;
vertical-align:middle; 
    }
.TextBox{
Height:20px; Width:80%;
 background-color: white;
            border: rgb(153, 153, 153) solid thin;
            font-family: Calibri;
            font-size: 14px;
            font-weight: lighter;
            color: black;
}
.TextBox:hover{
Height:20px; Width:80%;
 background-color: white;
                border: rgb(0,0,0) solid thin;
                font-family: Calibri;
                font-size: 14px;
                font-weight: lighter;
                color: black;
}
.BtnClass {
            background-color: #EEEEEE;
            /*background-color:rgb(153, 153, 153);*/
            border: rgb(153, 153, 153) 2px solid;
            width: 100px;
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
                width: 100px;
                height: 35px;
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

    <div style="width:99.6%; background-color:white; height:750px; border:medium groove black; text-align:center; vertical-align:middle;">
<%-- Div Heading--%>
<div style="width: 60%; height: 30px; margin:0 auto; line-height: 30px; font-family: Calibri; font-size: xx-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: black; ">
<asp:Label ID="Label11" runat="server" Text="Add New Party" Font-Underline="True"></asp:Label></div>

    <%-- Div Add New Party Panel --%>
<div style="width:90%; height:720px; margin: 0 auto; margin-top:50px; "> 
<%--1st Row--%>
<div class="divlabel"> <asp:Label ID="Label1" runat="server" Text="Party Name" Height="40px" Width="50%"></asp:Label></div>
<div class="divTextBox" ><asp:TextBox ID="TxtBxPartyName" runat="server" CssClass="TextBox" placeholder="only characters between 1 - 50" ToolTip="Enter Party Name" Height="30px" Width="70%"></asp:TextBox> 
<asp:RequiredFieldValidator ID="RequiredFieldValidatorPartyName" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="TxtBxPartyName" ErrorMessage="Please Enter Party Name" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red" ></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidatorPartyName" ValidationGroup="valgroupsubmit" runat="server"  Display="None" ControlToValidate="TxtBxPartyName" ValidationExpression="^[a-zA-Z''-'\s]{1,50}$" ErrorMessage="party Name Must Contain Only 1-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator></div>
<%--2nd Row--%>
<div class="divlabel">  <asp:Label ID="Label4" runat="server" Text="Party Leader" ToolTip="Party Name" Height="40px" Width="100%" ></asp:Label></div>
<div class="divTextBox" ><asp:TextBox ID="TxtBxPLeader" runat="server" CssClass="TextBox" ToolTip="Enter Party Name" Height="30px" Width="70%"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidatorTxPLeader" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TxtBxPLeader" ErrorMessage="Please Enter Party Leader Name" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red" ></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidatorPLeader" ValidationGroup="valgroupsubmit" Display="None" runat="server"  ControlToValidate="TxtBxPLeader" ValidationExpression="^[a-zA-Z''-'\s]{1,50}$" ErrorMessage="Party Leader Name Must Contain Only 1-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator></div>
<%--3rd Row--%>
<div class="divlabel"> <asp:Label ID="Label5" runat="server" Text="Party Address" ToolTip="Party Name" Height="40px" Width="100%"></asp:Label></div>
<div class="divTextBox"  style="height:100px;"><asp:TextBox ID="TxtBxPAdress" runat="server" CssClass="TextBox" ToolTip="Enter Party Descritpion" Height="80px" Width="70%" TextMode="MultiLine"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidatorPAdress" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TxtBxPAdress" ErrorMessage="Please Enter Party Address" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red" ></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidatorPAdress" ValidationGroup="valgroupsubmit" Display="None" runat="server"  ControlToValidate="TxtBxPAdress" ValidationExpression="^.{1,150}$" ErrorMessage="Party Address Must Contain Only 1-150 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
    </div>
<%--4th Row--%>
<div class="divlabel"> <asp:Label ID="Label2" runat="server" Text="Party Symbol" Height="40px" Width="100%" ></asp:Label></div>
<div class="divTextBox" style="width:55%; ">
    <asp:FileUpload ID="fu1" runat="server" />
<asp:CustomValidator ID="cvfu1" runat="server" Display="None" ErrorMessage="Only .jpeg | .jpg | .gif | .png | .bitmap files allowed!" ControlToValidate="fu1" onservervalidate="cvfu1_ServerValidate"  ></asp:CustomValidator>
<asp:RequiredFieldValidator id="rvfu1" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="party symbol is required!" ControlToValidate="fu1"></asp:RequiredFieldValidator>
</div>
<%--5th Row--%>
<div class="divlabel"> <asp:Label ID="Label6" runat="server" Text="Party Flag" ToolTip="Party Name" Height="40px" Width="100%" ></asp:Label></div>
<div class="divTextBox" style="width:55%; "><asp:FileUpload ID="fu2" runat="server" />
<asp:CustomValidator ID="cvfu2" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="Only .jpeg | .jpg | .gif | .png | .bitmap files allowed!" ControlToValidate="fu2" onservervalidate="cvfu2_ServerValidate"  ></asp:CustomValidator>
<asp:RequiredFieldValidator id="rvfu2" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="party flag is required!" ControlToValidate="fu2"></asp:RequiredFieldValidator>
</div>
<%--6th Row--%>
<div class="divlabel">  <asp:Label ID="Label3" runat="server" Text="Party Details" ToolTip="Party Name" Height="40px" Width="100%" ></asp:Label></div>
<div class="divTextBox" style="height:100px;"><asp:TextBox ID="TxtBoxPartyDescription" runat="server"  CssClass="TextBox" ToolTip="Enter Party Descritpion" Height="80px" Width="70%" TextMode="MultiLine"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidatorPartyDescription" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="TxtBoxPartyDescription" ErrorMessage="Please Enter Party Description" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red" ></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidatorPartyDescription" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="TxtBoxPartyDescription" ValidationExpression="^.{1,250}$$" ErrorMessage="Party Descripion Must Contain Only 1-250 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
    </div>
<%--7th Row--%>
<div style="width:100%;   height:40px; margin-top:20px; float:left; text-align:center; vertical-align:middle; line-height:40px; "> 
    <asp:Button ID="BtnAddParty" runat="server" Text="Add" CssClass="BtnClass" ValidationGroup="valgroupsubmit"  Height="40px" Width="100px" OnClick="BtnAddParty_Click1" />   </div>

<%--Validation Summary--%>
         .<br />
         <div style=" width:90%; text-align:left;  margin-top:30px; padding-left:5%;">
<asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Names="Calibri" ForeColor="Red" Font-Size="Small" HeaderText="Warnings........" />
</div>
</div> 

<%-- Div Heading--%>
<%--<div style="width:100%; height: 30px; margin-top:25px; float:left; vertical-align:central; text-align:center; line-height: normal; text-indent: inherit; white-space: pre-wrap; word-spacing: 2em;   background-color: #000000;"><p style="font-family: Calibri; font-weight: bold; font-style: normal; font-variant: small-caps; font-size:x-large; color:white;">Already Registered Parties</div>--%>
 


<%--Scroll Div Display all the Registered Parties--%> 
<%--<div style="width:96%; height:450px;  margin:0 auto; margin-top:70px; border:3px groove black; overflow: scroll;">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ECII(Old)ConnectionString %>" DeleteCommand="DELETE FROM [TblParty] WHERE [PartyId] = @original_PartyId AND (([PartyName] = @original_PartyName) OR ([PartyName] IS NULL AND @original_PartyName IS NULL)) AND (([PartyLeader] = @original_PartyLeader) OR ([PartyLeader] IS NULL AND @original_PartyLeader IS NULL)) AND (([PartyLogo] = @original_PartyLogo) OR ([PartyLogo] IS NULL AND @original_PartyLogo IS NULL)) AND (([PartyLogoPath] = @original_PartyLogoPath) OR ([PartyLogoPath] IS NULL AND @original_PartyLogoPath IS NULL)) AND (([PartyFlag] = @original_PartyFlag) OR ([PartyFlag] IS NULL AND @original_PartyFlag IS NULL)) AND (([PartyFlagPath] = @original_PartyFlagPath) OR ([PartyFlagPath] IS NULL AND @original_PartyFlagPath IS NULL)) AND (([PartyAddress] = @original_PartyAddress) OR ([PartyAddress] IS NULL AND @original_PartyAddress IS NULL)) AND (([PartyDescription] = @original_PartyDescription) OR ([PartyDescription] IS NULL AND @original_PartyDescription IS NULL))" InsertCommand="INSERT INTO [TblParty] ([PartyName], [PartyLeader], [PartyLogo], [PartyLogoPath], [PartyFlag], [PartyFlagPath], [PartyAddress], [PartyDescription]) VALUES (@PartyName, @PartyLeader, @PartyLogo, @PartyLogoPath, @PartyFlag, @PartyFlagPath, @PartyAddress, @PartyDescription)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblParty] ORDER BY [PartyId]" UpdateCommand="UPDATE [TblParty] SET [PartyName] = @PartyName, [PartyLeader] = @PartyLeader, [PartyLogo] = @PartyLogo, [PartyLogoPath] = @PartyLogoPath, [PartyFlag] = @PartyFlag, [PartyFlagPath] = @PartyFlagPath, [PartyAddress] = @PartyAddress, [PartyDescription] = @PartyDescription WHERE [PartyId] = @original_PartyId AND (([PartyName] = @original_PartyName) OR ([PartyName] IS NULL AND @original_PartyName IS NULL)) AND (([PartyLeader] = @original_PartyLeader) OR ([PartyLeader] IS NULL AND @original_PartyLeader IS NULL)) AND (([PartyLogo] = @original_PartyLogo) OR ([PartyLogo] IS NULL AND @original_PartyLogo IS NULL)) AND (([PartyLogoPath] = @original_PartyLogoPath) OR ([PartyLogoPath] IS NULL AND @original_PartyLogoPath IS NULL)) AND (([PartyFlag] = @original_PartyFlag) OR ([PartyFlag] IS NULL AND @original_PartyFlag IS NULL)) AND (([PartyFlagPath] = @original_PartyFlagPath) OR ([PartyFlagPath] IS NULL AND @original_PartyFlagPath IS NULL)) AND (([PartyAddress] = @original_PartyAddress) OR ([PartyAddress] IS NULL AND @original_PartyAddress IS NULL)) AND (([PartyDescription] = @original_PartyDescription) OR ([PartyDescription] IS NULL AND @original_PartyDescription IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_PartyId" Type="Int32" />
            <asp:Parameter Name="original_PartyName" Type="String" />
            <asp:Parameter Name="original_PartyLeader" Type="String" />
            <asp:Parameter Name="original_PartyLogo" Type="String" />
            <asp:Parameter Name="original_PartyLogoPath" Type="String" />
            <asp:Parameter Name="original_PartyFlag" Type="String" />
            <asp:Parameter Name="original_PartyFlagPath" Type="String" />
            <asp:Parameter Name="original_PartyAddress" Type="String" />
            <asp:Parameter Name="original_PartyDescription" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PartyName" Type="String" />
            <asp:Parameter Name="PartyLeader" Type="String" />
            <asp:Parameter Name="PartyLogo" Type="String" />
            <asp:Parameter Name="PartyLogoPath" Type="String" />
            <asp:Parameter Name="PartyFlag" Type="String" />
            <asp:Parameter Name="PartyFlagPath" Type="String" />
            <asp:Parameter Name="PartyAddress" Type="String" />
            <asp:Parameter Name="PartyDescription" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PartyName" Type="String" />
            <asp:Parameter Name="PartyLeader" Type="String" />
            <asp:Parameter Name="PartyLogo" Type="String" />
            <asp:Parameter Name="PartyLogoPath" Type="String" />
            <asp:Parameter Name="PartyFlag" Type="String" />
            <asp:Parameter Name="PartyFlagPath" Type="String" />
            <asp:Parameter Name="PartyAddress" Type="String" />
            <asp:Parameter Name="PartyDescription" Type="String" />
            <asp:Parameter Name="original_PartyId" Type="Int32" />
            <asp:Parameter Name="original_PartyName" Type="String" />
            <asp:Parameter Name="original_PartyLeader" Type="String" />
            <asp:Parameter Name="original_PartyLogo" Type="String" />
            <asp:Parameter Name="original_PartyLogoPath" Type="String" />
            <asp:Parameter Name="original_PartyFlag" Type="String" />
            <asp:Parameter Name="original_PartyFlagPath" Type="String" />
            <asp:Parameter Name="original_PartyAddress" Type="String" />
            <asp:Parameter Name="original_PartyDescription" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GV1" runat="server" Width="120%" AutoGenerateColumns="False" DataKeyNames="PartyId" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataSourceID="SqlDataSource1" >
        <Columns>
            <%--<asp:BoundField DataField="PartyId" HeaderText="PartyId" InsertVisible="False" ReadOnly="True" SortExpression="PartyId" />--%>
       <%--     <asp:BoundField DataField="PartyName" HeaderText="Name" SortExpression="PartyName" />
            <asp:BoundField DataField="PartyLeader" HeaderText="Leader" SortExpression="PartyLeader" />
            <%--<asp:BoundField DataField="PartyLogo" HeaderText="PartyLogo" SortExpression="PartyLogo" />--%>
          <%--  <asp:ImageField DataImageUrlField="PartyLogoPath" HeaderText="Logo" SortExpression="PartyLogoPath" ControlStyle-Width="64" ControlStyle-Height="64" >
<ControlStyle Height="48px" Width="48px"></ControlStyle>
            </asp:ImageField>
            <%--<asp:BoundField DataField="PartyFlag" HeaderText="PartyFlag" SortExpression="PartyFlag" />--%>
            <%--<asp:imageField DataImageUrlField="PartyFlagPath" HeaderText="Flag" SortExpression="PartyFlagPath" ControlStyle-Width="64" ControlStyle-Height="64" >--%>
<%--<ControlStyle Height="48px" Width="48px"></ControlStyle>--%>
            <%--</asp:imageField>--%>
            <%--<asp:BoundField DataField="PartyAddress" HeaderText="PartyAddress" SortExpression="PartyAddress" />--%>
            <%--<asp:BoundField DataField="PartyDescription" HeaderText="PartyDescription" SortExpression="PartyDescription" />--%>
        <%--</Columns>--%>--%>
       <%-- <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />--%>
    <%--</asp:GridView>--%>

<%--</div>--%>


</div>
</asp:Content>

