<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Contacts" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainMenuContentPlaceHolder" runat="server">
    <div id="menu_tabs_header">
          <ul>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/Default.aspx">Главная</a></li>
            <li onclick="select_menu_tab(this);"><a href=" <%Response.Write(Session["BaseAdress"].ToString());%>/VakantSearch.aspx">Искать работу</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/AddNewPersComlectOrder.aspx">Подбор персонала</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/Infos.aspx">Советы, карьера</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/ForumsList.aspx">Общение</a></li>
            <li id="menu_tabs_current" onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/Contacts.aspx">О нас</a></li>
          </ul>
        </div>
      </asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <h1>
    Контанктая информация
  </h1>

</asp:Content>

