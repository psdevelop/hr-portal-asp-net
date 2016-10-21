<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddVacancyByOldOrg.aspx.cs" Inherits="AddFunction_AddVacancyByOldOrg" Title="Untitled Page" %>

<%@ Register src="../Controls/VakantManip.ascx" tagname="VakantManip" tagprefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>Добавление вакансии по имеющейся организации
    </h1>
  <uc1:VakantManip ID="VakantManip1" dsMode="insert" 
          runat="server" />  
</asp:Content>

