<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Requestaccount.aspx.cs" Inherits="Registration_Requestaccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DEC | Request Account</title>
    <style type="text/css">
        .html, body {
            padding: 0 0 0 0;
            width: 100%;
            background: url("/images/sand.jpg") repeat-x;
        }

        a {
            text-decoration: none;
        }

            a:hover {
                text-decoration: underline;
            }

        .Wraper {
            width: 65%;
            height: 100%;
            background: #f3f3f3 url(/images/bg_top2.jpg) repeat-x;
            margin: 0 auto;
        }

        .Header {
            height: 90px;
            padding: 10px 20px 0 20px;
            text-shadow: #000 0px 1px 1px;
        }

        .Content {
            width: 100%;
            height: 700px;
            margin: 0 auto;
            background-color: #f3f3f3;
        }

        .Footer {
            background-color: black;
            border-top: 2px solid #404345;
            color: #939393;
            float: left;
            margin: 0 auto;
            margin-top: 20px;
            padding: 8px 20px;
            text-shadow: #111111 0px 1px 1px;
            width: 96%;
            text-align: right;
            line-height: normal;
        }

            .Footer a {
                color: #939393;
                font-weight: bold;
            }

        .TextBoxClass {
            background-color: white;
            border: rgb(153, 153, 153) solid thin;
            font-family: Calibri;
            font-size: 14px;
            font-weight: lighter;
            color: black;
            height: 20px;
        }

            .TextBoxClass:focus {
                background-color: white;
                border: rgb(0,0,0) solid thin;
                font-family: Calibri;
                font-size: 14px;
                font-weight: lighter;
                color: black;
                height: 20px;
            }
 
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
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Wraper">
            <div class="Header">
    <div style="width:50%; height:40%; float:left; text-align:left; line-height:100%;   ">
        <asp:Label ID="Label26" runat="server" Text="DEC" Font-Size="XX-Large" ForeColor="White" Font-Names="Calibri"></asp:Label>&nbsp; <asp:Label ID="Label27" runat="server" Text="Digitilized Electroid campaign" Font-Size="x-small" ForeColor="White" Font-Names="Calibri"></asp:Label>   </div>

                <div style="width: 50%; height: 40%; float: left; text-align: right;">
                    <asp:LinkButton ID="lnkbtnlogin" OnClick="lnkbtnlogin_Click" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="White">Login</asp:LinkButton>&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text=" | " Font-Names="Calibri" Font-Size="Small" ForeColor="White"></asp:Label>&nbsp;
    <asp:LinkButton ID="lnkbtnsignup" OnClick="lnkbtnsignup_Click" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="White">Signup</asp:LinkButton>
                </div>
                <div style="width: 100%; height: 50%; float: left; text-align: left;">
                    <asp:LinkButton ID="lnkbtnhome" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="White" OnClick="lnkbtnhome_Click">Home</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="lnkbtnaboutus" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="White" OnClick="lnkbtnaboutus_Click">About Us</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lnkbtnteam" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="White" OnClick="lnkbtnteam_Click">Our Team</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="lnkbtncontactus" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="White" OnClick="lnkbtncontactus_Click">Contact Us</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lnkbtncompanynews" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="White" OnClick="lnkbtncompanynews_Click">Company News</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>


            </div>

            <div class="Content">
                <%-- Div Heading--%>
                <div style="width: 100%; height: 30px; margin: 0 auto; text-align: center; line-height: 30px; font-family: Calibri; font-size: xx-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: black;">
                    <asp:Label ID="Label11" runat="server" Text="REQUEST FOR ACCOUNT" Font-Underline="True"></asp:Label>
                </div>

                <%--1st Row--%>
                <div style="width: 30%; height: 20px; float: left; line-height: 20px; text-align: right; margin-top: 20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
                    <asp:Label ID="Label9" runat="server" Text="First Name:" Height="30"></asp:Label>
                    <asp:Label ID="Label18" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="rvfirstname"  runat="server" Display="None" ErrorMessage="Please Enter First Name" Text="*" ValidationGroup="valgroupsubmit" ControlToValidate="tbxfirstname" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="width: 60%; height: 20px; float: left; line-height: 20px; text-align: left; margin-top: 20px; margin-left: 5%;">
                    <asp:TextBox ID="tbxfirstname" runat="server" CssClass="TextBoxClass" Width="60%" TextMode="SingleLine" ToolTip="Enter Your First name" AutoCompleteType="Disabled" placeholder="20 char E.g muhammad taqi"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revemail" runat="server" Display="None" ControlToValidate="tbxfirstname" ValidationGroup="valgroupsubmit" ValidationExpression="^[a-zA-Z''-'\s]{1,20}$" ErrorMessage="enter first name of 20 char" Text="*" Font-Names="Calibri" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <%--2nd Row--%>
                <div style="width: 30%; height: 20px; float: left; line-height: 20px; text-align: right; margin-top: 20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
                    <asp:Label ID="Label2" runat="server" Text="Last Name:" Height="30"></asp:Label>
                    <asp:Label ID="Label19" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="rvlastname" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="Please Enter Last Name" Text="*" ControlToValidate="tbxlastname" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="width: 60%; height: 20px; float: left; line-height: 20px; text-align: left; margin-top: 20px; margin-left: 5%;">
                    <asp:TextBox ID="tbxlastname" runat="server" CssClass="TextBoxClass" Width="60%" TextMode="SingleLine" ToolTip="Enter Your Last name" AutoCompleteType="Disabled" placeholder="20 char E.g hassan bukhari"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regexlastname" runat="server" Display="None" ValidationGroup="valgroupsubmit" ControlToValidate="tbxlastname" ValidationExpression="^[a-zA-Z''-'\s]{1,20}$" ErrorMessage="enter last name of 20 char" Text="*" Font-Names="Calibri" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <%--3rd Row--%>
                <div style="width: 30%; height: 20px; float: left; line-height: 20px; text-align: right; margin-top: 20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
                    <asp:Label ID="Label5" runat="server" Text="NIC:" Height="30"></asp:Label>
                    <asp:Label ID="Label20" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="rvnic" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="Please Enter Nic" Text="*" ControlToValidate="tbxnic" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="width: 60%; height: 20px; float: left; line-height: 20px; text-align: left; margin-top: 20px; margin-left: 5%;">
                    <asp:TextBox ID="tbxnic" runat="server" CssClass="TextBoxClass" Width="60%" TextMode="SingleLine" ToolTip="Enter Your Last name" AutoCompleteType="Disabled" placeholder="E.g 1234567891234"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regexnic" runat="server" Display="None" ValidationGroup="valgroupsubmit" ControlToValidate="tbxnic" ValidationExpression="[0-9]{13}" ErrorMessage="Nic must contain Only 13 digits" Text="*" Font-Names="Calibri" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <%--5th Row--%>
                <div style="width: 30%; height: 20px; float: left; line-height: 20px; text-align: right; margin-top: 20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
                    <asp:Label ID="Label7" runat="server" Text="Email Address:" Height="30"></asp:Label>
                    <asp:Label ID="Label21" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="rvemail" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="Please Enter Email" Text="*" ControlToValidate="tbxemail" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="width: 60%; height: 20px; float: left; line-height: 20px; text-align: left; margin-top: 20px; margin-left: 5%;">
                    <asp:TextBox ID="tbxemail" runat="server" CssClass="TextBoxClass" Width="60%" TextMode="SingleLine" ToolTip="Enter Your Email Address" AutoCompleteType="Disabled" placeholder="E.g. username@domain.com"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regexemail" runat="server" Display="None" ValidationGroup="valgroupsubmit" ControlToValidate="tbxemail" ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" ErrorMessage="invalid email format" Text="*" Font-Names="Calibri" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <%--4th Row--%>
                <div style="width: 30%; height: 60px; float: left; line-height: 20px; text-align: right; margin-top: 20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
                    <asp:Label ID="Label6" runat="server" Text="Constituency:" Height="30"></asp:Label>
                    <asp:Label ID="Label22" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 60%; height: 60px; float: left; line-height: 20px; text-align: left; margin-top: 20px; margin-left: 5%;">
                    <asp:DropDownList ID="DDDistrict" runat="server" AutoPostBack="True" Width="50%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your District in Which You Represent you Party" DataTextField="Name" DataValueField="DisID" OnSelectedIndexChanged="DDDistrict_SelectedIndexChanged"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:RequiredFieldValidator ID="rvdistrict" ValidationGroup="valgroupsubmit" runat="server" Display="None" ErrorMessage="Please Select Constituency" Text="*" ControlToValidate="DDDistrict" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:DropDownList ID="DDConstituency" runat="server" AutoPostBack="true" Width="50%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your Constituency" DataTextField="Code" DataValueField="ConstID"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rvconstituency" runat="server" ValidationGroup="valgroupsubmit" Display="None" ErrorMessage="Please Select Constituency" Text="*" ControlToValidate="DDConstituency" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <%--5th Row--%>
                <div style="width: 30%; height: 20px; float: left; line-height: 20px; text-align: right; margin-top: 20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
                    <asp:Label ID="Label8" runat="server" Text="Party:" Height="30"></asp:Label>
                    <asp:Label ID="Label23" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 60%; height: 20px; float: left; line-height: 20px; text-align: left; margin-top: 20px; margin-left: 5%;">
                    <asp:DropDownList ID="DDParty" runat="server" AutoPostBack="true" Width="50%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your Party Name" DataTextField="PartyName" DataValueField="PartyId"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rvparty" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="Please Select party" Text="*" ControlToValidate="DDParty" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <%--5th Row--%>
                <div style="width: 30%; height: 20px; float: left; line-height: 20px; text-align: right; margin-top: 20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
                    <asp:Label ID="Label24" runat="server" Text="Joins on:" Height="30"></asp:Label>
                    <asp:Label ID="Label25" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 60%; height: 20px; float: left; line-height: 20px; text-align: left; margin-top: 20px; margin-left: 5%;">
                    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
                    <asp:TextBox ID="tbxpartyjoinson" runat="server" CssClass="TextBoxClass" Width="50%" TextMode="SingleLine" ToolTip="Enter Your Email Address" AutoCompleteType="Disabled" placeholder="E.g. 01-03-2010"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbxpartyjoinson" PopupPosition="Right" Format="dd-MM-yyyy"></ajaxToolkit:CalendarExtender>
                    <asp:RequiredFieldValidator ID="rvjoiningdate" runat="server" Display="None" ValidationGroup="valgroupsubmit" ControlToValidate="tbxpartyjoinson" ErrorMessage="Please Enter Your Date of Joining the Party" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revjoiningdate" runat="server" Display="None" ValidationGroup="valgroupsubmit" ControlToValidate="tbxpartyjoinson" ValidationExpression="^(0[1-9]|1[0-9]|2[0-9]|3[1-2])[-](0[1-9]|1[0-2])[-](1[9][0-9][0-9]|2[0][0-9][0-9])$" ErrorMessage="Date should be in the format 31/12/2014" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <%--6th Row--%>
                <div style="width: 30%; height: 40px; float: left; line-height: 20px; text-align: right; margin-top: 20px; font-family: 'Carrois Gothic'; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: lowercase; color: #000000;">
                </div>
                <div style="width: 60%; height: 40px; float: left; line-height: 20px; text-align: left; margin-top: 20px; margin-left: 5%;">
                    <asp:Button ID="BtnClear" runat="server" Text="Clear" CssClass="BtnClass" Height="40px" Width="100px" OnClick="BtnClear_Click"   CausesValidation="False" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="Submit"  CssClass="BtnClass" Height="40px" Width="100px" OnClick="BtnSubmit_Click" ValidationGroup="valgroupsubmit"  />
                </div>
                <br />
                <br />
                <%-- Div Heading--%>
                <div style="width: 100%; height: 20px; margin: 0 auto; text-align: center; line-height: 20px; font-family: Calibri; font-size: medium; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: black;">
                    <asp:Label ID="Lblreqstatus" runat="server" Font-Underline="True" Visible="False"></asp:Label>
                </div>
                <br />
                <br />
                <br />
                <div style="width: 50%; height: 100px; margin: 0 auto; margin-top: 100px;">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="valgroupsubmit" ForeColor="Red" Font-Names="Calibri" Font-Size="Small" DisplayMode="BulletList" HeaderText="Warning..." ShowMessageBox="False" />
                </div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />

                <%--Important Security Tips--%>
                <div style="width: 90%; height: 100px; margin: 0 auto; margin-top: 60px; text-align: left; padding-left: 10px;">
                    <asp:Label ID="Label10" runat="server" Text="To Get Registeration, you must do the following" Font-Bold="True" Font-Names="Calibri" Font-Size="Larger" ForeColor="Black"></asp:Label>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label12" runat="server" Text="+" Font-Bold="False" Font-Names="Calibri" Font-Size="Small" ForeColor="Black"></asp:Label>
                    &nbsp;&nbsp;&nbsp;  
                    <asp:Label ID="Label13" runat="server" Text="Fill out the above form and then we will verify your information with ECP." Font-Bold="False" Font-Names="Calibri" Font-Size="Small" ForeColor="Black"></asp:Label>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label14" runat="server" Text="+" Font-Bold="False" Font-Names="Calibri" Font-Size="Small" ForeColor="Black"></asp:Label>
                    &nbsp;&nbsp;&nbsp; 
                    <asp:Label ID="Label15" runat="server" Text="After Verification, you will get an email about the status of your request." Font-Bold="False" Font-Names="Calibri" Font-Size="Small" ForeColor="Black"></asp:Label>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label16" runat="server" Text="+" Font-Bold="False" Font-Names="Calibri" Font-Size="Small" ForeColor="Black"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label17" runat="server" Text="Further Process details will be on your email that your recive. this whole process will tk 4 to 5 working days." Font-Bold="False" Font-Names="Calibri" Font-Size="Small" ForeColor="Black"></asp:Label>
                </div>

            </div>




            <div class="Footer">
                <div style="width: 50%; float: left; text-align: left;">
                    <asp:Label ID="Label4" runat="server" Text="DEC | Copyright © 2014 Digitilized Electroid Campaign" Font-Names="Calibri" Font-Size="Small" ForeColor="#EEEEEE"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="width: 50%; float: left;">
                    <asp:Label ID="Label3" runat="server" Text="follow us on " Font-Names="Calibri" Font-Size="Small" ForeColor="#EEEEEE"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="lnkbtnfb" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="White" OnClick="lnkbtnfb_Click">facebook</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lnkbtngplus" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="White" OnClick="lnkbtngplus_Click">google +</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lnkbtntwitter" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="White" OnClick="lnkbtntwitter_Click">twitter</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="lnkbtnytube" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="White" OnClick="lnkbtnytube_Click">youtube</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>


        </div>


    </form>
</body>
</html>
