<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForumsList.aspx.cs" Inherits="ForumsList" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainMenuContentPlaceHolder" runat="server">
    <div id="menu_tabs_header">
          <ul>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/Default.aspx">Главная</a></li>
            <li onclick="select_menu_tab(this);"><a href=" <%Response.Write(Session["BaseAdress"].ToString());%>/VakantSearch.aspx">Искать работу</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/AddNewPersComlectOrder.aspx">Подбор персонала</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/Infos.aspx">Советы, карьера</a></li>
            <li id="menu_tabs_current" onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/ForumsList.aspx">Общение</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/Contacts.aspx">О нас</a></li>
          </ul>
        </div>
      </asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
  Список форумов на RABOTA-YUG.RU
</h1>
  <asp:SqlDataSource ID="sdsForums" runat="server" 
             ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
             
             
                                                
                                                SelectCommand="SELECT Forum_ID, ForumTheme, AddDateTime, (CAST( (CAST (AddDateTime as DATETIME)) as VARCHAR(10))) as AddDate, ForumDescription, ThemeAuthor_ID, '~/ForAll/ForumContent.aspx?Forum_id=' + CAST(Forum_ID AS CHAR(10)) AS FHead, dbo.GetLastMessageByForumID(Forum_ID) as LastMess FROM PSP_Forums">
         </asp:SqlDataSource>
         <asp:SqlDataSource ID="sdsAllMessCount" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
            SelectCommand="SELECT COUNT(*) AS AllMessCount FROM PSP_ForumItems">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsAllUsersCount" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PMSecurConnection %>" 
            SelectCommand="SELECT COUNT(*) AS AllUsersCount FROM aspnet_Users">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="sdsLastCreateUser" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PMSecurConnection %>" 
            
                                                SelectCommand="SELECT TOP (1) aspnet_Users.UserName, aspnet_Membership.CreateDate FROM aspnet_Users INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId ORDER BY aspnet_Membership.CreateDate DESC">
        </asp:SqlDataSource>
        
         <table>
           <tr>
             <td>
               <div align="right">
               <span style="text-align:right; font-size:14px; font-weight:bold;">
               
               <%  
                  
                   Response.Write(DateTime.Now); %>
                  </span> </div>
             </td>
           </tr>
            
         </table>
                 
         
         <asp:GridView  ID="GridView2" runat="server" AutoGenerateColumns="False" 
             BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
             CellPadding="3" DataKeyNames="Forum_ID" DataSourceID="sdsForums" 
             GridLines="Horizontal" style="text-align: left" AllowPaging="True">
             <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Width="100%" />
             <Columns>
                 <asp:HyperLinkField DataNavigateUrlFields="FHead" DataTextField="ForumTheme" 
                     HeaderText="Тема" ItemStyle-Width="70%" >

<ItemStyle Width="70%"></ItemStyle>

                 </asp:HyperLinkField>
                 <asp:BoundField DataField="AddDate" HeaderText="Дата создания" 
                     SortExpression="AddDate" ItemStyle-Width="110" >
                 
<ItemStyle Width="110px"></ItemStyle>
                 </asp:BoundField>
                 
                 <asp:BoundField DataField="LastMess" HeaderText="Последнее сообщение" 
                     ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                 </asp:BoundField>
             </Columns>
             <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
             <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
             <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
             <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" 
                 HorizontalAlign="Left" />
             <AlternatingRowStyle BackColor="#F7F7F7" />
         </asp:GridView>
         <span>Наши пользователи оставили сообщений: <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsAllMessCount">
              <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("AllMessCount") %>'></asp:Label>
              </ItemTemplate>
            </asp:Repeater> <br />
          
         Последний зарегистрированный пользователь: 
            <asp:Repeater ID="Repeater3" 
            runat="server" DataSourceID="sdsLastCreateUser">
              <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
              </ItemTemplate>
            </asp:Repeater> <br />
           Всего зарегистрированных пользователей: 
            <asp:Repeater ID="Repeater2" 
            runat="server" DataSourceID="sdsAllUsersCount">
              <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("AllUsersCount") %>'></asp:Label>
              </ItemTemplate>
            </asp:Repeater> <br />
               
          Сейчас зарегистрированных посетителей на форуме: 
          <% Response.Write(Membership.GetNumberOfUsersOnline()); %>      

          </span>
          <h4>
            <asp:HyperLink ID="HyperLink1" runat="server" 
                  NavigateUrl="~/ForAll/AddForumeTheme.aspx">+Добавить новую тему для обсуждения</asp:HyperLink>
          </h4>
    
    
<h3>
    <img alt="" src="../Images/logo_mini.jpg" style="width: 107px; height: 60px" />Извините, страница в разработке...
</h3>
</asp:Content>

