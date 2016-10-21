<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResumeOldWorksManip.ascx.cs" Inherits="Controls_ResumeOldWorksManip" %>
<asp:HiddenField ID="hfAccessLogin" runat="server" Value="Denied" />
<asp:ObjectDataSource ID="odsOldWorks" runat="server" 
                                                
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetResumeOldWorks" 
                                                
    TypeName="dsResumeOldWorksTableAdapters.ResumeOldWorkSelectCommandTableAdapter" 
    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_OldWork_ID" Type="Int32" />
                                                </DeleteParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="EndYear" Type="Int32" />
                                                    <asp:Parameter Name="BeginYear" Type="Int32" />
                                                    <asp:Parameter Name="EndMonth" Type="String" />
                                                    <asp:Parameter Name="BeginMonth" Type="String" />
                                                    <asp:Parameter Name="OrgDescript" Type="String" />
                                                    <asp:Parameter Name="DismissalReason" Type="String" />
                                                    <asp:Parameter Name="Resume_ID" Type="Int32" />
                                                    <asp:Parameter Name="OrgName" Type="String" />
                                                    <asp:Parameter Name="WorkSpecific" Type="String" />
                                                    <asp:Parameter Name="SpecialName" Type="String" />
                                                    <asp:Parameter Name="Original_OldWork_ID" Type="Int32" />
                                                </UpdateParameters>
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="Resume_ID" 
                                                        QueryStringField="Resume_ID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="hfAccessLogin" DefaultValue="Denied" 
                                                        Name="UserLogin" PropertyName="Value" Type="String" />
                                                </SelectParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="EndYear" Type="Int32" />
                                                    <asp:Parameter Name="BeginYear" Type="Int32" />
                                                    <asp:Parameter Name="EndMonth" Type="String" />
                                                    <asp:Parameter Name="BeginMonth" Type="String" />
                                                    <asp:Parameter Name="OrgDescript" Type="String" />
                                                    <asp:Parameter Name="DismissalReason" Type="String" />
                                                    <asp:QueryStringParameter DefaultValue="0" Name="Resume_ID" 
                                                        QueryStringField="Resume_ID" Type="Int32" />
                                                    <asp:Parameter Name="OrgName" Type="String" />
                                                    <asp:Parameter Name="WorkSpecific" Type="String" />
                                                    <asp:Parameter Name="SpecialName" Type="String" />
                                                </InsertParameters>
                                            </asp:ObjectDataSource>
<asp:XmlDataSource ID="xmldsMonths" runat="server" 
            DataFile="~/App_Data/Months.xml"></asp:XmlDataSource>
