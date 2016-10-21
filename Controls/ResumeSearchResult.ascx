<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResumeSearchResult.ascx.cs" Inherits="Controls_ResumeSearchResult" %>
<asp:HiddenField ID="hfSelectByLogin" runat="server" Value="0" />
<asp:SqlDataSource ID="sdsResumeSearch" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    
    
    
    SelectCommand="SELECT PSP_Resumes.EcpecProfName, PSP_Resumes.AddDateTime, PSP_Resumes.WorkStage, PSP_Resumes.Age, PSP_Professionals.Name AS ProfName, PSP_Resumes.SalaryMin, PSP_ProfGroup.Name AS PGroupName, PSP_Resumes.Sex, PSP_Resumes.Adress, PSP_Resumes.FactAdress, dbo.GetSexNameByID(PSP_Resumes.Sex) AS SXName, PSP_Resumes.FirstName,  dbo.GetSalaryComment(PSP_Resumes.SalaryMin, 0) AS SalText,dbo.GetSimpleIf(IsProtect, PSP_Resumes.UserLogin, @UserLogin,@SelectByLogin, '~/ForAll/ResumeInfo.aspx?Resume_id=' + CAST(PSP_Resumes.Resume_ID AS VARCHAR(10)),'~/AddFunction/ViewProtectResume.aspx?Resume_id=' + CAST(PSP_Resumes.Resume_ID AS VARCHAR(10)))+('&SelByLogin='+CAST(@SelectByLogin as VARCHAR(10))) AS ResumeFullLink, '~/AddFunction/EditResume.aspx?Resume_id=' + CAST(PSP_Resumes.Resume_ID AS VARCHAR(10))+('&SelByLogin='+CAST(@SelectByLogin as VARCHAR(10))) AS ResumeEditLink, PSP_Resumes.IsModerated, PSP_Resumes.IsOccuped, PSP_Resumes.IsOld, PSP_Resumes.Resume_ID, PSP_Resumes.EnableDeleting FROM PSP_Resumes INNER JOIN PSP_Professionals ON PSP_Resumes.Professional_ID = PSP_Professionals.Professional_ID INNER JOIN PSP_ProfGroup ON PSP_Resumes.ProfGroup_ID = PSP_ProfGroup.ProfGroup_ID INNER JOIN PSP_BuildingTypes ON PSP_Resumes.BuildingType_ID = PSP_BuildingTypes.BuildingType_ID INNER JOIN PSP_States ON PSP_Resumes.State_ID = PSP_States.State_ID INNER JOIN PSP_Region ON PSP_Resumes.Region_ID = PSP_Region.Region_ID INNER JOIN PSP_Country ON PSP_Resumes.Country_ID = PSP_Country.Country_ID WHERE (PSP_Resumes.Professional_ID = @Professional_ID OR @Professional_ID = 1) AND (PSP_Resumes.ProfGroup_ID = @ProfGroup_ID OR @ProfGroup_ID = 1) AND (PSP_Resumes.BuildingType_ID = @BuildingType_ID OR @BuildingType_ID = 1) AND (PSP_Resumes.State_ID = @State_ID OR @State_ID = 1) AND (PSP_Resumes.Age &gt;= @AgeMin OR @AgeMin &lt; 14 OR PSP_Resumes.Age &lt;= 0) AND (PSP_Resumes.Age &lt;= @AgeMax OR @AgeMax &lt; 14 OR PSP_Resumes.Age &lt;= 0) AND (PSP_Resumes.WorkStage &gt;= @WorkStage OR @WorkStage &lt;= 0 OR PSP_Resumes.WorkStage &lt;= 0) AND (PSP_Resumes.UserLogin = @UserLogin OR @SelectByLogin = 0) AND (PSP_Resumes.SalaryMin &gt;= @SalaryMin OR @SalaryMin &lt;= 0 OR PSP_Resumes.SalaryMin &lt;= 0) AND (PSP_Resumes.SalaryMin &lt;= @SalaryMax OR @SalaryMax &lt;= 0 OR PSP_Resumes.SalaryMin &lt;= 0) AND (PSP_Resumes.Resume_ID = @Resume_ID OR @Resume_ID &lt;= 0) AND (PSP_Resumes.EcpecProfName LIKE @LIKESPN) AND (PSP_Resumes.Sex = @Sex OR @Sex = 0) AND (PSP_Resumes.WorkMode_ID = @WorkMode_ID OR @WorkMode_ID = 1) AND (PSP_Resumes.IsOld = 0 AND PSP_Resumes.IsModerated = 1 AND PSP_Resumes.IsOccuped = 0 AND (PSP_Resumes.Region_ID = @Region_ID OR @Region_ID = 1) AND (PSP_Resumes.Country_ID = @Country_ID OR @Country_ID = 1) OR @SelectByLogin = 1) ORDER BY PSP_Resumes.IsHot DESC, PSP_Resumes.AddDateTime DESC">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="Guest" Name="UserLogin" 
            SessionField="UserName" />
        <asp:ControlParameter ControlID="hfSelectByLogin" DefaultValue="0" 
            Name="SelectByLogin" PropertyName="Value" />
        <asp:QueryStringParameter DefaultValue="1" Name="Professional_ID" 
            QueryStringField="Professional_ID" />
        <asp:QueryStringParameter DefaultValue="1" Name="ProfGroup_ID" 
            QueryStringField="ProfGroup_ID" />
        <asp:QueryStringParameter DefaultValue="1" Name="BuildingType_ID" 
            QueryStringField="BuildingType_ID" />
        <asp:QueryStringParameter DefaultValue="1" Name="State_ID" 
            QueryStringField="State_ID" />
        <asp:QueryStringParameter DefaultValue="0" Name="AgeMin" 
            QueryStringField="AgeMin" />
        <asp:QueryStringParameter DefaultValue="0" Name="AgeMax" 
            QueryStringField="AgeMax" />
        <asp:QueryStringParameter DefaultValue="0" Name="WorkStage" 
            QueryStringField="WorkStage" />
        <asp:QueryStringParameter DefaultValue="0" Name="SalaryMin" 
            QueryStringField="SalaryMin" />
        <asp:QueryStringParameter DefaultValue="0" Name="SalaryMax" 
            QueryStringField="SalaryMax" />
        <asp:QueryStringParameter DefaultValue="0" Name="Resume_ID" 
            QueryStringField="Resume_ID" />
        <asp:QueryStringParameter DefaultValue="%" Name="LIKESPN" 
            QueryStringField="LIKESPN" />
        <asp:QueryStringParameter DefaultValue="0" Name="Sex" QueryStringField="Sex" />
        <asp:QueryStringParameter DefaultValue="1" Name="WorkMode_ID" 
            QueryStringField="WorkMode_ID" />
        <asp:SessionParameter DefaultValue="1" Name="Region_ID" 
            SessionField="Region_ID" />
        <asp:SessionParameter DefaultValue="1" Name="Country_ID" 
            SessionField="Country_ID" />
    </SelectParameters>
