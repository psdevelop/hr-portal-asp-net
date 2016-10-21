<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HotResumesContentl.ascx.cs" Inherits="Controls_HotResumesContentl" %>
<h3>
  Горячие резюме
</h3>
<asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" 
    Width="100%" DataSourceID="sdsHotResumes">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <AlternatingItemStyle BackColor="White" />
    <ItemStyle BackColor="#EFF3FB" />
    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <ItemTemplate>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl='<%# Eval("ResumeFullLink") %>' 
            Text='<%# Eval("EcpecProfName") %>'></asp:HyperLink>
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="sdsHotResumes" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    
    
    SelectCommand="SELECT EcpecProfName, ('~/ForAll/ResumeInfo.aspx?ViewMode=1&amp;Resume_ID='+ CAST(Resume_ID AS VARCHAR(10))) as ResumeFullLink FROM PSP_Resumes WHERE (IsOld = 0) AND (IsProtect = 0) AND (IsHot = 1) AND (IsOccuped=0) AND (IsModerated=1)">
</asp:SqlDataSource>
