<%@Page Language="C#" Title="Печатная форма резюме" %>
<%@import namespace="System.Net" %>
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
    <asp:SqlDataSource ID="sdsWorkMode" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [WorkMode_ID], [Name] FROM [PSP_WorkMode] ORDER BY [WorkMode_ID]">
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
        
        <asp:SqlDataSource ID="sdsViewProtectResume" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="ResumeByIDSelectCommand" 
        SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="-1" Name="Resume_ID" 
                    QueryStringField="Resume_ID" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="Administrator" Name="UserLogin" 
                    QueryStringField="UserLogin" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="sdsRegions" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [Region_ID], [Name] FROM [PSP_Region]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsCountries" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [Country_ID], [Name] FROM [PSP_Country]">
    </asp:SqlDataSource>
        <asp:FormView ID="fvResumeManip" runat="server" DataKeyNames="Resume_ID" 
    DataSourceID="sdsViewProtectResume" 
                                                CellPadding="4" 
    ForeColor="#333333" Width="100%" BorderStyle="Solid" BorderColor="#E7E7FF" 
    BorderWidth="2px">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#FFFFFF" ForeColor="#333333" />
        <EditItemTemplate>
          Не доступна модификация
        </EditItemTemplate>
        <InsertItemTemplate>
          Не доступна вставка
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width: 100%;">
                <tr>
                  <td rowspan="7">
                    <asp:Image ID="UserPhotoPreviewImage" runat="server" BorderColor="#CCCCCC" 
                      BorderStyle="Dashed" BorderWidth="2px" Width="150px" 
                          ImageUrl='<%# Eval("UserPhotoFilePath") %>'/>
                  </td>
                  <td>
                    ФИО:&nbsp;
                        <asp:Label ID="Label1" runat="server" 
                            Text='<%# Eval("LastName") %>' Font-Bold="True" />&nbsp;
                        <asp:Label ID="Label4" runat="server" 
                            Text='<%# Eval("FirstName") %>' Font-Bold="True" />&nbsp;
                        <asp:Label ID="Label5" runat="server" 
                            Text='<%# Eval("SurName") %>' Font-Bold="True" />        
                  </td>
                  
                </tr>
                <tr>
                    <td>
                    Желаемая должность:&nbsp;
                        <asp:Label ID="EcpecProfNameLabel" runat="server" 
                            Text='<%# Bind("EcpecProfName") %>' Font-Bold="True" />
                  </td>
                </tr>
                <tr>
                    <td>
                        Номер резюме:&nbsp;<asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("Resume_ID") %>' Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                     <td>
                        Стаж работы:&nbsp;
                        <asp:Label ID="WorkStageLabel" runat="server" Text='<%# Bind("WorkStage") %>' 
                            Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Добавлено:&nbsp;<asp:Label ID="AddDateTimeLabel" runat="server" 
                        Text='<%# Bind("AddDateTime") %>' Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Возраст (полных лет):&nbsp;
            <asp:Label ID="AgeLabel" runat="server" Text='<%# Bind("Age") %>' Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                    Контактный телефон:&nbsp;
                        <asp:Label ID="Label6" runat="server" 
                            Text='<%# Eval("Phones") %>' Font-Bold="True" />
                  </td>
                </tr>
                <tr>
                    <td>
                        Адрес электронной почты:&nbsp;
                        <asp:Label ID="Label7" runat="server" 
                            Text='<%# Eval("Email") %>' Font-Bold="True" />
                    </td>
                    <td>
                        Личный web-сайт:&nbsp;
                        <asp:Label ID="Label8" runat="server" 
                            Text='<%# Eval("Website") %>' Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Отрасль:&nbsp;<br/>
                          <asp:DropDownList ID="ddlResumeUpdate" DataSourceID="sdsProfGroup"  
                                     DataTextField="Name" DataValueField="ProfGroup_ID" 
                                     SelectedValue='<%# Eval("ProfGroup_ID") %>' runat="server" Width="200px" Enabled="false">
                                    </asp:DropDownList>
                    </td>
                    <td>
                        Пол:&nbsp;<br />
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
                    Специальность:&nbsp<br />
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sdsProfs" 
                        DataTextField="Name" DataValueField="Professional_ID" Enabled="False" 
                        SelectedValue='<%# Eval("Professional_ID") %>' Width="200px">
                    </asp:DropDownList>
                    </td>
                    <td>
                    Уровень образования:&nbsp<br />
                    <asp:DropDownList ID="ddlBuildingType" runat="server" Enabled="false" 
                                DataSourceID="sdsBuldingsType" DataTextField="Name" 
                                DataValueField="BuildingType_ID" Height="22px" Width="200px"
                                SelectedValue='<%# Eval("BuildingType_ID") %>'>
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
                    Населенный пункт:&nbsp<br />
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="sdsStates" 
                        DataTextField="Name" DataValueField="State_ID" Enabled="False" 
                        SelectedValue='<%# Eval("State_ID") %>' Width="200px">
                    </asp:DropDownList>
                    </td>
                    <td>
                      Предпочитаемый график работы:<br/>
                        <asp:DropDownList ID="ddlWorkMode" runat="server" DataSourceID="sdsWorkMode" 
                            DataTextField="Name" DataValueField="WorkMode_ID" Width="200px" 
                            SelectedValue='<%# Eval("WorkMode_ID") %>' Enabled="False">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                      Адрес прописки:&nbsp<br />
                      <asp:Label ID="AdressLabel" runat="server" Text='<%# Bind("Adress") %>' />
                    </td>
                    <td>
                    Фактический адрес проживания:<br />
                    <asp:Label ID="FactAdressLabel" runat="server" 
                      Text='<%# Bind("FactAdress") %>' />
                    </td>

                </tr>
                <tr>
                    <td>
                        Зарплата от:
                        <asp:Label ID="SalaryMinLabel" runat="server" Text='<%# Bind("SalaryMin") %>' />
                    </td>
                    <td></td>
                </tr>
                <tr>
                <td>
                    <b>Профессиональный опыт и подготовка</b> 
                  <asp:BulletedList ID="BulletedList1" runat="server" CssClass="small_desc_text" 
                        Width="169px" >
                       <asp:ListItem>
                         Курсы, тренинги
                       </asp:ListItem>
                       <asp:ListItem>
                         Сложность выполняемых задач, должностных обязанностей, функций
                       </asp:ListItem>
                       <asp:ListItem>
                         Владение иностранными языками
                       </asp:ListItem>
                       <asp:ListItem>
                         Владение компьютером
                       </asp:ListItem>
                    </asp:BulletedList>
                  
                </td>
                <td valign="top"> <br />
                    <asp:TextBox ID="SpecWorkModeTextBox" runat="server" TextMode="MultiLine" Height="149px" 
                        Width="259px" Text='<%# Eval("ProfEmp") %>'></asp:TextBox>
                </td>
              </tr>  
            <tr><td>  
                  <b>Дополнительная информация</b>
                  <asp:BulletedList ID="BulletedList2" runat="server" CssClass="small_desc_text" 
                      Width="169px">
                       <asp:ListItem>
                         Наличие водительских прав
                       </asp:ListItem>
                       <asp:ListItem>
                         Рекомендации и ссылки
                       </asp:ListItem>
                       <asp:ListItem>
                         Ключевые навыки и достижения
                       </asp:ListItem> 
                       <asp:ListItem> 
                         Занятия в свободное время
                       </asp:ListItem>
                       <asp:ListItem>
                         Дополнительные сведения
                       </asp:ListItem>
                          
                    </asp:BulletedList>
                 </td><td valign="top"> 
                
                    <asp:TextBox ID="SpecIfsTextBox" runat="server" TextMode="MultiLine" Height="149px" 
                        Width="263px" Text='<%# Eval("OtherInfo") %>'></asp:TextBox>
                 </td></tr>
     </table>

            
              
            &nbsp;&nbsp;
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            Нет данных резюме для отображения
        </EmptyDataTemplate>
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#63EF9E" />
    </asp:FormView>
    </center>
    </form>
</body>
</html>