<%@Page Language="C#" Title="Платное предоставление данных вакансии" %>
<%@import namespace="System.Net" %>
<%
/*** sms:key v1.0.6 ***/
string key = "222242";
byte[] response =
    new WebClient().DownloadData("http://key.smscoin.com/key/?s_key=" + key
    + "&s_pair=" + (Request.Params["s_pair"] != null
        ? Server.UrlEncode(Request.Params["s_pair"].Length > 10
            ? Request.Params["s_pair"].Substring(0, 10)
            : Request.Params["s_pair"]) : "")
    + "&s_language=" + (Request.Params["s_language"] != null
        ? Server.UrlEncode(Request.Params["s_language"].Length > 10
            ? Request.Params["s_language"].Substring(0, 10)
            : Request.Params["s_language"]) : "")
    + "&s_ip=" + Request.Params["REMOTE_ADDR"]
    + "&s_url=" + Request.Params["SERVER_NAME"]
    + Server.HtmlEncode(Server.UrlEncode(Request.Params["URL"]
        + "?" + Request.Params["QUERY_STRING"])));
if(Encoding.ASCII.GetString(response, 0, 4) != "true") {
    Response.BinaryWrite(response);
    Response.End();
}
/*** sms:key end ***/
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="AdmStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .button
        {
            height: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <center>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

<asp:SqlDataSource ID="sdsBuldingsType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [Name], [BuildingType_ID] FROM [PSP_BuildingTypes]">
    </asp:SqlDataSource>
<asp:SqlDataSource ID="sdsProfGroup" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT [ProfGroup_ID], [Name] FROM [PSP_ProfGroup] ORDER BY [ProfGroup_ID]">
</asp:SqlDataSource>
    
<asp:SqlDataSource ID="sdsProfs" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT [Name], [Professional_ID] FROM [PSP_Professionals]">
</asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sdsStates" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT [State_ID], [Name] FROM [PSP_States]">
</asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sdsRegions" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT [Region_ID], [Name] FROM [PSP_Region]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="sdsCountries" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
    SelectCommand="SELECT [Country_ID], [Name] FROM [PSP_Country]">
</asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sdsWorkMode" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [WorkMode_ID], [Name] FROM [PSP_WorkMode] ORDER BY [WorkMode_ID]">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsProtectVacancyView" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="VacancyProtectSelectCommand" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="-1" Name="Vakant_ID" 
                QueryStringField="Vakant_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

<asp:FormView ID="fwCompanyManip" runat="server" DataKeyNames="Vakant_ID" 
    DataSourceID="sdsProtectVacancyView"  BackColor="White" 
    BorderColor="#E7E7FF" BorderStyle="Solid" BorderWidth="2px" CellPadding="3" 
    GridLines="Horizontal" Width="100%">
    <FooterStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    <RowStyle BackColor="#BFEBFF" ForeColor="#4A3C8C" />
    <EditItemTemplate>
        Невозможно изменение
    </EditItemTemplate>
    <InsertItemTemplate>
        Невозможно добавление
    </InsertItemTemplate>
    <ItemTemplate>
        <table border="0">
          <tr>
            <td colspan="2" style="font-weight:bold;">Основные данные</td>
          </tr>
          <tr>
            <td>
                Номер вакансии:&nbsp;
                <asp:Label ID="Vakant_IDLabel" runat="server" Text='<%# Eval("Vakant_ID") %>' Font-Bold="true"/>
            </td>
            <td>
                Добавлена:&nbsp;
                <asp:Label ID="AddDateTimeLabel" runat="server" 
                Text='<%# Bind("AddDateTime") %>' Font-Bold="true" />
            </td>
          </tr>
          <tr>
            <td>
              Количество свободных мест:&nbsp;
              <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>' Font-Bold="true" />
            </td>
            <td>
              Требуемый стаж:&nbsp;
              <asp:Label ID="WorkStageMinLabel" runat="server" 
              Text='<%# Bind("WorkStageMin") %>' Font-Bold="true" />
            </td>
          </tr>
          <tr>
            <td>
              Название должности в штате:&nbsp;
            </td>
            <td>
              <asp:Label ID="EcpecProfNameLabel" runat="server" 
              Text='<%# Bind("EcpecProfName") %>' Font-Bold="true" />
            </td>
          </tr>
          <tr>
            <td>
              Отрасль:&nbsp;<br/>
              <asp:DropDownList ID="ddlVacancyUpdate" DataSourceID="sdsProfGroup"  
                         DataTextField="Name" DataValueField="ProfGroup_ID" 
                         SelectedValue='<%# Eval("ProfGroup_ID") %>' runat="server" Width="200px" Enabled="false">
                        </asp:DropDownList>
            </td>
            <td>
              Специальность:&nbsp;<br />
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sdsProfs" 
                    DataTextField="Name" DataValueField="Professional_ID" Enabled="False" 
                    SelectedValue='<%# Eval("Professional_ID") %>' Width="200px">
                </asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td>
              Возраст претендента:&nbsp;
              <asp:Label ID="AgeMaxLabel" runat="server" Text='<%# Eval("VacancyAgeComment") %>' />
            </td>
            <td>
              Зарплата:&nbsp;
                <asp:Label ID="SalaryMaxLabel" runat="server" Text='<%# Eval("VacancySalaryComment") %>' />
            </td>
          </tr>
          <tr>
            <td>
              Требуемый уровень образования:&nbsp;<br />
                <asp:DropDownList ID="ddlBuildingType" runat="server" Enabled="false" 
                            DataSourceID="sdsBuldingsType" DataTextField="Name" 
                            DataValueField="BuildingType_ID" Height="22px" Width="200px"
                            SelectedValue='<%# Eval("BuildingType_ID") %>'>
                        </asp:DropDownList>
            </td>
            <td>
              Предпочтительный пол:&nbsp;<br />
                <asp:DropDownList ID="ddlSex" runat="server" Enabled="false" Width="200px" 
                            SelectedValue='<%# Eval("Sex") %>'>
                            <asp:ListItem Value="1">Мужской</asp:ListItem>
                            <asp:ListItem Value="2">Женский</asp:ListItem>
                            <asp:ListItem Value="0">Не имеет значения</asp:ListItem>
                        </asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td>
                Страна:&nbsp;<br/>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sdsCountries" 
                    DataTextField="Name" DataValueField="Country_ID" Enabled="False" 
                    SelectedValue='<%# Eval("Country_ID") %>' Width="200px">
                </asp:DropDownList>
                
            </td>
            <td>
              Регион:&nbsp;<br />
                <asp:DropDownList ID="DropDownList5" runat="server" Enabled="False" DataSourceID="sdsRegions" 
                            DataTextField="Name" DataValueField="Region_ID"
                            SelectedValue='<%# Eval("Region_ID") %>' Width="200px">
                        </asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td>
                Город:&nbsp;<br/>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="sdsStates" 
                    DataTextField="Name" DataValueField="State_ID" Enabled="False" 
                    SelectedValue='<%# Eval("State_ID") %>' Width="200px">
                </asp:DropDownList>
                
            </td>
            <td>
              График работы:&nbsp;<br />
                <asp:DropDownList ID="ddlWorkMode" runat="server" Enabled="false" DataSourceID="sdsWorkMode" 
                            DataTextField="Name" DataValueField="WorkMode_ID"
                            SelectedValue='<%# Eval("WorkMode_ID") %>' Width="200px">
                        </asp:DropDownList>
            </td>
          </tr>
          <tr valign="top">
            <td>
                Описание должности 
              <asp:BulletedList ID="BulletedList1" runat="server" CssClass="small_desc_text" 
                    >
                   <asp:ListItem>
                     Выполняемые задачи, должностные обязанности, функции.
                   </asp:ListItem>
                   <asp:ListItem>
                     Место в структуре организации (кому подчиняется, кто входит в подчинение, количество)
                   </asp:ListItem>
                   <asp:ListItem>
                     Мед. страхование, оплата питания и транспорта
                   </asp:ListItem>
                   <asp:ListItem>
                     Соц. пакет (дополнительно)
                   </asp:ListItem>
                   <asp:ListItem>
                     Возможные перспективы
                   </asp:ListItem>
                   <asp:ListItem>
                     Особый режим работы
                   </asp:ListItem>      
                </asp:BulletedList>
              
            </td>
            <td valign="top"> <br />
                <asp:TextBox ID="TextBox9" runat="server" TextMode="MultiLine" 
                    Text='<%# Eval("SpecWorkMode") %>' Height="200px" 
                    Width="200px" ReadOnly="True"></asp:TextBox>
            </td>
          </tr>
          <tr valign="top"><td>  
              Прочие требования к кандидату
              <asp:BulletedList ID="BulletedList2" runat="server" CssClass="small_desc_text" 
                  >
                   <asp:ListItem>
                     Практический опыт работы в определенной сфере
                   </asp:ListItem>
                   <asp:ListItem>
                     Навыки в сфере компьютерных технологий
                   </asp:ListItem>
                   <asp:ListItem>
                     Иностранные языки, степень владения
                   </asp:ListItem> 
                   <asp:ListItem> 
                     Наличие водительских прав, личного а/м.
                   </asp:ListItem>
                   <asp:ListItem>
                     Требования к личным качествам
                   </asp:ListItem>
                   <asp:ListItem>
                     Требования к месту жительства
                   </asp:ListItem>
                   <asp:ListItem>
                     Испытательный срок и его оплата
                   </asp:ListItem>
                   <asp:ListItem>
                     Другие необходимые знания и прочие требования
                   </asp:ListItem>     
                </asp:BulletedList>
             </td><td valign="top"> 
            
                <asp:TextBox ID="TextBox10" runat="server" TextMode="MultiLine" 
                      Text='<%# Eval("SpecIfs") %>' Height="200px" 
                    Width="200px" ReadOnly="True"></asp:TextBox>
             </td></tr>
        </table>

    </ItemTemplate>
    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
    <EmptyDataTemplate>
        Нет данных по вакансии для отображения
    </EmptyDataTemplate>
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="False" ForeColor="#F7F7F7" />
    <EditRowStyle BackColor="#63EF9E" Font-Bold="False" ForeColor="#4A3C8C" />
</asp:FormView>
    </center>
    </form>
</body>
</html>