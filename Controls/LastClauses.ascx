<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LastClauses.ascx.cs" Inherits="Controls_LastClauses" %>
<h2>Последние статьи</h2>
<asp:ListView ID="LastClausesListView" runat="server" 
    DataSourceID="sdsLastClauses">
    <ItemTemplate>
        <li style="background-color: #FFFBD6;color: #333333;">
            <asp:Label ID="ClauseHeadLabel" runat="server" 
                Text='<%# Eval("ClauseHead") %>' />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClauseFullLink") %>'>Подробнее...</asp:HyperLink>
        </li>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <li style="background-color: #FFFBD6;color: #333333;">
            <asp:Label ID="ClauseHeadLabel" runat="server" 
                Text='<%# Eval("ClauseHead") %>' />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClauseFullLink") %>'>Подробнее...</asp:HyperLink>
        </li>
    </AlternatingItemTemplate>
    <EmptyDataTemplate>
        No data was returned.
    </EmptyDataTemplate>
    <InsertItemTemplate>
        <li style="">ClauseFilePath:
            <asp:TextBox ID="ClauseFilePathTextBox" runat="server" 
                Text='<%# Bind("ClauseFilePath") %>' />
            <br />
            PreviewText:
            <asp:TextBox ID="PreviewTextTextBox" runat="server" 
                Text='<%# Bind("PreviewText") %>' />
            <br />
            ClauseText:
            <asp:TextBox ID="ClauseTextTextBox" runat="server" 
                Text='<%# Bind("ClauseText") %>' />
            <br />
            ClauseHead:
            <asp:TextBox ID="ClauseHeadTextBox" runat="server" 
                Text='<%# Bind("ClauseHead") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
        </li>
    </InsertItemTemplate>
    <LayoutTemplate>
        <ul ID="itemPlaceholderContainer" runat="server" 
            style="font-family: Verdana, Arial, Helvetica, sans-serif;">
            <li ID="itemPlaceholder" runat="server" />
            </ul>
            <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <EditItemTemplate>
            <li style="background-color: #FFCC66;color: #000080;">ClauseFilePath:
                <asp:TextBox ID="ClauseFilePathTextBox" runat="server" 
                    Text='<%# Bind("ClauseFilePath") %>' />
                <br />
                PreviewText:
                <asp:TextBox ID="PreviewTextTextBox" runat="server" 
                    Text='<%# Bind("PreviewText") %>' />
                <br />
                ClauseText:
                <asp:TextBox ID="ClauseTextTextBox" runat="server" 
                    Text='<%# Bind("ClauseText") %>' />
                <br />
                ClauseHead:
                <asp:TextBox ID="ClauseHeadTextBox" runat="server" 
                    Text='<%# Bind("ClauseHead") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                    Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Cancel" />
            </li>
        </EditItemTemplate>
        <ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                ClauseFilePath:
                <asp:Label ID="ClauseFilePathLabel" runat="server" 
                    Text='<%# Eval("ClauseFilePath") %>' />
                <br />
                PreviewText:
                <asp:Label ID="PreviewTextLabel" runat="server" 
                    Text='<%# Eval("PreviewText") %>' />
                <br />
                ClauseText:
                <asp:Label ID="ClauseTextLabel" runat="server" 
                    Text='<%# Eval("ClauseText") %>' />
                <br />
                ClauseHead:
                <asp:Label ID="ClauseHeadLabel" runat="server" 
                    Text='<%# Eval("ClauseHead") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="sdsLastClauses" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        
        
        
        SelectCommand="SELECT ClauseFilePath, PreviewText, ClauseText, ClauseHead, Clause_ID, ('~/ForAll/ClauseContent.aspx?clause_id=' + CAST(Clause_ID AS CHAR(10))) AS ClauseFullLink FROM PSP_Clauses WHERE (InPopList = 1)"></asp:SqlDataSource>

