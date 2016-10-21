<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PrivateCab.aspx.cs" Inherits="PrivateCab" Title="Untitled Page" %>
<%@ Register src="Controls/VacantSearchResult.ascx" tagname="VacantSearchResult" tagprefix="uc1" %>

<%@ Register src="Controls/ResumeSearchResult.ascx" tagname="ResumeSearchResult" tagprefix="uc2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>
    Личный кабинет (тут изменение Ваших резюме или заявок)
  </h1>
  <h2>
    Поданные вами резюме
  </h2>
    <uc2:ResumeSearchResult ID="ResumeSearchResult1" runat="server" dsSelectByLogin="True"  dsEnableEdit="True" />
  <h2>
    Поданные вами заявки на подбор персонала
  </h2>
    <uc1:VacantSearchResult ID="VacantSearchResult1" runat="server" dsSelectByLogin="True" dsEnableEdit="True" />

</asp:Content>

