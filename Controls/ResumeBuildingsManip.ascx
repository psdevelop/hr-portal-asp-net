<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResumeBuildingsManip.ascx.cs" Inherits="Controls_ResumeBuildingsManip" %>
<asp:HiddenField ID="hfAccessLogin" runat="server" Value="Denied" />
<asp:ObjectDataSource ID="odsResumeBuildings" runat="server" 
                                                
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetResumeBuilds" 
                                                
    TypeName="dsResumeBuildingsTableAdapters.ResumeBuildSelectCommandTableAdapter" 
    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_Building_ID" Type="Int32" />
                                                </DeleteParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="SpName" Type="String" />
                                                    <asp:Parameter Name="BegYear" Type="Int32" />
                                                    <asp:Parameter Name="EndYear" Type="Int32" />
                                                    <asp:Parameter Name="InstName" Type="String" />
                                                    <asp:Parameter Name="Resume_ID" Type="Int32" />
                                                    <asp:Parameter Name="BegMonth" Type="String" />
                                                    <asp:Parameter Name="EndMonth" Type="String" />
                                                    <asp:Parameter Name="LearnMode" Type="String" />
                                                    <asp:Parameter Name="BuildingType_ID" Type="Int32" />
                                                    <asp:Parameter Name="Original_Building_ID" Type="Int32" />
                                                </UpdateParameters>
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="Resume_ID" 
                                                        QueryStringField="Resume_ID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="hfAccessLogin" DefaultValue="Denied" 
                                                        Name="UserLogin" PropertyName="Value" Type="String" />
                                                </SelectParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="SpName" Type="String" />
                                                    <asp:Parameter Name="BegYear" Type="Int32" />
                                                    <asp:Parameter Name="EndYear" Type="Int32" />
                                                    <asp:Parameter Name="InstName" Type="String" />
                                                    <asp:QueryStringParameter DefaultValue="0" Name="Resume_ID" 
                                                        QueryStringField="Resume_ID" Type="Int32" />
                                                    <asp:Parameter Name="BegMonth" Type="String" />
                                                    <asp:Parameter Name="EndMonth" Type="String" />
                                                    <asp:Parameter Name="LearnMode" Type="String" />
                                                    <asp:Parameter Name="BuildingType_ID" Type="Int32" />
                                                </InsertParameters>
                                            </asp:ObjectDataSource>

              
    <asp:SqlDataSource ID="sdsBuldingsType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PMConnectionString %>" 
        SelectCommand="SELECT [Name], [BuildingType_ID] FROM [PSP_BuildingTypes]">
    </asp:SqlDataSource>
    <asp:XmlDataSource ID="xmldsMonths" runat="server" 
            DataFile="~/App_Data/Months.xml"></asp:XmlDataSource>
    
 <asp:GridView ID="gwResumeBuildings" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataKeyNames="Building_ID" DataSourceID="odsResumeBuildings" 
                    GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="InstName" HeaderText="Учебно заведение" 
                            SortExpression="InstName" />
                        <asp:BoundField DataField="BuildPeriod" HeaderText="Период обучения" 
                            SortExpression="BuildPeriod" />
                        <asp:BoundField DataField="SpName" HeaderText="Наименование специальности" 
                            SortExpression="SpName" />
                        <asp:BoundField DataField="LearnMode" HeaderText="Форма обучения" 
                            SortExpression="LearnMode" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Left" 
                        VerticalAlign="Top" />
                    <EmptyDataTemplate>
                        Нет записей по данному резюме о полученном образовании
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:GridView>
                
                <br />
                
                <asp:FormView ID="fvAddResumeBuilding" runat="server" CellPadding="4" 
                    DataKeyNames="Building_ID" DataSourceID="odsResumeBuildings" 
                    DefaultMode="Insert" Height="85px" 
    Width="299px" ForeColor="#333333">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <EditItemTemplate>
                        Специальность:
                        <asp:TextBox ID="SpNameTextBox" runat="server" Text='<%# Bind("SpName") %>' />
                        <br />
                        Год поступления:
                        <asp:TextBox ID="BegYearTextBox" runat="server" Text='<%# Bind("BegYear") %>' />
                        <br />
                        Год окончания:
                        <asp:TextBox ID="EndYearTextBox" runat="server" Text='<%# Bind("EndYear") %>' />
                        <br />
                        Наименование:
                        <asp:TextBox ID="InstNameTextBox" runat="server" 
                            Text='<%# Bind("InstName") %>' />
                        <br />
                        Месяц поступления:
                        <asp:TextBox ID="BegMonthTextBox" runat="server" 
                            Text='<%# Bind("BegMonth") %>' />
                        <br />
                        Месяц окончания:
                        <asp:TextBox ID="EndMonthTextBox" runat="server" 
                            Text='<%# Bind("EndMonth") %>' />
                        <br />
                        Форма обучения:
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="130px" 
                            SelectedValue='<%# Bind("LearnMode") %>'>
                          <asp:ListItem Value="Очно" Selected="True">Очно</asp:ListItem>
                          <asp:ListItem Value="Заочно">Заочно</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlResumeOldBuildType" runat="server">
                        </asp:DropDownList>
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Обновить" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Отмена" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <h3 id="AddHeader">Добавление в список</h3>
                        <table>
                          <tr>
                            <td align="right">
                              Наименование:
                            </td>
                            <td align="left">
                              <asp:TextBox ID="InstNameTextBox" runat="server" 
                                     Text='<%# Bind("InstName") %>' MaxLength="255" Width="200px" />
                                <ajaxToolkit:TextBoxWatermarkExtender ID="InstNameTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="InstNameTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Введите наим. образ. учреждения">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                              Специальность:
                            </td>
                            <td align="left">
                              <asp:TextBox ID="SpNameTextBox" runat="server" Text='<%# Bind("SpName") %>' 
                                    MaxLength="150" Width="200px" />
                                <ajaxToolkit:TextBoxWatermarkExtender ID="SpNameTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="SpNameTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Введите наим. специальности">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                              Год/мес. поступл.:
                              
                            </td>
                            <td align="left">
                              <asp:TextBox ID="BegYearTextBox" runat="server" Width="80" 
                                    Text='<%# Bind("BegYear") %>' MaxLength="4" />
                                <ajaxToolkit:TextBoxWatermarkExtender ID="BegYearTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="BegYearTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Введите год">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                                <ajaxToolkit:FilteredTextBoxExtender ID="BegYearTextBox_FilteredTextBoxExtender" 
                                    runat="server" Enabled="True" FilterType="Numbers" 
                                    TargetControlID="BegYearTextBox">
                                </ajaxToolkit:FilteredTextBoxExtender>
                                <asp:DropDownList ID="ddlBirthDayMonth" runat="server" 
                                    DataSourceID="xmldsMonths" DataTextField="text" DataValueField="value" 
                                    Width="91px" SelectedValue='<%# Bind("BegMonth") %>'>
                                </asp:DropDownList>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                              Год/мес. оконч.:
                              
                            </td>
                            <td align="left">
                              <asp:TextBox ID="EndYearTextBox" runat="server" Width="80" 
                                    Text='<%# Bind("EndYear") %>' MaxLength="4" />
                                <ajaxToolkit:TextBoxWatermarkExtender ID="EndYearTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="EndYearTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="Введите год">
                                </ajaxToolkit:TextBoxWatermarkExtender>
                                <ajaxToolkit:FilteredTextBoxExtender ID="EndYearTextBox_FilteredTextBoxExtender" 
                                    runat="server" Enabled="True" FilterType="Numbers" 
                                    TargetControlID="EndYearTextBox">
                                </ajaxToolkit:FilteredTextBoxExtender>
                                <asp:DropDownList ID="ddlBirthDayMonth0" runat="server" 
                                    DataSourceID="xmldsMonths" DataTextField="text" DataValueField="value" 
                                    Width="91px" SelectedValue='<%# Bind("EndMonth") %>'>
                                </asp:DropDownList>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                              Форма обучения:
                              
                            </td>
                            <td align="left">
                              <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" 
                                SelectedValue='<%# Bind("LearnMode") %>'>
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
                              <asp:DropDownList ID="ddlResumeBuildType" runat="server" 
                                DataSourceID="sdsBuldingsType" DataTextField="Name" 
                                DataValueField="BuildingType_ID"  
                                SelectedValue='<%# Bind("BuildingType_ID") %>' Width="200px">
                              </asp:DropDownList>
                            </td>
                          </tr>
                        </table>
                        
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Вставка" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Отмена" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        SpName:
                        <asp:Label ID="SpNameLabel" runat="server" Text='<%# Bind("SpName") %>' />
                        <br />
                        Building_ID:
                        <asp:Label ID="Building_IDLabel" runat="server" 
                            Text='<%# Eval("Building_ID") %>' />
                        <br />
                        BegYear:
                        <asp:Label ID="BegYearLabel" runat="server" Text='<%# Bind("BegYear") %>' />
                        <br />
                        EndYear:
                        <asp:Label ID="EndYearLabel" runat="server" Text='<%# Bind("EndYear") %>' />
                        <br />
                        InstName:
                        <asp:Label ID="InstNameLabel" runat="server" Text='<%# Bind("InstName") %>' />
                        <br />
                        Resume_ID:
                        <asp:Label ID="Resume_IDLabel" runat="server" Text='<%# Bind("Resume_ID") %>' />
                        <br />
                        BegMonth:
                        <asp:Label ID="BegMonthLabel" runat="server" Text='<%# Bind("BegMonth") %>' />
                        <br />
                        EndMonth:
                        <asp:Label ID="EndMonthLabel" runat="server" Text='<%# Bind("EndMonth") %>' />
                        <br />
                        LearnMode:
                        <asp:Label ID="LearnModeLabel" runat="server" Text='<%# Bind("LearnMode") %>' />
                        <br />
                        BuildingType_ID:
                        <asp:Label ID="BuildingType_IDLabel" runat="server" 
                            Text='<%# Bind("BuildingType_ID") %>' />
                        <br />
                    </ItemTemplate>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                </asp:FormView>