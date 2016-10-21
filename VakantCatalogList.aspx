<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VakantCatalogList.aspx.cs" Inherits="VakantCatalogList" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>Список каталогов отраслей</h1>
  <asp:SqlDataSource ID="sdsAllCatalogList" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    
        SelectCommand="SELECT Name + ' (' + CAST(dbo.GetProfGroupVacantCount(ProfGroup_ID) AS VARCHAR(10)) + ')' AS CatalogInfo, '~/VacantiesCatalog.aspx?ProfGroup_ID=' + CAST(ProfGroup_ID AS VARCHAR(10)) AS CatalogLink, Description FROM PSP_ProfGroup ORDER BY Name"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="sdsAllCatalogList" GridLines="Horizontal" 
        Width="456px" HeaderStyle-HorizontalAlign="Left" AllowPaging="True" 
        PageSize="20">
        <PagerSettings Mode="NumericFirstLast" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="CatalogLink" 
                DataTextField="CatalogInfo" HeaderText="Каталог" >
                <ItemStyle Width="300px" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="Description" HeaderText="Описание" 
                SortExpression="Description" >
                <ItemStyle Width="500px" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" 
            HorizontalAlign="Left" />
        <AlternatingRowStyle BackColor="#F7F7F7" />
    </asp:GridView>
</asp:Content>

