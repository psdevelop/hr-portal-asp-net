<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VakantSearch.aspx.cs" Inherits="VakantSearch" Title="Untitled Page" %>
<%@ Register Src="~/Controls/VakantSearchPanel.ascx" TagPrefix="User" 
TagName="VakantSearchPanel"%>
<%@ Register Src="~/Controls/VacantSearchResult.ascx" TagPrefix="User" 
TagName="VacantSearchResult"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainMenuContentPlaceHolder" runat="server">
    <div id="menu_tabs_header">
          <ul>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/Default.aspx">Главная</a></li>
            <li id="menu_tabs_current" onclick="select_menu_tab(this);"><a href=" <%Response.Write(Session["BaseAdress"].ToString());%>/VakantSearch.aspx">Искать работу</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/AddNewPersComlectOrder.aspx">Подбор персонала</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/Infos.aspx">Советы, карьера</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/ForumsList.aspx">Общение</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/Contacts.aspx">О нас</a></li>
          </ul>
        </div>
      </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
    Поиск вакансии
  </h1>
  <user:VakantSearchPanel id="VakantSearchPanel" runat="server" />
  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="AddNewResume.aspx">Добавить резюме</asp:HyperLink>
  <h2>Результат поиска вакансии</h2>
    <user:VacantSearchResult id="VacantSearchResult" runat="server" dsSelectByLogin="False" dsEnableEdit="False" />
  <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="AddNewResume.aspx">Добавить резюме</asp:HyperLink>
</asp:Content>

