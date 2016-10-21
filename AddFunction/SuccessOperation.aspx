<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SuccessOperation.aspx.cs" Inherits="AddFunction_SuccessOperation" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <center>
    <h1>ОПЕРАЦИЯ</h1>
    <h2>успешно завершена</h2>
      <asp:Menu ID="Menu1" runat="server" BackColor="#FFFBD6" 
          DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" 
          ForeColor="#990000" StaticSubMenuIndent="10px">
          <StaticSelectedStyle BackColor="#FFCC66" />
          <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
          <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
          <DynamicMenuStyle BackColor="#FFFBD6" />
          <DynamicSelectedStyle BackColor="#FFCC66" />
          <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
          <StaticHoverStyle BackColor="#990000" ForeColor="White" />
          <Items>
              <asp:MenuItem Text="ГЛАВНАЯ" Value="New Item"></asp:MenuItem>
              <asp:MenuItem Text="ПОИСК ВАКАНСИЙ" Value="New Item"></asp:MenuItem>
              <asp:MenuItem Text="ПОИСК РЕЗЮМЕ" Value="New Item"></asp:MenuItem>
              <asp:MenuItem Text="ДОБАВИТЬ РЕЗЮМЕ" Value="New Item"></asp:MenuItem>
              <asp:MenuItem Text="ДОБАВИТЬ ВАКАНСИЮ" Value="New Item"></asp:MenuItem>
              <asp:MenuItem Text="ЛИЧНЫЙ КАБИНЕТ" Value="ЛИЧНЫЙ КАБИНЕТ"></asp:MenuItem>
          </Items>
      </asp:Menu>
  </center>
</asp:Content>