</asp:SqlDataSource>
<div class="base_resume_search_result">    
<asp:Panel ID="QueryParams" runat="server">
    <asp:Label ID="QueryParamsHeadLabel" runat="server" Text="Label" Font-Size="14px" Font-Bold="True" Visible="False">по параметрам: </asp:Label>
    <asp:Label ID="QueryParamsLabel" runat="server" Text="" Font-Size="14px"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="14px" Font-Bold="True" Visible="True">  сортировать по: </asp:Label>
    <asp:DropDownList ID="ddlSortField" runat="server" Width="200px" 
        AutoPostBack="true" Enabled="False">
      <asp:ListItem Selected="True" Text="по дате" Value="0"></asp:ListItem>
      <asp:ListItem Text="по наименованию" Value="1"></asp:ListItem>
      <asp:ListItem Text="по величине зарплаты" Value="2"></asp:ListItem>
    </asp:DropDownList>
</asp:Panel>
<asp:ListView ID="ListView1" runat="server" DataSourceID="sdsResumeSearch">
      <ItemTemplate>
          <span style="background-color: #E0FFFF;color: #333333;">
        <table border="0" width="100%">
          <tr>
            <td>
              <table border="0" width="100%">
                <tr>
                  <td> 
                    <b><sqlnetframeworkwebcontrols:GoogleAnalyticsAspNetGridCounter ID="GoogleAnalyticsAspNetGridCounter1"  
                          IndexFormat="{0}. " IndexOffset="1" runat="server"/></b>
                    <b>"<asp:Label ID="EcpecProfNameLabel" runat="server" 
                      Text='<%# Eval("EcpecProfName") %>' />" Номер: 
                      <b>"<asp:Label ID="IDLabel" runat="server" 
                      Text='<%# Eval("Resume_ID") %>' />"</b>, 
                      <asp:Label ID="Label1" runat="server" 
                      Text='<%# Eval("FirstName") %>'></asp:Label>,
                      <asp:Label ID="Label3" runat="server" 
                      Text='<%# Eval("Age") %>' /> </b>
                     
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
        </table>
       <asp:Panel ID="MoreAboutResumeHeadPanel" runat="server" CssClass="collapsePanelHeader">
                        <asp:ImageButton ID="MoreAboutResumeImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Подробней...)"/>
                        <asp:Label ID="MoreAboutResumeLabel" runat="server">(Подробней...)</asp:Label>
       </asp:Panel>
       <asp:Panel ID="MoreAboutResumePanel" runat="server" CssClass="collapsePanel" 
                            Height="0" HorizontalAlign="center">
        <table border="0" width="100%">
          <tr>
            <td>
              <table border="0" width="100%">
                <tr>
                  <td align="left">
                    (специализация-
                      <b>
                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProfName") %>' />)
                      </b>
                      <br />  
                  </td>
                  <td align="right">
                    Отрасль:
                      <b><asp:Label ID="PGroupNameLabel" runat="server" 
                      Text='<%# Eval("PGroupName") %>' />
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
                  <td align="left">
                    Стаж работы 
                      <b><asp:Label ID="WorkStageMinLabel" runat="server" 
                        Text='<%# Eval("WorkStage") %>' /></b> лет
                          
                  </td>
                  <td align="right">
                    Пол:
                      <b><asp:Label ID="SexLabel" runat="server" Text='<%# Eval("SXName") %>' />
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
                  <td align="left">
                    Зарплата от  
                      <b><asp:Label ID="SalaryMinLabel" runat="server" Text='<%# Eval("SalText") %>' />      
                      </b> руб.
                  </td>
                  <td align="right">
                    Возраст (полн. лет)-
                      <b><asp:Label ID="AgeMaxLabel" runat="server" Text='<%# Eval("Age") %>' />
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
            <td align="right">
              <table border="0" width="100%">
                <tr>
                  <td align="left">
                                      
                  </td>
                  <td align="right" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ResumeFullLink") %>' Target="_blank">Смотреть все данные</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ResumeEditLink") %>' Visible='<%#dsEnableEdit %>'>Править</asp:HyperLink>
                    <asp:Button ID="ResumeDEL1Button" runat="server" Text="Удалить" Visible='<%#dsEnableEdit%>' Enabled='<%# Eval("EnableDeleting") %>' CommandArgument='<%# Eval("Resume_ID")%>' onclick="Button1_Click" />
                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="ResumeDEL1Button" ConfirmText="Вы точно хотите удалить это резюме?" Enabled="True">
                      </ajaxToolkit:ConfirmButtonExtender>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          
        </table>
        </asp:Panel>
        <ajaxToolkit:CollapsiblePanelExtender ID="cpeDemo" runat="Server"
                      TargetControlID="MoreAboutResumePanel"
                      ExpandControlID="MoreAboutResumeHeadPanel"
                      CollapseControlID="MoreAboutResumeHeadPanel" 
                      Collapsed="True"
                      TextLabelID="MoreAboutResumeLabel"
                      ImageControlID="MoreAboutResumeImage"    
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
        <span style="background-color: #FFCC66;color: #333333;">
        <table border="0" width="100%" style="background-color:#FFCC66;">
          <tr>
            <td>
              <table border="0" width="100%">
                <tr>
                  <td>
                      <b><sqlnetframeworkwebcontrols:GoogleAnalyticsAspNetGridCounter ID="GoogleAnalyticsAspNetGridCounter1"  
                          IndexFormat="{0}. " IndexOffset="1" runat="server"/></b>
                      <b>"<asp:Label ID="EcpecProfNameLabel" runat="server" 
                      Text='<%# Eval("EcpecProfName") %>' />" Номер: 
                      <b>"<asp:Label ID="IDLabel" runat="server" 
                      Text='<%# Eval("Resume_ID") %>' />"</b>, 
                      <asp:Label ID="Label1" runat="server" 
                      Text='<%# Eval("FirstName") %>'></asp:Label>,
                      <asp:Label ID="Label3" runat="server" 
                      Text='<%# Eval("Age") %>' /> </b>
                     
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
        </table>
        <asp:Panel ID="MoreAboutResumeAlternatHeadPanel" runat="server" CssClass="collapsePanelHeader" BackColor="#FFCC66">
                        <asp:ImageButton ID="MoreAboutResumeAlternatImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Подробней...)"/>
                        <asp:Label ID="MoreAboutResumeAlternatLabel" runat="server">(Подробней...)</asp:Label>
       </asp:Panel>
       <asp:Panel ID="MoreAboutResumeAlternatPanel" runat="server" CssClass="collapsePanel" 
                            Height="0" HorizontalAlign="center">  
        <table border="0" width="100%" style="background-color:#FFCC66;">
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
                    Стаж работы 
                      <b><asp:Label ID="WorkStageMinLabel" runat="server" 
                        Text='<%# Eval("WorkStage") %>' /></b> лет
                          
                  </td>
                  <td align="right">
                    Пол:
                      <b><asp:Label ID="SexLabel" runat="server" Text='<%# Eval("SXName") %>' />
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
                  <td align="left">
                    Зарплата от  
                      <b><asp:Label ID="SalaryMinLabel" runat="server" Text='<%# Eval("SalText") %>' />      
                      </b> руб.
                  </td>
                  <td align="right">
                    Возраст (полн. лет)-
                      <b><asp:Label ID="AgeMaxLabel" runat="server" Text='<%# Eval("Age") %>' />
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
                                      
                  </td>
                  <td align="right" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ResumeFullLink") %>' Target="_blank">Смотреть все данные</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ResumeEditLink") %>' Visible='<%#dsEnableEdit %>'>Править</asp:HyperLink>
                    <asp:Button ID="ResumeDEL2Button" runat="server" Text="Удалить" Visible='<%#dsEnableEdit%>' Enabled='<%# Eval("EnableDeleting") %>' CommandArgument='<%# Eval("Resume_ID")%>' onclick="Button1_Click" />
                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="ResumeDEL2Button" ConfirmText="Вы точно хотите удалить это резюме?">
                      </ajaxToolkit:ConfirmButtonExtender>
                  </td>
                </tr>
              </table>
            </td>
          </tr> 
        </table>
        </asp:Panel>
        <ajaxToolkit:CollapsiblePanelExtender ID="cpeDemoAlternat" runat="Server"
                      TargetControlID="MoreAboutResumeAlternatPanel"
                      ExpandControlID="MoreAboutResumeAlternatHeadPanel"
                      CollapseControlID="MoreAboutResumeAlternatHeadPanel" 
                      Collapsed="True"
                      TextLabelID="MoreAboutResumeAlternatLabel"
                      ImageControlID="MoreAboutResumeAlternatImage"    
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
          <span>Нет данных резюме.</span>
      </EmptyDataTemplate>
      <InsertItemTemplate>
          Не поддерживается вставка
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
          Не поддерживается правка
      </EditItemTemplate>
      <SelectedItemTemplate>
          Не описан стиль выделенного
      </SelectedItemTemplate>
</asp:ListView>
</div>  