<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResumeManip.ascx.cs" Inherits="Controls_ResumeManip" Debug="true" %>
<%@ Register Src="~/Controls/ResumeOldWorksManip.ascx" TagPrefix="User" 
TagName="ResumeOldWorksManip"%>
<%@ Register Src="~/Controls/ResumeBuildingsManip.ascx" TagPrefix="User" 
TagName="ResumeBuildingsManip"%>
                  
    <asp:HiddenField ID="hfAccessLogin" runat="server" Value="Denied" />
                  
    <asp:ObjectDataSource ID="odsEditResume" runat="server" 
    DeleteMethod="Delete" InsertMethod="Insert" 
                                                
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetResumeByID" 
                                                TypeName="dsNewSelectEditResumeTableAdapters.ResumeByIDSelectCommandTableAdapter" 
                                                UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Resume_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="AddDateTime" Type="DateTime" />
            <asp:Parameter Name="WorkStage" Type="Double" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:Parameter Name="WorkPosition_ID" Type="Int32" />
            <asp:Parameter Name="EcpecProfName" Type="String" />
            <asp:Parameter Name="ProfGroup_ID" Type="Int32" DefaultValue="1" />
            <asp:Parameter Name="OtherInfo" Type="String" />
            <asp:Parameter Name="ProfEmp" Type="String" />
            <asp:Parameter Name="HightProjects" Type="String" />
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="Adress" Type="String" />
            <asp:Parameter Name="FactAdress" Type="String" />
            <asp:Parameter Name="UserLogin" Type="String" DefaultValue="Guest" />
            <asp:Parameter Name="Sex" Type="Int32" DefaultValue="0" />
            <asp:Parameter Name="Professional_ID" Type="Int32" DefaultValue="1" />
            <asp:Parameter Name="BuildingType_ID" Type="Int32" DefaultValue="1" />
            <asp:Parameter Name="State_ID" Type="Int32" DefaultValue="1" />
            <asp:Parameter Name="SalaryMin" Type="Double" DefaultValue="" />
            <asp:Parameter Name="IsOld" Type="Boolean" />
            <asp:Parameter Name="IsOccuped" Type="Boolean" />
            <asp:Parameter Name="IsProtect" Type="Boolean" />
            <asp:Parameter Name="IsHot" Type="Boolean" />
            <asp:Parameter Name="IsModerated" Type="Boolean" />
            <asp:Parameter Name="Region_ID" Type="Int32" />
            <asp:Parameter Name="Country_ID" Type="Int32" />
            <asp:Parameter Name="Original_Resume_ID" Type="Int32" />
            <asp:Parameter Name="Phones" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Website" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="SurName" Type="String" />
            <asp:Parameter Name="WorkMode_ID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="Resume_ID" 
                QueryStringField="Resume_ID" Type="Int32" />
            <asp:ControlParameter ControlID="hfAccessLogin" DefaultValue="Denied" 
                Name="UserLogin" PropertyName="Value" Type="String" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="AddDateTime" Type="DateTime" />
            <asp:Parameter Name="WorkStage" Type="Double" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:Parameter Name="WorkPosition_ID" Type="Int32" />
            <asp:Parameter Name="EcpecProfName" Type="String" />
            <asp:Parameter Name="ProfGroup_ID" Type="Int32" />
            <asp:Parameter Name="OtherInfo" Type="String" />
            <asp:Parameter Name="ProfEmp" Type="String" />
            <asp:Parameter Name="HightProjects" Type="String" />
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="Adress" Type="String" />
            <asp:Parameter Name="FactAdress" Type="String" />
            <asp:Parameter Name="UserLogin" Type="String" />
            <asp:Parameter Name="Sex" Type="Int32" />
            <asp:Parameter Name="Professional_ID" Type="Int32" />
            <asp:Parameter Name="BuildingType_ID" Type="Int32" />
            <asp:Parameter Name="State_ID" Type="Int32" />
            <asp:Parameter Name="SalaryMin" Type="Double" />
            <asp:Parameter Name="IsOld" Type="Boolean" />
            <asp:Parameter Name="IsOccuped" Type="Boolean" />
            <asp:Parameter Name="IsProtect" Type="Boolean" />
            <asp:Parameter Name="IsHot" Type="Boolean" />
            <asp:Parameter Name="IsModerated" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
    
    
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
        
        <asp:SqlDataSource ID="sdsRegions" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [Region_ID], [Name] FROM [PSP_Region]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsCountries" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [Country_ID], [Name] FROM [PSP_Country]">
    </asp:SqlDataSource>
    <asp:MultiView ID="myMV" runat="server" ActiveViewIndex="0"> 

      <asp:View ID="myViewShort" runat="server">


        <asp:FormView ID="fvResumeManip" runat="server" DataKeyNames="Resume_ID" 
    DataSourceID="odsEditResume" 
                                                CellPadding="4" 
    ForeColor="#333333" Width="100%" BorderStyle="Solid" BorderColor="#E7E7FF" 
    BorderWidth="2px">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#FFE991" ForeColor="#333333" />
        <EditItemTemplate>
          <table border="0" style="width:100%;">
                <tr>
                    <td class="style1">
                        Номер резюме:&nbsp;<asp:Label ID="Resume_IDLabel1" runat="server" 
                            Text='<%# Eval("Resume_ID") %>' Font-Bold="True" />
                    </td>
                    <td>
                        Добавлено:
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("AddDateTime") %>' 
                            Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Имя:</td>
                    <td>
                        <asp:TextBox ID="FullNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' 
                            Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Фамилия:</td>
                    <td>
                        <asp:TextBox ID="FullNameTextBox0" runat="server" 
                            Text='<%# Bind("LastName") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Отчество:</td>
                    <td>
                        <asp:TextBox ID="FullNameTextBox1" runat="server" 
                            Text='<%# Bind("SurName") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Контактный телефон:</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" 
                            Text='<%# Bind("Phones") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Адрес электронной почты:</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" 
                            Text='<%# Bind("Email") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Личный web-сайт:</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" 
                            Text='<%# Bind("Website") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Стаж работы</td>
                    <td>
                        <asp:TextBox ID="WorkStageTextBox" runat="server" 
                            Text='<%# Bind("WorkStage") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Возраст</td>
                    <td>
                        <asp:TextBox ID="AgeTextBox" runat="server" Text='<%# Bind("Age") %>' 
                            Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Желаемая должность:</td>
                    <td>
                        <asp:TextBox ID="EcpecProfNameTextBox" runat="server" 
                            Text='<%# Bind("EcpecProfName") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Отрасль:</td>
                    <td>
                        <asp:DropDownList ID="ddlResumeUpdatePrGroup" DataSourceID="sdsProfGroup" 
                          runat="server" Width="200px" DataTextField="Name" 
                          DataValueField="ProfGroup_ID" SelectedValue='<%# Bind("ProfGroup_ID") %>'>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Специализация:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sdsProfs" 
                           DataTextField="Name" DataValueField="Professional_ID" Enabled="False" 
                           SelectedValue='<%# Bind("Professional_ID") %>' Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td  valign="top">
                        <b>Профессиональный опыт и подготовка</b><asp:BulletedList ID="BulletedList1" 
                            runat="server" CssClass="small_desc_text" Width="169px">
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
                            <asp:ListItem> Дополнительные сведения
                            </asp:ListItem>
                        </asp:BulletedList>
                    </td>
                    <td valign="top">
                        <asp:TextBox ID="SpecWorkModeTextBox" runat="server" Height="149px" 
                            TextMode="MultiLine" Width="200px" Text='<%# Bind("ProfEmp") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
               <td valign="top">
                        <b>Дополнительная информация</b><asp:BulletedList ID="BulletedList2" runat="server" 
                            CssClass="small_desc_text" Width="169px">
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
                    </td>
                    <td valign="top">
                        <asp:TextBox ID="SpecIfsTextBox2" runat="server" Height="149px" 
                            TextMode="MultiLine" Width="200px" Text='<%# Bind("OtherInfo") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Адрес прописки:</td>
                    <td>
                        <asp:TextBox ID="AdressTextBox" runat="server" Text='<%# Bind("Adress") %>' 
                            Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Фактический адрес проживания:</td>
                    <td>
                        <asp:TextBox ID="FactAdressTextBox" runat="server" 
                            Text='<%# Bind("FactAdress") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Пол:</td>
                    <td>
                        <asp:DropDownList ID="ddlSex" runat="server" Width="200px" 
                            SelectedValue='<%# Bind("Sex") %>'>
                            <asp:ListItem Value="1">Мужской</asp:ListItem>
                            <asp:ListItem Value="2">Женский</asp:ListItem>
                            <asp:ListItem Value="0">Не имеет значения</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Образование:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBuildingType" runat="server" 
                            DataSourceID="sdsBuldingsType" DataTextField="Name" 
                            DataValueField="BuildingType_ID" Width="200px" 
                            SelectedValue='<%# Bind("BuildingType_ID") %>'>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Предпочитаемый график работы:</td>
                    <td>
                        <asp:DropDownList ID="ddlWorkMode" runat="server" DataSourceID="sdsWorkMode" 
                            DataTextField="Name" DataValueField="WorkMode_ID" Width="200px" 
                            SelectedValue='<%# Bind("WorkMode_ID") %>'>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                    Страна:&nbsp;</td>
                    <td><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sdsCountries" 
                            DataTextField="Name" DataValueField="Country_ID" Enabled="False" 
                            SelectedValue='<%# Bind("Country_ID") %>' Width="200px">
                        </asp:DropDownList>
                        
                    </td></tr>
                    <tr><td>
                      Регион:&nbsp;</td>
                    <td>  
                        <asp:DropDownList ID="DropDownList5" runat="server" Enabled="False" DataSourceID="sdsRegions" 
                                    DataTextField="Name" DataValueField="Region_ID"
                                    SelectedValue='<%# Bind("Region_ID") %>' Width="200px">
                                </asp:DropDownList></td></tr>
                    <tr>            
                    <td class="style1">
                        Населенный пункт:
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="sdsStates" 
                           DataTextField="Name" DataValueField="State_ID" Enabled="False" 
                           SelectedValue='<%# Bind("State_ID") %>' Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Зарплата от:</td>
                    <td>
                        <asp:TextBox ID="SalaryMinTextBox" runat="server" 
                            Text='<%# Bind("SalaryMin") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:CheckBox ID="IsHotCheckBox" runat="server" Checked='<%# Bind("IsHot") %>' 
                            Enabled="False" Text="В горячем списке" />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsOldCheckBox" runat="server" Checked='<%# Bind("IsOld") %>' 
                            Text="Убрать в старые" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:CheckBox ID="IsProtectCheckBox" runat="server" 
                            Checked='<%# Bind("IsProtect") %>' Enabled="False" Text="Платный доступ" 
                            Visible="False" />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsOccupedCheckBox" runat="server" 
                            Checked='<%# Bind("IsOccuped") %>' Text="Пометить как временно реализованное" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        <asp:CheckBox ID="IsModeratedCheckBox" runat="server" 
                            Checked='<%# Bind("IsModerated") %>' Enabled="False" 
                            Text="Проверено модератором" />
                    </td>
                </tr>
            </table>
            &nbsp;<br />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Logic/Small/page_save.png" />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Сохранить внесенные изменения" />

        </EditItemTemplate>
        <InsertItemTemplate>
          Ваш стаж работы:
            <asp:TextBox ID="WorkStageTextBox" runat="server" 
                Text='<%# Bind("WorkStage") %>' />
            <br />
            Возраст:
            <asp:TextBox ID="AgeTextBox" runat="server" Text='<%# Bind("Age") %>' />
            <br />
            Желаемая специальность:
            <asp:TextBox ID="EcpecProfNameTextBox" runat="server" 
                Text='<%# Bind("EcpecProfName") %>' />
            <br />
            Отрасль:
            <asp:TextBox ID="ProfGroup_IDTextBox" runat="server" 
                Text='<%# Bind("ProfGroup_ID") %>' />
            <br />
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td>
        Профессиональный опыт и подготовка 
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
            Width="259px"></asp:TextBox>
    </td>
  </tr>  
  </table>
        <br />
            <table cellpadding="0" cellspacing="0" border="0" ><tr><td>  
      Дополнительная информация
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
     </td><td> 
    
        <asp:TextBox ID="SpecIfsTextBox" runat="server" TextMode="MultiLine" Height="149px" 
            Width="263px"></asp:TextBox>
     </td></tr></table>
            <br />
            Полной имя:
            <asp:TextBox ID="FullNameTextBox" runat="server" 
                Text='<%# Bind("FullName") %>' />
            <br />
            Адрес прописки:
            <asp:TextBox ID="AdressTextBox" runat="server" Text='<%# Bind("Adress") %>' />
            <br />
            Фактический адрес проживания:
            <asp:TextBox ID="FactAdressTextBox" runat="server" 
                Text='<%# Bind("FactAdress") %>' />
            <br />
            Пол:
            <asp:DropDownList ID="ddlSex" runat="server">
                <asp:ListItem Value="1">Мужской</asp:ListItem>
                <asp:ListItem Value="2">Женский</asp:ListItem>
                <asp:ListItem Selected="True" Value="0">Не имеет значения</asp:ListItem>
            </asp:DropDownList>
            <br />
            Специализация:
            <asp:TextBox ID="Professional_IDTextBox" runat="server" 
                Text='<%# Bind("Professional_ID") %>' />
            <br />
            Уровень образования:
            <asp:DropDownList ID="ddlBuildingType" runat="server" 
                DataSourceID="sdsBuldingsType" DataTextField="Name" 
                DataValueField="BuildingType_ID" Height="22px" Width="185px">
            </asp:DropDownList>
            <br />
            Предпочитаемый график работы:
            <asp:DropDownList ID="ddlWorkMode" runat="server" DataSourceID="sdsWorkMode" 
              DataTextField="Name" DataValueField="WorkMode_ID" Height="16px" Width="160px">
            </asp:DropDownList>
            <br />
            Город:
            <asp:TextBox ID="State_IDTextBox" runat="server" 
                Text='<%# Bind("State_ID") %>' />
            <br />
            Зарплата от:
            <asp:TextBox ID="SalaryMinTextBox" runat="server" 
                Text='<%# Bind("SalaryMin") %>' />
            <br />
            <asp:CheckBox ID="IsHotCheckBox" runat="server" 
                Checked='<%# Bind("IsHot") %>' Text="Разместить в горящем списке" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Вставка" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Отмена" />
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
                        <asp:Label ID="EcpecProfNameLabel" runat="server" 
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
                        <asp:Label ID="Label2" runat="server" 
                            Text='<%# Eval("EcpecProfName") %>' Font-Bold="True" />
                  </td>
                </tr>
                <tr>  
                    <td>
                        Номер резюме:&nbsp;<asp:Label ID="Label3" runat="server" 
                        Text='<%# Eval("Resume_ID") %>' Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                     <td>
                        Стаж работы:&nbsp;
                        <asp:Label ID="WorkStageLabel" runat="server" Text='<%# Eval("WorkStage") %>' 
                            Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Добавлено:&nbsp;<asp:Label ID="AddDateTimeLabel" runat="server" 
                        Text='<%# Eval("AddDateTime") %>' Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Возраст (полных лет):&nbsp;
            <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age") %>' Font-Bold="True" />
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
                                    <asp:ListItem Value="1" Selected="True">Мужской</asp:ListItem>
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
                        <asp:Label ID="AdressLabel" runat="server" Text='<%# Eval("Adress") %>' />
                    
                    </td>
                    <td>
                    Фактический адрес проживания:<br />
                    <asp:Label ID="FactAdressLabel" runat="server" 
                      Text='<%# Eval("FactAdress") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                    Зарплата от:
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("SalaryMin") %>' />
                    <br/><a href="http://rabota-yug.ru/AddFunction/ReportResume.aspx?Resume_ID=<%# Eval("Resume_ID") %>" target="_blank">Печатная форма</a>
                    </td>
                    <td>
                    </td>
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
                        Width="259px" Text='<%# Eval("ProfEmp") %>' ReadOnly="True"></asp:TextBox>
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
                        Width="263px" Text='<%# Eval("OtherInfo") %>' ReadOnly="True"></asp:TextBox>
                 </td></tr>
     </table>

            <center>
  <asp:Button ID="ReportButton" runat="server" Text="В виде полного отчета" onclick="ReportButton_Click" 
        style="height: 26px" />  
