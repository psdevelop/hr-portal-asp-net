<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VakantManip.ascx.cs" Inherits="Controls_VakantManip" %>
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
<asp:HiddenField ID="hfAccessLogin" runat="server" Value="Denied" />    
<asp:ObjectDataSource ID="odsVakantManip" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetVacancy" 
    TypeName="dsVacanciesTableAdapters.VacancySelectCommandTableAdapter" 
    InsertMethod="Insert" DeleteMethod="Delete" UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="Original_Vakant_ID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="Quantity" Type="Int32" />
        <asp:Parameter Name="WorkStageMin" Type="Double" />
        <asp:Parameter Name="AgeMin" Type="Int32" />
        <asp:Parameter Name="AgeMax" Type="Int32" />
        <asp:Parameter Name="WorkPosition_ID" Type="Int32" />
        <asp:Parameter Name="Organization_ID" Type="Int32" />
        <asp:Parameter Name="DirectFromOrganization" Type="Boolean" />
        <asp:Parameter Name="IsHot" Type="Boolean"  />
        <asp:Parameter Name="IsProtect" Type="Boolean" />
        <asp:Parameter Name="IsOld" Type="Boolean" />
        <asp:Parameter Name="EcpecProfName" Type="String" />
        <asp:Parameter Name="ProfGroup_ID" Type="Int32" DefaultValue="1" />
        <asp:Parameter Name="IsModerated" Type="Boolean" />
        <asp:Parameter Name="IsOccuped" Type="Boolean"  />
        <asp:Parameter Name="ContactOrg_ID" Type="Int32" />
        <asp:Parameter Name="ContactFace" Type="String" DefaultValue="" />
        <asp:Parameter Name="HomePlace_ID" Type="Int32" DefaultValue="1" />
        <asp:Parameter Name="BuildingType_ID" Type="Int32" DefaultValue="1" />
        <asp:Parameter Name="Professional_ID" Type="Int32" DefaultValue="1" />
        <asp:Parameter Name="State_ID" Type="Int32" DefaultValue="1" />
        <asp:Parameter Name="SalaryMin" Type="Double" DefaultValue="" />
        <asp:Parameter Name="SalaryMax" Type="Double" />
        <asp:Parameter Name="Sex" Type="Int32" />
        <asp:Parameter Name="WorkMode_ID" Type="Int32" DefaultValue="1" />
        <asp:Parameter Name="CheckTime" Type="Int32" DefaultValue="0" />
        <asp:Parameter Name="CheckTimeSalary" Type="Double" DefaultValue="0"  />
        <asp:Parameter Name="FoodInclude" Type="String" />
        <asp:Parameter Name="Transporting" Type="String" DefaultValue="" />
        <asp:Parameter Name="SocMedical" Type="String" />
        <asp:Parameter Name="OutlandLanguage" Type="String" />
        <asp:Parameter Name="SpecIfs" Type="String" />
        <asp:Parameter Name="SpecWorkMode" Type="String" />
        <asp:Parameter Name="Region_ID" Type="Int32" />
        <asp:Parameter Name="Country_ID" Type="Int32" />
        <asp:Parameter Name="Original_Vakant_ID" Type="Int32" />
    </UpdateParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="Vakant_ID" 
            QueryStringField="Vakant_ID" Type="Int32" />
        <asp:ControlParameter ControlID="hfAccessLogin" DefaultValue="Denied" 
            Name="UserLogin" PropertyName="Value" Type="String" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="AddDateTime" Type="DateTime" />
        <asp:Parameter Name="Quantity" Type="Int32" />
        <asp:Parameter Name="WorkStageMin" Type="Double" />
        <asp:Parameter Name="AgeMin" Type="Int32" />
        <asp:Parameter Name="AgeMax" Type="Int32" />
        <asp:Parameter Name="WorkPosition_ID" Type="Int32" />
        <asp:QueryStringParameter DefaultValue="1" Name="Organization_ID" 
            QueryStringField="Organization_ID" Type="Int32" />
        <asp:Parameter Name="DirectFromOrganization" Type="Boolean" />
        <asp:Parameter Name="IsHot" Type="Boolean" />
        <asp:Parameter Name="IsProtect" Type="Boolean" />
        <asp:Parameter Name="IsOld" Type="Boolean" />
        <asp:Parameter Name="EcpecProfName" Type="String" />
        <asp:Parameter Name="ProfGroup_ID" Type="Int32" />
        <asp:Parameter Name="IsModerated" Type="Boolean" />
        <asp:Parameter Name="IsOccuped" Type="Boolean" />
        <asp:Parameter Name="ContactOrg_ID" Type="Int32" />
        <asp:Parameter Name="ContactFace" Type="String" />
        <asp:Parameter Name="HomePlace_ID" Type="Int32" />
        <asp:Parameter Name="BuildingType_ID" Type="Int32" />
        <asp:Parameter Name="Professional_ID" Type="Int32" />
        <asp:Parameter Name="State_ID" Type="Int32" />
        <asp:Parameter Name="SalaryMin" Type="Double" />
        <asp:Parameter Name="SalaryMax" Type="Double" />
        <asp:Parameter Name="Sex" Type="Int32" />
        <asp:Parameter Name="WorkMode_ID" Type="Int32" />
        <asp:Parameter Name="CheckTime" Type="Int32" />
        <asp:Parameter Name="CheckTimeSalary" Type="Double" />
        <asp:Parameter Name="FoodInclude" Type="String" />
        <asp:Parameter Name="Transporting" Type="String" />
        <asp:Parameter Name="SocMedical" Type="String" />
        <asp:Parameter Name="OutlandLanguage" Type="String" />
        <asp:Parameter Name="SpecIfs" Type="String" />
        <asp:Parameter Name="SpecWorkMode" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>
