﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowCaptcha.aspx.cs" Inherits="ShowCaptcha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>



  <tr>


    <td>

      <asp:Image ID="imgCaptcha" runat="server" ImageUrl="~/CreateCaptcha.aspx?New=1"/>

     </td>

   </tr>

   <tr>

    <td>

      <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>

     </td>

    </tr>

    <tr>

     <td>

       <asp:Label ID="lblMessage" runat="server"></asp:Label>

      </td>

     </tr>

     <tr>

      <td>

 <asp:Button ID="btnCaptcha" runat="server" Text="Validate Cpatcha Code"  onclick="btnCaptcha_Click" />

       </td>

       </tr>

     </table>
    </div>
    </form>
</body>
</html>
