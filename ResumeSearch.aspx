<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ResumeSearch.aspx.cs" Inherits="ResumeSearch" Title="Untitled Page" %>
<%@ Register Src="~/Controls/ResumeSearchPanel.ascx" TagPrefix="User" 
TagName="ResumeSearchPanel"%>
<%@ Register Src="~/Controls/ResumeSearchResult.ascx" TagPrefix="User" 
TagName="ResumeSearchResult"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>
    Поиск резюме
  </h1>
  <user:ResumeSearchPanel id="ResumeSearchPanel" runat="server" />
  <h2>Результат поиска резюме</h2>
  <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="AddNewPersComlectOrder.aspx">Добавить вакансию</asp:HyperLink>
    <user:ResumeSearchResult id="ResumeSearchResult" runat="server" dsSelectByLogin="False" />
  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="AddNewPersComlectOrder.aspx">Добавить вакансию</asp:HyperLink>  
</asp:Content>

