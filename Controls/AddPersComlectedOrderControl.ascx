<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddPersComlectedOrderControl.ascx.cs" Inherits="Controls_AddPersComlectedOrderControl" %>
<%@ Register src="VacancyOrgSet.ascx" tagname="VacancyOrgSet" tagprefix="uc1" %>
<%@ Register Src="~/Controls/VakantManip.ascx" TagPrefix="User" 
TagName="VakantManip"%>
<%@ Register TagPrefix="sota" Namespace="Sota.Web.UI.WebControls" Assembly="RandomCodeImage"%>
<%@ Register src="QuickUserCreateControl.ascx" tagname="QuickUserCreateControl" tagprefix="uc2" %>
<link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
<link href="../Styles/ssVSSample.css" rel="stylesheet" type="text/css" />

<h1>
    
    Заявка на подбор персонала
    <asp:Label ID="AlertLabel" runat="server" Text=" "></asp:Label></h1>
    
    <asp:SqlDataSource ID="sdsBuldingsType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [Name], [BuildingType_ID] FROM [PSP_BuildingTypes]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsProfGroup" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT [ProfGroup_ID], [Name] FROM [PSP_ProfGroup] ORDER BY [ProfGroup_ID]">
</asp:SqlDataSource>
    
    <asp:HiddenField ID="hfCompanyID" runat="server" Value="-1" />
    
    <asp:SqlDataSource ID="sdsRegisteredCompany" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    
    SelectCommand="SELECT Name, Adress, Organization_ID FROM PSP_Organizations WHERE (Organization_ID = @Organization_ID) AND (UserLogin = @UserName) AND (UserLogin&lt;&gt;'Guest')">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="-1" Name="Organization_ID" 
                QueryStringField="CompanyID" Type="Int32" />
            <asp:SessionParameter DefaultValue="Guest" Name="UserName" 
                SessionField="UserName" />
        </SelectParameters>
</asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sdsWorkMode" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [WorkMode_ID], [Name] FROM [PSP_WorkMode] ORDER BY [WorkMode_ID]">
    </asp:SqlDataSource>

<asp:Wizard ID="VacancyOrderWizard" runat="server" ActiveStepIndex="0" 
    onfinishbuttonclick="VacancyOrderWizard_FinishButtonClick" Height="180px" 
    Width="100%" StepNextButtonType="Link" 
    StepNextButtonText="Выберите одну из организаций или добавьте новую " 
    StartNextButtonText="Добавить информацию о новой организации" FinishCompleteButtonText="Добавить вакансию" 
    onnextbuttonclick="VacancyOrderWizard_NextButtonClick" 
    FinishPreviousButtonText="Назад">
  <WizardSteps>
   <asp:WizardStep ID="WzStepFirst" runat="server" Title="Сведения об организации">
   <h2>Сведения об организации-заказчике</h2>
   
   <uc1:VacancyOrgSet ID="VacancyOrgSet1" runat="server" />
   <asp:SqlDataSource ID="sdsAddOrganization" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    InsertCommand="INSERT INTO PSP_Organizations(Name, Adress, Phones, Website, Email, CompanyAge, WorkerQuantity, ProfGroup_ID, HeadFullName, UserLogin) VALUES (@Name, @Adress, @Phones, @Website, @Email, @CompanyAge, @WorkerQuantity, @ProfGroup_ID, @HeadFullName, @UserLogin)" 
    ProviderName="<%$ ConnectionStrings:PMConnectionString.ProviderName %>">
        <InsertParameters>
            <asp:ControlParameter ControlID="OrgNameTextBox" DefaultValue="" Name="Name" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="AdressTextBox" Name="Adress" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="PhonesTextBox" Name="Phones" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="WebTextBox" Name="Website" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="EMailTextBox" Name="Email" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="OrgAgeTextBox" DefaultValue="0" 
                Name="CompanyAge" PropertyName="Text" />
            <asp:ControlParameter ControlID="WQTextBox" DefaultValue="1" 
                Name="WorkerQuantity" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlOrgProfType" DefaultValue="1" 
                Name="ProfGroup_ID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="HeadNameTextBox" DefaultValue="" 
                Name="HeadFullName" PropertyName="Text" />
            <asp:SessionParameter Name="UserLogin" SessionField="Username" 
                DefaultValue="'guest'" />
        </InsertParameters>