<asp:GridView ID="gwResumeOldWorks" runat="server" AutoGenerateColumns="False" 
                 DataKeyNames="OldWork_ID" DataSourceID="odsOldWorks" BackColor="White" 
                 BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                 GridLines="Horizontal" Width="100%">
                 <AlternatingRowStyle BackColor="#F7F7F7" />
                 <Columns>
                     <asp:BoundField DataField="WPeriod" HeaderText="Период работы" 
                         SortExpression="WPeriod" />
                     <asp:BoundField DataField="OrgName" HeaderText="Организация" 
                         SortExpression="OrgName" />
                     <asp:BoundField DataField="OrgDescript" HeaderText="Вид деятельности" 
                         SortExpression="OrgDescript" />
                     <asp:BoundField DataField="SpecialName" HeaderText="Должность" 
                         SortExpression="SpecialName" />
                     <asp:BoundField DataField="WorkSpecific" HeaderText="Условия работы" 
                         SortExpression="WorkSpecific" Visible="False" />
                     <asp:BoundField DataField="DismissalReason" HeaderText="Причина увольнения" 
                         SortExpression="DismissalReason" Visible="False" />
                 </Columns>
                 <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                 <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" 
                     HorizontalAlign="Left" />
                 <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                 <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Left" 
                     VerticalAlign="Top" />
                 <EmptyDataTemplate>
                     Нет записей по данному резюме о прежних местах работы
                 </EmptyDataTemplate>
                 <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
             </asp:GridView>
             <br/>
             <asp:FormView ID="fvAddResumeOldWorks" runat="server" CellPadding="4" 
                 DataKeyNames="OldWork_ID" DataSourceID="odsOldWorks" 
        DefaultMode="Insert" ForeColor="#333333">
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <RowStyle BackColor="#EFF3FB" />
                 <EditItemTemplate>
                     EndYear:
                     <asp:TextBox ID="EndYearTextBox" runat="server" Text='<%# Bind("EndYear") %>' />
                     <br />
                     BeginYear:
                     <asp:TextBox ID="BeginYearTextBox" runat="server" 
                         Text='<%# Bind("BeginYear") %>' />
                     <br />
                     EndMonth:
                     <asp:TextBox ID="EndMonthTextBox" runat="server" 
                         Text='<%# Bind("EndMonth") %>' />
                     <br />
                     BeginMonth:
                     <asp:TextBox ID="BeginMonthTextBox" runat="server" 
                         Text='<%# Bind("BeginMonth") %>' />
                     <br />
                     OrgDescript:
                     <asp:TextBox ID="OrgDescriptTextBox" runat="server" 
                         Text='<%# Bind("OrgDescript") %>' />
                     <br />
                     DismissalReason:
                     <asp:TextBox ID="DismissalReasonTextBox" runat="server" 
                         Text='<%# Bind("DismissalReason") %>' />
                     <br />
                     OrgName:
                     <asp:TextBox ID="OrgNameTextBox" runat="server" Text='<%# Bind("OrgName") %>' />
                     <br />
                     WorkSpecific:
                     <asp:TextBox ID="WorkSpecificTextBox" runat="server" 
                         Text='<%# Bind("WorkSpecific") %>' />
                     <br />
                     SpecialName:
                     <asp:TextBox ID="SpecialNameTextBox" runat="server" 
                         Text='<%# Bind("SpecialName") %>' />
                     &nbsp;<br />
                     <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                         CommandName="Update" Text="Обновить" />
                     &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                         CausesValidation="False" CommandName="Cancel" Text="Отмена" />
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <h3>Добавить период работы</h3><table style="width:100%;">
                         <tr>
                             <td class="style1">
                                 Наименование организации:</td>
                             <td>
                                 <asp:TextBox ID="OrgNameTextBox" runat="server" Text='<%# Bind("OrgName") %>' 
                                     Width="200px" />
                                 <ajaxToolkit:TextBoxWatermarkExtender ID="OrgNameTextBox_TextBoxWatermarkExtender" 
                                     runat="server" Enabled="True" TargetControlID="OrgNameTextBox" 
                                     WatermarkCssClass="watermarked" WatermarkText="Введите наим. работодателя">
                                 </ajaxToolkit:TextBoxWatermarkExtender>
                             </td>
                         </tr>
                         <tr>
                             <td class="style1">
                                 Занимаемая должность:</td>
                             <td>
                                 <asp:TextBox ID="SpecialNameTextBox" runat="server" 
                                     Text='<%# Bind("SpecialName") %>' Width="200px" />
                                 <ajaxToolkit:TextBoxWatermarkExtender ID="SpecialNameTextBox_TextBoxWatermarkExtender" 
                                     runat="server" Enabled="True" TargetControlID="SpecialNameTextBox" 
                                     WatermarkCssClass="watermarked" WatermarkText="Введите заним. должность">
                                 </ajaxToolkit:TextBoxWatermarkExtender>
                             </td>
                         </tr>
                         <tr>
                             <td class="style1">
                                 Год/мес. приема:</td>
                             <td>
                                 <asp:TextBox ID="BeginYearTextBox" runat="server" 
                                     Text='<%# Bind("BeginYear") %>' Width="80px" MaxLength="4" />
                                 <asp:DropDownList ID="ddlBirthDayMonth" runat="server" 
                                    DataSourceID="xmldsMonths" DataTextField="text" DataValueField="value" 
                                    Width="91px" SelectedValue='<%# Bind("BeginMonth") %>'>
                                 </asp:DropDownList>        
                                 <ajaxToolkit:TextBoxWatermarkExtender ID="BeginYearTextBox_TextBoxWatermarkExtender" 
                                     runat="server" Enabled="True" TargetControlID="BeginYearTextBox" 
                                     WatermarkCssClass="watermarked" WatermarkText="Введите год">
                                 </ajaxToolkit:TextBoxWatermarkExtender>
                                 <ajaxToolkit:FilteredTextBoxExtender ID="BeginYearTextBox_FilteredTextBoxExtender" 
                                     runat="server" Enabled="True" FilterType="Numbers" 
                                     TargetControlID="BeginYearTextBox">
                                 </ajaxToolkit:FilteredTextBoxExtender>
                                 
                                   
                             </td>
                         </tr>
                         <tr>
                             <td class="style1">
                                 Год/мес. увольнения:</td>
                             <td>
                                 <asp:TextBox ID="EndYearTextBox" runat="server" Text='<%# Bind("EndYear") %>' 
                                     Width="80px" MaxLength="4" />
                                 <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="xmldsMonths" DataTextField="text" DataValueField="value" 
                                    Width="91px" SelectedValue='<%# Bind("EndMonth") %>'>
                                 </asp:DropDownList>       
                                 <ajaxToolkit:TextBoxWatermarkExtender ID="EndYearTextBox_TextBoxWatermarkExtender" 
                                     runat="server" Enabled="True" TargetControlID="EndYearTextBox" 
                                     WatermarkCssClass="watermarked" WatermarkText="Введите год">
                                 </ajaxToolkit:TextBoxWatermarkExtender>
                                 <ajaxToolkit:FilteredTextBoxExtender ID="EndYearTextBox_FilteredTextBoxExtender" 
                                     runat="server" Enabled="True" FilterType="Numbers" 
                                     TargetControlID="EndYearTextBox">
                                 </ajaxToolkit:FilteredTextBoxExtender>
                                 
                                    
                             </td>
                         </tr>
                         <tr>
                             <td class="style1">
                                 Причина увольнения:</td>
                             <td>
                                 <asp:TextBox ID="DismissalReasonTextBox" runat="server" 
                                     Text='<%# Bind("DismissalReason") %>' Width="200px" />
                                 <ajaxToolkit:TextBoxWatermarkExtender ID="DismissalReasonTextBox_TextBoxWatermarkExtender" 
                                     runat="server" Enabled="True" TargetControlID="DismissalReasonTextBox" 
                                     WatermarkCssClass="watermarked" WatermarkText="Укажите основание увольнения">
                                 </ajaxToolkit:TextBoxWatermarkExtender>
                             </td>
                         </tr>
                         <tr>
                             <td class="style1">
                                 Специфика занимаемой должности:</td>
                             <td>
                                 <asp:TextBox ID="OrgDescriptTextBox" runat="server" 
                                     Text='<%# Bind("OrgDescript") %>' Width="200px" Rows="3" 
                                     TextMode="MultiLine" />
                                 <ajaxToolkit:TextBoxWatermarkExtender ID="OrgDescriptTextBox_TextBoxWatermarkExtender" 
                                     runat="server" Enabled="True" TargetControlID="OrgDescriptTextBox" 
                                     WatermarkCssClass="watermarked" WatermarkText="Введите особ. деятельности">
                                 </ajaxToolkit:TextBoxWatermarkExtender>
                             </td>
                         </tr>
                         <tr>
                             <td class="style1">
                                 Достижения, условия работы:</td>
                             <td>
                                 <asp:TextBox ID="WorkSpecificTextBox" runat="server" 
                                     Text='<%# Bind("WorkSpecific") %>' Width="200px" Rows="3" 
                                     TextMode="MultiLine" />
                                 <ajaxToolkit:TextBoxWatermarkExtender ID="WorkSpecificTextBox_TextBoxWatermarkExtender" 
                                     runat="server" Enabled="True" TargetControlID="WorkSpecificTextBox" 
                                     WatermarkCssClass="watermarked" WatermarkText="Опишите особ. условия работы">
                                 </ajaxToolkit:TextBoxWatermarkExtender>
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
                     EndYear:
                     <asp:Label ID="EndYearLabel" runat="server" Text='<%# Bind("EndYear") %>' />
                     <br />
                     BeginYear:
                     <asp:Label ID="BeginYearLabel" runat="server" Text='<%# Bind("BeginYear") %>' />
                     <br />
                     EndMonth:
                     <asp:Label ID="EndMonthLabel" runat="server" Text='<%# Bind("EndMonth") %>' />
                     <br />
                     BeginMonth:
                     <asp:Label ID="BeginMonthLabel" runat="server" 
                         Text='<%# Bind("BeginMonth") %>' />
                     <br />
                     OrgDescript:
                     <asp:Label ID="OrgDescriptLabel" runat="server" 
                         Text='<%# Bind("OrgDescript") %>' />
                     <br />
                     DismissalReason:
                     <asp:Label ID="DismissalReasonLabel" runat="server" 
                         Text='<%# Bind("DismissalReason") %>' />
                     <br />
                     Resume_ID:
                     <asp:Label ID="Resume_IDLabel" runat="server" Text='<%# Bind("Resume_ID") %>' />
                     <br />
                     OrgName:
                     <asp:Label ID="OrgNameLabel" runat="server" Text='<%# Bind("OrgName") %>' />
                     <br />
                     WorkSpecific:
                     <asp:Label ID="WorkSpecificLabel" runat="server" 
                         Text='<%# Bind("WorkSpecific") %>' />
                     <br />
                     SpecialName:
                     <asp:Label ID="SpecialNameLabel" runat="server" 
                         Text='<%# Bind("SpecialName") %>' />
                     <br />
                     OldWork_ID:
                     <asp:Label ID="OldWork_IDLabel" runat="server" 
                         Text='<%# Eval("OldWork_ID") %>' />
                     <br />
                 </ItemTemplate>
                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

             </asp:FormView>