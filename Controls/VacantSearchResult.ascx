<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VacantSearchResult.ascx.cs" Inherits="Controls_VacantSearchResult" %>
<%@ Register src="~/Controls/QuickUserCreateControl.ascx" tagname="QuickUserCreateControl" tagprefix="uc2"%>
<%@ Register TagPrefix="sota" Namespace="Sota.Web.UI.WebControls" Assembly="RandomCodeImage"%>

<asp:HiddenField ID="hfSelectByLogin" runat="server" Value="0" />
<asp:SqlDataSource ID="sdsVakantSearch" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
       
    
    
    
    
    SelectCommand="SELECT PSP_Vakanties.AddDateTime, PSP_Vakanties.EnableDeleting, PSP_Vakanties.DirectFromOrganization, PSP_Vakanties.EcpecProfName, PSP_Vakanties.WorkStageMin, PSP_Vakanties.Quantity, PSP_Vakanties.AgeMax, PSP_Vakanties.AgeMin, PSP_Vakanties.IsHot, PSP_Organizations.Name AS OrgName, PSP_Organizations.Adress, PSP_Organizations.Phones, PSP_Organizations.Website, PSP_Organizations.Email, PSP_Vakanties.IsOccuped, PSP_BuildingTypes.Name AS BuildTypeName, PSP_ProfGroup.Name AS PGroupName, PSP_Professionals.Name AS ProfName, dbo.GetSexNameByID(PSP_Vakanties.Sex) AS SXName, PSP_Vakanties.ContactFace, PSP_Vakanties.SpecIfs, PSP_Vakanties.SpecWorkMode, dbo.GetSalaryComment(PSP_Vakanties.SalaryMin, PSP_Vakanties.SalaryMax) AS SalText, dbo.GetAgeComment(PSP_Vakanties.AgeMin, PSP_Vakanties.AgeMax) AS AgeText, dbo.GetOrganizationComment(PSP_Vakanties.DirectFromOrganization, PSP_Vakanties.IsProtect, PSP_Vakanties.Organization_ID, PSP_Vakanties.ContactOrg_ID, 0) AS ContactInfo,dbo.GetSimpleIf(IsProtect, PSP_Vakanties.UserLogin, @UserLogin,@SelectByLogin, '~/ForAll/VakantInfo.aspx?Vakant_ID=' + CAST(PSP_Vakanties.Vakant_ID AS VARCHAR(10)), ('~/AddFunction/ViewProtectVacancy.aspx?Vakant_ID=' + CAST(PSP_Vakanties.Vakant_ID AS VARCHAR(10))))+('&amp;SelByLogin='+CAST(@SelectByLogin as VARCHAR(10))) AS VakantFullLink, '~/AddFunction/EditVacancy.aspx?Vakant_ID=' + CAST(PSP_Vakanties.Vakant_ID AS VARCHAR(10))+('&amp;SelByLogin='+CAST(@SelectByLogin as VARCHAR(10))) AS VakantEditLink, PSP_Vakanties.IsOld, PSP_Vakanties.IsModerated, PSP_Vakanties.Vakant_ID FROM PSP_Vakanties INNER JOIN PSP_States ON PSP_Vakanties.State_ID = PSP_States.State_ID INNER JOIN PSP_Region ON PSP_Vakanties.Region_ID = PSP_Region.Region_ID INNER JOIN PSP_Country ON PSP_Vakanties.Country_ID = PSP_Country.Country_ID INNER JOIN PSP_Professionals ON PSP_Vakanties.Professional_ID = PSP_Professionals.Professional_ID INNER JOIN PSP_ProfGroup ON PSP_Vakanties.ProfGroup_ID = PSP_ProfGroup.ProfGroup_ID INNER JOIN PSP_BuildingTypes ON PSP_Vakanties.BuildingType_ID = PSP_BuildingTypes.BuildingType_ID INNER JOIN PSP_Organizations ON PSP_Vakanties.Organization_ID = PSP_Organizations.Organization_ID WHERE (PSP_Vakanties.State_ID = @State_ID OR @State_ID = 1) AND (PSP_Vakanties.Professional_ID = @Professional_ID OR @Professional_ID = 1) AND (PSP_Vakanties.ProfGroup_ID = @ProfGroup_ID OR @ProfGroup_ID = 1) AND (PSP_BuildingTypes.BuildingType_ID = @BuildingType_ID OR @BuildingType_ID = 1) AND (PSP_Organizations.Organization_ID = @Organization_ID OR @Organization_ID = 1) AND ((PSP_Vakanties.AgeMin &lt;= @Age OR PSP_Vakanties.AgeMin &lt; 14) AND (PSP_Vakanties.AgeMax &gt;= @Age OR PSP_Vakanties.AgeMax &lt; 14) OR @Age &lt; 14) AND (PSP_Vakanties.WorkStageMin &lt;= @WorkStageMin OR PSP_Vakanties.WorkStageMin &lt;= 0 OR @WorkStageMin &lt;= 0) AND (PSP_Vakanties.SalaryMax &gt;= @Salary OR PSP_Vakanties.SalaryMin &gt;= @Salary OR PSP_Vakanties.SalaryMax &lt;= 0 AND PSP_Vakanties.SalaryMin &lt;= 0 OR @Salary &lt;= 0) AND (PSP_Vakanties.WorkMode_ID = @WorkMode_ID OR @WorkMode_ID = 1) AND (PSP_Vakanties.Sex = @Sex OR @Sex = 0) AND (PSP_Vakanties.EcpecProfName LIKE @LIKESPN) AND (PSP_Vakanties.Vakant_ID = @Vakant_ID OR @Vakant_ID = 0) AND (PSP_Vakanties.UserLogin = @UserLogin OR @SelectByLogin = 0) AND (PSP_Vakanties.IsOld = 0 AND PSP_Vakanties.IsModerated = 1 AND PSP_Vakanties.IsOccuped = 0 AND (PSP_Vakanties.Region_ID = @Region_ID OR @Region_ID = 1) AND (PSP_Vakanties.Country_ID = @Country_ID OR @Country_ID = 1) OR @SelectByLogin = 1) AND ((PSP_Vakanties.AddDateTime&gt;=DATEADD(day,-CAST(@LastDayCount AS INT),GetDate())) OR (CAST(@LastDayCount AS INT)&lt;=0)) ORDER BY PSP_Vakanties.IsHot DESC, dbo.GetVacancyOrderVariantValue(PSP_Vakanties.Vakant_ID,@sort_field) DESC">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="Guest" Name="UserLogin" 
            SessionField="UserName" />
        <asp:ControlParameter ControlID="hfSelectByLogin" DefaultValue="0" 
            Name="SelectByLogin" PropertyName="Value" />
        <asp:QueryStringParameter DefaultValue="1" Name="State_ID" 
            QueryStringField="State_ID" />
        <asp:QueryStringParameter DefaultValue="1" Name="Professional_ID" 
            QueryStringField="Professional_ID" />
        <asp:QueryStringParameter DefaultValue="1" Name="ProfGroup_ID" 
            QueryStringField="ProfGroup_ID" />
        <asp:QueryStringParameter DefaultValue="1" Name="BuildingType_ID" 
            QueryStringField="BuildingType_ID" />
        <asp:QueryStringParameter DefaultValue="1" Name="Organization_ID" 
            QueryStringField="Organization_ID" />
        <asp:QueryStringParameter DefaultValue="0" Name="Age" QueryStringField="Age" />
        <asp:QueryStringParameter DefaultValue="-1" Name="WorkStageMin" 
            QueryStringField="WorkStageMin" />
        <asp:QueryStringParameter DefaultValue="0" Name="Salary" 
            QueryStringField="Salary" />
        <asp:QueryStringParameter DefaultValue="1" Name="WorkMode_ID" 
            QueryStringField="WorkMode_ID" />
        <asp:QueryStringParameter DefaultValue="0" Name="Sex" QueryStringField="Sex" />
        <asp:QueryStringParameter DefaultValue="%" Name="LIKESPN" 
            QueryStringField="LIKESPN" />
        <asp:QueryStringParameter DefaultValue="0" Name="Vakant_ID" 
            QueryStringField="Vakant_ID" />
        <asp:SessionParameter DefaultValue="1" Name="Region_ID" 
            SessionField="Region_ID" />
        <asp:SessionParameter DefaultValue="1" Name="Country_ID" 
            SessionField="Country_ID" />
        <asp:QueryStringParameter DefaultValue="0" Name="LastDayCount" 
            QueryStringField="LastDayCount" />
        <asp:ControlParameter ControlID="ddlSortField" DefaultValue="0" 
            Name="sort_field" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
