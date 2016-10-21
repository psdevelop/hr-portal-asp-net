<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LastActualFAQs.ascx.cs" Inherits="Controls_LastActualFAQs" %>
<h3>
  Актуальные вопросы
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="sdsActualFAQs" 
        ForeColor="#333333" RowStyle-Font-Size="12" GridLines="None" PageSize="5" ShowHeader="False" 
        Width="100%">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:HyperLinkField DataTextField="Head" DataNavigateUrlFields="FAQFullLink" />
            
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="False" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
</h3>
<asp:SqlDataSource ID="sdsActualFAQs" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    
    SelectCommand="SELECT Head,('~/ForAll/FAQContent.aspx?ActualFAQ_ID=' + CAST(ActualFAQ_ID AS VARCHAR(10))) AS FAQFullLink FROM PSP_ActualFAQs WHERE (InPopList = 1)"></asp:SqlDataSource>

