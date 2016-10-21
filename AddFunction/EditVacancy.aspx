<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditVacancy.aspx.cs" Inherits="EditVacancy" Title="Untitled Page" %>
<%@ Register Src="~/Controls/VakantManip.ascx" TagPrefix="User" 
TagName="VakantManip"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>
  Изменение данных вакансии
</h1>

<User:VakantManip id="VakantManip" dsMode="edit" runat="server" />

</asp:Content>

