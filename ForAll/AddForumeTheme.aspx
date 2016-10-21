<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddForumeTheme.aspx.cs" Inherits="AddForumeTheme" Title="Untitled Page" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div style="text-align:center">
    <h1>Тема нового форума:</h1><BR>
    <asp:TextBox ID="TextBox1" runat="server" Width="255px"></asp:TextBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:u173288ConnectionString %>" 
    InsertCommand="INSERT INTO PSP_Forums(AuthorLogin, ForumTheme) VALUES (@login, @text)" 
    SelectCommand="SELECT Review_ID, Author_ID, AddDateTime, Text, AuthorLogin FROM PSP_Forums">
    <InsertParameters>
        <asp:SessionParameter DefaultValue="Гость" Name="login" 
            SessionField="UserName" Size="50" Type="String" />
        <asp:ControlParameter ControlID="TextBox1" Name="text" PropertyName="Text" />
    </InsertParameters>
</asp:SqlDataSource>
<asp:Button ID="Button1" runat="server" onclick="Button1_Click"  
    style="text-align: center; margin-right: 2px;" Text="Добавить" 
    Width="255px" />
       
  </div>
  <h4><div>
      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ForAll/ForumsList.aspx">Вернуться к списку тем</asp:HyperLink></div>
  </h4>
</asp:Content>

