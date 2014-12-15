<%@ Page Title="" Language="C#" MasterPageFile="../User/Users.master" AutoEventWireup="true" CodeFile="PostVideos.aspx.cs" Inherits="PostVideos" %>

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
    <div style="width: 99.8%; height: 700px; border: 1px ridge black; text-align: center; vertical-align: middle;">
        <%-- Div Heading--%>
   <div style="width:100%; height:30px; float:left; line-height:30px; background-color: #000000; color: #FFFFFF; text-decoration: none; vertical-align: middle; text-align: center; text-indent: inherit; white-space: normal; text-transform: lowercase; font-variant: small-caps; font-style: normal; font-weight: lighter; font-size: large;">
<asp:Label ID="Label4" runat="server" Text="Post Video" Font-Names="Calibri" Font-Size="XX-Large" ForeColor="White"></asp:Label>
   </div> 

        <div style="width: 95%; height: 500px; margin: 0 auto; margin-top: 50px;">

            <%--1st Row--%>
            <div style="width: 20%; height: 25px; line-height: 25px; float: left; margin-top: 5px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label1" runat="server" Text="Title" ForeColor="Black"></asp:Label> <asp:Label ID="Label11" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 75%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 5px; text-align: left;">
                <asp:TextBox ID="TBVname" runat="server" CssClass="TextBoxClass" Width="90%" Height="25px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvvideoname" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBVname" Text="*" ErrorMessage="video tittle is missing" ForeColor="Red" Font-Names="Calibri" Font-Size="Medium"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexvideoname" ValidationGroup="valgroupsubmit" Display="None" runat="server" ValidationExpression="^.{10,100}$" ControlToValidate="TBVname" Text="*" ErrorMessage="video tittle must be atleast 20 characters to atmost 100 characters" ForeColor="Red" Font-Names="Calibri" Font-Size="Medium"></asp:RegularExpressionValidator>
            </div>
            <%--2nd Row--%>

            <div style="width: 20%; height: 100px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label8" runat="server" Text="Description" ForeColor="Black"></asp:Label> <asp:Label ID="Label5" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 75%; height: 100px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="TBVDesc" runat="server" CssClass="TextBoxClass" Width="90%" Height="90px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvvideoDesc" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="TBVDesc" Text="*" ErrorMessage="video description is missing" ForeColor="Red" Font-Names="Calibri" Font-Size="Medium"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexDesc" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="TBVDesc" Text="*" ErrorMessage="video description needs to be between 20 to 100 characters" ValidationExpression="^.{1,250}$$" ForeColor="Red" Font-Names="Calibri" Font-Size="Medium"></asp:RegularExpressionValidator>
            </div>
            <%--6th Row--%>
            <div style="width: 20%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label9" runat="server" Text="Category" ForeColor="Black"></asp:Label> <asp:Label ID="Label6" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 75%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="TBCategory" runat="server" CssClass="TextBoxClass" Width="30%" Height="25px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regexCategory" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="TBCategory" Text="*" ErrorMessage="Category Must Contain Only 1-50 Characters" ValidationExpression="^[a-zA-Z''-'\s]{1,50}$" ForeColor="Red" Font-Names="Calibri" Font-Size="Medium"></asp:RegularExpressionValidator>
            </div>
            <%--8th Row--%>
            <div style="width: 20%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label3" runat="server" Text="Posted For" ForeColor="Black"></asp:Label> <asp:Label ID="Label7" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 75%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                 <asp:DropDownList ID="ddltargetconstituency" runat="server" AutoPostBack="True" Width="30%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your District in Which You Represent you Party" DataTextField="Code" DataValueField="ConstID" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="ddltargetconstituency" Text="*" ErrorMessage="Please Input Article Category" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
            </div>

            <%--7th Row--%>
            <div style="width: 20%; height: 35px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: small;">
                <asp:Label ID="Label2" runat="server" Text="Vimeo Video Url id" ForeColor="Black"></asp:Label> <asp:Label ID="Label10" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 75%; height: 35px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
             <asp:TextBox ID="tbxvideourl" runat="server" CssClass="TextBoxClass" Width="50%" Height="25px" placeholder="paste video urld id e.g 31427019"></asp:TextBox> <asp:Label ID="Label12" runat="server" Text="E.g https://vimeo.com/" ForeColor="Black"></asp:Label><asp:Label ID="Label13" runat="server" Text="31427019" ForeColor="#FF3300"></asp:Label>
                <br /><asp:Label ID="Label14" runat="server" Text="If you didn't vimeo account, click" ForeColor="Black"></asp:Label> <a href="https://vimeo.com" style="font-family: Calibri; font-size: small; font-weight: normal; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #FF0000">here</a> <asp:Label ID="Label15" runat="server" Text="to create" ForeColor="Black"></asp:Label>
                <asp:RegularExpressionValidator ID="regexvideourl" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="TBCategory" Text="*" ErrorMessage="Category Must Contain Only 1-50 Characters" ValidationExpression="^[a-zA-Z''-'\s]{1,50}$" ForeColor="Red" Font-Names="Calibri" Font-Size="Medium"></asp:RegularExpressionValidator>  
            </div>
            
            <%--9th Row--%>
            <div style="width: 100%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: center; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Button ID="Button1" runat="server" CssClass="BtnClass " ValidationGroup="valgroupsubmit" Text="Upload" Width="80px" Height="25px" OnClick="Button1_Click" />
            </div>

            <div style="width: 100%; height: 25px; text-align: left; padding-left: 5%;">
                <asp:ValidationSummary ID="vs" runat="server" ForeColor="Red" ValidationGroup="valgroupsubmit" HeaderText="Warning!" Font-Size="Small" Font-Names="Calibri" />
            </div>




        </div>







    </div>
</asp:Content>

