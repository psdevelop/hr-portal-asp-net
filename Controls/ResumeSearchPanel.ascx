<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResumeSearchPanel.ascx.cs" Inherits="Controls_ResumeSearchPanel" %>

    <table style="background-color:#FFFFCC;" width="100%" cellpadding="1" cellspacing="1">
      <tr>
        <td align="right" width="300">
          Отрасль:
        </td>
        <td align="left">
           <asp:DropDownList ID="ddlProfGroups" runat="server" Width="200" /> 
        </td>
        <td width="20">
        </td>
      </tr>
      <tr>
        <td align="right">
          Специальность:
        </td>
        <td align="left">
           <asp:DropDownList ID="ddlProfs" runat="server" Width="200" />
        </td>
        <td width="20">
        </td>
      </tr>
      <tr>
        <td align="right">
          Должность или ID:
        </td>
        <td align="left">
            <asp:TextBox ID="KeyTextBox" runat="server" Width="200"></asp:TextBox>
            <ajaxToolkit:TextBoxWatermarkExtender ID="KeyTextBox_TextBoxWatermarkExtender" 
                runat="server" Enabled="True" TargetControlID="KeyTextBox" 
                WatermarkCssClass="watermarked" 
                WatermarkText="Введите номер или часть имени должности">
            </ajaxToolkit:TextBoxWatermarkExtender>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">
          Возраст:
        </td>
        <td align="left">
            от <asp:TextBox ID="AgeMinSearchTextBox" runat="server" Width="180px"></asp:TextBox>
            <ajaxToolkit:TextBoxWatermarkExtender ID="AgeMinSearchTextBox_TextBoxWatermarkExtender" 
                runat="server" Enabled="True" TargetControlID="AgeMinSearchTextBox" 
                WatermarkCssClass="watermarked" WatermarkText="Пусто - нет мин. ограничения">
            </ajaxToolkit:TextBoxWatermarkExtender>
            <ajaxToolkit:FilteredTextBoxExtender ID="AgeMinSearchTextBox_FilteredTextBoxExtender" 
                runat="server" Enabled="True" FilterType="Numbers" 
                TargetControlID="AgeMinSearchTextBox">
            </ajaxToolkit:FilteredTextBoxExtender>
            <br/> 
            до <asp:TextBox ID="AgeMaxSearchTextBox" runat="server" Width="157px"></asp:TextBox> 
            <ajaxToolkit:TextBoxWatermarkExtender ID="AgeMaxSearchTextBox_TextBoxWatermarkExtender" 
                runat="server" Enabled="True" TargetControlID="AgeMaxSearchTextBox" 
                WatermarkCssClass="watermarked" WatermarkText="Пусто - нет макс. ограничения">
            </ajaxToolkit:TextBoxWatermarkExtender>
            <ajaxToolkit:FilteredTextBoxExtender ID="AgeMaxSearchTextBox_FilteredTextBoxExtender" 
                runat="server" Enabled="True" FilterType="Numbers" 
                TargetControlID="AgeMaxSearchTextBox">
            </ajaxToolkit:FilteredTextBoxExtender>
            лет 
        </td>
        <td>
        </td>
      </tr>
   </table>
   <asp:Panel ID="SearchMoreParamsHeadPanel" runat="server" CssClass="collapsePanelHeader" BackColor="#FFFFCC">
                        <asp:ImageButton ID="SearchMoreParamsImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Больше параметров...)"/>
                        <asp:Label ID="SearchMoreParamsLabel" runat="server">(Больше параметров...)</asp:Label>
       </asp:Panel>
   <asp:Panel ID="SearchMoreParamsPanel" runat="server" CssClass="collapsePanel" 
                            Height="0" HorizontalAlign="center">
   <table style="background-color:#FFFFCC;" width="100%" cellpadding="1" cellspacing="1">
      <tr>
        <td align="right" width="300">
          Образование:
        </td>
        <td align="left">
            <asp:DropDownList ID="ddlBuildingType" runat="server" Width="200px" 
                DataSourceID="sdsBuldingsType" DataTextField="Name" 
                DataValueField="BuildingType_ID">
            </asp:DropDownList>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td align="right">
          Страна:
        </td>
        <td align="left">
           <asp:DropDownList ID="ddlSrchCountry" runat="server" Width="200px" >
                </asp:DropDownList>              
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td align="right">
          Регион:
        </td>
        <td align="left">
            <asp:DropDownList ID="ddlSrchRegion" runat="server" Width="200px" >
                </asp:DropDownList> 
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td align="right">
          Город (н.п.):
        </td>
        <td align="left">
            <asp:DropDownList ID="ddlSrchStates" runat="server" Width="200px" >
                </asp:DropDownList>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td align="right">
          Пол:
        </td>
        <td align="left">
            <asp:DropDownList ID="ddlSearchSexValue" runat="server" Width="200px">
              <asp:ListItem Selected="True" Text="Не указан" Value="0">
              </asp:ListItem>
              <asp:ListItem Text="Мужской" Value="1">
              </asp:ListItem>
              <asp:ListItem Text="Женский" Value="2">
              </asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td align="right">
          Опыт работы от:
        </td>
        <td align="left">
            <asp:TextBox ID="WStageTextBox" runat="server" Width="170"></asp:TextBox> 
            <ajaxToolkit:TextBoxWatermarkExtender ID="WStageTextBox_TextBoxWatermarkExtender" 
                runat="server" Enabled="True" TargetControlID="WStageTextBox" 
                WatermarkCssClass="watermarked" WatermarkText="Пусто - любой опыт работы">
            </ajaxToolkit:TextBoxWatermarkExtender>
            <ajaxToolkit:FilteredTextBoxExtender ID="WStageTextBox_FilteredTextBoxExtender" 
                runat="server" Enabled="True" FilterType="Numbers" 
                TargetControlID="WStageTextBox">
            </ajaxToolkit:FilteredTextBoxExtender>
            лет
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">
          Зарплата:
        </td>
        <td align="left">
            от<asp:TextBox ID="SearchSalaryMinTextBox" runat="server" Width="145"></asp:TextBox>
            <ajaxToolkit:TextBoxWatermarkExtender ID="SearchSalaryMinTextBox_TextBoxWatermarkExtender" 
                runat="server" Enabled="True" TargetControlID="SearchSalaryMinTextBox" 
                WatermarkCssClass="watermarked" WatermarkText="Пусто - нет мин. ограничения">
            </ajaxToolkit:TextBoxWatermarkExtender>
            <ajaxToolkit:FilteredTextBoxExtender ID="SearchSalaryMinTextBox_FilteredTextBoxExtender" 
                runat="server" Enabled="True" FilterType="Numbers" 
                TargetControlID="SearchSalaryMinTextBox">
            </ajaxToolkit:FilteredTextBoxExtender>
            <br/> 
            до<asp:TextBox ID="SearchSalaryMaxTextBox" runat="server" Width="145"></asp:TextBox>
            <ajaxToolkit:TextBoxWatermarkExtender ID="SearchSalaryMaxTextBox_TextBoxWatermarkExtender" 
                runat="server" Enabled="True" TargetControlID="SearchSalaryMaxTextBox" 
                WatermarkCssClass="watermarked" WatermarkText="Пусто - нет макс. ограничения">
            </ajaxToolkit:TextBoxWatermarkExtender>
            <ajaxToolkit:FilteredTextBoxExtender ID="SearchSalaryMaxTextBox_FilteredTextBoxExtender" 
                runat="server" Enabled="True" FilterType="Numbers" 
                TargetControlID="SearchSalaryMaxTextBox">
            </ajaxToolkit:FilteredTextBoxExtender>
            рублей 
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td align="right">
          Занятость:
        </td>
        <td align="left">
            <asp:DropDownList ID="ddlSearchWorkMode" runat="server" Width="200px" 
                DataSourceID="sdsWorkMode" DataTextField="Name" DataValueField="WorkMode_ID">
            </asp:DropDownList>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td align="right">
          Искать от:
        </td>
        <td align="left">
            <asp:DropDownList ID="DropDownList7" runat="server" Width="200" Enabled="False">
              <asp:ListItem Selected="True" Text="Всех" Value="0">
              </asp:ListItem>
              <asp:ListItem Text="Соискателей" Value="1">
              </asp:ListItem>
              <asp:ListItem Text="Кадрового агенства" Value="2">
              </asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td align="right">
          По словам:
        </td>
        <td align="left">
            <asp:TextBox ID="TextBox3" runat="server" Width="200" Wrap="True" 
                Enabled="False"></asp:TextBox> 
             
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td colspan="3" align="center">
              
        </td>
      </tr>
    </table>
    </asp:Panel>
        <ajaxToolkit:CollapsiblePanelExtender ID="cpeMoreSearchParams" runat="Server"
                      TargetControlID="SearchMoreParamsPanel"
                      ExpandControlID="SearchMoreParamsHeadPanel"
                      CollapseControlID="SearchMoreParamsHeadPanel" 
                      Collapsed="True"
                      TextLabelID="SearchMoreParamsLabel"
                      ImageControlID="SearchMoreParamsImage"    
                      ExpandedText="(Скрыть доп. параметры)"
                      CollapsedText="(Больше параметров...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                      SkinID="" />
