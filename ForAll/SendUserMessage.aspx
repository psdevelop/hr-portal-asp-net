<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SendUserMessage.aspx.cs" Inherits="Administration_SendUserMessage" Title="Untitled Page" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <center><asp:Label ID="SendMsgStatusLabel" runat="server" Text="" ForeColor="Red" Font-Size="16px" Font-Bold="True"></asp:Label></center><br/>
  <h2><asp:Image ID="Image1" runat="server" ImageUrl="Images/Logic/email_32.png" />Отослать нам сообщение</h2>
    
  <h3>От кого (e-mail или имя):<asp:TextBox ID="tbSubjName" runat="server">Гость</asp:TextBox> </h3>
  <h3>Тема письма:<asp:TextBox ID="tbTheme" runat="server">Без темы</asp:TextBox> </h3>
   
    <h3>Текст письма:</h3>
    <asp:TextBox ID="tbMailText" runat="server" Height="100" Width="400"></asp:TextBox><br/>
  <asp:Button ID="Button1" runat="server" Text="Отправить письмо" onclick="Button1_Click"/>  
</asp:Content>

