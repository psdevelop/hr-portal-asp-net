<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HotVakantiesContent.ascx.cs" Inherits="Controls_HotVakantiesContent" %>
<h3>
  Горячие вакансии
</h3>
<asp:DataList ID="DataList1" runat="server" 
    DataSourceID="sdsHotVakanties" CellPadding="4" ForeColor="#333333" 
    Width="100%">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <AlternatingItemStyle BackColor="White" />
    <ItemStyle BackColor="#EFF3FB" />
    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <ItemTemplate>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl='<%# Eval("VakantFullLink") %>' Text='<%# Eval("EcpecProfName") %>'></asp:HyperLink>
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="sdsHotVakanties" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    
    
    SelectCommand="SELECT EcpecProfName, Vakant_ID, ('~/ForAll/VakantInfo.aspx?Vakant_ID='+ CAST(Vakant_ID AS CHAR(10))) as VakantFullLink FROM PSP_Vakanties WHERE (IsOld = 0) AND (IsProtect = 0) AND (IsHot = 1) AND (IsOccuped=0) AND (IsModerated=1)">
</asp:SqlDataSource>
