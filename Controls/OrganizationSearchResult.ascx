<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OrganizationSearchResult.ascx.cs" Inherits="Controls_OrganizationSearchResult" %>
<asp:SqlDataSource ID="sdsOrgSrch" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    
    
    SelectCommand="SELECT Name, HeadFullName, Adress, ProfGroup_ID, ('~/VakantSearch.aspx?ProfGroup_ID='+
CAST(ProfGroup_ID as VARCHAR(10))+'&amp;Organization_ID='+
CAST(Organization_ID as VARCHAR(10))) as SearchLink FROM PSP_Organizations WHERE (ProfGroup_ID = @ProfGroup_ID) OR (@ProfGroup_ID = 1)">
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlOrgPrGroup" DefaultValue="1" 
            Name="ProfGroup_ID" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
<div>
    <b>Отрасль деятельности организации</b> 
  <asp:DropDownList ID="ddlOrgPrGroup" runat="server" DataSourceID="sdsOrgPrGroups" 
        DataTextField="Name" DataValueField="ProfGroup_ID" Width="200px" 
        AutoPostBack="True">
  </asp:DropDownList><br />
</div>  
<asp:SqlDataSource ID="sdsOrgPrGroups" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT [Name], [ProfGroup_ID] FROM [PSP_ProfGroup]">
</asp:SqlDataSource>
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
    CellPadding="3" DataSourceID="sdsOrgSrch" GridLines="Horizontal" Width="563px"
     HeaderStyle-HorizontalAlign="Left" AllowPaging="True">
    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Организация" 
            SortExpression="Name" />
        <asp:BoundField DataField="HeadFullName" HeaderText="Руководитель" 
            SortExpression="HeadFullName" />
        <asp:BoundField DataField="Adress" HeaderText="Адрес" SortExpression="Adress" />
        <asp:HyperLinkField DataNavigateUrlFields="SearchLink" 
            HeaderText="Список вакансий" Text="Вакансии организации" />
    </Columns>
    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
    <EmptyDataTemplate>
        Нет организаций в этой отрасли
    </EmptyDataTemplate>
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" 
        HorizontalAlign="Left" />
    <AlternatingRowStyle BackColor="#F7F7F7" />
</asp:GridView>

