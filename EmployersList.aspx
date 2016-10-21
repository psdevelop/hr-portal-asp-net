<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployersList.aspx.cs" Inherits="EmployersList" Title="Untitled Page" %>

<%@ Register src="Controls/OrganizationSearchResult.ascx" tagname="OrganizationSearchResult" tagprefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Перечень организаций-работодателей</h1>
    <uc1:OrganizationSearchResult ID="OrganizationSearchResult1" runat="server" />
</asp:Content>

