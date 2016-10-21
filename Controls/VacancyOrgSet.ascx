<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VacancyOrgSet.ascx.cs" Inherits="Controls_VacancyOrgSet" %>

<asp:SqlDataSource ID="sdsCompanyByLogin" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT  dbo.GetOrganizationComment(1,0,Organization_ID,-1,0) as OrgInfo, 
              ('~/AddNewPersComlectOrderWithExistComp.aspx?CompanyID='+
              CAST(Organization_ID AS VARCHAR(10))) as
              ByOldCompAddLink  
FROM PSP_Organizations WHERE (UserLogin = @UserName) AND (UserLogin<>'Guest')">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="Guest" Name="UserName" 
                SessionField="UserName" />
        </SelectParameters>
</asp:SqlDataSource>
<asp:Panel ID="ProfGroupCHeadPanel" runat="server" CssClass="collapsePanelHeader"> 
                      <div style="padding:5px; cursor: pointer; vertical-align: middle;"> 
                        <asp:ImageButton ID="ProfGroupCHeadImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Взять из списка зарегистрированных организаций...)"/>
                        <asp:Label ID="ProfGroupCHeadLabel" runat="server">(Взять из списка зарегистрированных организаций...)</asp:Label>
                      </div>
                    </asp:Panel>
                    <asp:Panel ID="ProfGroupCPanel" runat="server" CssClass="collapsePanel" Height="0">
                       <h3>Выберите щелчком одну из организаций</h3>
                       <asp:ListView ID="lvCompByLogin" runat="server" DataSourceID="sdsCompanyByLogin">
            <AlternatingItemTemplate>
                <li style="background-color: #FFF8DC;">
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("ByOldCompAddLink") %>' Text='<%# Eval("OrgInfo") %>'></asp:HyperLink>
                    <asp:Label ID="OrgInfoLabel" runat="server" Text="" />
                    <br />
                </li>
               </AlternatingItemTemplate>
               
            <EditItemTemplate>
                <li style="background-color: #008A8C;color: #FFFFFF;">OrgInfo:
                    <asp:TextBox ID="OrgInfoTextBox" runat="server" Text='<%# Bind("OrgInfo") %>' />
                    <br />
                    ByOldCompAddLink:
                    <asp:TextBox ID="ByOldCompAddLinkTextBox" runat="server" 
                        Text='<%# Bind("ByOldCompAddLink") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Обновить" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Отмена" />
                </li>
               </EditItemTemplate>
               
            <EmptyDataTemplate>
                Нет данных.
               </EmptyDataTemplate>
               
            <InsertItemTemplate>
                <li style="">OrgInfo:
                    <asp:TextBox ID="OrgInfoTextBox" runat="server" Text='<%# Bind("OrgInfo") %>' />
                    <br />
                    ByOldCompAddLink:
                    <asp:TextBox ID="ByOldCompAddLinkTextBox" runat="server" 
                        Text='<%# Bind("ByOldCompAddLink") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Вставить" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Очистить" />
                </li>
               </InsertItemTemplate>
               
            <itemseparatortemplate>
                <br />
            </itemseparatortemplate>
            <ItemTemplate>
                <li style="background-color: #DCDCDC;color: #000000;">
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("ByOldCompAddLink") %>' Text='<%# Eval("OrgInfo") %>'></asp:HyperLink>
                    <asp:Label ID="OrgInfoLabel" runat="server" Text="" />
                    <br />
                </li>
               </ItemTemplate>
               
            <LayoutTemplate>
                <ul id="itemPlaceholderContainer" runat="server" 
                    style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <li id="itemPlaceholder" runat="server" />
                    </ul>
                    <div 
                    style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
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
               
                <SelectedItemTemplate>
                    <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">OrgInfo:
                        <asp:Label ID="OrgInfoLabel" runat="server" Text='<%# Eval("OrgInfo") %>' />
                        <br />
                        ByOldCompAddLink:
                        <asp:Label ID="ByOldCompAddLinkLabel" runat="server" 
                            Text='<%# Eval("ByOldCompAddLink") %>' />
                        <br />
                    </li>
                </SelectedItemTemplate>
               
            </asp:ListView> 

          </asp:Panel>

                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="Server"
                      TargetControlID="ProfGroupCPanel"
                      ExpandControlID="ProfGroupCHeadPanel"
                      CollapseControlID="ProfGroupCHeadPanel" 
                      Collapsed="True"
                      TextLabelID="ProfGroupCHeadLabel"
                      ImageControlID="ProfGroupCHeadImage"    
                      ExpandedText="(Скрыть список зарегистрированных организаций...)"
                      CollapsedText="(Взять из списка зарегистрированных организаций...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                      SkinID="CollapsiblePanelDemo" />
