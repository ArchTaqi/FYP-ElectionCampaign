<%@ Page Title="" Language="C#" MasterPageFile="~/User/Users.master" AutoEventWireup="true" CodeFile="articledetails.aspx.cs" Inherits="User_articledetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 99.8%; height: 925px; border: 1px ridge black; text-align: center; vertical-align: middle;">
        <%-- Div Heading--%>
        <div style="width: 100%; height: 30px; line-height: 30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none; background-color: #000000;">
            <asp:Label ID="Label11" runat="server" Text="Post Article"></asp:Label>
        </div>


        <div style="width: 98%; height: 665px; margin: 0 auto; margin-top: 10px;">

            <%--1st Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label1" runat="server" Text="Title" ForeColor="Black"></asp:Label>
            </div>
            <div style="width: 80%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="tbtitle" runat="server" CssClass="TextBoxClass" Width="95%" Height="25px" placeholder="Enter Your Article Title with only 20 to 50 chracters"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatortitle" runat="server" ValidationGroup="Valgroupupdate" Display="None" ControlToValidate="tbtitle" Text="*" ErrorMessage="Please Input Article Title" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatortitle" runat="server" ValidationGroup="Valgroupupdate" Display="None" ControlToValidate="tbtitle" ValidationExpression="^[a-zA-Z''-'\s]{20,50}$" ErrorMessage="Article Title Name Must Contain Only 20-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <%--2nd Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label2" runat="server" Text="Body" ForeColor="Black"></asp:Label>
            </div>
            <div style="width: 80%; height: 300px; line-height: 20px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="tbbody" runat="server" CssClass="TextBoxClass" Width="95%" Height="300px" placeholder="Enter Your Article body with only 50 to 500 chracters" MaxLength="500" Rows="60" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorbody" runat="server" Display="None" ValidationGroup="Valgroupupdate" ControlToValidate="tbbody" Text="*" ErrorMessage="Please Input Article Title" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorbody" runat="server" Display="None" ValidationGroup="Valgroupupdate" ControlToValidate="tbbody" ValidationExpression="^.{50,500}$" ErrorMessage="Article Body Name Must Contain Only 50-500 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <%--3rd Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label4" runat="server" Text="Category" ForeColor="Black"></asp:Label>
            </div>
            <div style="width: 80%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="tbcategory" runat="server" CssClass="TextBoxClass" Width="95%" Height="25px" placeholder="Enter Your Article Title with only 5 to 30 chracters"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorcategory" Display="None" runat="server" ValidationGroup="Valgroupupdate" ControlToValidate="tbcategory" Text="*" ErrorMessage="Please Input Article Category" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidatorcategory" runat="server" ControlToValidate="tbcategory" ValidationExpression="^[a-zA-Z''-'\s]{5,30}$" ErrorMessage="Article Title Name Must Contain Only 1-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>--%>
            </div>

            <%--5th Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label5" runat="server" Text="Published On" ForeColor="Black"></asp:Label>
            </div>
            <div style="width: 30%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:Label ID="lblpublishedon" runat="server" ForeColor="Black"></asp:Label>
            </div>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; margin-left: 5%; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label6" runat="server" Text="Updated On" ForeColor="Black"></asp:Label>
            </div>
            <div style="width: 30%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:Label ID="lblupdatedon" runat="server" ForeColor="Black"></asp:Label>
            </div>
            <%--5th Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label7" runat="server" Text="Likes" ForeColor="Black"></asp:Label>
            </div>
            <div style="width: 30%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:Label ID="lbllikes" runat="server" ForeColor="Black"></asp:Label>
            </div>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; margin-left: 5%; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
            </div>
            <div style="width: 30%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
            </div>
            <%--7th Row--%>
            <div style="width: 100%; height: 25px; line-height: 25px; float: left; margin-top: 30px; text-align: center; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Button ID="btnUpdate" runat="server" CssClass="BtnClass" Text="SAVE" Width="80px" ValidationGroup="Valgroupupdate" Height="25px" OnClick="btnUpdate_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btndelete" runat="server" CssClass="BtnClass" Text="DELETE" Width="80px" Height="25px" OnClick="btndelete_Click" CausesValidation="False" />
            </div>
               <%--7th Row--%>
            <div style="width: 100%; height: 25px; line-height: 25px; float: left; margin-top: 30px; text-align: center; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
          <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Valgroupupdate" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="Red" HeaderText="These information are missing" />
            </div>
          
        </div>

    </div>
</asp:Content>

