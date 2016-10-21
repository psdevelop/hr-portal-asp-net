<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CompanyInfo.aspx.cs" Inherits="CompanyInfo" Title="Безымянная страница" %>
<%@ Register Src="~/Controls/CompanyManip.ascx" TagPrefix="User" 
TagName="CompanyManip"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>Информация об организации</h1>
  <User:CompanyManip id="CompanyManip" runat="server"/>
</asp:Content>