<center>
  <asp:Button ID="Button1" runat="server" Text="Искать снова" onclick="Button1_Click" AutoPostBack="True" />
</center>

 
<ajaxToolkit:CascadingDropDown ID="cddProfGroups" runat="server" TargetControlID="ddlProfGroups"
            Category="ProfGroup"  PromptText="Пожалуйста, выберите отрасль"  LoadingText="[Загрузка отраслей...]"
            ServicePath="~/Services/PrGroupService.asmx" 
    ServiceMethod="GetDropDownContents" />
<ajaxToolkit:CascadingDropDown ID="cddProfs" runat="server" TargetControlID="ddlProfs"
            Category="Prof" PromptText="Пожалуйста, выберите специальность" LoadingText="[Загрузка специальностей...]"
            ServiceMethod="GetProfs" ServicePath="~/Services/PrGroupService.asmx" 
            ParentControlID="ddlProfGroups" ContextKey="" />
<asp:SqlDataSource ID="sdsRegions" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT Country_ID, Name, Region_ID FROM PSP_Region WHERE (Country_ID = @Country_ID) or (Region_ID=1)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="Country_ID" 
            SessionField="Country_ID" />
    </SelectParameters>
</asp:SqlDataSource>  

              
    <asp:SqlDataSource ID="sdsBuldingsType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [Name], [BuildingType_ID] FROM [PSP_BuildingTypes]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sdsWorkMode" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [WorkMode_ID], [Name] FROM [PSP_WorkMode] ORDER BY [WorkMode_ID] ASC">
    </asp:SqlDataSource>
<ajaxToolkit:CascadingDropDown ID="cddCountry" 
    runat="server" TargetControlID="ddlSrchCountry"
            Category="Country"  PromptText="Пожалуйста выберите страну"  LoadingText="[Загрузка списка стран...]"
            ServicePath="~/Services/Geography.asmx" 
    ServiceMethod="GetCountries" />              

   <ajaxToolkit:CascadingDropDown ID="cddRegion" runat="server"  TargetControlID="ddlSrchRegion"
            Category="Region"  PromptText="Пожалуйста выберите регион"  LoadingText="[Загрузка списка регионов...]"
            ServicePath="~/Services/Geography.asmx" 
    ServiceMethod="GetRegions" ParentControlID="ddlSrchCountry" />              
<ajaxToolkit:CascadingDropDown ID="cddState" runat="server"  TargetControlID="ddlSrchStates"
            Category="State"  PromptText="Пожалуйста выберите город"  LoadingText="[Загрузка списка городов...]"
            ServicePath="~/Services/Geography.asmx" 
    ServiceMethod="GetStates" ParentControlID="ddlSrchRegion" />