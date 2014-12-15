<%@ Page Title="" Language="C#" MasterPageFile="~/AboutUs/Home.master" AutoEventWireup="true" CodeFile="Useraccountactivation.aspx.cs" Inherits="Registration_Useraccountactivation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 99.6%; height: 100%; text-align: center; vertical-align: middle;">
        <%-- Div Heading--%>
        <div style="width: 20%; height: 30px; margin: 0 auto; line-height: 30px; font-family: Calibri; font-size: xx-large; font-weight: lighter; font-style: normal; font-variant: small-caps; text-transform: uppercase; color: black;">
            <asp:Label ID="lblerror" runat="server" Font-Underline="True" Visible="False"></asp:Label>
        </div>


        <div style="width: 96%; height: 500px; margin: 0 auto; border: black solid thin; margin-top: 30px;">
            <%--1st Row--%>
            <div style="width: 100%; height: 30px; float: left; margin-top: 10px;">
                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label1" runat="server" Text="Father Name" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="90%"></asp:Label><asp:Label ID="Label18" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:TextBox ID="tbxfathername" Width="80%" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="valgroupsubmit" runat="server" Display="None" ErrorMessage="Please Enter Father Name" Text="*" ControlToValidate="tbxfathername" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxfathername" ValidationExpression="^[a-zA-Z''-'\s]{1,30}$" ErrorMessage=" First Name Must Contain Only 1-30 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>

                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label2" runat="server" Text="DOB" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="90%"></asp:Label><asp:Label ID="Label14" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
                    <asp:TextBox ID="tbxdob" Width="80%" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbxdob" PopupPosition="Right" Format="dd-MM-yyyy"></ajaxToolkit:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="valgroupsubmit" runat="server" Display="None" ErrorMessage="Please Enter Father Name" Text="*" ControlToValidate="tbxdob" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxdob" ValidationExpression="^(0[1-9]|1[0-9]|2[0-9]|3[1-2])[-](0[1-9]|1[0-2])[-](1[9][0-9][0-9]|2[0][0-9][0-9])$" ErrorMessage=" First Name Must Contain Only 1-30 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
            </div>
            <%--2nd Row--%>
            <div style="width: 100%; height: 30px; float: left; margin-top: 10px;">
                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label3" runat="server" Text="Work Phone" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="90%"></asp:Label><asp:Label ID="Label15" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:TextBox ID="tbxworkphone" Width="80%" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvWorkphone" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxworkphone" ErrorMessage="Please Enter Workphone" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revWorkphone" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxworkphone" ValidationExpression="[0-9]{11}" ErrorMessage="Please Enter Workphone in the Format i.e 03455097679" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                </div>
            </div>
            <%--3rd Row--%>
            <div style="width: 100%; height: 30px; float: left; margin-top: 10px;">
                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label4" runat="server" Text="Province" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="90%"></asp:Label>
                    <asp:Label ID="Label16" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:DropDownList ID="DDProvince" runat="server" AutoPostBack="True" Width="80%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your Office Province" OnSelectedIndexChanged="DDProvince_SelectedIndexChanged" DataTextField="ProvinceName" DataValueField="ProvinceId"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rvProvince" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="DDProvince" InitialValue="None" ErrorMessage="Please Select a Province" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label5" runat="server" Text="City" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="90%"></asp:Label>
                    <asp:Label ID="Label17" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:DropDownList ID="DDCity" runat="server" AutoPostBack="true" Width="80%" Height="25px" ForeColor="Black" Font-Size="Small" Font-Names="Calibri" ToolTip="Select Your Office City" DataTextField="Cityname" DataValueField="CityId"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rvCity" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="DDCity" InitialValue="None" ErrorMessage="Please Select a City" Text="*" Font-Names="Calibri" Font-Size="medium" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <%--4th Row--%>
            <div style="width: 100%; height: 50px; float: left; margin-top: 10px;">
                <div style="width: 15%; height: 50px; float: left; margin-top: 10px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label6" runat="server" Text="Office Address" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="90%"></asp:Label>
                    <asp:Label ID="Label19" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 80%; height: 50px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:TextBox runat="server" Width="89%" Height="50px" TextMode="MultiLine" ID="tbxofficeadress"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvPAdress" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxofficeadress" ErrorMessage="Please Enter Your Office Address" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPAdress" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxofficeadress" ValidationExpression="^.{1,150}$" ErrorMessage="Office Address Must Contain Only 1-150 Characters" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>

                </div>
            </div>
            <%--5th row--%>
            <div style="width: 100%; height: 30px; float: left; margin-top: 20px;">
                <div style="width: 15%; height: 30px; float: left; margin-top: 20px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label7" runat="server" Text="User Name" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="90%"></asp:Label>
                    <asp:Label ID="Label20" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 20px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:TextBox ID="tbxusername" runat="server" Width="80%" placeholder="E.g Taqi125"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvusername" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxusername" ErrorMessage="Please Enter Username" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regexusername" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxusername" ValidationExpression="^(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{5,15}$" ErrorMessage="User name must contians 5-15 Alphanumeric only" Text="*" Font-Names="Calibri" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div style="width: 15%; height: 30px; float: left; margin-top: 20px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    
                   
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
             
                </div>
            </div>

            <%--6th Row--%>
            <div style="width: 100%; height: 30px; float: left; margin-top: 10px;">
                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label8" runat="server" Text="Password" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="90%"></asp:Label>
                    <asp:Label ID="Label22" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:TextBox ID="tbxpassword" runat="server" TextMode="Password" Width="80%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxpassword" ErrorMessage="Please Enter Password" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxpassword" ValidationExpression="(?=^.{5,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{:;'?/>.<,])(?!.*\s).*$" ErrorMessage="Password must be 5-15 characters long with at least one numeric,</br>one upper case character and one special character." Text="*" Font-Names="Calibri" ForeColor="Red" Font-Size="12px"></asp:RegularExpressionValidator>
                </div>
                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label9" runat="server" Text="Re-Type Password" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="90%"></asp:Label>
                    <asp:Label ID="Label23" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:TextBox ID="tbxrepassword" runat="server" Width="80%" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" ValidationGroup="valgroupsubmit" runat="server" ControlToValidate="tbxrepassword" ErrorMessage="Please Enter Retype Password" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorConfirmPassword" ValidationGroup="valgroupsubmit" runat="server" Display="None" ControlToValidate="tbxrepassword" ValidationExpression="(?=^.{5,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{:;'?/>.<,])(?!.*\s).*$" ErrorMessage="Password must be 5-15 characters long with at least one numeric,</br>one upper case character and one special character." Text="*" Font-Names="Calibri" ForeColor="Red" Font-Size="12px"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="CompareValidatorPasssword" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxrepassword" ControlToCompare="tbxpassword" Type="String" Operator="Equal" ErrorMessage="Password did not match" Text="*" Font-Names="Calibri" Font-Size="small" ForeColor="Red"></asp:CompareValidator>
                </div>
            </div>
            <%--7th Row--%>
            <div style="width: 100%; height: 30px; float: left; margin-top: 10px;">
                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label10" runat="server" Text="Pincode" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="90%"></asp:Label>
                    <asp:Label ID="Label24" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:TextBox ID="tbxpincode" runat="server" Width="80%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvPincode" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxpincode" ErrorMessage="Please Enter Pincode" Text="*" Font-Names="Calibri" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPincode" runat="server" ValidationGroup="valgroupsubmit" Display="None" ControlToValidate="tbxpincode" ValidationExpression="^([0-9]{6})$" ErrorMessage="Pin Code must be only 6 digits" Text="*" Font-Names="Calibri" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div style="width: 15%; height: 30px; float: left; margin-top: 10px; text-align: right; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-weight: bold; font-style: normal; font-variant: small-caps;">
                    <asp:Label ID="Label12" runat="server" Text="Profile Avatar" Font-Names="Calibri" Font-Size="Small" ForeColor="Black" Width="90%"></asp:Label>
                    <asp:Label ID="Label25" runat="server" Text="*" Height="30px" ForeColor="Red"></asp:Label>
                </div>
                <div style="width: 30%; height: 30px; float: left; margin-left: 2.5%; margin-top: 10px; text-align: left; vertical-align: middle; line-height: 30px; font-family: Calibri; font-size: medium; font-style: normal;">
                    <asp:FileUpload ID="fu1" runat="server" />
                    <asp:CustomValidator ID="cvfu1" runat="server" Display="None" ValidationGroup="valgroupsubmit" ErrorMessage="Only .jpeg | .jpg | .gif | .png | .bitmap files allowed!" ControlToValidate="fu1" OnServerValidate="cvfu1_ServerValidate"></asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="rvfu1" runat="server" Display="None" ValidationGroup="valgroupsubmit"  ErrorMessage="user avatar is required!" ControlToValidate="fu1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <%--8th Row--%>
            <div style="width: 100%; height: 40px; float: left; text-align: center; line-height: 30px; margin-top: 30px;">
                <asp:Button ID="BttnSumbit" runat="server" ValidationGroup="valgroupsubmit" CssClass="BtnClass" Text="Submit" Height="35px" OnClick="BttnSumbit_Click" />
            </div>

            <%--9th Row--%>
        </div>



    </div>
</asp:Content>

