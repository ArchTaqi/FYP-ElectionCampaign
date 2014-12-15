<%@ Page Title="" Language="C#" MasterPageFile="~/User/Users.master" AutoEventWireup="true" CodeFile="Purchasepackages.aspx.cs" Inherits="User_Purchasepackages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 99.8%; height: 800px; border: 1px ridge black; text-align: center; vertical-align: middle;">
        <%--Heading--%>
        <div style="width: 100%; height: 30px; text-align: center; background-color: #000000; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; text-decoration: none;">
            <asp:Label ID="Label30" runat="server" Text="Purchase Package" ForeColor="White" Font-Size="X-Large" Font-Names="Calibri"></asp:Label>
        </div>


        <div style="width: 100%; height: auto; float: left;">
            <%--Panel Constituency--%>
            <div style="width: 99%; height: 120px; margin: 0 auto; margin-top: 5px;">
                <div style="width: 100%; height: auto; margin-top: 20px; float: left; text-align: center; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000; text-decoration: none;">
                    <asp:Label ID="Label1" runat="server" Text="Package and Constituency Details"></asp:Label>
                </div>
                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label14" runat="server" Text="District" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label><asp:Label ID="Label19" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:DropDownList ID="DDDistrict" runat="server"  AutoPostBack="True" Width="80%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your District in Which You Represent you Party" DataTextField="Name" DataValueField="DisID" OnSelectedIndexChanged="DDDistrict_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div style="width: 15%; height: 30px; float: left; margin-left: 5%; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label15" runat="server" Text="Constituency" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label>
                    <asp:Label ID="Label17" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:DropDownList ID="DDConstituency" runat="server" AutoPostBack="true" Width="80%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your Constituency" DataTextField="Code" DataValueField="ConstID"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="valgroupsubmit" runat="server" ControlToValidate="DDConstituency" Display="None" Text="*" ErrorMessage="select constituency"></asp:RequiredFieldValidator>
                </div>
                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label4" runat="server" Text="Package" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label><asp:Label ID="Label18" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:DropDownList ID="ddpackages" runat="server" AutoPostBack="true" Width="80%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your Package" DataTextField="Category" DataValueField="PackageID"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="valgroupsubmit" runat="server" ControlToValidate="ddpackages" Display="None" Text="*" ErrorMessage="select package"></asp:RequiredFieldValidator>
                </div>
                <div style="width: 15%; height: 30px; float: left; margin-left: 5%; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: middle; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;"></div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;"></div>

                <%--Payment Details--%>
                <div style="width: 100%; height: auto; margin-top: 20px; float: left; text-align: center; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000; text-decoration: none;">
                    <asp:Label ID="Label2" runat="server" Text="Payment Details"></asp:Label>
                </div>
                <div style="width: 100%; height: auto; float: left;">

                    <%--1st Row--%>
                    <div style="width: 15%; height: 30px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                        <asp:Label ID="Label3" runat="server" Text="Card Number" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label>
                        <asp:Label ID="Label5" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                    </div>
                    <div style="width: 70%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                        <asp:TextBox ID="tbxcardnumber" runat="server" placeholder="E.g 4567891234567898"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxcardnumber" Text="*" ErrorMessage="enter card number"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxcardnumber" ValidationExpression="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$" ErrorMessage="invalid credit card number format"></asp:RegularExpressionValidator>
                    </div>
                    <%--2nd Row--%>
                    <div style="width: 15%; height: 30px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                        <asp:Label ID="Label6" runat="server" Text="Card Type" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label>
                        <asp:Label ID="Label7" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                    </div>
                    <div style="width: 70%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                        <asp:DropDownList ID="ddcardtype" runat="server" AutoPostBack="True" BackColor="White" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black" Height="20px" ToolTip="Payment Mode" Width="29%">
                            <asp:ListItem Value="1">Visa</asp:ListItem>
                            <asp:ListItem Value="2">Master</asp:ListItem>
                            <asp:ListItem Value="3">Discover</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="ddcardtype" ErrorMessage="select payment method"></asp:RequiredFieldValidator>
                    </div>
                    <%--3rd Row--%>
                    <div style="width: 15%; height: 30px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                        <asp:Label ID="Label8" runat="server" Text="Expiration Date" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label>
                        <asp:Label ID="Label9" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                    </div>
                    <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
                        <asp:TextBox ID="tbxexpirationdate" runat="server"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbxexpirationdate" PopupPosition="Right" Format="dd-MM-yyyy"></ajaxToolkit:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="valgroupsubmit" runat="server" Display="None" ErrorMessage="Please Enter Father Name" Text="*" ControlToValidate="tbxexpirationdate" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxexpirationdate" ValidationExpression="^(0[1-9]|1[0-9]|2[0-9]|3[1-2])[-](0[1-9]|1[0-2])[-](1[9][0-9][0-9]|2[0][0-9][0-9])$" ErrorMessage=" invalid date format" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div style="width: 15%; height: 30px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                        <asp:Label ID="Label10" runat="server" Text="CCV" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label>
                        <asp:Label ID="Label11" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                    </div>
                    <div style="width: 30%; height: 30px; float: left; margin-left: 7%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                        <asp:TextBox ID="tbxccv" runat="server" placeholder="E.g 445"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxccv" Text="*" ErrorMessage="enter ccv number"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxccv" ValidationExpression="([0-9]{3,4})$" ErrorMessage="invalid ccv number format"></asp:RegularExpressionValidator>


                    </div>
                    <%--4rd Row--%>
                    <div style="width: 15%; height: 30px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: small; font-weight: bold; font-style: normal; font-variant: small-caps;">
                        <asp:Label ID="Label12" runat="server" Text="Card Holder Name" Font-Names="Calibri" Font-Size="small" ForeColor="Black"></asp:Label>
                        <asp:Label ID="Label13" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                    </div>
                    <div style="width: 60%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                        <asp:TextBox ID="tbxcardholdername" runat="server" placeholder="E.g Muhammad Taqi"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxcardholdername" Text="*" ErrorMessage="enter cardholder name"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationGroup="valgroupsubmit"  runat="server" Display="None" ControlToValidate="tbxcardholdername" ValidationExpression="^[a-zA-Z''-'\s]{1,50}$" ErrorMessage="only charachters and spaces allowd in cardholder name"></asp:RegularExpressionValidator>



                    </div>
                    <%--5th Row--%>
                    <div style="width: 100%; height: auto; margin-top: 20px; float: left; text-align: center; font-family: Calibri; font-size: x-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: #000000; text-decoration: none;">
                        <asp:Label ID="Label16" runat="server" Text="Billing Information"></asp:Label>
                    </div>
                    <%--7th Row--%>
                    <div style="width: 15%; height: 50px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                        <asp:Label ID="Label20" runat="server" Text="Address" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label>
                        <asp:Label ID="Label21" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                    </div>
                    <div style="width: 75%; height: 50px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                        <asp:TextBox ID="tbxaddress" runat="server" Width="100%" TextMode="MultiLine"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxaddress" Text="*" ErrorMessage="enter address"></asp:RequiredFieldValidator>


                    </div>
                    <%--8th Row--%>
                    <div style="width: 15%; height: 30px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                        <asp:Label ID="Label22" runat="server" Text="Province" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label>
                        <asp:Label ID="Label23" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                    </div>
                    <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                        <asp:DropDownList ID="DDProvince" runat="server" AutoPostBack="True" Width="80%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your Office Province" OnSelectedIndexChanged="DDProvince_SelectedIndexChanged" DataTextField="ProvinceName" DataValueField="ProvinceId"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rvProvince" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="DDProvince" InitialValue="None" ErrorMessage="Please Select a Province" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                    <div style="width: 15%; height: 30px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                        <asp:Label ID="Label24" runat="server" Text="City" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label>
                        <asp:Label ID="Label25" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                    </div>
                    <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                        <asp:DropDownList ID="DDCity" runat="server" AutoPostBack="true" Width="80%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your Office City" DataTextField="Cityname" DataValueField="CityId"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rvCity" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="DDCity" InitialValue="None" ErrorMessage="Please Select a City" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <%--9th Row--%>
                    <div style="width: 15%; height: 30px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                        <asp:Label ID="Label26" runat="server" Text="Zip Code" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label>
                        <asp:Label ID="Label27" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                    </div>
                    <div style="width: 70%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                        <asp:TextBox ID="tbxzipcode" runat="server" placeholder="E.g 46000"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvzipcode" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxzipcode" ErrorMessage="enter zipcode" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revzipcode" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxzipcode" ValidationExpression="^([0-9]{4,6})$" ErrorMessage="zipcode must be only 6 digits" Text="*" Font-Names="Calibri" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>

                    </div>
                    <%--10th Row--%>
                    <div style="width: 15%; height: 30px; float: left; margin-top: 10px; line-height: 30px; text-align: right; vertical-align: central; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                        <asp:Label ID="Label28" runat="server" Text="Phone Number" Font-Names="Calibri" Font-Size="medium" ForeColor="Black"></asp:Label>
                        <asp:Label ID="Label29" runat="server" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="#FF3300"></asp:Label>
                    </div>
                    <div style="width: 70%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                        <asp:TextBox ID="tbxphonenumber" runat="server" placeholder="E.g 03455097679"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxphonenumber" ErrorMessage="enter phone number" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationGroup="valgroupsubmit"  runat="server" Display="None" ControlToValidate="tbxphonenumber" ValidationExpression="^([0-9]{1,15})$" ErrorMessage="phone number must be only 13 digits" Text="*" Font-Names="Calibri" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>


                    </div>
                    <%--11th Row--%>
                    <div style="width: 100%; height: 30px; float: left; text-align: center; margin-left: 2.5%; margin-top: 10px; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                        <asp:Button ID="btnpay" runat="server" Text="Pay" ValidationGroup="valgroupsubmit" BackColor="#EEEEEE" BorderColor="Black" BorderStyle="Solid" BorderWidth="2" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black" Width="100px" Height="30px" OnClick="btnpay_Click" />
                    </div>



                </div>




            </div>

        </div>


        <div style="width: 70%; float: left; line-height:15px; padding-left:30px; margin-top: 10px; text-align: left;">
            <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="valgroupsubmit" runat="server" Font-Names="Calibri" Font-Size="Small" ForeColor="Red" HeaderText="These information is missing" />
        </div>





    </div>
</asp:Content>

