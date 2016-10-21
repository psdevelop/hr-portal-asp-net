<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdviseContent.aspx.cs" Inherits="AdviseContent" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>
  Совет на RABOTA_YUG.RU
</h2>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="sdsAdviceContent" 
        Width="100%" CellPadding="4" ForeColor="#333333">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditItemTemplate>
            Head:
            <asp:TextBox ID="HeadTextBox" runat="server" Text='<%# Bind("Head") %>' />
            <br />
            FullTXT:
            <asp:TextBox ID="FullTXTTextBox" runat="server" Text='<%# Bind("FullTXT") %>' />
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
            FullTXT:
            <asp:TextBox ID="FullTXTTextBox" runat="server" Text='<%# Bind("FullTXT") %>' />
            <br />
            AddDateTime:
            <asp:TextBox ID="AddDateTimeTextBox" runat="server" 
                Text='<%# Bind("AddDateTime") %>' />
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
            <span class="cont_date_text"><asp:Label ID="AddDateTimeLabel" runat="server" 
                Text='<%# Bind("AddDateTime") %>'/>
            </span>    
            <br />
            <span class="all_cont_text">
            <asp:Label ID="FullTXTLabel" runat="server" Text='<%# Bind("FullTXT") %>'  />
            </span>
            <br />
            <br />
        </ItemTemplate>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
    </asp:FormView>
    <asp:SqlDataSource ID="sdsAdviceContent" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT Head, FullTXT, AddDateTime FROM PSP_Advices WHERE (Advice_ID = @Advice_ID)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="-1" Name="Advice_ID" 
                QueryStringField="Advice_ID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

