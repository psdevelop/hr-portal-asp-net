<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewResume.aspx.cs" Inherits="AddNewResume" Title="Untitled Page" %>
<%@ Register src="Controls/ResumeManip.ascx" tagname="ResumeManip" tagprefix="uc1" %>
<%@ Register TagPrefix="sota" Namespace="Sota.Web.UI.WebControls" Assembly="RandomCodeImage"%>
<%@ Register src="~/Controls/QuickUserCreateControl.ascx" tagname="QuickUserCreateControl" tagprefix="uc2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:SqlDataSource ID="sdsBuldingsType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [Name], [BuildingType_ID] FROM [PSP_BuildingTypes]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sdsWorkMode" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [WorkMode_ID], [Name] FROM [PSP_WorkMode] ORDER BY [WorkMode_ID] ASC">
    </asp:SqlDataSource>
      <asp:HiddenField ID="hfStartLoadStatus" runat="server" Value="1" />
      <asp:SqlDataSource ID="sdsAddResumeWithDetails" runat="server">
      </asp:SqlDataSource>
      
  
    <asp:SqlDataSource ID="sdsDeleteUnattachedWHistory" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        DeleteCommand="DELETE FROM PSP_OldWorks WHERE (Resume_ID=-1) AND (INSSession_ID = @INSSession_ID)" 
        ProviderName="<%$ ConnectionStrings:PMConnectionString.ProviderName %>">
        <DeleteParameters>
            <asp:SessionParameter Name="INSSession_ID" SessionField="SessionID" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsDeleteUnattachedBuilds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        DeleteCommand="DELETE FROM PSP_Building WHERE (INSSession_ID = @INSSession_ID) AND (Resume_ID=-1)" 
        ProviderName="<%$ ConnectionStrings:PMConnectionString.ProviderName %>">
        <DeleteParameters>
            <asp:SessionParameter Name="INSSession_ID" SessionField="SessionID" />
        </DeleteParameters>
    </asp:SqlDataSource>
      
  
  <h1>  
      Добавление резюме
    <asp:Label ID="AlertLabel" runat="server" Text=" " ForeColor="#FF3300"></asp:Label>  
  </h1>
  <asp:XmlDataSource ID="xmldsYears" runat="server" 
          DataFile="~/App_Data/Years.xml"></asp:XmlDataSource>
        <asp:XmlDataSource ID="xmldsMonths" runat="server" 
            DataFile="~/App_Data/Months.xml"></asp:XmlDataSource>                  
  <asp:Wizard 
          ID="AddNewResumeWizard" runat="server" ActiveStepIndex="0" 
        StartNextButtonText="Продолжить" StepNextButtonText="Продолжить" 
          Width="200px" FinishCompleteButtonText="Добавить реэюме" onnextbuttonclick="Wizard1_NextButtonClick" 
                                                
          onfinishbuttonclick="AddNewResumeWizard_FinishButtonClick" 
    Height="460px" FinishPreviousButtonText="Назад" 
                                                StepPreviousButtonText="Назад" 
    style="text-align: left" 
    onactivestepchanged="AddNewResumeWizard_ActiveStepChanged">
          <StepStyle HorizontalAlign="Center" />
          <WizardSteps>
              <asp:WizardStep runat="server" title="Личные данные">
            
            <ajaxToolkit:CascadingDropDown ID="cddCountry" 
             runat="server" TargetControlID="ddlResumeCountry"
            Category="Country"  PromptText="Пожалуйста выберите страну"  LoadingText="[Загрузка списка стран...]"
            ServicePath="~/Services/Geography.asmx" 
    ServiceMethod="GetCountries" Enabled="True" />              

   <ajaxToolkit:CascadingDropDown ID="cddRegion" runat="server"  TargetControlID="ddlResumeRegion"
            Category="Region"  PromptText="Пожалуйста выберите регион"  LoadingText="[Загрузка списка регионов...]"
            ServicePath="~/Services/Geography.asmx" 
    ServiceMethod="GetRegions" ParentControlID="ddlResumeCountry" />              