</asp:SqlDataSource>
        <table Border="0" CellPadding="2" CellSpacing="2">
            <tr>
                <td align="right" valign="top">
                    Название компании:</td>
                <td>
                    <asp:TextBox ID="OrgNameTextBox" runat="server" 
                         Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Основной вид деятельности компании:</td>
                <td>
                    <asp:DropDownList ID="ddlOrgProfType" runat="server" 
                        DataSourceID="sdsProfGroup" DataTextField="Name" DataValueField="ProfGroup_ID" 
                         Width="200px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Руководитель компании:</td>
                <td>
                    <asp:TextBox ID="HeadNameTextBox" runat="server" Width="200px"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender5" 
                                    runat="server" Enabled="True" TargetControlID="HeadNameTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="ФИО руководителя (работодателя)">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Телефон/факс:</td>
                <td>
                    <asp:TextBox ID="OrgPhonesTextBox" runat="server" Width="200px"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>

                            <td align="right" valign="top">
                                Электронная почта:
                            </td>
                            <td>
                                <asp:TextBox ID="OrgEMailTextBox" runat="server" Width="200px"></asp:TextBox>
                                <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" 
                                    runat="server" Enabled="True" TargetControlID="OrgEMailTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Например mail@mycompany.ru">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                            </td>

            </tr>
            <tr>
                <td align="right" valign="top">
                    Сайт организации:</td>
                <td valign="bottom">
                    <asp:TextBox ID="OrgWebTextBox" runat="server" Width="200px"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" 
                                    runat="server" Enabled="True" TargetControlID="OrgWebTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Например www.mycompany.ru">
                                </ajaxToolkit:TextBoxWatermarkExtender> 
                </td>
            </tr>
            
            <tr>
                <td align="right" valign="top">
                    Юридический адрес организации:
                     
                </td>
                <td>
                    <asp:TextBox ID="OrgAdressTextBox" runat="server" Height="58px" 
                        TextMode="MultiLine" Width="200px"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" 
                                    runat="server" Enabled="True" TargetControlID="OrgAdressTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Полный адрес работодателя">
                                </ajaxToolkit:TextBoxWatermarkExtender>    
                </td>
            </tr>
            <tr>

                            <td align="right" valign="top">
                                &nbsp; Год образования организации:</td>
                            <td class="style1">
                                <asp:TextBox ID="OrgAgeTextBox" runat="server" Width="200px"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="OrgAgeTextBox_FilteredTextBoxExtender" 
                                    runat="server" Enabled="True" FilterType="Numbers" 
                                    TargetControlID="OrgAgeTextBox">
                                </ajaxToolkit:FilteredTextBoxExtender>
                                <ajaxToolkit:TextBoxWatermarkExtender ID="OrgAgeTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="OrgAgeTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="По умолчанию - 0">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                            </td>

            </tr>
            <tr style="visibility:hidden; height:5px;">
                <td align="right" valign="top">
                    Количество служащих в компании:</td>
                <td>
                    <asp:TextBox ID="OrgWQTextBox" runat="server" Width="200px"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="OrgWQFilterEx" 
                                    runat="server" Enabled="True" FilterType="Numbers" 
                                    TargetControlID="OrgWQTextBox">
                                </ajaxToolkit:FilteredTextBoxExtender>
                                <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" 
                                    runat="server" Enabled="True" TargetControlID="OrgWQTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Введите число сотрудников компании">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                </td>
            </tr>
       </table>
     
   </asp:WizardStep> 
   <asp:WizardStep ID="WzStepLast" runat="server" Title="Информация о вакансии">
 
           <asp:HiddenField ID="hfVacancyCountry" runat="server" Value="1" />
           <asp:HiddenField ID="hfVacancyRegion" runat="server" Value="1" />
           <asp:HiddenField ID="hfVacancyState" runat="server" Value="1" />
           <asp:HiddenField ID="hfVacancyProfGroup" runat="server" Value="1" />
           <asp:HiddenField ID="hfVacancySpec" runat="server" Value="1" />
           <asp:HiddenField ID="hfOrgProfGroup" runat="server" Value="1" />
           <asp:SqlDataSource ID="sdsInsertVacancyWithRegistCompany" runat="server" 
               ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
               InsertCommand="AddVacancyWithCompanyID" InsertCommandType="StoredProcedure" 
               
               SelectCommand="SELECT PSP_Vakanties.* FROM PSP_Vakanties WHERE (Vakant_ID = @Vakant_ID)">
               <InsertParameters>
                   <asp:SessionParameter DefaultValue="Unnamed" Name="UserLogin" 
                       SessionField="UserName" Type="String" />
                   <asp:ControlParameter ControlID="QuantityTextBox" DefaultValue="1" 
                       Name="Quantity" PropertyName="Text" Type="Int32" />
                   <asp:ControlParameter ControlID="WorkStageMinTextBox" DefaultValue="0" 
                       Name="WorkStageMin" PropertyName="Text" Type="Int32" />
                   <asp:ControlParameter ControlID="AgeMinTextBox" DefaultValue="0" Name="AgeMin" 
                       PropertyName="Text" Type="Int32" />
                   <asp:ControlParameter ControlID="AgeMaxTextBox" DefaultValue="0" Name="AgeMax" 
                       PropertyName="Text" Type="Int32" />
                   <asp:ControlParameter ControlID="EcpecProfNameTextBox" DefaultValue="" 
                       Name="EcpecProfName" PropertyName="Text" Type="String" />
                   <asp:ControlParameter ControlID="SpecWorkModeTextBox" Name="SpecWorkMode" 
                       PropertyName="Text" Type="String" />
                   <asp:ControlParameter ControlID="SpecIfsTextBox" Name="SpecIfs" 
                       PropertyName="Text" Type="String" DefaultValue="" />
                   <asp:ControlParameter ControlID="SalaryMinTextBox" DefaultValue="0" 
                       Name="SalaryMin" PropertyName="Text" Type="Double" />
                   <asp:ControlParameter ControlID="SalaryMaxTextBox" DefaultValue="0" 
                       Name="SalaryMax" PropertyName="Text" Type="Double" />
                   <asp:ControlParameter ControlID="ddlVacSex" DefaultValue="0" Name="Sex" 
                       PropertyName="SelectedValue" Type="Int32" />
                   <asp:ControlParameter ControlID="ddlVacBuildingType" DefaultValue="1" 
                       Name="BuildingType_ID" PropertyName="SelectedValue" Type="Int32" />
                   <asp:ControlParameter ControlID="hfVacancyState" DefaultValue="1" Name="State_ID" 
                       PropertyName="Value" Type="Int32" />
                   <asp:ControlParameter ControlID="hfVacancySpec" DefaultValue="1" 
                       Name="Professional_ID" PropertyName="Value" Type="Int32" />
                   <asp:ControlParameter ControlID="hfVacancyProfGroup" DefaultValue="1" 
                       Name="VacantPrGroup_ID" PropertyName="Value" Type="Int32" />
                   <asp:ControlParameter ControlID="hfVacancyRegion" DefaultValue="1" Name="Region_ID" 
                       PropertyName="Value" Type="Int32" />
                   <asp:ControlParameter ControlID="hfVacancyCountry" DefaultValue="1" 
                       Name="Country_ID" PropertyName="Value" Type="Int32" />
                   <asp:Parameter DefaultValue="" Name="RETURN_VALUE" Type="Int32" 
                       Direction="ReturnValue" />
                   <asp:ControlParameter ControlID="hfCompanyID" 
                       DefaultValue="-1" Name="CompanyID" 
                       PropertyName="Value" Type="Int32" />
               </InsertParameters>
               <SelectParameters>
                   <asp:QueryStringParameter DefaultValue="0" Name="Vakant_ID" 
                       QueryStringField="Vakant_ID" />
               </SelectParameters>
           </asp:SqlDataSource>
           
           <asp:SqlDataSource ID="sdsInsertVacancyWithCompany" runat="server" 
               ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
               InsertCommand="AddVacancyWithCompany" InsertCommandType="StoredProcedure" 
               SelectCommand="SELECT PSP_Vakanties.* FROM PSP_Vakanties WHERE (Vakant_ID = @Vakant_ID)">
               <InsertParameters>
                   <asp:ControlParameter ControlID="OrgNameLabel" 
                       DefaultValue="Не указано название организации" Name="OrgName" 
                       PropertyName="Text" Type="String" />
                   <asp:ControlParameter ControlID="OrgAdressLabel" DefaultValue="" Name="Adress" 
                       PropertyName="Text" Type="String" />
                   <asp:ControlParameter ControlID="OrgPhonesLabel" DefaultValue="" Name="Phones" 
                       PropertyName="Text" Type="String" />
                   <asp:ControlParameter ControlID="OrgWWWLabel" DefaultValue="www.company.ru" 
                       Name="Website" PropertyName="Text" Type="String" />
                   <asp:ControlParameter ControlID="OrgEmailLabel" DefaultValue="" Name="Email" 
                       PropertyName="Text" Type="String" />
                   <asp:ControlParameter ControlID="OrgAgeLabel" DefaultValue="0" 
                       Name="CompanyAge" PropertyName="Text" Type="String" />
                   <asp:Parameter DefaultValue="0" Name="WorkerQuantity" Type="Int32" />
                   <asp:ControlParameter ControlID="hfOrgProfGroup" DefaultValue="1" 
                       Name="ProfGroup_ID" PropertyName="Value" Type="Int32" />
                   <asp:ControlParameter ControlID="HeadFullNameLabel" DefaultValue="" 
                       Name="HeadFullName" PropertyName="Text" Type="String" />
                   <asp:SessionParameter DefaultValue="Unnamed" Name="UserLogin" 
                       SessionField="UserName" Type="String" />
                   <asp:ControlParameter ControlID="QuantityTextBox" DefaultValue="1" 
                       Name="Quantity" PropertyName="Text" Type="Int32" />
                   <asp:ControlParameter ControlID="WorkStageMinTextBox" DefaultValue="0" 
                       Name="WorkStageMin" PropertyName="Text" Type="Int32" />
                   <asp:ControlParameter ControlID="AgeMinTextBox" DefaultValue="0" Name="AgeMin" 
                       PropertyName="Text" Type="Int32" />
                   <asp:ControlParameter ControlID="AgeMaxTextBox" DefaultValue="0" Name="AgeMax" 
                       PropertyName="Text" Type="Int32" />
                   <asp:ControlParameter ControlID="EcpecProfNameTextBox" DefaultValue="" 
                       Name="EcpecProfName" PropertyName="Text" Type="String" />
                   <asp:ControlParameter ControlID="SpecWorkModeTextBox" Name="SpecWorkMode" 
                       PropertyName="Text" Type="String" />
                   <asp:ControlParameter ControlID="SpecIfsTextBox" DefaultValue="" Name="SpecIfs" 
                       PropertyName="Text" Type="String" />
                   <asp:ControlParameter ControlID="SalaryMinTextBox" DefaultValue="0" 
                       Name="SalaryMin" PropertyName="Text" Type="Double" />
                   <asp:ControlParameter ControlID="SalaryMaxTextBox" DefaultValue="0" 
                       Name="SalaryMax" PropertyName="Text" Type="Double" />
                   <asp:ControlParameter ControlID="ddlVacSex" DefaultValue="0" Name="Sex" 
                       PropertyName="SelectedValue" Type="Int32" />
                   <asp:ControlParameter ControlID="ddlVacBuildingType" DefaultValue="1" 
                       Name="BuildingType_ID" PropertyName="SelectedValue" Type="Int32" />
                   <asp:ControlParameter ControlID="hfVacancyState" DefaultValue="1" 
                       Name="State_ID" PropertyName="Value" Type="Int32" />
                   <asp:ControlParameter ControlID="hfVacancySpec" DefaultValue="1" 
                       Name="Professional_ID" PropertyName="Value" Type="Int32" />
                   <asp:ControlParameter ControlID="hfVacancyProfGroup" DefaultValue="1" 
                       Name="VacantPrGroup_ID" PropertyName="Value" Type="Int32" />
                   <asp:ControlParameter ControlID="hfVacancyRegion" DefaultValue="1" 
                       Name="Region_ID" PropertyName="Value" Type="Int32" />
                   <asp:ControlParameter ControlID="hfVacancyCountry" DefaultValue="1" 
                       Name="Country_ID" PropertyName="Value" Type="Int32" />
               </InsertParameters>
               <SelectParameters>
                   <asp:QueryStringParameter DefaultValue="0" Name="Vakant_ID" 
                       QueryStringField="Vakant_ID" />
               </SelectParameters>
           </asp:SqlDataSource>
           
           <asp:MultiView ID="CompInfoMultiView" runat="server" ActiveViewIndex="0">
               <asp:View ID="NewCompView" runat="server">
                   <table Border="0" CellPadding="2" CellSpacing="2" width="100%">
                       <tr>
                           <td class="style2">
                               <asp:Label ID="OrgNameLabel" runat="server" Font-Bold="True" 
                                   Text="Не указано наименование"></asp:Label>
                           </td>
                           <td>
                               &nbsp;</td>
                       </tr>
                       <tr>
                           <td class="style2">
                               Руководитель:
                               <asp:Label ID="HeadFullNameLabel" runat="server" Font-Bold="True" Text="Label"></asp:Label>
                               <br />
                               Тел./факс:
                               <asp:Label ID="OrgPhonesLabel" runat="server" Font-Bold="True" Text="Label"></asp:Label>
                           </td>
                           <td valign="top">
                               Направление деятельности:
                               <asp:Label ID="OrgPrGroupLabel" runat="server" Font-Bold="True" Text="Label"></asp:Label>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               Адрес:
                               <asp:Label ID="OrgAdressLabel" runat="server" Font-Bold="True" Text="Label"></asp:Label>
                           </td>
                           <td>
                               Электронная почта:
                               <asp:Label ID="OrgEmailLabel" runat="server" Font-Bold="True" Text="Label"></asp:Label>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               Год образования:
                               <asp:Label ID="OrgAgeLabel" runat="server" Font-Bold="True" Text="0"></asp:Label>
                           </td>
                           <td>
                               Сайт компании:
                               <asp:Label ID="OrgWWWLabel" runat="server" Font-Bold="True" Text="Label"></asp:Label>
                           </td>
                       </tr>
                   </table>
               </asp:View>
               <asp:View ID="ExistCompView" runat="server">
                   <h3>Добавление вакансии по имеющейся организации</h3>
                   <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsRegisteredCompany">
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label><br/>
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("Adress") %>'></asp:Label>
                     </ItemTemplate>
                   </asp:Repeater>
               </asp:View>
           </asp:MultiView>
           
           <ajaxToolkit:CascadingDropDown ID="cddProfGroups" runat="server" 
               Category="ProfGroup" Enabled="True" LoadingText="[Загрузка списка отраслей...]" 
               PromptText="Пожалуйста, выберите отрасль" ServiceMethod="GetDropDownContents" 
               ServicePath="~/Services/PrGroupService.asmx" TargetControlID="ddlVacancyProfGroup">
           </ajaxToolkit:CascadingDropDown>
           <ajaxToolkit:CascadingDropDown ID="cddProfs" runat="server" Category="Prof" 
               ContextKey="" Enabled="True" LoadingText="[Загрузка списка специальностей...]" 
               ParentControlID="ddlVacancyProfGroup" 
               PromptText="Пожалуйста, выберите специализацию" ServiceMethod="GetProfs" 
               ServicePath="~/Services/PrGroupService.asmx" TargetControlID="ddlVacancySpec" 
               UseContextKey="True">
           </ajaxToolkit:CascadingDropDown>
           
       <ajaxToolkit:CascadingDropDown ID="cddCountry" runat="server" 
           Category="Country" Enabled="True" LoadingText="[Загрузка списка стран...]" 
           PromptText="Пожалуйста выберите страну" ServiceMethod="GetCountries" 
           ServicePath="~/Services/Geography.asmx" TargetControlID="ddlOrgCountry">
       </ajaxToolkit:CascadingDropDown>
       <ajaxToolkit:CascadingDropDown ID="cddRegion" runat="server" Category="Region" 
           Enabled="True" LoadingText="[Загрузка списка регионов...]" 
           ParentControlID="ddlOrgCountry" PromptText="Пожалуйста выберите регион" 
           ServiceMethod="GetRegions" ServicePath="~/Services/Geography.asmx" 
           TargetControlID="ddlOrgRegion">
       </ajaxToolkit:CascadingDropDown>
       <ajaxToolkit:CascadingDropDown ID="cddState" runat="server" Category="State" 
           Enabled="True" LoadingText="[Загрузка списка городов...]" 
           ParentControlID="ddlOrgRegion" PromptText="Пожалуйста выберите город" 
           ServiceMethod="GetStates" ServicePath="~/Services/Geography.asmx" 
           TargetControlID="ddlOrgState">
       </ajaxToolkit:CascadingDropDown>
           
               <table Border="0" CellPadding="2" CellSpacing="2">
               <tr>
                   <td class="insert_table_caption_td">
                       
                       
                   </td>
                   <td valign="top">
                       
                       </td>
               </tr>
               <tr>
                          <td align="right" valign="top">
                              Отрасль:
                          </td>
                          <td align="left">
                              <asp:DropDownList ID="ddlVacancyProfGroup" runat="server" Width="200px">
                              </asp:DropDownList>
                              
                    <asp:Panel ID="ProfGroupCHeadPanel" runat="server" CssClass="collapsePanelHeader"> 
                      <div style="padding:5px; cursor: pointer; vertical-align: middle;"> 
                        <asp:ImageButton ID="ProfGroupCHeadImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Добавить...)"/>
                        <asp:Label ID="ProfGroupCHeadLabel" runat="server">(Добавить...)</asp:Label>
                      </div>
                    </asp:Panel>
                    <asp:Panel ID="ProfGroupCPanel" runat="server" CssClass="collapsePanel" Height="0">
                        Наименование новой отрасли:<br />
                         <asp:TextBox ID="NewPrGroupTextBox" runat="server" Width="200px"></asp:TextBox>

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
                              <asp:DropDownList ID="ddlVacancySpec" runat="server" Width="200px">
                              </asp:DropDownList>
                              
                              <asp:Panel ID="SpecCHeadPanel" runat="server" CssClass="collapsePanelHeader"> 
                      <div style="padding:5px; cursor: pointer; vertical-align: middle;"> 
                        <asp:ImageButton ID="SpecCHeadImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Добавить...)"/>
                        <asp:Label ID="SpecCHeadLabel" runat="server">(Добавить...)</asp:Label>
                      </div>
                    </asp:Panel>
                    <asp:Panel ID="SpecCPanel" runat="server" CssClass="collapsePanel" Height="0">
                        Наименование новой специализации:<br />
                                  <asp:TextBox ID="NewResumeSpecTextBox" runat="server" Width="200px"></asp:TextBox>

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
                <td align="right" valign="top">
                    *Cтрана (выбрана):&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:DropDownList ID="ddlOrgCountry" runat="server" Width="200px">
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

                    </asp:Panel>

                    <ajaxToolkit:CollapsiblePanelExtender ID="cpeDemo" runat="Server"
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
                    <asp:DropDownList ID="ddlOrgRegion" runat="server" Width="200px">
                    </asp:DropDownList>
                    
                    <asp:Panel ID="RegionCHeadPanel" runat="server" CssClass="collapsePanelHeader"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                      
                        <asp:ImageButton ID="RegionCHeadImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Добавить...)"/>
                        <asp:Label ID="RegionCHeadLabel" runat="server">(Добавить...)</asp:Label>

                    </div>
                    </asp:Panel>
                    <asp:Panel ID="RegionCPanel" runat="server" CssClass="collapsePanel" Height="0">
                        Введите наименование нового региона:<br />
                                  <asp:TextBox ID="NewRegionTextBox" runat="server" Width="200px"></asp:TextBox>

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
                    Город (необязательно):&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:DropDownList ID="ddlOrgState" runat="server" Width="200px">
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
                   <td class="insert_table_caption_td">
                       Число мест по вакансии:
                       
                   </td>
                   <td valign="top">
                       <asp:TextBox ID="QuantityTextBox" runat="server" Width="200px"></asp:TextBox>
                       <ajaxToolkit:FilteredTextBoxExtender ID="QuantityTextBox_FilteredTextBoxExtender" 
                           runat="server" Enabled="True" FilterType="Numbers" 
                           TargetControlID="QuantityTextBox">
                       </ajaxToolkit:FilteredTextBoxExtender>
                       <ajaxToolkit:TextBoxWatermarkExtender ID="QuantityTextBox_TextBoxWatermarkExtender" 
                           runat="server" Enabled="True" TargetControlID="QuantityTextBox" 
                           WatermarkText="[Пусто - 1 свободное место]" 
                           WatermarkCssClass="watermarked">
                       </ajaxToolkit:TextBoxWatermarkExtender>
                       </td>
               </tr> 
               <tr>
                   <td class="insert_table_caption_td">
                       Стаж не менее (полное число лет):
                       
                   </td>
                   <td valign="top">
                       <asp:TextBox ID="WorkStageMinTextBox" runat="server" Width="200px"></asp:TextBox>
                       <ajaxToolkit:FilteredTextBoxExtender ID="WorkStageMinTextBox_FilteredTextBoxExtender" 
                           runat="server" Enabled="True" FilterType="Numbers" 
                           TargetControlID="WorkStageMinTextBox">
                       </ajaxToolkit:FilteredTextBoxExtender>
                       <ajaxToolkit:TextBoxWatermarkExtender ID="WorkStageMinTextBox_TextBoxWatermarkExtender" 
                           runat="server" Enabled="True" TargetControlID="WorkStageMinTextBox" 
                           WatermarkCssClass="watermarked" WatermarkText="Не введено - без стажа">
                       </ajaxToolkit:TextBoxWatermarkExtender>
                       </td>
               </tr>
               <tr>
                   <td class="insert_table_caption_td">
                       Возраст от:
                       
                   </td>
                   <td valign="top">
                       <asp:TextBox ID="AgeMinTextBox" runat="server" Width="85px"></asp:TextBox>
                       <ajaxToolkit:FilteredTextBoxExtender ID="AgeMinTextBox_FilteredTextBoxExtender" 
                           runat="server" Enabled="True" FilterType="Numbers" 
                           TargetControlID="AgeMinTextBox">
                       </ajaxToolkit:FilteredTextBoxExtender>
                       <ajaxToolkit:TextBoxWatermarkExtender ID="AgeMinTextBox_TextBoxWatermarkExtender" 
                           runat="server" Enabled="True" TargetControlID="AgeMinTextBox" 
                           WatermarkCssClass="watermarked" WatermarkText="Мин. возраст">
                       </ajaxToolkit:TextBoxWatermarkExtender>
                       до
                       <asp:TextBox ID="AgeMaxTextBox" runat="server" Width="85px"></asp:TextBox>
                       <ajaxToolkit:FilteredTextBoxExtender ID="AgeMaxTextBox_FilteredTextBoxExtender" 
                           runat="server" Enabled="True" FilterType="Numbers" 
                           TargetControlID="AgeMaxTextBox">
                       </ajaxToolkit:FilteredTextBoxExtender>
                       <ajaxToolkit:TextBoxWatermarkExtender ID="AgeMaxTextBox_TextBoxWatermarkExtender" 
                           runat="server" Enabled="True" TargetControlID="AgeMaxTextBox" 
                           WatermarkCssClass="watermarked" WatermarkText="Необязательно">
                       </ajaxToolkit:TextBoxWatermarkExtender>
                       </td>
               </tr>
               <tr>
                   <td class="insert_table_caption_td">
                       Штатное наименование должности:
                       
                   </td>
                   <td valign="top">
                       <asp:TextBox ID="EcpecProfNameTextBox" runat="server" Width="200px"></asp:TextBox>
                       
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
                            </OnHide></Animations>
                        </ajaxToolkit:AutoCompleteExtender> 
                       
                       <ajaxToolkit:TextBoxWatermarkExtender ID="EcpecProfNameTextBox_TextBoxWatermarkExtender" 
                           runat="server" Enabled="True" TargetControlID="EcpecProfNameTextBox" 
                           WatermarkCssClass="watermarked" WatermarkText="Имя должности на предприятии">
                       </ajaxToolkit:TextBoxWatermarkExtender>
                       </td>
               </tr>
               <tr>
                   <td class="insert_table_caption_td">
                       Контактное лицо:
                       
                   </td>
                   <td valign="top">
                       <asp:TextBox ID="ContactFaceTextBox" runat="server" Width="200px"></asp:TextBox>
                       <ajaxToolkit:TextBoxWatermarkExtender ID="ContactFaceTextBox_TextBoxWatermarkExtender" 
                           runat="server" Enabled="True" TargetControlID="ContactFaceTextBox" 
                           WatermarkCssClass="watermarked" WatermarkText="ФИО проводящего собеседование">
                       </ajaxToolkit:TextBoxWatermarkExtender>
                       </td>
               </tr>
               <tr>
                   <td class="insert_table_caption_td">
                       Описание должности
                       <asp:BulletedList ID="BulletedList1" runat="server" CssClass="small_desc_text">
                           <asp:ListItem> Выполняемые задачи, должностные обязанности, функции.
                           </asp:ListItem>
                           <asp:ListItem> Место в структуре организации (кому подчиняется, кто входит в 
                           подчинение, количество)
                           </asp:ListItem>
                           <asp:ListItem> Мед. страхование, оплата питания и транспорта
                           </asp:ListItem>
                           <asp:ListItem> Соц. пакет (дополнительно)
                           </asp:ListItem>
                           <asp:ListItem> Возможные перспективы
                           </asp:ListItem>
                           <asp:ListItem> Особый режим работы
                           </asp:ListItem>
                       </asp:BulletedList>
                       
                   </td>
                   <td valign="top">
                       <asp:TextBox ID="SpecWorkModeTextBox" runat="server" Height="250px" 
                           TextMode="MultiLine" Width="200px"></asp:TextBox>
                       </td>
               </tr>
               <tr>
                   <td class="insert_table_caption_td">
                       Прочие требования к кандидату
                       <asp:BulletedList ID="BulletedList2" runat="server" CssClass="small_desc_text">
                           <asp:ListItem> Практический опыт работы в определенной сфере
                           </asp:ListItem>
                           <asp:ListItem> Навыки в сфере компьютерных технологий
                           </asp:ListItem>
                           <asp:ListItem> Иностранные языки, степень владения
                           </asp:ListItem>
                           <asp:ListItem> Наличие водительских прав, личного а/м.
                           </asp:ListItem>
                           <asp:ListItem> Требования к личным качествам
                           </asp:ListItem>
                           <asp:ListItem> Требования к месту жительства
                           </asp:ListItem>
                           <asp:ListItem> Испытательный срок и его оплата
                           </asp:ListItem>
                           <asp:ListItem> Другие необходимые знания и прочие требования
                           </asp:ListItem>
                       </asp:BulletedList>
                       
                   </td>
                   <td valign="top">
                       <asp:TextBox ID="SpecIfsTextBox" runat="server" Height="250px" 
                           TextMode="MultiLine" Width="200px"></asp:TextBox>
                       </td>
               </tr>
               <tr>
                   <td class="insert_table_caption_td">
                       Требуемый уровень образования:
                       
                   </td>
                   <td valign="top">
                       <asp:DropDownList ID="ddlVacBuildingType" runat="server" 
                            DataSourceID="sdsBuldingsType" DataTextField="Name" 
                            DataValueField="BuildingType_ID" Width="200">
                        </asp:DropDownList>
                       </td>
               </tr>
               <tr>
                   <td class="insert_table_caption_td">
                       Предпочтительный пол:
                       
                   </td>
                   <td valign="top">
                       <asp:DropDownList ID="ddlVacSex" runat="server" Width="200px">
                        <asp:ListItem Value="1">Мужской</asp:ListItem>
                        <asp:ListItem Value="2">Женский</asp:ListItem>
                        <asp:ListItem Selected="True" Value="0">Не имеет значения</asp:ListItem>
                        </asp:DropDownList>
                       </td>
               </tr>
               <tr>
                   <td class="insert_table_caption_td">
                       График работы:
                       
                   </td>
                   <td valign="top">
                       <asp:DropDownList ID="ddlVacWorkMode" runat="server" DataSourceID="sdsWorkMode" 
                        DataTextField="Name" DataValueField="WorkMode_ID" Width="200px">
                        </asp:DropDownList>
                       </td>
               </tr>
               <tr>
                   <td class="insert_table_caption_td">
                       Зарплата от:
                       <br/>до
                   </td>
                   <td valign="top">
                       <asp:TextBox ID="SalaryMinTextBox" runat="server" Width="200px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="SalaryMinTextBox_FilteredTextBoxExtender" 
                           runat="server" Enabled="True" FilterType="Numbers" 
                           TargetControlID="SalaryMinTextBox">
                       </ajaxToolkit:FilteredTextBoxExtender>
                       <ajaxToolkit:TextBoxWatermarkExtender ID="SalaryMinTextBox_TextBoxWatermarkExtender" 
                           runat="server" Enabled="True" TargetControlID="SalaryMinTextBox" 
                           WatermarkCssClass="watermarked" WatermarkText="Пусто или 0-по договору">
                       </ajaxToolkit:TextBoxWatermarkExtender>
                        <br/>
                       <asp:TextBox ID="SalaryMaxTextBox" runat="server" Width="200px"></asp:TextBox>
                       <ajaxToolkit:FilteredTextBoxExtender ID="SalaryMaxTextBox_FilteredTextBoxExtender" 
                           runat="server" Enabled="True" FilterType="Numbers" 
                           TargetControlID="SalaryMaxTextBox">
                       </ajaxToolkit:FilteredTextBoxExtender>
                       <ajaxToolkit:TextBoxWatermarkExtender ID="SalaryMaxTextBox_TextBoxWatermarkExtender" 
                           runat="server" Enabled="True" TargetControlID="SalaryMaxTextBox" 
                           WatermarkCssClass="watermarked" WatermarkText="Необязательно">
                       </ajaxToolkit:TextBoxWatermarkExtender>
                       </td>
               </tr>      
           </table>
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
                              />
                      </td>
                      </tr>
                    </table>  
                      <br/>
                    Код подтверждения (5 символов): 
                      <asp:TextBox ID="acknowledgementTextBox" runat="server"></asp:TextBox>  
                    <br/><asp:Label ID="ImageAckStatusLabel" runat="server" Font-Bold="True" 
                      ForeColor="#FF3300"></asp:Label>
                  </div>   
   </asp:WizardStep> 
  </WizardSteps>
</asp:Wizard>    

 




 

    
    
    

    
    