</center>
              
            &nbsp;&nbsp;
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            Нет данных резюме для отображения
        </EmptyDataTemplate>
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#63EF9E" />
    </asp:FormView>
    </asp:View>
    <asp:View ID="ReportView" runat="server">
      <asp:FormView ID="fvResumeReportManip" runat="server" DataKeyNames="Resume_ID" 
    DataSourceID="odsEditResume" 
                                                CellPadding="4" 
    ForeColor="#333333" Width="100%" BorderStyle="Solid" BorderColor="#E7E7FF" 
    BorderWidth="2px">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#FFFFFF" ForeColor="#333333" />
        <EditItemTemplate>
          Невозможно изменение в режиме полного отчета
        </EditItemTemplate>
        <InsertItemTemplate>
          Невозможна вставка в режиме полного отчета
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
                        <asp:Label ID="EcpecProfNameLabel" runat="server" 
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
                        <asp:Label ID="Label2" runat="server" 
                            Text='<%# Eval("EcpecProfName") %>' Font-Bold="True" />
                  </td>
                </tr>
                <tr>  
                    <td>
                        Номер резюме:&nbsp;<asp:Label ID="Label3" runat="server" 
                        Text='<%# Eval("Resume_ID") %>' Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                     <td>
                        Стаж работы:&nbsp;
                        <asp:Label ID="WorkStageLabel" runat="server" Text='<%# Eval("WorkStage") %>' 
                            Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Добавлено:&nbsp;<asp:Label ID="AddDateTimeLabel" runat="server" 
                        Text='<%# Eval("AddDateTime") %>' Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Возраст (полных лет):&nbsp;
            <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age") %>' Font-Bold="True" />
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
                                    <asp:ListItem Value="1" Selected="True">Мужской</asp:ListItem>
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
                        <asp:Label ID="AdressLabel" runat="server" Text='<%# Eval("Adress") %>' />
                    
                    </td>
                    <td>
                    Фактический адрес проживания:<br />
                    <asp:Label ID="FactAdressLabel" runat="server" 
                      Text='<%# Eval("FactAdress") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                    Зарплата от:
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("SalaryMin") %>' />
                    </td>
                    <td>
                    </td>
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
                        Width="259px" Text='<%# Eval("ProfEmp") %>' ReadOnly="True"></asp:TextBox>
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
                        Width="263px" Text='<%# Eval("OtherInfo") %>' ReadOnly="True"></asp:TextBox>
                 </td></tr>
     </table>

        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            Нет данных резюме для отображения
        </EmptyDataTemplate>
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#63EF9E" />
    </asp:FormView>
    <user:ResumeOldWorksManip id="ResumeOldWorksManip" dsMode="read" runat="server"       AccessLogin="all" />
    <user:ResumeBuildingsManip id="ResumeBuildingsManip" dsMode="read" runat="server"  AccessLogin="all" />
      Извините, полный вид в разработке...
      <br/>
      <center>
  <asp:Button ID="ShortViewButton" runat="server" Text="Назад к основным данным" onclick="ShortViewButton_Click" 
        style="height: 26px" />  
</center>
    </asp:View>
    </asp:MultiView>