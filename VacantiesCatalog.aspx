<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VacantiesCatalog.aspx.cs" Inherits="VacantiesCatalog" Title="Untitled Page" %>
<%@ Register Src="~/Controls/VacantSearchResult.ascx" TagPrefix="User" 
TagName="VacantSearchResult"%>
<%@ Register Src="~/Controls/ResumeSearchResult.ascx" TagPrefix="User" 
TagName="ResumeSearchResult"%>
<%@ Register Src="~/Controls/OrganizationSearchResult.ascx" TagPrefix="User" 
TagName="OrganizationSearchResult"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>Содержимое каталога 
      <asp:Repeater ID="rptSelectedCatalog" runat="server" 
          DataSourceID="sdsSelectedCatalog">
            <ItemTemplate>
                &#39;<asp:Label ID="lblCatName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>&#39;
            </ItemTemplate>
      </asp:Repeater>
      <asp:SqlDataSource ID="sdsSelectedCatalog" runat="server" 
          ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
          
          SelectCommand="SELECT Name FROM PSP_ProfGroup WHERE (ProfGroup_ID = @ProfGroup_ID)">
          <SelectParameters>
              <asp:QueryStringParameter DefaultValue="0" Name="ProfGroup_ID" 
                  QueryStringField="ProfGroup_ID" />
          </SelectParameters>
      </asp:SqlDataSource>
  </h1>
  <h2>Вакансии</h2>
  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="AddNewResume.aspx">Добавить резюме</asp:HyperLink>
  <br />
  <user:VacantSearchResult id="VacantSearchResult" runat="server" />
  <h2>Резюме</h2>
  <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="AddNewPersComlectOrder.aspx">Добавить вакансию</asp:HyperLink>
  <br />
  <user:ResumeSearchResult id="ResumeSearchResult" runat="server" />
  <h2>Организации</h2>
  <user:OrganizationSearchResult id="OrganizationSearchResult1" runat="server" />
</asp:Content>

