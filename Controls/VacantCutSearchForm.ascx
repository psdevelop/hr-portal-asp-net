<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VacantCutSearchForm.ascx.cs" Inherits="Controls_VacantCutSearchForm" %>

    <h3>Быстрый поиск работы</h3>
    <table style="background-color:#F7F6F3; height: 39px;" cellpadding="5" 
        cellspacing="5" width="100%">
      <tr>
        <td align="left">
            <u>Имя должности</u> или <u>ее 
            ID</u> (номер):
        </td>
        
        
      </tr>
      <tr>
        
        <td align="left">
            <asp:TextBox ID="KeyTextBox" runat="server" Width="100%"></asp:TextBox>
            <ajaxToolkit:TextBoxWatermarkExtender ID="KeyTextBox_TextBoxWatermarkExtender" 
                runat="server" Enabled="True" TargetControlID="KeyTextBox" WatermarkCssClass="watermarked" WatermarkText="Введите номер или часть имени должности">
            </ajaxToolkit:TextBoxWatermarkExtender>
        </td>
        
      </tr>
      <tr style="display:none;">
        
        <td align="left">
           <asp:DropDownList ID="ddlCutPrGroupList" runat="server" Width="100%" 
             DataSourceID="sdsPrGroups" DataTextField="Name" 
             DataValueField="ProfGroup_ID" Visible="False">
            </asp:DropDownList>  
        </td>
        
      </tr>
      
      <tr style="display:none;">
        
        <td align="left">
          <asp:DropDownList ID="ddlCutSrchRegion" runat="server" Width="100%" 
             DataSourceID="sdsRegions" DataTextField="Name" DataValueField="Region_ID" 
                Visible="False">
            </asp:DropDownList>   
        </td>
        
      </tr>
      
      <tr>
        <td colspan="2" align="center">
              
        </td>
      </tr>
    </table>

<center>
  <asp:Button ID="Button1" runat="server" Text="Искать" onclick="Button1_Click" 
        style="height: 26px" />  
</center>
             
<asp:SqlDataSource ID="sdsPrGroups" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT [ProfGroup_ID], dbo.GetReplaceText(Name,'Не указана отрасль','Любая отрасль') as Name FROM [PSP_ProfGroup]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="sdsRegions" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT Country_ID, dbo.GetReplaceText(Name,'Не указан регион','Любой регион') as Name, Region_ID FROM PSP_Region WHERE (Country_ID = @Country_ID) or (Region_ID=1)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="Country_ID" 
            SessionField="Country_ID" />
    </SelectParameters>
</asp:SqlDataSource>
<table border="0" cellpadding="2" cellspacing="2" width="100%"><tr><td>
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/VakantSearch.aspx">Расширенный поиск</asp:HyperLink>
  &nbsp;| 
  <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/EmployersList.aspx">Искать по организациям</asp:HyperLink>
  &nbsp;
</td></tr><tr><td>
<asp:LinkButton ID="LinkButton1" runat="server" 
          CssClass="contrast_link" onclick="LinkButton1_Click">Последние вакансии за</asp:LinkButton>
        <asp:TextBox ID="LastDayCountTextBox" runat="server" Width="30px">10</asp:TextBox>&nbsp;дней
        <ajaxToolkit:FilteredTextBoxExtender ID="ResumeWorkStageTextBox_FilteredTextBoxExtender" 
                                  runat="server" Enabled="True" TargetControlID="LastDayCountTextBox" FilterType="Numbers">
                              </ajaxToolkit:FilteredTextBoxExtender>
                              <ajaxToolkit:TextBoxWatermarkExtender ID="ResumeWorkStageTextBox_TextBoxWatermarkExtender" 
                                  runat="server" Enabled="True" TargetControlID="LastDayCountTextBox" WatermarkCssClass="watermarked" WatermarkText="Введите число дней">
                              </ajaxToolkit:TextBoxWatermarkExtender>
</td></tr></table>  
