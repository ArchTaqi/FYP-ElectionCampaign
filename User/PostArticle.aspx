<%@ Page Title="" Language="C#" MasterPageFile="../User/Users.master" AutoEventWireup="true" CodeFile="PostArticle.aspx.cs" Inherits="PostArticles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .BtnClass {
            background-color: #EEEEEE;
            /*background-color:rgb(153, 153, 153);*/
            border: rgb(153, 153, 153) 2px solid;
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

        .TextBoxClass {
            background-color: white;
            border: black solid thin;
            font-family: Calibri;
            font-size: 14px;
            font-weight: lighter;
            color: black;
        }

            .TextBoxClass:focus {
                background-color: white;
                border: rgb(48, 157, 207) solid thin;
                font-family: Calibri;
                font-size: 14px;
                font-weight: lighter;
                color: black;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 99.8%; height: 925px; border: 1px ridge black; text-align: center; vertical-align: middle;">
        <%-- Div Heading--%>
        <div style="width: 100%; height: 30px; line-height: 30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none; background-color: #000000;">
            <asp:Label ID="Label11" runat="server" Text="Post Article"></asp:Label>
        </div>

        <div style="width: 98%; height: 665px; margin: 0 auto; margin-top: 10px; ">

            <%--1st Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label1" runat="server" Text="Title" ForeColor="Black"></asp:Label> <asp:Label ID="Label6" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 80%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="tbtitle" runat="server" CssClass="TextBoxClass" Width="95%" Height="25px" placeholder="Enter Your Article Title with only 20 to 50 chracters"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatortitle" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbtitle" Text="*" ErrorMessage="article tittle is missing" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatortitle" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbtitle" ValidationExpression="^[a-zA-Z''-'\s]{20,50}$" ErrorMessage="Article Title Name Must Contain Only 20-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <%--2nd Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label2" runat="server" Text="Body" ForeColor="Black"></asp:Label> <asp:Label ID="Label7" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 80%; height: 300px; line-height: 20px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="tbbody" runat="server" CssClass="TextBoxClass" Width="95%" Height="300px" placeholder="Enter Your Article body with only 50 to 500 chracters" MaxLength="500" Rows="60" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorbody" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbbody" Text="*" ErrorMessage="article body is missing" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorbody" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbbody" ValidationExpression="^.{50,500}$" ErrorMessage="Article Body Name Must Contain Only 50-500 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <%--3rd Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label3" runat="server" Text="Author" ForeColor="Black"></asp:Label> <asp:Label ID="Label8" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 80%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="tbauthor" runat="server" CssClass="TextBoxClass" Width="95%" Height="25px" placeholder="Enter Your Article's Author Name with only 10 to 50 chracters"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorauthor" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbauthor" Text="*" ErrorMessage="article author name is missing" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorauthor" ValidationGroup="valgroupsubmit" runat="server"  Display="None" ControlToValidate="tbauthor" ValidationExpression="^[a-zA-Z''-'\s]{10,50}$" ErrorMessage="Author Name Must Contain Only 1-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <%--4th Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: small;">
                <asp:Label ID="Label4" runat="server" Text="Category" ForeColor="Black"></asp:Label> <asp:Label ID="Label9" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 80%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="tbcategory" runat="server" CssClass="TextBoxClass" Width="95%" Height="25px" placeholder="Enter Your Article Title with only 5 to 30 chracters"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorcategory" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="tbcategory" Text="*" ErrorMessage="article category is missing" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidatorcategory" ValidationGroup="valgroupsubmit" runat="server" ControlToValidate="tbcategory" ValidationExpression="^[a-zA-Z''-'\s]{5,30}$" ErrorMessage="Article Title Name Must Contain Only 1-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>--%>
            </div>

               <%--5th Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label5" runat="server" Text="Posted For" ForeColor="Black"></asp:Label> <asp:Label ID="Label10" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 80%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                 <asp:DropDownList ID="ddltargetconstituency" runat="server" AutoPostBack="True" Width="50%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your target constituency" DataTextField="Code" DataValueField="ConstID" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="-1" Display="None" ValidationGroup="valgroupsubmit" runat="server" ControlToValidate="ddltargetconstituency" Text="*" ErrorMessage="target consitutency is missing" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <%--<asp:CustomValidator ID="ddlist1" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="target constituency is missing" ControlToValidate="ddltargetconstituency" OnServerValidate="ddlist1_ServerValidate"></asp:CustomValidator>--%>

            </div>

            <%--6th Row--%>
            <div style="width: 100%; height: 25px; line-height: 25px; float: left; margin-top: 30px; text-align: center; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Button ID="BtnPost" runat="server" CssClass="BtnClass" ValidationGroup="valgroupsubmit" Text="Post" Width="80px" Height="25px" OnClick="BtnPost_Click" />
            </div>

            
            <%--7th Row--%>
            <div style="width: 100%; height: 50px; line-height: 20px; float: left; margin-top: 30px; text-align: center; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="valgroupsubmit" Font-Names="Calibri" Font-Size="Small" ForeColor="Red" HeaderText="These Information is missing..." />
            </div>
        </div>
 
       


    </div>
</asp:Content>

