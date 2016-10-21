<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Culture="Auto" UICulture="RU-ru" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="AdmStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .button
        {
            height: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <center>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="../JavaScript/LoginPage.js" />
            </Scripts>
        </asp:ScriptManager>
        <asp:loginview id="LoginArea" runat="server">
    <AnonymousTemplate>
        
      <h1>Авторизация</h1>
        <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" 
            BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            Font-Size="0.8em" ForeColor="#333333" 
            CreateUserIconUrl="~/Images/Logic/Small/user_add.png" 
            CreateUserText="Регистрация" 
            CreateUserUrl="~/Administration/Registration.aspx" 
            onloggedin="Login1_LoggedIn" PasswordRecoveryText="Восстановить пароль" 
            PasswordRecoveryUrl="~/Administration/RecoveryPasswordPage.aspx" 
            Width="200px">
            <TextBoxStyle Font-Size="0.8em" />
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                ForeColor="White" />
        </asp:Login>
    </anonymoustemplate>
    <LoggedInTemplate>
      <div style="text-align:center;"> 
       <h4><asp:loginname id="LoginName1" runat="server"  formatstring="Добро пожаловать {0}!" /></h4>
          <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="../MainPage.aspx">Главная</asp:HyperLink>
          <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="../PrivateCab.aspx">&nbsp&nbsp&nbspЛичный кабинет</asp:HyperLink>
      </div> 
    </LoggedInTemplate>
    </asp:loginview>

    </center>
    </form>
</body>
</html>
