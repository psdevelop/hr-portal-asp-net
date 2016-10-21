<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Clauses.aspx.cs" Inherits="Clauses" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
  Статьи на RABOTA-YUG.RU
</h1>
    <asp:SqlDataSource ID="sdsClauseCatalog" runat="server" ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
                                                
                                                
        SelectCommand="SELECT [AuthorFullName], [ClauseFilePath], [InPopList], [ClauseHead], [Clause_ID], [AddDateTime], ( '~/ForAll/ClauseContent.aspx?Clause_ID='+CAST(Clause_ID as VARCHAR(10))) as ClauseFullLink FROM [PSP_Clauses]"></asp:SqlDataSource>
    <asp:GridView ID="gvClauseCatalog" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" 
                                                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                                DataKeyNames="Clause_ID" DataSourceID="sdsClauseCatalog" 
                                                EmptyDataText="Не найдено статей" ForeColor="Black" GridLines="Vertical" 
                                                Width="100%">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="AddDateTime" HeaderText="Добавлена" 
                SortExpression="AddDateTime" ItemStyle-Width="130" >
<ItemStyle Width="130px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="AuthorFullName" HeaderText="Автор" 
                SortExpression="AuthorFullName" ItemStyle-Width="120" >
<ItemStyle Width="120px"></ItemStyle>
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="ClauseFullLink" DataTextField="ClauseHead" 
                HeaderText="Название" ItemStyle-Width="250" >
<ItemStyle Width="250px"></ItemStyle>
            </asp:HyperLinkField>
            <asp:CheckBoxField DataField="InPopList" HeaderText="В горячем списке" 
                SortExpression="InPopList" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Left" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>

