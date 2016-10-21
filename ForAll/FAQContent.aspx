<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FAQContent.aspx.cs" Inherits="FAQContent" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
  Подробно об актуальном
</h2>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="sdsAFAQContent" 
        Width="100%" CellPadding="4" ForeColor="#333333" 
    EmptyDataText="Нет данных">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditItemTemplate>
            Head:
            <asp:TextBox ID="HeadTextBox" runat="server" Text='<%# Bind("Head") %>' />
            <br />
            Text:
            <asp:TextBox ID="TextTextBox" runat="server" Text='<%# Bind("Text") %>' />
            <br />
            AddDateTime:
            <asp:TextBox ID="AddDateTimeTextBox" runat="server" 
                Text='<%# Bind("AddDateTime") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Обновить" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Head:
            <asp:TextBox ID="HeadTextBox" runat="server" Text='<%# Bind("Head") %>' />
            <br />
            Text:
            <asp:TextBox ID="TextTextBox" runat="server" Text='<%# Bind("Text") %>' />
            <br />
            <span class="cont_date_text">
            Добавлено:
            <asp:TextBox ID="AddDateTimeTextBox" runat="server" 
                Text='<%# Bind("AddDateTime") %>' />
            </span>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Вставка" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            <span class="cont_head_text">
            "<asp:Label ID="HeadLabel" runat="server" Text='<%# Bind("Head") %>' />"
            </span>
            <br />
            <span class="cont_date_text">
            Добавлено:
            <asp:Label ID="AddDateTimeLabel" runat="server" 
                Text='<%# Bind("AddDateTime") %>' />
            </span>
            <br />
            <span class="all_cont_text">
            <asp:Label ID="TextLabel" runat="server" Text='<%# Bind("Text") %>' />
            </span>
            <br />
            
        </ItemTemplate>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
    </asp:FormView>
    <asp:SqlDataSource ID="sdsAFAQContent" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        
        SelectCommand="SELECT Head, Text, AddDateTime FROM PSP_ActualFAQs WHERE (ActualFAQ_ID = @ActualFAQ_ID)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="ActualFAQ_ID" 
                QueryStringField="ActualFAQ_ID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