<asp:FormView ID="fwCompanyManip" runat="server" DataKeyNames="Vakant_ID" 
    DataSourceID="odsVakantManip" 
    oniteminserted="fwCompanyManip_ItemInserted" BackColor="White" 
    BorderColor="#E7E7FF" BorderStyle="Solid" BorderWidth="2px" CellPadding="3" 
    GridLines="Horizontal" Width="100%">
    <FooterStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    <RowStyle BackColor="#BFEBFF" ForeColor="#4A3C8C" />
    <EditItemTemplate>
       <div>
        <table border="0" style="width:100%;">
                <tr>
                    <td class="left_td_sized">
                        Номер вакансии</td>
                    <td>
                        <asp:Label ID="Vakant_IDLabel1" runat="server" 
                            Text='<%# Eval("Vakant_ID") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        Штатное наименование должности:</td>
                    <td>
                        <asp:TextBox ID="EcpecProfNameTextBox" runat="server" 
                            Text='<%# Bind("EcpecProfName") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        Отрасль:</td>
                    <td>
                        <asp:DropDownList ID="ddlVacancyUpdate" DataSourceID="sdsProfGroup" 
                         DataTextField="Name" DataValueField="ProfGroup_ID" 
                         SelectedValue='<%# Bind("ProfGroup_ID") %>' runat="server" Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        Специализация:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sdsProfs" 
                          DataTextField="Name" DataValueField="Professional_ID" 
                          SelectedValue='<%# Bind("Professional_ID") %>' Width="200px">
                          </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        Число рабочих мест по данной вакансии:</td>
                    <td>
                        <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' 
                            Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        Стаж не менее (полное число лет): </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WorkStageMin") %>' 
                            Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        Возраст от</td>
                    <td>
                        <asp:TextBox ID="AgeMinTextBox" runat="server" Text='<%# Bind("AgeMin") %>' 
                            Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        до</td>
                    <td>
                        <asp:TextBox ID="AgeMaxTextBox" runat="server" Text='<%# Bind("AgeMax") %>' 
                            Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        &nbsp;Требуемое образование:</td>
                    <td>
                        <asp:DropDownList ID="ddlBuildingType" runat="server" 
                            DataSourceID="sdsBuldingsType" DataTextField="Name" 
                            DataValueField="BuildingType_ID" Height="22px" Width="200px"
                            SelectedValue='<%# Bind("BuildingType_ID") %>'>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">Страна:&nbsp;<br/></td>
                    <td><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sdsCountries" 
                    DataTextField="Name" DataValueField="Country_ID" 
                    SelectedValue='<%# Bind("Country_ID") %>' Width="200px">
                    </asp:DropDownList></td></tr>
                 <tr>   
                    <td class="left_td_sized">Регион:&nbsp;</td>
                    <td><asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="sdsRegions" 
                            DataTextField="Name" DataValueField="Region_ID"
                            SelectedValue='<%# Bind("Region_ID") %>' Width="200px">
                        </asp:DropDownList></td></tr>
                 <tr>       
                    <td class="left_td_sized">
                        Город:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="sdsStates" 
                          DataTextField="Name" DataValueField="State_ID" 
                          SelectedValue='<%# Bind("State_ID") %>' Width="200px">
                          </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        Зарплата от</td>
                    <td>
                        <asp:TextBox ID="SalaryMinTextBox" runat="server" 
                            Text='<%# Bind("SalaryMin") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        до</td>
                    <td>
                        <asp:TextBox ID="SalaryMaxTextBox" runat="server" 
                            Text='<%# Bind("SalaryMax") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        Предпочтительный пол:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSex" runat="server" Width="200px" 
                            SelectedValue='<%# Bind("Sex") %>'>
                            <asp:ListItem Value="1" Selected="True">Мужской</asp:ListItem>
                            <asp:ListItem Value="2">Женский</asp:ListItem>
                            <asp:ListItem Value="0">Не имеет значения</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="left_td_sized">
                        Описание должности
                        <asp:BulletedList ID="BulletedList1" runat="server" CssClass="small_desc_text">
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
                    <td valign="top">
                        <asp:TextBox ID="TextBox9" runat="server" Height="200px" 
                            Text='<%# Bind("SpecWorkMode") %>' TextMode="MultiLine" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="left_td_sized">
                    Прочие требования к кандидату:
                        <asp:BulletedList ID="BulletedList2" runat="server" CssClass="small_desc_text">
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
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox10" runat="server" Height="200px" 
                            Text='<%# Bind("SpecIfs") %>' TextMode="MultiLine" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        График работы:</td>
                    <td>
                        <asp:DropDownList ID="ddlWorkMode" runat="server" DataSourceID="sdsWorkMode" 
                            DataTextField="Name" DataValueField="WorkMode_ID"
                            SelectedValue='<%# Bind("WorkMode_ID") %>' Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="left_td_sized">
                        Контактное лицо:</td>
                    <td>
                        <asp:TextBox ID="ContactFaceTextBox" runat="server" 
                            Text='<%# Bind("ContactFace") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        &nbsp;</td>
                    <td>
                        <asp:CheckBox ID="IsOldUpdateCheckBox" runat="server" 
                            Checked='<%# Bind("IsOccuped") %>' Text="Помечено как временно реализованное" />
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        &nbsp;</td>
                    <td>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsOld") %>' 
                            Text="Старое" />
                    </td>
                </tr>
                <tr>
                    <td class="left_td_sized">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        
        </div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Logic/Small/page_save.png" />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
            CommandName="Update" Text="Обновить" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Отмена" />
            
    </EditItemTemplate>
    <InsertItemTemplate>
        <h2>Добавление вакансии по имеющейся организации</h2>
        <table style="width: 100%;">
            <tr>
                <td>
                    Штатное наименование должности:
                </td>
                <td>
                    <asp:TextBox ID="EcpecProfNameTextBox" runat="server" 
                      Text='<%# Bind("EcpecProfName") %>' />
                </td>
            </tr>
            <tr>
                <td>
                    Число рабочих мест по данной вакансии:
                </td>
                <td>
                    <asp:TextBox ID="QuantityTextBox" runat="server" 
                      Text='<%# Bind("Quantity") %>' />
                </td>
            </tr>
            <tr>
                <td>
                    Стаж не менее (полное число лет):
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" 
                      Text='<%# Bind("WorkStageMin") %>' />
                </td>
            </tr>
            <tr>
              <td>
                Возраст от
                 <asp:TextBox ID="AgeMinTextBox" runat="server" Text='<%# Bind("AgeMin") %>' />
              </td>
              <td>
                до
        <asp:TextBox ID="AgeMaxTextBox" runat="server" Text='<%# Bind("AgeMax") %>' />
              </td>
            </tr>
            <tr>
              <td>
                Зарплата от
                <asp:TextBox ID="SalaryMinTextBox" runat="server" 
                Text='<%# Bind("SalaryMin") %>' />
              </td>
              <td>
                до
                <asp:TextBox ID="SalaryMaxTextBox" runat="server" 
                Text='<%# Bind("SalaryMax") %>' />
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
                <asp:TextBox ID="TextBox9" runat="server" TextMode="MultiLine" Text='<%# Bind("SpecWorkMode") %>' Height="250px" 
                    Width="200px"></asp:TextBox>
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
             </td><td> 
            
                <asp:TextBox ID="TextBox10" runat="server" TextMode="MultiLine" Text='<%# Bind("SpecIfs") %>' Height="250px" 
                    Width="200px"></asp:TextBox>
             </td></tr>
        </table>
        
        <br />

        Образование:
        <asp:DropDownList ID="ddlBuildingType" runat="server" 
            DataSourceID="sdsBuldingsType" DataTextField="Name" 
            DataValueField="BuildingType_ID" Height="22px" 
            Width="185px">
        </asp:DropDownList>
        <br />
        Специализация:
        <asp:TextBox ID="TextBox11" runat="server" 
            />
        <br />
        State_ID:
        <asp:TextBox ID="TextBox12" runat="server" 
            />
        <br />
        Предпочтительный пол:
        <asp:DropDownList ID="ddlSex" runat="server">
              
            <asp:ListItem Value="1">Мужской</asp:ListItem>
            <asp:ListItem Value="2">Женский</asp:ListItem>
            <asp:ListItem Selected="True" Value="0">Не имеет значения</asp:ListItem>
              
        </asp:DropDownList>
        <br />
        График работы:
        <asp:DropDownList ID="ddlWorkMode" runat="server" DataSourceID="sdsWorkMode" 
            DataTextField="Name" DataValueField="WorkMode_ID" Height="16px" Width="160px">
        </asp:DropDownList>
        
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Вставка" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Отмена" />
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


