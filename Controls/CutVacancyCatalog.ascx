<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CutVacancyCatalog.ascx.cs" Inherits="Controls_CutVacancyCatalog" %>
<h3>Каталог вакансий</h3>
<asp:DataList ID="DataList1" runat="server" 
    DataSourceID="sdsCutCatalogList" Width="100%" CellPadding="4" 
    ForeColor="#333333">
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <ItemTemplate>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl='<%# Eval("CatalogLink") %>' Text='<%# Eval("CatalogInfo") %>'></asp:HyperLink>
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="sdsCutCatalogList" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT TOP (7) (Name+' ('+CAST(dbo.GetProfGroupVacantCount(ProfGroup_ID) AS VARCHAR(10))+')') as CatalogInfo, ('~/VacantiesCatalog.aspx?ProfGroup_ID='+(CAST(ProfGroup_ID as VARCHAR(10)))) as CatalogLink FROM PSP_ProfGroup ORDER BY dbo.GetProfGroupVacantCount(ProfGroup_ID) DESC"></asp:SqlDataSource>