<div class="base_vacancy_search_result">
<asp:Panel ID="QueryParams" runat="server">
    <asp:Label ID="QueryParamsHeadLabel" runat="server" Text="Label" Font-Size="14px" Font-Bold="True" Visible="False">по параметрам: </asp:Label>
    <asp:Label ID="QueryParamsLabel" runat="server" Text="" Font-Size="14px"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="14px" Font-Bold="True" Visible="True">  сортировать по: </asp:Label>
    <asp:DropDownList ID="ddlSortField" runat="server" Width="200px" AutoPostBack="true">
      <asp:ListItem Selected="True" Text="по дате" Value="0"></asp:ListItem>
      <asp:ListItem Text="по наименованию" Value="1"></asp:ListItem>
      <asp:ListItem Text="по величине зарплаты" Value="2"></asp:ListItem>
    </asp:DropDownList>
</asp:Panel>
<asp:ListView ID="ListView1" runat="server" DataSourceID="sdsVakantSearch">
    <ItemTemplate>
        <span style="background-color: #E0FFFF;color: #333333;">
        <table border="0" width="100%" style="background-color:#E0FFFF;">
          <tr>
            <td>
              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                  <td>
                    <b><sqlnetframeworkwebcontrols:GoogleAnalyticsAspNetGridCounter ID="GoogleAnalyticsAspNetGridCounter1"  
                          IndexFormat="{0}. " IndexOffset="1" runat="server"/></b>
                    Должность:
                      <b>"<asp:Label ID="EcpecProfNameLabel" runat="server" 
                      Text='<%# Eval("EcpecProfName") %>' />"</b> Номер: 
                      <b>"<asp:Label ID="IDLabel" runat="server" 
                      Text='<%# Eval("Vakant_ID") %>' />"</b>
                  </td>
                  <td align="right">
                    Добавлена:
                      <b><asp:Label ID="AddDateTimeLabel" runat="server" 
                      Text='<%# Eval("AddDateTime","{0:dd.MM.yyyy}") %>' /></b>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                  <td align="left">
                    Стаж от 
                      <b><asp:Label ID="WorkStageMinLabel" runat="server" 
                        Text='<%# Eval("WorkStageMin") %>' /></b> лет
                    Возраст:
                      <b><asp:Label ID="AgeMaxLabel" runat="server" Text='<%# Eval("AgeText") %>' />      
                      </b>
                  </td>
                  <td align="left">
                    Зарплата&nbsp; 
                      <b><asp:Label ID="SalaryMinLabel" runat="server" Text='<%# Eval("SalText") %>' />      
                      </b>
                      <br/><A href="mailto:email?subject=Message from RABOTA-YUG.RU&body='Vashim drugom predlojena vakansiya nomer <%# Eval("Vakant_ID") %> na saite RABOTA-YUG.RU, prosto zaidite na sait i vvedite nomer v pole bystrogo poiska'" mce_href="mailto:email?subject=Message from RABOTA-YUG.RU&body='Vashim drugom predlojena vakansiya nomer <%# Eval("Vakant_ID") %> na saite RABOTA-YUG.RU, prosto zaidite na sait i vvedite nomer v pole bystrogo poiska'">Отослать другу</A>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
       </table>
       <table width="100%"><tr>
          <td valign="bottom">     
            <asp:Panel ID="MoreAboutVacancyHeadPanel" runat="server" CssClass="collapsePanelHeader">
                        <asp:ImageButton ID="MoreAboutVacancyImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Подробней...)"/>
                        <asp:Label ID="MoreAboutVacancyLabel" runat="server">(Подробней...)</asp:Label>
            </asp:Panel>
          </td>
          <td align="right">
                <table>
                <tr><td>
                    <asp:Panel ID="SendResumeDocHeaderPanel" runat="server" CssClass="collapsePanelHeader">
                    <asp:Label ID="ResumeDocStatusLabel" runat="server" Text=""></asp:Label>
                    <asp:ImageButton ID="SendResumeDocImageButton" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Подробней...)"/>
                    <asp:LinkButton ID="SendResumeDocLinkButton" runat="server">Отправить файл с резюме...</asp:LinkButton>
                    </asp:Panel>
                    </td>
                    <td><asp:FileUpload ID="ResumeDocFileUpload" runat="server" /></td>
                </tr><tr>
                <td colspan="2">
                    <asp:Panel ID="SendResumeDocPanel" runat="server" CssClass="collapsePanel" 
                            Height="0" HorizontalAlign="center" Width="100%">
                         <center>
                             <uc2:QuickUserCreateControl ID="QuickUserCreateControl" runat="server" />
                         </center>
                         <div style=" background-color:#bbbbbb; padding:10px; text-align:center;">
                            <table align="center"><tr><td>
                              <asp:UpdatePanel ID="ImCodeUpdatePanel" runat="server" EnableViewState="False">
                                    <ContentTemplate>
                                      <sota:RandomCodeImage runat="server" id="RandomCodeImage" Digits="5" 
                                            Height="40px" RotateAngle="8" Width="100px">
                                        </sota:RandomCodeImage>
                                    </ContentTemplate>
                                    <Triggers>
                                      <asp:AsyncPostBackTrigger ControlID="ImChangeButton" EventName="Click" />
                                    </Triggers>
                                  </asp:UpdatePanel>
                              </td>
                              <td>
                                  
                                  <asp:Button ID="ImChangeButton" runat="server" Text="Не видно, ОБНОВИТЬ" 
                                       Visible="false"/>
                              </td>
                              </tr>
                            </table>  
                              <br/>
                             Код подтверждения (5 символов): 
                              <asp:TextBox ID="acknowledgementTextBox" runat="server"></asp:TextBox>  
                              <br/><asp:Label ID="ImageAckStatusLabel" runat="server" Font-Bold="True" 
                              ForeColor="#FF3300"></asp:Label>
                          </div>  
                         <asp:Button ID="Button1" CommandArgument='<%# Eval("Vakant_ID") %>' runat="server" Text="Отправить файл" OnClick="SendResumeDocButton_Click" />
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="SendResumeDocCollapsiblePanelExtender" runat="Server"
                      TargetControlID="SendResumeDocPanel"
                      ExpandControlID="SendResumeDocHeaderPanel"
                      CollapseControlID="SendResumeDocHeaderPanel" 
                      Collapsed="True"
                      TextLabelID="SendResumeDocLinkButton"
                      ImageControlID="SendResumeDocImageButton"    
                      ExpandedText="(Скрыть панель отправки...)"
                      CollapsedText="(Отправить файл с резюме...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                      SkinID="" />        
                </td>
                </tr></table>    
          </td>
       </tr></table>
       <asp:Panel ID="MoreAboutVacancyPanel" runat="server" CssClass="collapsePanel" 
                            Height="0" HorizontalAlign="center" Width="100%">
       <table width="100%">
          <tr>
            <td>
              <table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="left">
                    (специализация-
                      <b><asp:Label ID="Label2" runat="server" Text='<%# Eval("ProfName") %>' />)
                      </b>
                      <br />  
                  </td>
                  <td align="right">
                    Отрасль:
                      <b><asp:Label ID="PGroupNameLabel" runat="server" 
                      Text='<%# Eval("PGroupName") %>' /></b>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="left">
                    Пол:
                      <b><asp:Label ID="SexLabel" runat="server" Text='<%# Eval("SXName") %>' />
                      </b>
                  </td>

                  <td align="right">
                    Количество вакансий:
                      <b>
                      <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' /> мест
                      </b>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table border="0" width="100%">
                <tr>
                  <td>
                      <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false"
                        Text="Проверено модератором"  
                        Checked='<%# Eval("IsModerated") %>' 
                        Visible='<%#dsEnableEdit %>' />
                  </td>
                  <td>
                    <asp:CheckBox ID="CheckBox2" runat="server" Enabled="false"
                        Text="Реализовано"  
                        Checked='<%# Eval("IsOccuped") %>' 
                        Visible='<%#dsEnableEdit %>' />
                  </td>
                  <td>
                    <asp:CheckBox ID="CheckBox3" runat="server" Enabled="false"
                        Text="Старое"  
                        Checked='<%# Eval("Isold") %>' 
                        Visible='<%#dsEnableEdit %>' />
                  </td>
                </tr>
                </table>
            </td>
          </tr>
          <tr>
            <td>
              <table border="0" width="100%">
                <tr>
                  <td align="left">
                    <asp:Label ID="OrgNameLabel" runat="server" Text='<%# Eval("ContactInfo") %>' />                  
                  </td>
                  <td align="right" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("VakantFullLink") %>' Target="_blank">Смотреть все данные</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("VakantEditLink") %>' Visible='<%#dsEnableEdit%>' Target="_blank">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Logic/Small/page_edit.png" />
                    Править</asp:HyperLink>
                    <asp:Button ID="VacancyDEL1Button" runat="server" Text="Удалить" Visible='<%#dsEnableEdit%>' Enabled='<%# Eval("EnableDeleting") %>' CommandArgument='<%# Eval("Vakant_ID")%>' onclick="Button1_Click" />
                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="VacancyDEL1Button" ConfirmText="Вы точно хотите удалить эту вакансию?">
                      </ajaxToolkit:ConfirmButtonExtender>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          
        </table>
        </asp:Panel>
        <ajaxToolkit:CollapsiblePanelExtender ID="cpeDemo" runat="Server"
                      TargetControlID="MoreAboutVacancyPanel"
                      ExpandControlID="MoreAboutVacancyHeadPanel"
                      CollapseControlID="MoreAboutVacancyHeadPanel" 
                      Collapsed="True"
                      TextLabelID="MoreAboutVacancyLabel"
                      ImageControlID="MoreAboutVacancyImage"    
                      ExpandedText="(Скрыть доп. данные...)"
                      CollapsedText="(Подробней...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                      SkinID="" />     
        </span>
        <hr />
    </ItemTemplate>
    <AlternatingItemTemplate>
        <span style="background-color: #66CCFF;color: #284775;">
        <table border="0" width="100%" style="background-color:#66CCFF;"><tr><td>
        <tr>
            <td>
              <table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td>
                    <b><sqlnetframeworkwebcontrols:GoogleAnalyticsAspNetGridCounter ID="GoogleAnalyticsAspNetGridCounter1"  
                          IndexFormat="{0}. " IndexOffset="1" runat="server"/></b>
                    Должность:
                      <b>"<asp:Label ID="EcpecProfNameLabel" runat="server" 
                      Text='<%# Eval("EcpecProfName") %>' /></b> Номер: 
                      <b>"<asp:Label ID="IDLabel" runat="server" 
                      Text='<%# Eval("Vakant_ID") %>' />"</b>
                  </td>
                  <td align="right">
                    Добавлена:
                      <b><asp:Label ID="AddDateTimeLabel" runat="server" 
                      Text='<%# Eval("AddDateTime","{0:dd.MM.yyyy}") %>' /></b>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="left">
                    Стаж от 
                      <b><asp:Label ID="WorkStageMinLabel" runat="server" 
                        Text='<%# Eval("WorkStageMin") %>' /></b> лет
                    Возраст:
                      <b><asp:Label ID="AgeMaxLabel" runat="server" Text='<%# Eval("AgeText") %>'/>      
                      </b>
                  </td>
                  <td align="left">
                    Зарплата&nbsp; 
                      <b><asp:Label ID="SalaryMinLabel" runat="server" Text='<%# Eval("SalText") %>' />      
                      </b>
                      <br/><A href="mailto:email?subject=Message from RABOTA-YUG.RU&body='Vashim drugom predlojena vakansiya nomer <%# Eval("Vakant_ID") %> na saite RABOTA-YUG.RU, prosto zaidite na sait i vvedite nomer v pole bystrogo poiska'" mce_href="mailto:email?subject=Message from RABOTA-YUG.RU&body='Vashim drugom predlojena vakansiya nomer <%# Eval("Vakant_ID") %> na saite RABOTA-YUG.RU, prosto zaidite na sait i vvedite nomer v pole bystrogo poiska'">Отослать другу</A>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
       </table>
       
       <table width="100%"><tr>
          <td valign="bottom">     
            <asp:Panel ID="AlternatMoreAboutVacancyHeadPanel" runat="server" CssClass="collapsePanelHeader" BackColor="#66CCFF">
                        <asp:ImageButton ID="AlternatMoreAboutVacancyImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Подробней...)"/>
                        <asp:Label ID="AlternatMoreAboutVacancyLabel" runat="server">(Подробней...)</asp:Label>
            </asp:Panel>
          </td>
          <td align="right">
                <table>
                <tr><td>
                    <asp:Panel ID="AlternatSendResumeDocHeaderPanel" runat="server" CssClass="collapsePanelHeader">
                    <asp:Label ID="AlternatResumeDocStatusLabel" runat="server" Text=""></asp:Label>
                    <asp:ImageButton ID="AlternatSendResumeDocImageButton" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Подробней...)"/>
                    <asp:LinkButton ID="AlternatSendResumeDocLinkButton" runat="server">Отправить файл с резюме...</asp:LinkButton>
                    </asp:Panel>
                    </td>
                    <td><asp:FileUpload ID="AlternatResumeDocFileUpload" runat="server" /></td>
                </tr><tr>
                <td colspan="2">
                    <asp:Panel ID="AlternatSendResumeDocPanel" runat="server" CssClass="collapsePanel" 
                            Height="0" HorizontalAlign="center" Width="100%">
                         <center>
                             <uc2:QuickUserCreateControl ID="AlternatQuickUserCreateControl" runat="server" />
                         </center>
                         <div style=" background-color:#bbbbbb; padding:10px; text-align:center;">
                            <table align="center"><tr><td>
                              <asp:UpdatePanel ID="AlternatImCodeUpdatePanel" runat="server" EnableViewState="False">
                                    <ContentTemplate>
                                      <sota:RandomCodeImage runat="server" id="AlternatRandomCodeImage" Digits="5" 
                                            Height="40px" RotateAngle="8" Width="100px">
                                        </sota:RandomCodeImage>
                                    </ContentTemplate>
                                    <Triggers>
                                      <asp:AsyncPostBackTrigger ControlID="AlternatImChangeButton" EventName="Click" />
                                    </Triggers>
                                  </asp:UpdatePanel>
                              </td>
                              <td>
                                  
                                  <asp:Button ID="AlternatImChangeButton" runat="server" Text="Не видно, ОБНОВИТЬ" 
                                       Visible="false"/>
                              </td>
                              </tr>
                            </table>  
                              <br/>
                             Код подтверждения (5 символов): 
                              <asp:TextBox ID="AlternatacknowledgementTextBox" runat="server"></asp:TextBox>  
                              <br/><asp:Label ID="AlternatImageAckStatusLabel" runat="server" Font-Bold="True" 
                              ForeColor="#FF3300"></asp:Label>
                          </div>  
                         <asp:Button ID="Button1" CommandArgument='<%# Eval("Vakant_ID") %>' runat="server" Text="Отправить файл" OnClick="AlternatSendResumeDocButton_Click" />
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="AlternatSendResumeDocCollapsiblePanelExtender" runat="Server"
                      TargetControlID="AlternatSendResumeDocPanel"
                      ExpandControlID="AlternatSendResumeDocHeaderPanel"
                      CollapseControlID="AlternatSendResumeDocHeaderPanel" 
                      Collapsed="True"
                      TextLabelID="AlternatSendResumeDocLinkButton"
                      ImageControlID="AlternatSendResumeDocImageButton"    
                      ExpandedText="(Скрыть панель отправки...)"
                      CollapsedText="(Отправить файл с резюме...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                      SkinID="" />        
                </td>
                </tr></table>    
          </td>
       </tr></table>
       <asp:Panel ID="AlternatMoreAboutVacancyPanel" runat="server" CssClass="collapsePanel" 
                            Height="0" HorizontalAlign="center">
       <table border="0" width="100%" style="background-color:#66CCFF;">
          <tr>
            <td>
              <table border="0" width="100%">
                <tr>
                  <td align="left">
                    (специализация-
                      <b><asp:Label ID="Label2" runat="server" Text='<%# Eval("ProfName") %>' />)
                      </b>
                      <br />  
                  </td>
                  <td align="right">
                    Отрасль:
                      <b><asp:Label ID="PGroupNameLabel" runat="server" 
                      Text='<%# Eval("PGroupName") %>' /></b>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table border="0" width="100%">
                <tr>
                  <td align="left">
                    Пол:
                      <b><asp:Label ID="SexLabel" runat="server" Text='<%# Eval("SXName") %>' />
                      </b>
                  </td>
                  <td align="right">
                    Количество вакансий:
                      <b>
                      <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' /> мест
                      </b>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table border="0" width="100%">
                <tr>
                  <td>
                      <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false"
                        Text="Проверено модератором"  
                        Checked='<%# Eval("IsModerated") %>' 
                        Visible='<%#dsEnableEdit %>' />
                  </td>
                  <td>
                    <asp:CheckBox ID="CheckBox2" runat="server" Enabled="false"
                        Text="Реализовано"  
                        Checked='<%# Eval("IsOccuped") %>' 
                        Visible='<%#dsEnableEdit %>' />
                  </td>
                  <td>
                    <asp:CheckBox ID="CheckBox3" runat="server" Enabled="false"
                        Text="Старое"  
                        Checked='<%# Eval("Isold") %>' 
                        Visible='<%#dsEnableEdit %>' />
                  </td>
                </tr>
                </table>
            </td>
          </tr>
          <tr>
            <td>
              <table border="0" width="100%">
                <tr>
                  <td align="left">
                    <asp:Label ID="OrgNameLabel" runat="server" Text='<%# Eval("ContactInfo") %>' />                  
                  </td>
                  <td align="right" valign="top">
                      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("VakantFullLink") %>' Target="_blank">Смотреть все данные</asp:HyperLink>
                      <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("VakantEditLink") %>' Visible='<%#dsEnableEdit%>' Target="_blank">
                          <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Logic/Small/page_edit.png" />
                        Править</asp:HyperLink>
                      <asp:Button ID="VacancyDEL2Button" runat="server" Text="Удалить" Visible='<%#dsEnableEdit%>' Enabled='<%# Eval("EnableDeleting") %>' CommandArgument='<%# Eval("Vakant_ID")%>' onclick="Button1_Click" />
                      <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="VacancyDEL2Button" ConfirmText="Вы точно хотите удалить эту вакансию?">
                        </ajaxToolkit:ConfirmButtonExtender>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </td></tr></table>
        </asp:Panel>
        <ajaxToolkit:CollapsiblePanelExtender ID="cpeDemoAlternat" runat="Server"
                      TargetControlID="AlternatMoreAboutVacancyPanel"
                      ExpandControlID="AlternatMoreAboutVacancyHeadPanel"
                      CollapseControlID="AlternatMoreAboutVacancyHeadPanel" 
                      Collapsed="True"
                      TextLabelID="AlternatMoreAboutVacancyLabel"
                      ImageControlID="AlternatMoreAboutVacancyImage"    
                      ExpandedText="(Скрыть доп. данные...)"
                      CollapsedText="(Подробней...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                      SkinID="" />   
        </span>
        <hr />
    </AlternatingItemTemplate>
    <EmptyDataTemplate>
        <span>Нет данных.</span>
    </EmptyDataTemplate>
    <InsertItemTemplate>
        Вставка не поддерживается
    </InsertItemTemplate>
    <LayoutTemplate>
        <div ID="itemPlaceholderContainer" runat="server" 
            style="font-family: Verdana, Arial, Helvetica, sans-serif;">
            <span ID="itemPlaceholder" runat="server" />
        </div>
        <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
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
    <EditItemTemplate>
        
    </EditItemTemplate>
    <SelectedItemTemplate>
        Выделено
    </SelectedItemTemplate>
</asp:ListView>
</div>