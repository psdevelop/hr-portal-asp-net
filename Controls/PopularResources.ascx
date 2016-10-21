<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PopularResources.ascx.cs" Inherits="Controls_PopularResources" %>
<table>
<tr>
  <td>
      <asp:Image ID="DownloadsHeadImage" runat="server" 
          ImageUrl="~/Images/Logic/net_files.png" />
  </td>
  <td>
  <h3>
    Материалы
  </h3>
  </td>
</tr>  
</table>
<b>Раздел</b><br/> 
<asp:DropDownList ID="ddlResTypes" runat="server" 
    DataSourceID="sdsResTypes" DataTextField="ResCaption" 
    DataValueField="ResType_ID" Width="235px" AutoPostBack="True">
</asp:DropDownList><br/><br/>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="4" DataSourceID="sdsEDocs" ForeColor="#333333" GridLines="None" 
    ShowHeader="False" Width="100%" AllowPaging="True" PageSize="7" EmptyDataText="Не найдено ссылок на материалы">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <Columns>
        <asp:HyperLinkField DataNavigateUrlFields="FullPath" 
            DataTextField="Name" />
    </Columns>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>
<asp:SqlDataSource ID="sdsEDocs" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT Name, ('~/Downloads/' + FileName) AS ResourseAdress, FullPath FROM PSP_Resources WHERE (InPopularList = 1) AND (Protected = 0) AND (ResType_ID=@ResType_ID OR @ResType_ID=1)">
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlResTypes" DefaultValue="1" 
            Name="ResType_ID" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="sdsResTypes" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT [ResType_ID], [ResCaption] FROM [PSP_ResourceTypes]">
</asp:SqlDataSource>

