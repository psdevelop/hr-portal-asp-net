<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DaysAdvise.ascx.cs" Inherits="Controls_DaysAdvise" %>
<asp:FormView ID="DaysAdviseFormView" runat="server" AllowPaging="True" 
    CellPadding="4" ForeColor="#333333" 
    DataSourceID="sdsDaysAdvise" Width="100%" Height="150px" 
    BorderColor="#003366" BorderStyle="Dotted" BorderWidth="1px">
    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="14px" />
    <ItemTemplate>
        <table cellpadding="0" cellspacing="2" border="0" style="text-align:left;">
            <tr>
            <td valign="top">
                <br/>
                <asp:Image ID="AdviceBussinessImage" runat="server" ImageUrl="~/Images/businness/useful_info.jpg" Height="90" />
            </td>
            <td valign="top" style="font-size:11px; text-align:justify;">
                <div style="font-size:22px;text-align:left; font-weight: bold;">Совет дня</div>
                <div style="width:100%; background-color: Purple; color:White;">
                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("Head") %>'></asp:Label>
                </div>
                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("ShortTXT") %>'></asp:Label> 
                <br/>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("AdviseFullLink") %>'>Подробно...</asp:HyperLink>
            </td>
            </tr>
          </table> 
    </ItemTemplate>
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
</asp:FormView>
<asp:SqlDataSource ID="sdsDaysAdvise" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    
    
    
    SelectCommand="SELECT ShortHead, Advice_ID, Head, ShortTXT, FullTXT, AddDateTime, ('~/ForAll/AdviseContent.aspx?Advice_id='+ CAST(Advice_ID AS CHAR(10))) as AdviseFullLink  FROM PSP_Advices ORDER BY AddDateTime DESC"></asp:SqlDataSource>

