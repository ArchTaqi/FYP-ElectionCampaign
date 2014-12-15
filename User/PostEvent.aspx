<%@ Page Title="" Language="C#" MasterPageFile="../User/Users.master" AutoEventWireup="true" CodeFile="PostEvent.aspx.cs" Inherits="PostEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
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
<asp:Label ID="Label11" runat="server" Text="Post Event" Font-Names="Calibri" Font-Size="XX-Large" ForeColor="White"></asp:Label>
   </div> 

        <div style="width: 98%; height: 500px; margin: 0 auto; margin-top: 10px;">

            <%--1st Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label1" runat="server" Text="Name" ForeColor="Black"></asp:Label><asp:Label ID="Label13" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 80%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="TBEname" runat="server" CssClass="TextBoxClass" Width="90%" Height="25px" placeholder="Enter Your Event Title with only 20 to 150 chracters"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEname" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBEname" Text="*" ErrorMessage="Please Input Event Title" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEname" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBEname" ValidationExpression="^[a-zA-Z''-'\s]{10,50}$" ErrorMessage="Event Title Name Must Contain Only 1-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>


            <%--1st Row--%>
            <div style="width: 12%; height: 70px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label7" runat="server" Text="Details" ForeColor="Black"></asp:Label><asp:Label ID="Label14" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 80%; height: 70px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="TBDetails" runat="server" CssClass="TextBoxClass" Width="90%" Height="70px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDetails" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBDetails" ErrorMessage="Please Enter Party Address" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorDetails" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBDetails" ValidationExpression="^.{20,500}$" ErrorMessage="Party Address Must Contain Only 1-150 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <%--2nd Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label2" runat="server" Text="Start Date" ForeColor="Black"></asp:Label><asp:Label ID="Label15" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 25%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
                <asp:TextBox ID="TBstartdate" runat="server" CssClass="TextBoxClass" Width="80%" Height="25px" placeholder="01-01-1900"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TBstartdate" PopupPosition="Right" Format="dd-MM-yyyy"></ajaxToolkit:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorstartdate" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBstartdate" Text="*" ErrorMessage="Please Input Event Title" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorstartdate" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBstartdate" ValidationExpression="^(0[1-9]|1[0-9]|2[0-9]|3[1-2])[-](0[1-9]|1[0-2])[-](1[9][0-9][0-9]|2[0][0-9][0-9])$" ErrorMessage="Event Title Name Must Contain Only 1-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-left: 10%; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label3" runat="server" Text="End Date" ForeColor="Black"></asp:Label><asp:Label ID="Label16" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 25%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
               
                <asp:TextBox ID="TBenddate" runat="server" CssClass="TextBoxClass" Width="80%" Height="25px" placeholder="01-01-1900"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TBenddate" PopupPosition="Right" Format="dd-MM-yyyy"></ajaxToolkit:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorenddate" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBenddate" Text="*" ErrorMessage="Please Input Event End Date" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorenddate" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBenddate" ValidationExpression="^(0[1-9]|1[0-9]|2[0-9]|3[1-2])[-](0[1-9]|1[0-2])[-](1[9][0-9][0-9]|2[0][0-9][0-9])$" ErrorMessage="Event Date should be in the format 31-12-2014" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <%--3rd Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label4" runat="server" Text="Start Time" ForeColor="Black"></asp:Label><asp:Label ID="Label17" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 25%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="TBstarttime" runat="server" CssClass="TextBoxClass" Width="80%" Height="25px" placeholder="01:50 PM"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorstarttime" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBstarttime" Text="*" ErrorMessage="Please Input Event Start Time" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorstarttime" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBstarttime" ValidationExpression="^(0[1-9]|1[0-2]):[0-5][0-9] (am|pm|AM|PM)$" ErrorMessage="Invalid Time" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-left: 10%; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label5" runat="server" Text="End Time" ForeColor="Black"></asp:Label><asp:Label ID="Label18" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 25%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="TBendtime" runat="server" CssClass="TextBoxClass" Width="80%" Height="25px" placeholder="01:50 PM"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorendtime" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBendtime" Text="*" ErrorMessage="Please Input Event End Time" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorendtime" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBendtime" ValidationExpression="^(0[1-9]|1[0-2]):[0-5][0-9] (am|pm|AM|PM)$" ErrorMessage="Invalid Time" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <%--4th Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label6" runat="server" Text="City" ForeColor="Black"></asp:Label><asp:Label ID="Label19" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 25%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">

                <asp:DropDownList ID="DDProvince" runat="server" AutoPostBack="True" Width="80%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your Office Province" OnSelectedIndexChanged="DDProvince_SelectedIndexChanged" DataTextField="ProvinceName" DataValueField="ProvinceId"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorProvince" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="DDProvince" InitialValue="None" ErrorMessage="Please Select a Province" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-left: 10%; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
            </div>
            <div style="width: 25%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:DropDownList ID="DDCity" runat="server" AutoPostBack="true" Width="80%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your Office City" DataTextField="Cityname" DataValueField="CityId"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="DDCity" InitialValue="None" ErrorMessage="Please Select a City" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <%--5th Row--%>
            <div style="width: 12%; height: 45px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label8" runat="server" Text="Venue" ForeColor="Black"></asp:Label><asp:Label ID="Label20" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 80%; height: 45px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:TextBox ID="TBvenue" runat="server" CssClass="TextBoxClass" Width="90%" Height="45px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorvenue" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBvenue" ErrorMessage="Please Enter Party Address" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorvenue" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBvenue" ValidationExpression="^.{20,300}$" ErrorMessage="Party Address Must Contain Only 1-150 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>


            <%--6th Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label9" runat="server" Text="Contact" ForeColor="Black"></asp:Label><asp:Label ID="Label21" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 25%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;"> 
                <asp:TextBox ID="TBcontact" runat="server" CssClass="TextBoxClass" Width="100%" Height="25px" placeholder="E.g 03455097679"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorcontact" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBcontact" ErrorMessage="Please Contact Details" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorcontact" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="TBcontact" ValidationExpression="^.{11,50}$" ErrorMessage="Contact Must Contain Only 1-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>

            </div>
            <div style="width: 14%; height: 25px; line-height: 25px; float: left; margin-left:8%; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;"> 
                <asp:Label ID="Label10" runat="server" Text="Posted For" ForeColor="Black"></asp:Label><asp:Label ID="Label22" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div> 
            <div style="width: 25%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
             <asp:DropDownList ID="ddltargetconstituency" runat="server" AutoPostBack="True" Width="80%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your District in Which You Represent you Party" DataTextField="Code" DataValueField="ConstID" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="valgroupsubmit" Display="None" runat="server" ControlToValidate="ddltargetconstituency" Text="*" ErrorMessage="Please Input Article Category" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>  

            </div>
            <%--6th Row--%>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label12" runat="server" Text="Banner" ForeColor="Black"></asp:Label><asp:Label ID="Label23" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 25%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
              <asp:FileUpload ID="fu1" runat="server" />
                <asp:CustomValidator ID="cvfu1" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="Only .jpeg | .jpg | .gif | .png | .bitmap files allowed!" ControlToValidate="fu1" OnServerValidate="cvfu1_ServerValidate"></asp:CustomValidator>
                <asp:RequiredFieldValidator ID="rvfu1" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="event banner is required!" ControlToValidate="fu1"></asp:RequiredFieldValidator>
            </div>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-left: 10%; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
               
            </div>
            <div style="width: 25%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
            </div>
            <%--7th Row--%>
            <div style="width: 100%; height: 25px; line-height: 25px; float: left; margin-top: 30px; text-align: center; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Button ID="Button1" runat="server" CssClass="BtnClass " ValidationGroup="valgroupsubmit" Text="Create" Width="80px" Height="25px" OnClick="Button1_Click" />
            </div>

              <%--7th Row--%>
            <div style="width: 80%; height: 25px; line-height: 15px; float: left; margin-top: 30px; text-align: left; padding-left:20px; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
               <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="valgroupsubmit" Font-Names="Calibri" Font-Size="Small" ForeColor="Red" HeaderText="These Information are missing" />
            </div>
        </div>
         
    </div>
</asp:Content>

