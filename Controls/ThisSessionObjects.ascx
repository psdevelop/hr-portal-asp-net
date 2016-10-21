<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThisSessionObjects.ascx.cs" Inherits="Controls_ThisSessionObjects" %>
<asp:SqlDataSource ID="sdsThisSessionVacanties" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    
    SelectCommand="SELECT Vakant_ID, EcpecProfName, '~/ForAll/VakantInfo.aspx?Vakant_ID=' + CAST(PSP_Vakanties.Vakant_ID AS VARCHAR(10)) as FullVakantLink  FROM PSP_Vakanties WHERE (INSSession_ID = @INSSession_ID)">
    <SelectParameters>
        <asp:SessionParameter Name="INSSession_ID" SessionField="SessionID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="sdsThisSessionResumes" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    
    SelectCommand="SELECT Resume_ID, EcpecProfName, '~/ForAll/ResumeInfo.aspx?Resume_id=' + CAST(PSP_Resumes.Resume_ID AS VARCHAR(10)) as ResumeFullLink FROM PSP_Resumes WHERE (INSSession_ID = @INSSession_ID)">
    <SelectParameters>
        <asp:SessionParameter Name="INSSession_ID" SessionField="SessionID" />
    </SelectParameters>
</asp:SqlDataSource>

<div style="width:100%; padding:4px; font-weight:bold; font-size:11px;">

    Вакансии в этой сессии: 
    <asp:GridView ID="GridView1" runat="server" 
        DataSourceID="sdsThisSessionVacanties" AutoGenerateColumns="False" 
        AllowPaging="True" PageSize="2" BackColor="White" BorderColor="#E7E7FF" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Horizontal" Width="100%" EmptyDataText="Еще не добавлены">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="Vakant_ID" HeaderText="Номер" InsertVisible="False" 
                ReadOnly="True" SortExpression="Vakant_ID">
            <ItemStyle Width="40px" />
            </asp:BoundField>
            <asp:BoundField DataField="EcpecProfName" HeaderText="Должность" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />

    </asp:GridView>
<br/>
    Резюме в этой сессии: 
    <asp:GridView ID="GridView2" runat="server" 
        DataSourceID="sdsThisSessionResumes" AutoGenerateColumns="False" 
        AllowPaging="True" PageSize="2" BackColor="White" BorderColor="#E7E7FF" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Horizontal" Width="100%" EmptyDataText="Еще не добавлены">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="Resume_ID" HeaderText="Номер">
            <ItemStyle Width="40px" />
            </asp:BoundField>
            <asp:BoundField DataField="EcpecProfName" HeaderText="Должность" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />

    </asp:GridView>

</div>