<ajaxToolkit:CascadingDropDown ID="cddState" runat="server"  TargetControlID="ddlResumeState"
            Category="State"  PromptText="Пожалуйста выберите город"  LoadingText="[Загрузка списка городов...]"
            ServicePath="~/Services/Geography.asmx" 
    ServiceMethod="GetStates" ParentControlID="ddlResumeRegion" />
            <table border="0" width="400">
              <tr>
                <td align="right">
                    *Имя:
                </td>
                <td align="left">
                  <asp:TextBox ID="ResumeNameTextBox" runat="server" Width="200px" 
                  />
                    <ajaxToolkit:TextBoxWatermarkExtender ID="ResumeNameTextBox_TextBoxWatermarkExtender" 
                        runat="server" Enabled="True" TargetControlID="ResumeNameTextBox" 
                        WatermarkCssClass="watermarked" WatermarkText="Введите ваше имя">
                    </ajaxToolkit:TextBoxWatermarkExtender>
                </td>
              </tr>
               <tr>
                <td align="right">
                    *Фамилия:
                </td>
                <td align="left">
                  <asp:TextBox ID="ResumeLastNameTextBox" runat="server" Width="200px" 
                  />
                    <ajaxToolkit:TextBoxWatermarkExtender ID="ResumeLastNameTextBox_TextBoxWatermarkExtender" 
                        runat="server" Enabled="True" TargetControlID="ResumeLastNameTextBox" WatermarkCssClass="watermarked" 
                         WatermarkText="Введите вашу фамилию">
                    </ajaxToolkit:TextBoxWatermarkExtender>
                </td>
              </tr>
               <tr>
                <td align="right">
                    Отчество:
                </td>
                <td align="left">
                  <asp:TextBox ID="ResumeSurnameTextBox" runat="server" Width="200px" 
                  />
                    <ajaxToolkit:TextBoxWatermarkExtender ID="ResumeSurnameTextBox_TextBoxWatermarkExtender" 
                        runat="server" Enabled="True" TargetControlID="ResumeSurnameTextBox" WatermarkCssClass="watermarked" 
                         WatermarkText="Введите ваше отчество">
                    </ajaxToolkit:TextBoxWatermarkExtender>
                </td>
              </tr>
              <tr>
                <td align="right">
                    *Дата рождения:
                </td>
                <td align="left">
                    <asp:TextBox ID="BirthDayDayTextBox" runat="server" Width="26px">01</asp:TextBox>
                    <asp:DropDownList ID="ddlBirthDayMonth" runat="server" DataSourceID="xmldsMonths" 
                        DataTextField="text" DataValueField="value" Width="91px">
                    </asp:DropDownList>
                    <asp:TextBox ID="BirthDayYearTextBox" runat="server" Width="55px">1980</asp:TextBox>
                    
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/Images/Calendar_scheduleHS.png" />
                    
                </td>
              </tr>
              <tr>
                <td align="right">
                    *Контактные телефоны:
                </td>
                <td align="left">
                    <asp:TextBox ID="PhonesTextBox" runat="server" Width="200px"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" 
                        runat="server" Enabled="True" TargetControlID="PhonesTextBox" WatermarkCssClass="watermarked" 
                         WatermarkText="Введите ваши контактные телефоны">
                    </ajaxToolkit:TextBoxWatermarkExtender>
                </td>
              </tr>
              <tr>
                <td align="right">
                    *Адр. электронной почты:
                </td>
                <td align="left">
                    <asp:TextBox ID="EmailTextBox" runat="server" Width="200px"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" 
                        runat="server" Enabled="True" TargetControlID="EmailTextBox" WatermarkCssClass="watermarked" 
                         WatermarkText="Введите ваш email-адрес ">
                    </ajaxToolkit:TextBoxWatermarkExtender>
                </td>
              </tr>
              <tr>
                <td align="right">
                    *Личная страница(web-сайт):
                </td>
                <td align="left">
                    <asp:TextBox ID="WebsiteTextBox" runat="server" Width="200px"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" 
                        runat="server" Enabled="True" TargetControlID="WebsiteTextBox" WatermarkCssClass="watermarked" 
                         WatermarkText="Введите адрес вашей страницы в интернете">
                    </ajaxToolkit:TextBoxWatermarkExtender>
                </td>
              </tr>
              <tr>
                <td align="right">
                    *Пол:
                </td>
                <td align="left">
                    <asp:DropDownList ID="ddlSex" runat="server" Width="200px">
                        <asp:ListItem Value="1">Мужской</asp:ListItem>
                        <asp:ListItem Value="2">Женский</asp:ListItem>
                        <asp:ListItem Selected="True" Value="0">Не имеет значения</asp:ListItem>
                    </asp:DropDownList>
                </td>
              </tr>
              <tr>
                <td align="right" valign="top">
                    *Cтрана (выбрана):&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:DropDownList ID="ddlResumeCountry" runat="server" Width="200px">
                    </asp:DropDownList>

                    <asp:Panel ID="CountryCHeadPanel" runat="server" CssClass="collapsePanelHeader"> 
                      <div style="padding:5px; cursor: pointer; vertical-align: middle;"> 
                        <asp:ImageButton ID="CountryCHeadImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Добавить...)"/>
                        <asp:Label ID="CountryCHeadLabel" runat="server">(Добавить...)</asp:Label>
                      </div>
                    </asp:Panel>
                    <asp:Panel ID="CountryCPanel" runat="server" CssClass="collapsePanel" Height="0">
                        Введите название страны:<br />
                    <asp:TextBox ID="NewCountryTextBox" runat="server" Width="200px"></asp:TextBox>

                        <ajaxToolkit:TextBoxWatermarkExtender ID="NewCountryTextBox_TextBoxWatermarkExtender" 
                            runat="server" Enabled="True" TargetControlID="NewCountryTextBox" WatermarkCssClass="watermarked" WatermarkText="Наименование новой страны">
                        </ajaxToolkit:TextBoxWatermarkExtender>

                    </asp:Panel>

                    <ajaxToolkit:CollapsiblePanelExtender ID="cpeDemo0" runat="Server"
                      TargetControlID="CountryCPanel"
                      ExpandControlID="CountryCHeadPanel"
                      CollapseControlID="CountryCHeadPanel" 
                      Collapsed="True"
                      TextLabelID="CountryCHeadLabel"
                      ImageControlID="CountryCHeadImage"    
                      ExpandedText="(Скрыть панель добавления...)"
                      CollapsedText="(Добавить...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                      SkinID="CollapsiblePanelDemo" />
                </td>
              </tr>
              <tr>
                <td align="right" valign="top">
                    *Регион:&nbsp;
                    </td>
                <td align="left" valign="top">
                    <asp:DropDownList ID="ddlResumeRegion" runat="server" Width="200px">
                    </asp:DropDownList>
                    
                    <asp:Panel ID="RegionCHeadPanel" runat="server" CssClass="collapsePanelHeader"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                      
                        <asp:ImageButton ID="RegionCHeadImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Добавить...)"/>
                        <asp:Label ID="RegionCHeadLabel" runat="server">(Добавить...)</asp:Label>

                    </div>
                    </asp:Panel>
                    <asp:Panel ID="RegionCPanel" runat="server" CssClass="collapsePanel" Height="0">
                        Введите название региона:<br />
                      <asp:TextBox ID="NewRegionTextBox" runat="server" Width="200px"></asp:TextBox>

                        <ajaxToolkit:TextBoxWatermarkExtender ID="NewRegionTextBox_TextBoxWatermarkExtender" 
                            runat="server" Enabled="True" TargetControlID="NewRegionTextBox" WatermarkCssClass="watermarked" WatermarkText="Название нового региона">
                        </ajaxToolkit:TextBoxWatermarkExtender>

                    </asp:Panel>

                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
                      TargetControlID="RegionCPanel"
                      ExpandControlID="RegionCHeadPanel"
                      CollapseControlID="RegionCHeadPanel" 
                      Collapsed="True"
                      TextLabelID="RegionCHeadLabel"
                      ImageControlID="RegionCHeadImage"    
                      ExpandedText="(Скрыть панель добавления...)"
                      CollapsedText="(Добавить...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                      SkinID="CollapsiblePanelDemo" />          
                  </td>
              </tr>
              <tr>
                <td align="right" valign="top">
                    Город (необязательно)&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:DropDownList ID="ddlResumeState" runat="server" Width="200px">
                    </asp:DropDownList>

                    <asp:Panel ID="StateCHeadPanel" runat="server" CssClass="collapsePanelHeader"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">

                        <asp:ImageButton ID="StateCHeadImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Добавить...)"/>
                        <asp:Label ID="StateCHeadLabel" runat="server">(Добавить...)</asp:Label>
                        
                    </div>
                    </asp:Panel>
                    <asp:Panel ID="StateCPanel" runat="server" CssClass="collapsePanel" Height="0">
                        Введите имя города (нас. пункта):<br />
                      <asp:TextBox ID="NewStateTextBox" runat="server" Width="200px"></asp:TextBox>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="NewStateTextBox_TextBoxWatermarkExtender" 
                            runat="server" Enabled="True" TargetControlID="NewStateTextBox" WatermarkCssClass="watermarked" WatermarkText="Наименование нового нас. пункта">
                        </ajaxToolkit:TextBoxWatermarkExtender>
                    </asp:Panel>

                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
                      TargetControlID="StateCPanel"
                      ExpandControlID="StateCHeadPanel"
                      CollapseControlID="StateCHeadPanel" 
                      Collapsed="True"
                      TextLabelID="StateCHeadLabel"
                      ImageControlID="StateCHeadImage"    
                      ExpandedText="(Скрыть панель добавления...)"
                      CollapsedText="(Добавить...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                      SkinID="CollapsiblePanelDemo" />          
                  </td>
              </tr>
              <tr>
                <td align="right" class="style3">
                    *Адрес прописки:&nbsp;
                </td>
                <td align="left">
                    <asp:TextBox ID="AdressTextBox" runat="server" Text='<%# Bind("Adress") %>' 
                        Width="200px"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="AdressTextBox_TextBoxWatermarkExtender" 
                        runat="server" Enabled="True" TargetControlID="AdressTextBox" WatermarkCssClass="watermarked" WatermarkText="Введите адрес прописки в паспорте">
                    </ajaxToolkit:TextBoxWatermarkExtender>
                  </td>
              </tr>
              <tr>
                <td align="right">
                    *Фактический адрес проживания:&nbsp;
                </td>
                <td align="left">
                    <asp:TextBox ID="FactAdressTextBox" runat="server" 
                        Text='<%# Bind("FactAdress") %>' Width="200px"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="FactAdressTextBox_TextBoxWatermarkExtender" 
                        runat="server" Enabled="True" TargetControlID="FactAdressTextBox" WatermarkCssClass="watermarked" WatermarkText="Введите адрес фактического проживания">
                    </ajaxToolkit:TextBoxWatermarkExtender>
                  </td>
              </tr>
            </table>
            <table border="0" width="100%">
                     <tr><td></td><td></td></tr>
                     <tr><td colspan="2">
                     
                         <!--
                         <br/><asp:Label ID="FinishStatusLabel" runat="server" Text=""></asp:Label>-->
                     </td></tr>
                   </table>
            <br />    
                  &nbsp;<asp:CheckBox ID="IsHotCheckBox" runat="server" 
                Checked='<%# Bind("IsHot") %>' Text="Разместить в горящем списке" 
                      Enabled="False" />
            <br />
              </asp:WizardStep>
              <asp:WizardStep runat="server" title="Основные данные резюме">
              <ajaxToolkit:CascadingDropDown ID="cddProfGroups" runat="server" 
               Category="ProfGroup" Enabled="True" LoadingText="[Загрузка списка отраслей...]" 
               PromptText="Пожалуйста, выберите отрасль" ServiceMethod="GetDropDownContents" 
               ServicePath="~/Services/PrGroupService.asmx" TargetControlID="ddlResumeProfGroup">
           </ajaxToolkit:CascadingDropDown>
           <ajaxToolkit:CascadingDropDown ID="cddProfs" runat="server" Category="Prof" 
               ContextKey="" Enabled="True" LoadingText="[Загрузка списка специальностей...]" 
               ParentControlID="ddlResumeProfGroup" 
               PromptText="Пожалуйста, выберите специализацию" ServiceMethod="GetProfs" 
               ServicePath="~/Services/PrGroupService.asmx" TargetControlID="ddlResumeSpec" 
               UseContextKey="True">
           </ajaxToolkit:CascadingDropDown>    
                  <table border="0">
                      <tr>
                          <td align="right" class="style2">
                              *Стаж работы:
                          </td>
                          <td align="left">
                              <asp:TextBox ID="ResumeWorkStageTextBox" runat="server" Width="200px"></asp:TextBox>
                              <ajaxToolkit:FilteredTextBoxExtender ID="ResumeWorkStageTextBox_FilteredTextBoxExtender" 
                                  runat="server" Enabled="True" TargetControlID="ResumeWorkStageTextBox" FilterType="Numbers">
                              </ajaxToolkit:FilteredTextBoxExtender>
                              <ajaxToolkit:TextBoxWatermarkExtender ID="ResumeWorkStageTextBox_TextBoxWatermarkExtender" 
                                  runat="server" Enabled="True" TargetControlID="ResumeWorkStageTextBox" WatermarkCssClass="watermarked" WatermarkText="Пусто - без стажа">
                              </ajaxToolkit:TextBoxWatermarkExtender>
                          </td>
                      </tr>
                      <tr>
                          <td align="right" valign="top">
                              Отрасль:
                          </td>
                          <td align="left">
                              <asp:DropDownList ID="ddlResumeProfGroup" runat="server" Width="200px">
                              </asp:DropDownList>
      
                     <asp:Panel ID="ProfGroupCHeadPanel" runat="server" CssClass="collapsePanelHeader"> 
                      <div style="padding:5px; cursor: pointer; vertical-align: middle;"> 
                        <asp:ImageButton ID="ProfGroupCHeadImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Добавить...)"/>
                        <asp:Label ID="ProfGroupCHeadLabel" runat="server">(Добавить...)</asp:Label>
                      </div>
                    </asp:Panel>
                    <asp:Panel ID="ProfGroupCPanel" runat="server" CssClass="collapsePanel" Height="0">
                        Наименование отрасли:<br />
                      <asp:TextBox ID="NewPrGroupTextBox" runat="server" Width="200px"></asp:TextBox>

                        <ajaxToolkit:TextBoxWatermarkExtender ID="NewPrGroupTextBox_TextBoxWatermarkExtender" 
                            runat="server" Enabled="True" TargetControlID="NewPrGroupTextBox" WatermarkCssClass="watermarked" WatermarkText="Введите наименование новой отрасли">
                        </ajaxToolkit:TextBoxWatermarkExtender>

                    </asp:Panel>

                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="Server"
                      TargetControlID="ProfGroupCPanel"
                      ExpandControlID="ProfGroupCHeadPanel"
                      CollapseControlID="ProfGroupCHeadPanel" 
                      Collapsed="True"
                      TextLabelID="ProfGroupCHeadLabel"
                      ImageControlID="ProfGroupCHeadImage"    
                      ExpandedText="(Скрыть панель добавления...)"
                      CollapsedText="(Добавить...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                      SkinID="CollapsiblePanelDemo" />
                                  
                          </td>
                      </tr>
                      <tr>
                          <td align="right" valign="top">
                              Специализация:
                          </td>
                          <td align="left">
                              <asp:DropDownList ID="ddlResumeSpec" runat="server" Width="200px">
                              </asp:DropDownList>
                              
                    <asp:Panel ID="SpecCHeadPanel" runat="server" CssClass="collapsePanelHeader"> 
                      <div style="padding:5px; cursor: pointer; vertical-align: middle;"> 
                        <asp:ImageButton ID="SpecCHeadImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Добавить...)"/>
                        <asp:Label ID="SpecCHeadLabel" runat="server">(Добавить...)</asp:Label>
                      </div>
                    </asp:Panel>
                    <asp:Panel ID="SpecCPanel" runat="server" CssClass="collapsePanel" Height="0">
                        Наименование специализации:<br />
                                  <asp:TextBox ID="NewResumeSpecTextBox" runat="server" Width="200px"></asp:TextBox>

                        <ajaxToolkit:TextBoxWatermarkExtender ID="NewResumeSpecTextBox_TextBoxWatermarkExtender" 
                            runat="server" Enabled="True" TargetControlID="NewResumeSpecTextBox" WatermarkCssClass="watermarked" WatermarkText="Введите наименование новой специальности">
                        </ajaxToolkit:TextBoxWatermarkExtender>

                    </asp:Panel>

                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender4" runat="Server"
                      TargetControlID="SpecCPanel"
                      ExpandControlID="SpecCHeadPanel"
                      CollapseControlID="SpecCHeadPanel" 
                      Collapsed="True"
                      TextLabelID="SpecCHeadLabel"
                      ImageControlID="SpecCHeadImage"    
                      ExpandedText="(Скрыть панель добавления...)"
                      CollapsedText="(Добавить...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                       />
                          </td>
                      </tr>
                      <tr>
                          <td align="right" class="style2">
                              *Желаемая должность:&nbsp;
                          </td>
                          <td align="left">
                              <asp:TextBox ID="EcpecProfNameTextBox" runat="server" 
                                   Width="200px"></asp:TextBox>
                              <ajaxToolkit:AutoCompleteExtender
                                runat="server" 
                                BehaviorID="AutoCompleteEx"
                                ID="autoComplete1" 
                                TargetControlID="EcpecProfNameTextBox"
                                ServicePath="~/Services/AllSpecsAutoComplete.asmx" 
                                ServiceMethod="GetCompletionList"
                                MinimumPrefixLength="2" 
                                CompletionInterval="1000"
                                EnableCaching="True"
                                CompletionSetCount="20"
                                CompletionListCssClass="autocomplete_completionListElement" 
                                CompletionListItemCssClass="autocomplete_listItem" 
                                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                DelimiterCharacters=";, :"
                                 
                                Enabled="True">
                                <Animations>
                                    <OnShow>
                                        <Sequence>
                                        <OpacityAction Opacity="0" />
                                        <HideAction Visible="true" />
                                        <ScriptAction Script="
                                        // Cache the size and setup the initial size
                                        var behavior = $find('AutoCompleteEx');
                                        if (!behavior._height) {
                                        var target = behavior.get_completionList();
                                        behavior._height = target.offsetHeight - 2;
                                         target.style.height = '0px';
                                        }" />
                                        <Parallel Duration=".4">
                                        <FadeIn />
                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                                        </Parallel>
                                        </Sequence>
                                    </OnShow>
                                <OnHide>   
                            <Parallel Duration=".4">
                                <FadeOut />
                                <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                            </Parallel>
                            </OnHide>
                        </Animations>
                        </ajaxToolkit:AutoCompleteExtender>     
                              <ajaxToolkit:TextBoxWatermarkExtender ID="EcpecProfNameTextBox_TextBoxWatermarkExtender" 
                                  runat="server" Enabled="True" TargetControlID="EcpecProfNameTextBox" WatermarkCssClass="watermarked" WatermarkText="Список предполагаемых должностей">
                              </ajaxToolkit:TextBoxWatermarkExtender>
                          </td>
                      </tr>
                      <tr>
                          <td align="right">
                              *Зарплата от:&nbsp;
                          </td>
                          <td align="left">
                              <asp:TextBox ID="SalaryMinTextBox" runat="server" Width="200px"></asp:TextBox>
                              <ajaxToolkit:FilteredTextBoxExtender ID="SalaryMinTextBox_FilteredTextBoxExtender" 
                                  runat="server" Enabled="True" TargetControlID="SalaryMinTextBox" FilterType="Numbers">
                              </ajaxToolkit:FilteredTextBoxExtender>
                              <ajaxToolkit:TextBoxWatermarkExtender ID="SalaryMinTextBox_TextBoxWatermarkExtender" 
                                  runat="server" Enabled="True" TargetControlID="SalaryMinTextBox" WatermarkCssClass="watermarked" WatermarkText="Минимальная оплата Вашего труда">
                              </ajaxToolkit:TextBoxWatermarkExtender>
                          </td>
                      </tr>
                      <tr>
                          <td align="right" class="style2">
                              *Уровень образования:&nbsp;
                          </td>
                          <td align="left">
                              <asp:DropDownList ID="ddlBuildingType" runat="server" 
                                  DataSourceID="sdsBuldingsType" DataTextField="Name" 
                                  DataValueField="BuildingType_ID" Height="22px" Width="200px">
                              </asp:DropDownList>
                          </td>
                      </tr>
                      <tr>
                          <td align="right" class="style2">
                              *Предпочитаемый график работы:&nbsp;
                          </td>
                          <td align="left">
                              <asp:DropDownList ID="ddlWorkMode" runat="server" DataSourceID="sdsWorkMode" 
                                  DataTextField="Name" DataValueField="WorkMode_ID"  
                                  Width="200px">
                              </asp:DropDownList>
                          </td>
                      </tr>
                      <tr>
                          <td align="right" valign="top">
                              Профессиональный опыт и подготовка
                              <asp:BulletedList ID="BulletedList3" runat="server" CssClass="small_desc_text" 
                                  Width="169px">
                                  <asp:ListItem> Курсы, тренинги </asp:ListItem>
                                  <asp:ListItem> Сложность выполняемых задач, должностных обязанностей, функций </asp:ListItem>
                                  <asp:ListItem> Владение иностранными языками </asp:ListItem>
                                  <asp:ListItem> Владение компьютером </asp:ListItem>
                              </asp:BulletedList>
                          </td>
                          <td valign="top">
                              <br />
                              <asp:TextBox ID="SpecWorkModeTextBox" runat="server" Height="149px" 
                                  TextMode="MultiLine" Width="259px"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td align="right" valign="top">
                              Дополнительная информация
                              <asp:BulletedList ID="BulletedList4" runat="server" CssClass="small_desc_text" 
                                  Width="169px">
                                  <asp:ListItem> Наличие водительских прав </asp:ListItem>
                                  <asp:ListItem> Рекомендации и ссылки </asp:ListItem>
                                  <asp:ListItem> Ключевые навыки и достижения </asp:ListItem>
                                  <asp:ListItem> Занятия в свободное время </asp:ListItem>
                                  <asp:ListItem> Дополнительные сведения </asp:ListItem>
                              </asp:BulletedList>
                          </td>
                          <td valign="top">
                              <asp:TextBox ID="SpecIfsTextBox" runat="server" Height="149px" 
                                  TextMode="MultiLine" Width="263px"></asp:TextBox>
                          </td>
                      </tr>
                  </table>
              </asp:WizardStep>
              <asp:WizardStep runat="server" Title="Образование">
                  <asp:SqlDataSource ID="sdsAddBuildToNewResume" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
                      InsertCommand="ResumeBuildInsertRetIDCommand" 
                      InsertCommandType="StoredProcedure" 
                      ProviderName="<%$ ConnectionStrings:PMConnectionString.ProviderName %>">
                      <InsertParameters>
                          <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                          <asp:Parameter Name="SpName" Type="String" />
                          <asp:Parameter Name="BegYear" Type="Int32" />
                          <asp:Parameter Name="EndYear" Type="Int32" />
                          <asp:Parameter Name="InstName" Type="String" />
                          <asp:Parameter Name="Resume_ID" Type="Int32" />
                          <asp:Parameter Name="BegMonth" Type="String" />
                          <asp:Parameter Name="EndMonth" Type="String" />
                          <asp:Parameter Name="LearnMode" Type="String" />
                          <asp:Parameter Name="BuildingType_ID" Type="Int32" />
                          <asp:Parameter Direction="InputOutput" Name="NewBuild_ID" Type="Int32" />
                      </InsertParameters>
                  </asp:SqlDataSource>
                  <asp:ObjectDataSource ID="odsCurrentSessionBuildings" runat="server" 
                      DeleteMethod="Delete" InsertMethod="Insert" 
                      OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                      TypeName="dsUnattachedSessionResBuildsTableAdapters.PSP_BuildingTableAdapter" 
                      UpdateMethod="Update">
                      <DeleteParameters>
                          <asp:Parameter Name="Original_Building_ID" Type="Int32" />
                      </DeleteParameters>
                      <InsertParameters>
                          <asp:Parameter Name="SpName" Type="String" />
                          <asp:Parameter Name="InstName" Type="String" />
                          <asp:Parameter Name="INSSession_ID" Type="String" />
                      </InsertParameters>
                      <SelectParameters>
                          <asp:SessionParameter DefaultValue="0" Name="INSSession_ID" 
                              SessionField="SessionID" Type="String" />
                      </SelectParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="SpName" Type="String" />
                          <asp:Parameter Name="InstName" Type="String" />
                          <asp:Parameter Name="INSSession_ID" Type="String" />
                          <asp:Parameter Name="Original_Building_ID" Type="Int32" />
                      </UpdateParameters>
                  </asp:ObjectDataSource>
                  <asp:SqlDataSource ID="sdsCurrentSessionBuildings" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
                      EnableViewState="False" 
                      
                      SelectCommand="SELECT SpName, InstName, INSSession_ID FROM PSP_Building WHERE (INSSession_ID = @INSSession_ID) AND (Resume_ID=-1)">
                      <SelectParameters>
                          <asp:SessionParameter Name="INSSession_ID" SessionField="SessionID" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="False">
                    <ContentTemplate>
                        <asp:Label ID="BuildCountLabel" runat="server" Text="Добавлено" 
                            style="text-align:left" Font-Bold="True"></asp:Label>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataSourceID="odsCurrentSessionBuildings" 
                            EmptyDataText="Не добавлено ни одного образования" EnableViewState="False" ForeColor="#333333" 
                            GridLines="None" DataKeyNames="Building_ID">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="SpName" HeaderText="Специальность" 
                                    SortExpression="SpName">
                                    <ItemStyle Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="InstName" HeaderText="Учебное заведение" 
                                    SortExpression="InstName" >
                                    <ItemStyle Width="250px" />
                                </asp:BoundField>
                                <asp:CommandField ButtonType="Image" 
                                    CancelImageUrl="~/Images/Logic/Small/undo.png" CancelText="Отмена" 
                                    EditImageUrl="~/Images/Logic/Small/edit.png" EditText="Править" 
                                    ShowEditButton="True" UpdateImageUrl="~/Images/Logic/Small/apply.png" 
                                    UpdateText="Принять изменения" />
                                <asp:CommandField ButtonType="Image" 
                                    DeleteImageUrl="~/Images/Logic/Small/del.png" DeleteText="Удалить" 
                                    ShowDeleteButton="True" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                HorizontalAlign="Left" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
                        
                    </ContentTemplate>         

                      <Triggers>
                          <asp:AsyncPostBackTrigger ControlID="AddBuildButton" EventName="Click" />
                      </Triggers>

                  </asp:UpdatePanel>                                    
                  <table style="width:100%;">
                      <tr>
                          <td class="rigth_oriented_td">
                              Наименование учебного заведения:</td>
                          <td class="left_oriented_td">
                              <asp:TextBox ID="BuildOrgNameTextBox" runat="server" Width="200"></asp:TextBox>
                              <ajaxToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="BOAutoCompleteEx"
                                    ID="BOrgAutoCompleteExtender" 
                                    TargetControlID="BuildOrgNameTextBox"
                                    ServicePath="~/Services/wsBuildOrgNameAutoComplete.asmx" 
                                    ServiceMethod="GetCompletionList"
                                    MinimumPrefixLength="2" 
                                    CompletionInterval="1000"
                                    EnableCaching="True"
                                    CompletionSetCount="20"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    DelimiterCharacters=";, :"
                                     
                                    Enabled="True">
                                    <Animations>
                                        <OnShow>
                                            <Sequence>
                                            <OpacityAction Opacity="0" />
                                            <HideAction Visible="true" />
                                            <ScriptAction Script="
                                            // Cache the size and setup the initial size
                                            var behavior = $find('BOAutoCompleteEx');
                                            if (!behavior._height) {
                                            var target = behavior.get_completionList();
                                            behavior._height = target.offsetHeight - 2;
                                             target.style.height = '0px';
                                            }" />
                                            <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" EndValueScript="$find('BOAutoCompleteEx')._height" />
                                            </Parallel>
                                            </Sequence>
                                        </OnShow>
                                    <OnHide>   
                                <Parallel Duration=".4">
                                    <FadeOut />
                                    <Length PropertyKey="height" StartValueScript="$find('BOAutoCompleteEx')._height" EndValue="0" />
                                </Parallel>
                                </OnHide>
                            </Animations>
                            </ajaxToolkit:AutoCompleteExtender>
                              <ajaxToolkit:TextBoxWatermarkExtender ID="BuildOrgNameTextBox_TextBoxWatermarkExtender" 
                                  runat="server" Enabled="True" TargetControlID="BuildOrgNameTextBox" 
                                  WatermarkCssClass="watermarked" 
                                  WatermarkText="Введите наименование учебного заведения">
                              </ajaxToolkit:TextBoxWatermarkExtender>
                          </td>
                      </tr>
                      <tr>
                          <td class="rigth_oriented_td">
                              Специальность:</td>
                          <td class="left_oriented_td">
                              <asp:TextBox ID="BuildSpecNameTextBox" runat="server" Width="200"></asp:TextBox>
                              <ajaxToolkit:TextBoxWatermarkExtender ID="BuildSpecNameTextBox_TextBoxWatermarkExtender" 
                                  runat="server" Enabled="True" TargetControlID="BuildSpecNameTextBox" 
                                  WatermarkCssClass="watermarked" 
                                  WatermarkText="Введите наименование специальности">
                              </ajaxToolkit:TextBoxWatermarkExtender>
                          </td>
                      </tr>
                      <tr>
                            <td align="right">
                                Год/мес. поступл.:
                              
                            </td>
                            <td align="left">
                              <asp:TextBox ID="BegYearTextBox" runat="server" Width="80" />
                                <ajaxToolkit:TextBoxWatermarkExtender ID="BegYearTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="BegYearTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Введите год">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                              <ajaxToolkit:FilteredTextBoxExtender ID="BegYearFiltExt" runat="server" TargetControlID="BegYearTextBox" FilterType="Numbers">
                              </ajaxToolkit:FilteredTextBoxExtender>
                                <asp:DropDownList ID="ddlBuildBegMonth" runat="server" 
                                    DataSourceID="xmldsMonths" DataTextField="text" DataValueField="value" 
                                     Width="76px">
                                </asp:DropDownList>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                                Год/мес. оконч.:
                              
                            </td>
                            <td align="left">
                              <asp:TextBox ID="EndYearTextBox" runat="server" Width="80" />
                                <ajaxToolkit:TextBoxWatermarkExtender ID="EndYearTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="EndYearTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Введите год">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                              <ajaxToolkit:FilteredTextBoxExtender ID="EndYearFiltExt" runat="server" TargetControlID="EndYearTextBox" FilterType="Numbers">
                              </ajaxToolkit:FilteredTextBoxExtender>
                                <asp:DropDownList ID="ddlBuildEndMonth" runat="server" Width="76px" 
                                    DataSourceID="xmldsMonths" DataTextField="text" DataValueField="value">
                                </asp:DropDownList>
                                
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                                Форма обучения:
                              
                            </td>
                            <td align="left">
                              <asp:DropDownList ID="ddlBuildMode" runat="server" Width="200px" 
                                >
                                  <asp:ListItem Value="Очно" Selected="True">Очно</asp:ListItem>
                                  <asp:ListItem Value="Заочно">Заочно</asp:ListItem>
                              </asp:DropDownList>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                                Образование:
                              
                            </td>
                            <td align="left">
                              <asp:DropDownList ID="ddlBResumeBuildType" runat="server" 
                                DataSourceID="sdsBuldingsType" DataTextField="Name" 
                                DataValueField="BuildingType_ID" 
                                Width="200px">
                              </asp:DropDownList>
                            </td>
                          </tr>
                  </table>
                  <div align="right">
                      <asp:Button ID="AddBuildButton" runat="server" Text="Добавить образование" 
                            OnClick="Button2_Click" Width="250px"/>
                  </div>
              </asp:WizardStep>
              <asp:WizardStep runat="server" Title="Предыдущая работа">
                  <asp:ObjectDataSource ID="odsCurrentSessionOldWorks" runat="server" 
                      DeleteMethod="Delete" InsertMethod="Insert" 
                      OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                      TypeName="dsUnattachedSessionResWorksTableAdapters.PSP_OldWorksTableAdapter" 
                      UpdateMethod="Update">
                      <DeleteParameters>
                          <asp:Parameter Name="Original_OldWork_ID" Type="Int32" />
                      </DeleteParameters>
                      <InsertParameters>
                          <asp:Parameter Name="OrgName" Type="String" />
                          <asp:Parameter Name="SpecialName" Type="String" />
                      </InsertParameters>
                      <SelectParameters>
                          <asp:SessionParameter Name="INSSession_ID" SessionField="SessionID" 
                              Type="String" />
                      </SelectParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="OrgName" Type="String" />
                          <asp:Parameter Name="SpecialName" Type="String" />
                          <asp:Parameter Name="Original_OldWork_ID" Type="Int32" />
                      </UpdateParameters>
                  </asp:ObjectDataSource>
                  <asp:SqlDataSource ID="sdsCurrentSessionOldWorks" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
                      
                      SelectCommand="SELECT OrgName, SpecialName FROM PSP_OldWorks WHERE (Resume_ID=-1) AND (INSSession_ID = @INSSession_ID)">
                      <SelectParameters>
                          <asp:SessionParameter Name="INSSession_ID" SessionField="SessionID" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:UpdatePanel ID="UpdatePanel2" runat="server" EnableViewState="False">
                      <ContentTemplate>
                          <asp:Label ID="OldWorkCountLabel" runat="server" Font-Bold="True" 
                              style="text-align:left">Добавлено</asp:Label>
                          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                              CellPadding="4" DataSourceID="odsCurrentSessionOldWorks" 
                              EmptyDataText="Не добавлена предыдущая работа" ForeColor="#333333" 
                              GridLines="None">
                              <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                              <Columns>
                                  <asp:BoundField DataField="OrgName" HeaderText="Организация" 
                                      SortExpression="OrgName">
                                      <ItemStyle Width="150px" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="SpecialName" HeaderText="Должность" 
                                      SortExpression="SpecialName" />
                                  <asp:CommandField ButtonType="Image" 
                                      CancelImageUrl="~/Images/Logic/Small/undo.png" CancelText="Отмена" 
                                      DeleteText="Удалить" EditImageUrl="~/Images/Logic/Small/edit.png" 
                                      EditText="Править" ShowEditButton="True" />
                                  <asp:CommandField ButtonType="Image" 
                                      DeleteImageUrl="~/Images/Logic/Small/del.png" DeleteText="Удалить" 
                                      ShowDeleteButton="True" />
                              </Columns>
                              <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                              <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                              <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                              <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                  HorizontalAlign="Left" />
                              <EditRowStyle BackColor="#999999" />
                              <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                          </asp:GridView>
                      </ContentTemplate>
                      <Triggers>
                          <asp:AsyncPostBackTrigger ControlID="AddOldWorkButton" EventName="Click" />
                      </Triggers>
                  </asp:UpdatePanel>

                  <table style="width:100%;">
                      <tr>
                          <td class="rigth_oriented_td">
                              Организация:</td>
                          <td class="left_oriented_td">
                              <asp:TextBox ID="OWOrgNameTextBox" runat="server" Width="200"></asp:TextBox>
                              <ajaxToolkit:TextBoxWatermarkExtender ID="OWOrgNameTextBox_TextBoxWatermarkExtender" 
                                  runat="server" Enabled="True" TargetControlID="OWOrgNameTextBox" 
                                  WatermarkCssClass="watermarked" 
                                  WatermarkText="Введите наименование организации">
                              </ajaxToolkit:TextBoxWatermarkExtender>
                          </td>
                      </tr>
                      <tr>
                          <td class="rigth_oriented_td">
                              Специальность:</td>
                          <td class="left_oriented_td">
                              <asp:TextBox ID="OWSpecNameTextBox" runat="server" Width="200"></asp:TextBox>
                              <ajaxToolkit:TextBoxWatermarkExtender ID="OWSpecNameTextBox_TextBoxWatermarkExtender" 
                                  runat="server" Enabled="True" TargetControlID="OWSpecNameTextBox" 
                                  WatermarkCssClass="watermarked" WatermarkText="Введите наим. исп. должности">
                              </ajaxToolkit:TextBoxWatermarkExtender>
                          </td>
                      </tr>
                      <tr>
                            <td align="right">
                                Год/мес. приема.:
                            </td>
                            <td align="left">
                              <asp:TextBox ID="OWStartYearTextBox" runat="server" Width="80" />
                                <ajaxToolkit:TextBoxWatermarkExtender ID="OWStartYearTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="OWStartYearTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Введите год">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                              <ajaxToolkit:FilteredTextBoxExtender ID="OWStartYearFilter" runat="server" FilterType="Numbers" TargetControlID="OWStartYearTextBox">
                              </ajaxToolkit:FilteredTextBoxExtender>
                                <asp:DropDownList ID="ddlOWStartMonth" runat="server" 
                                    DataSourceID="xmldsMonths" DataTextField="text" DataValueField="value" 
                                     Width="76px">
                                </asp:DropDownList>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                                Год/мес. увольнения.:
                            </td>
                            <td align="left">
                              <asp:TextBox ID="OWEndYearTextBox" runat="server" Width="80" />
                                <ajaxToolkit:TextBoxWatermarkExtender ID="OWEndYearTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="OWEndYearTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Введите год">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                              <ajaxToolkit:FilteredTextBoxExtender ID="OWEndYearFilter" runat="server" FilterType="Numbers" TargetControlID="OWEndYearTextBox">
                              </ajaxToolkit:FilteredTextBoxExtender>
                                <asp:DropDownList ID="ddlOWEndMonth" runat="server" Width="76px" 
                                    DataSourceID="xmldsMonths" DataTextField="text" DataValueField="value">
                                </asp:DropDownList>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                                Причина увольнения:
                              
                            </td>
                            <td align="left">
                                <asp:TextBox ID="OWDismissingReason" runat="server" Width="200px"></asp:TextBox>
                                <ajaxToolkit:TextBoxWatermarkExtender ID="OWDismissingReason_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="OWDismissingReason" 
                                    WatermarkCssClass="watermarked" WatermarkText="Введите причину увольнения">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                                Достижения, условия работы:
                              
                            </td>
                            <td align="left">
                                <asp:TextBox ID="OWWorkModeTextBox" runat="server" Width="200px" Rows="3" 
                                    TextMode="MultiLine"></asp:TextBox>
                                <ajaxToolkit:TextBoxWatermarkExtender ID="OWWorkModeTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="OWWorkModeTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Описание особых условий работы">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                                Описание занимаемой должности:
                              
                            </td>
                            <td align="left">
                                <asp:TextBox ID="OWOrgSpecTextBox" runat="server" Width="200px" Rows="3" 
                                    TextMode="MultiLine"></asp:TextBox>
                                <ajaxToolkit:TextBoxWatermarkExtender ID="OWOrgSpecTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="OWOrgSpecTextBox" 
                                    WatermarkCssClass="watermarked" 
                                    WatermarkText="Введите специфику деятельности организации">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                            </td>
                          </tr>
                  </table>
                  <div align="right">
                      <asp:Button ID="AddOldWorkButton" runat="server" Text="Добавить место работы" 
                          OnClick="Button3_Click" Width="250px" />
                  </div>
              </asp:WizardStep>
              <asp:WizardStep runat="server" Title="Готово">
                <h2>Последний шаг</h2>
                <h3>Загрузить фото</h3>
                  <asp:Image ID="UserPhotoPreviewImage" runat="server" BorderColor="#CCCCCC" 
                      BorderStyle="Dashed" BorderWidth="2px" ImageUrl="~/Images/no_foto.JPG" />
                  <br/>
                <div>
                    <asp:FileUpload ID="UserPhotoFileUpload" runat="server"/> 
                       
                </div>
                   <asp:Button ID="UploadButton" runat="server" Text="Загрузить на сервер" 
                      Width="150px" OnClick="UploadButton_Click" /><br/> 
                   <asp:Label ID="UploadingStateLabel" runat="server" Text=""></asp:Label>
                  <br/>
                  <center>
                     <uc2:QuickUserCreateControl ID="QuickUserCreateControl1" runat="server" />
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
                              OnClick="ImChangeButton_Click"/>
                      </td>
                      </tr>
                    </table>  
                      <br/>
                     Код подтверждения (5 символов): 
                      <asp:TextBox ID="acknowledgementTextBox" runat="server"></asp:TextBox>  
                      <br/><asp:Label ID="ImageAckStatusLabel" runat="server" Font-Bold="True" 
                      ForeColor="#FF3300"></asp:Label>
                  </div>
                     
                   <asp:HiddenField ID="hfUserFotoFilePath" runat="server" Visible="False" 
                      Value="~/Images/no_foto.JPG" />  
              </asp:WizardStep>
          </WizardSteps>
      </asp:Wizard>
  </asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">

        
    <style type="text/css">
        .style2
        {
            text-decoration: underline;
        }
    </style>


</asp:Content>

