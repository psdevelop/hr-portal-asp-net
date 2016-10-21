<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Download.aspx.cs" Inherits="Download" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>
    Ресурсы на RABOTA-YUG.RU
  </h1>
  <b>Раздел</b><br/> 
<asp:DropDownList ID="ddlResTypes" runat="server" 
    DataSourceID="sdsResTypes" DataTextField="ResCaption" 
    DataValueField="ResType_ID" Width="235px" AutoPostBack="True">
</asp:DropDownList><br/><br/>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="4" DataSourceID="sdsEDocs" ForeColor="#333333" GridLines="None" 
        Width="100%" AllowPaging="True" PageSize="20" 
        EmptyDataText="Не найдено ссылок на материалы">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <Columns>
        <asp:BoundField DataField="AddDateTime" HeaderText="Добавлен" 
            SortExpression="AddDateTime">
            <ItemStyle Width="80px" />
        </asp:BoundField>
        <asp:HyperLinkField DataNavigateUrlFields="FullPath" 
            DataTextField="Name" HeaderText="Название" />
        <asp:BoundField DataField="FileSize" HeaderText="Размер" 
            SortExpression="FileSize" />
        <asp:BoundField DataField="Author" HeaderText="Автор" SortExpression="Author" />
        <asp:BoundField DataField="Description" HeaderText="Описание" 
            SortExpression="Description">
            <ItemStyle Width="250px" />
        </asp:BoundField>
    </Columns>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
        HorizontalAlign="Left" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>
<asp:SqlDataSource ID="sdsEDocs" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    
        SelectCommand="SELECT Name, '~/Downloads/' + FileName AS ResourseAdress, FullPath, FileSize, FileName, Author, Description, AddDateTime FROM PSP_Resources WHERE (Protected = 0) AND (ResType_ID = @ResType_ID OR @ResType_ID = 1)">
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlResTypes" DefaultValue="1" 
            Name="ResType_ID" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="sdsResTypes" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT [ResType_ID], [ResCaption] FROM [PSP_ResourceTypes]">
</asp:SqlDataSource>
</asp:Content>

