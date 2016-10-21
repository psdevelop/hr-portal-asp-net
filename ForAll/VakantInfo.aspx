<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VakantInfo.aspx.cs" Inherits="VakantInfo" Title="Untitled Page" %>
<%@ Register Src="~/Controls/VakantManip.ascx" TagPrefix="User" 
TagName="VakantManip"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>
  Информация по вакансии
</h2>
<User:VakantManip id="VakantManip" dsMode="read" runat="server" AccessLogin="all" />
</asp:Content>

