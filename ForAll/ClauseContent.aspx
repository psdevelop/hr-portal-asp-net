<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClauseContent.aspx.cs" Inherits="ClauseContent" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>
  Содержание статьи 
</h2>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="sdsClauseContent" 
        Width="100%" CellPadding="4" ForeColor="#333333">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditItemTemplate>
            ClauseHead:
            <asp:TextBox ID="ClauseHeadTextBox" runat="server" 
                Text='<%# Bind("ClauseHead") %>' />
            <br />
            ClauseText:
            <asp:TextBox ID="ClauseTextTextBox" runat="server" 
                Text='<%# Bind("ClauseText") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Обновить" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </EditItemTemplate>
        <InsertItemTemplate>
            ClauseHead:
            <asp:TextBox ID="ClauseHeadTextBox" runat="server" 
                Text='<%# Bind("ClauseHead") %>' />
            <br />
            ClauseText:
            <asp:TextBox ID="ClauseTextTextBox" runat="server" 
                Text='<%# Bind("ClauseText") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Вставка" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            <span class="cont_head_text">
            "<asp:Label ID="ClauseHeadLabel" runat="server" 
                Text='<%# Bind("ClauseHead") %>' />"
            </span>    
            <br />
            <br />
            <span class="all_cont_text">
            <asp:Label ID="ClauseTextLabel" runat="server" 
                Text='<%# Bind("ClauseText") %>'/>
            </span>
            <br />
        </ItemTemplate>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
    </asp:FormView>
<asp:SqlDataSource ID="sdsClauseContent" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT ClauseHead, ClauseText FROM PSP_Clauses WHERE (Clause_ID = @Clause_ID)">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="-1" Name="Clause_ID" 
            QueryStringField="Clause_ID" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView2" runat="server" AllowPaging="True" CellPadding="4" 
        DataSourceID="sdsClauseParts" ForeColor="#333333" Width="100%">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <EditItemTemplate>
            TXTPART:
            <asp:TextBox ID="TXTPARTTextBox" runat="server" Text='<%# Bind("TXTPART") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Обновить" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </EditItemTemplate>
        <InsertItemTemplate>
            TXTPART:
            <asp:TextBox ID="TXTPARTTextBox" runat="server" Text='<%# Bind("TXTPART") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Вставка" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:Label ID="TXTPARTLabel" runat="server" Text='<%# Bind("TXTPART") %>' />
            <br />
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    </asp:FormView>
    <asp:SqlDataSource ID="sdsClauseParts" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT ClauseText AS TXTPART FROM PSP_Clauses WHERE (Clause_ID = @Clause_ID) UNION SELECT PartText AS TXTPART FROM PSP_ClauseParts WHERE (Clause_ID = @Clause_ID)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="Clause_ID" 
                QueryStringField="Clause_ID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

