<%@ Page Title="" Language="C#" MasterPageFile="Users.master" AutoEventWireup="true" CodeFile="ViewEventDetails.aspx.cs" Inherits="User_ViewEventDetails" %>

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

        .divlabeltext {
            text-align: right;
            font-family: 'Carrois Gothic';
            font-size: 13px;
            font-weight: lighter;
            font-style: normal;
            font-variant: small-caps;
            text-transform: uppercase;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 99.8%; height: 800px; border: 1px ridge black; text-align: center; vertical-align: middle;">
        <%-- Div Heading--%>
        <div style="width: 100%; height: 30px; line-height: 30px; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none; background-color: #000000;">
            <asp:Label ID="Lblevent" runat="server" Text="Event Details"></asp:Label>
        </div>

        <div style="width: 98%; height: 550px; margin: 0 auto; margin-top: 40px;">

            <%--1st Row--%>
            <div style="width: 98%; height: 264px; margin: 0 auto;">
                <asp:Image ID="imgevent" runat="server" ImageUrl="~/Images/Flag_of_Muslim_League.jpg" Height="264px" Width="90%" />
            </div>
            <%--2nd Row--%>
            <div style="width: 98%; height: 10px; margin: 0 auto; margin-top: 2px;"></div>
            <%--3a row--%>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-top: 10px;">
                <asp:Label ID="Label7" runat="server" Text="Event Name"></asp:Label>
            </div>
            <div style="width: 80%; height: 20px; float: left; margin-left: 6.5%; margin-top: 10px; text-align: left;">
                <asp:TextBox ID="tbxeventname" runat="server" Width="90%" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEname" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxeventname" Text="*" ErrorMessage="event name is missing" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEname" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxeventname" ValidationExpression="^[a-zA-Z''-'\s]{10,50}$" ErrorMessage="Event Title Name Must Contain Only 1-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <%--3a row--%>
            <div class="divlabeltext" style="width: 12%; height: 80px; float: left; margin-top: 10px;">
                <asp:Label ID="Label6" runat="server" Text="Event Details"></asp:Label>
            </div>
            <div style="width: 80%; height: 80px; float: left; margin-left: 6.5%; margin-top: 10px; text-align: left;">
                <asp:TextBox ID="tbxeventdetails" runat="server" Width="90%" Height="80px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDetails" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxeventdetails" ErrorMessage="event details is missing" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorDetails" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxeventdetails" ValidationExpression="^.{20,500}$" ErrorMessage="event details is between 20 to 500 characters only" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <%--3a row--%>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-top: 10px;">
                <asp:Label ID="lblstartdate" runat="server" Text="Start Date"></asp:Label>
            </div>


            <div style="width: 30%; height: 20px; float: left; margin-left: 2%; margin-top: 10px;">
                <asp:TextBox ID="tbxstartdate" runat="server" Width="70%" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorstartdate" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxstartdate" Text="*" ErrorMessage="start date is missing" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
            </div>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-left: 5%; margin-top: 10px;">
                <asp:Label ID="lblenddate" runat="server" Text="End Date"></asp:Label>
            </div>
            <div style="width: 30%; height: 20px; float: left; margin-left: 2%; margin-top: 10px;">
                <asp:TextBox ID="tbxenddate" runat="server" Width="70%" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxenddate" Text="*" ErrorMessage="end date is missing" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
            </div>

            <%--3brow--%>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-top: 10px;">
                <asp:Label ID="lblstarttime1" runat="server" Text="Start Time"></asp:Label>
            </div>
            <div style="width: 30%; height: 20px; float: left; margin-left: 2%; margin-top: 10px;">
                <asp:TextBox ID="tbxstarttime" runat="server" Width="70%" Height="20px"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidatorstarttime" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxstarttime" Text="*" ErrorMessage="Please Input Event Start Time" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorstarttime" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxstarttime" ValidationExpression="^(0[1-9]|1[0-2]):[0-5][0-9] (am|pm|AM|PM)$" ErrorMessage="Invalid Time" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-left: 5%; margin-top: 10px;">
                <asp:Label ID="lblendtime1" runat="server" Text="End Time"></asp:Label>
            </div>
            <div style="width: 30%; height: 20px; float: left; margin-left: 2%; margin-top: 10px;">
                <asp:TextBox ID="tbxendtime" runat="server" Width="70%" Height="20px"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxendtime" Text="*" ErrorMessage="Please Input Event Start Time" ForeColor="Red" Font-Names="Calibri"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxendtime" ValidationExpression="^(0[1-9]|1[0-2]):[0-5][0-9] (am|pm|AM|PM)$" ErrorMessage="Invalid Time" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <%--3crow--%>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-top: 10px;">
                <asp:Label ID="lblvenue1" runat="server" Text="Venue"></asp:Label>
            </div>
            <div style="width: 80%; height: 20px; float: left; margin-left: 6.5%; margin-top: 10px; text-align: left;">
                <asp:TextBox ID="tbxvenue" runat="server" Width="90%" Height="20px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidatorvenue" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxvenue" ErrorMessage="Please Enter Party Address" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorvenue" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxvenue" ValidationExpression="^.{20,300}$" ErrorMessage="Party Address Must Contain Only 1-150 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <%--3drow--%>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-top: 10px;">
                <asp:Label ID="Label1" runat="server" Text="City"></asp:Label>
            </div>
            <div style="width: 30%; height: 20px; float: left; margin-left: 5%; margin-top: 10px;">
                <asp:TextBox ID="tbxcity" runat="server" Width="90%" Height="20px"></asp:TextBox>
            </div>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-left: 5%; margin-top: 10px;">
                <asp:Label ID="Label3" runat="server" Text="Contact"></asp:Label>
            </div>
            <div style="width: 30%; height: 20px; float: left; margin-left: 5%; margin-top: 10px;">
                <asp:TextBox ID="tbxcontact" runat="server" Width="90%" Height="20px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorcontact" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxcontact" ErrorMessage="Please Contact Details" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorcontact" ValidationGroup="valgroupupdate" Display="None" runat="server" ControlToValidate="tbxcontact" ValidationExpression="^.{11,50}$" ErrorMessage="Contact Must Contain Only 1-50 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>

            </div>

            <%--4th Row--%>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-top: 10px;">
                <asp:Label ID="Label2" runat="server" Text="Published On"></asp:Label>
            </div>
            <div style="width: 30%; height: 20px; float: left; margin-left: 5%; margin-top: 10px;">
                <asp:Label ID="lblpublishedon" runat="server"></asp:Label>
            </div>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-left: 5%; margin-top: 10px;">
                <asp:Label ID="Label4" runat="server" Text="Updated On"></asp:Label>
            </div>
            <div style="width: 30%; height: 20px; float: left; margin-left: 5%; margin-top: 10px;">
                <asp:Label ID="lblupdatedon" runat="server" Text="Updated On"></asp:Label>
            </div>
            <%--5th Row--%>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-top: 10px;">
                <asp:Label ID="Label5" runat="server" Text="Likes"></asp:Label>
            </div>
            <div style="width: 30%; height: 20px; float: left; margin-left: 5%; margin-top: 10px;">
                <asp:Label ID="lbllikes" runat="server" Text="Likes"></asp:Label>
            </div>
            <div class="divlabeltext" style="width: 12%; height: 20px; float: left; margin-left: 5%; margin-top: 10px;">
            </div>
            <div style="width: 30%; height: 20px; float: left; margin-left: 5%; margin-top: 10px;"></div>
            <div style="width: 12%; height: 25px; line-height: 25px; float: left; margin-top: 20px; text-align: right; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Label ID="Label12" runat="server" Text="Banner" ForeColor="Black"></asp:Label><asp:Label ID="Label23" runat="server" Text="*" ForeColor="#FF3300"></asp:Label>
            </div>
            <div style="width: 80%; height: 25px; line-height: 25px; float: left; margin-left: 5%; margin-top: 20px; text-align: left;">
                <asp:FileUpload ID="fu1" runat="server" />
                <asp:CustomValidator ID="cvfu1" runat="server" Display="None" ValidationGroup="valgroupupdate" ErrorMessage="Only .jpeg | .jpg | .gif | .png | .bitmap files allowed!" ControlToValidate="fu1" OnServerValidate="cvfu1_ServerValidate"></asp:CustomValidator>
                <asp:RequiredFieldValidator ID="rvfu1" runat="server" Display="None" ValidationGroup="valgroupupdate" ErrorMessage="event banner is required!" ControlToValidate="fu1"></asp:RequiredFieldValidator>
            </div>
            <%--7th Row--%>
            <div style="width: 100%; height: 25px; line-height: 25px; float: left; margin-top: 30px; text-align: center; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
                <asp:Button ID="btnUpdate" runat="server" CssClass="BtnClass" ValidationGroup="valgroupupdate" Text="Save" Width="80px" Height="25px" OnClick="btnUpdate_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btndelete" runat="server" CssClass="BtnClass" Text="Delete" Width="80px" Height="25px" OnClick="btndelete_Click" CausesValidation="False" />
            </div>


  <%--7th Row--%>
            <div style="width: 880%; Height: 50px; line-height: 15px; padding-left:20px; float: left; margin-top: 30px; text-align: center; font-variant: small-caps; font-style: normal; font-weight: lighter; text-transform: uppercase; color: #000000; font-family: 'Carrois Gothic'; font-size: medium;">
          
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="valgroupupdate" runat="server" Font-Names="Calibri" ForeColor="Red" Font-Size="Small" HeaderText="These information is missing..." /> 
            </div>







        </div>











    </div>
</asp:Content>

