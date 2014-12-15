<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.master" AutoEventWireup="true" CodeFile="Usersaccountrequest.aspx.cs" Inherits="Admin_Usersaccountrequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
.divlabel{
width:15%; height:30px; margin-top:10px; float:left; line-height:30px;
 font-family: 'Carrois Gothic';  font-size: 13px;
font-weight: lighter; font-style: normal;
font-variant: small-caps; text-transform: uppercase;
color: #000000; text-align:right;
}
.divTextBox {
width:30%; height:30px; margin-top:10px; float:left; line-height:30px;
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
    <div style="width: 100%; height: 100%;  text-align: center; vertical-align: middle;">


<div style="width:96%; height:200px; margin: 0 auto; margin-top:20px;"> 
<%--1st Row--%>
<div class="divlabel"><asp:Label ID="Label10" runat="server" Text="Request Id" ></asp:Label></div>
<div class="divTextBox "><asp:TextBox ID="tbxreqid" runat="server" CssClass="TextBox" ></asp:TextBox> </div>
<div class="divlabel"><asp:Label ID="Label11" runat="server" Text="Email" ></asp:Label></div>
<div class="divTextBox "><asp:TextBox ID="tbxemail" runat="server" CssClass="TextBox"></asp:TextBox></div>
 
<%--2nd Row--%>
<div class="divlabel" style=" height:50px;"><asp:Label ID="Label12" runat="server" Text="Comments" ></asp:Label></div>
<div class="divTextBox" style="height:50px;"><asp:TextBox ID="tbxcomments" runat="server" CssClass="TextBox" Height="50px" TextMode="MultiLine"></asp:TextBox> </div>
 
<%--4th Row--%>
<div style="width:100%;  height:40px; margin-top:20px; float:left; text-align: center; vertical-align:middle; line-height:40px; "> <asp:Button ID="Button1" runat="server" Text="Approved" CssClass="BtnClass" Height="40px" Width="100px" OnClick="BtnRegisterCand_Click1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnreject" runat="server" Text="Dis-approved" CssClass="BtnClass" Height="40px" Width="100px" OnClick="btnreject_Click"  /></div>

</div>
 
    


<%-- Div Heading--%>
<div style="width:100%; height:40px; line-height:40px; background-color:#000000; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none;">
    <asp:Label ID="Label1" runat="server" Text="New Account Request"></asp:Label>
</div>
 
<div style="width:50%; height:25px; margin:0 auto; line-height:25px;   font-family: Calibri; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none;">
    <asp:Label ID="lbloperationstatus" runat="server" Visible="False" BackColor="Black"></asp:Label>
</div>

<div style="width:99%; height:450px;  margin:0 auto; margin-top:10px; border:3px groove black; overflow: visible;">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="RequestID" DataSourceID="SqlDataSource1" Font-Names="Calibri" Font-Size="Small" GridLines="Horizontal" Width="100%" ForeColor="Black" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="RequestID" HeaderText="Req. Id" InsertVisible="False" ReadOnly="True" SortExpression="RequestID" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:BoundField DataField="CNIC" HeaderText="CNIC" SortExpression="CNIC" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Constituency" HeaderText="Constituency" SortExpression="Constituency" />
            <asp:BoundField DataField="Party" HeaderText="Party" SortExpression="Party" />
            <asp:BoundField DataField="partyjoninson" HeaderText="Joins On" SortExpression="partyjoninson" />
            <asp:BoundField DataField="RequestDate" HeaderText="Req. Date" SortExpression="RequestDate" />
            <asp:CheckBoxField DataField="IsAccepted" HeaderText="Accept?" SortExpression="IsAccepted" />
            <asp:CheckBoxField DataField="IsRejected" HeaderText="Reject?" SortExpression="IsRejected" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" Font-Names="Calibri" Font-Size="Medium" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ECII(Old)ConnectionString %>" SelectCommand="SELECT [RequestID], [FirstName], [LastName], [CNIC], [Email], [Constituency], [Party], [partyjoninson], [RequestDate], [IsAccepted], [IsRejected] FROM [TblAccountRequest] WHERE (([IsAccepted] = @IsAccepted) AND ([IsRejected] = @IsRejected)) ORDER BY [RequestDate] DESC" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:Parameter DefaultValue="false" Name="IsAccepted" Type="Boolean" />
            <asp:Parameter DefaultValue="false" Name="IsRejected" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</div>
    

</div>


























</asp:Content>

