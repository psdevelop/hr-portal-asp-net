<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuickUserCreateControl.ascx.cs" Inherits="Controls_QuickUserCreateControl" %>
<asp:LoginView ID="AddNewResumeLoginView" runat="server">
                    <AnonymousTemplate>
                      <p style="width:450px; font-size:12px; font-weight:bold;">Вы-незарегистрированный пользователь или не вошли в систему 
                          <asp:HyperLink ID="HyperLink1" runat="server" 
                              NavigateUrl="~/Administration/Login.aspx">(войти)</asp:HyperLink>, ваша 
                          вакансия будет добавлена <span class="style2">без возможности изменения</span></p>
                      <p style="width:450px; font-size:12px;">Если у вас нет имени входа и вы хотите 
                          изменять поданые вами резюме и вакансии, иметь защищенный доступ и учетную 
                          запись в системе вам можно пройти быструю регистрацию</p> 
                     <asp:Panel ID="QuickRegistrHeadPanel" runat="server" CssClass="collapsePanelHeader">
                        <asp:ImageButton ID="QuickRegistrImage" runat="server" ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Быстрая регистрация...)"/>
                        <asp:Label ID="QuickRegistrLabel" runat="server">(Быстрая регистрация...)</asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="QuickRegistrPanel" runat="server" CssClass="collapsePanel" 
                            Height="0" HorizontalAlign="center">
                          <table border="0" style="text-align:left;">
                            <tr>
                              <td>
                                Логин:
                              </td>
                              <td>
                                <asp:TextBox ID="NewLoginTextBox" runat="server" Width="200px"></asp:TextBox>
                              </td>
                            </tr>
                            
                            <tr>
                              <td>
                                  Пароль (длина&gt;=7):
                              </td>
                              <td>
                                <asp:TextBox ID="NewPswTextBox" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                
                              </td>
                              <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                      ErrorMessage="Неподходящий пароль" ControlToValidate="NewPswTextBox" 
                                      ValidationExpression="(.{7,})" Display="Dynamic"></asp:RegularExpressionValidator>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                Повтор пароля:
                              </td>
                              <td>
                                <asp:TextBox ID="NewPswRepeatTextBox" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                
                              </td>
                              <td>
                                  <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                      ErrorMessage="Неверный повтор пароля" ControlToCompare="NewPswTextBox" 
                                      ControlToValidate="NewPswRepeatTextBox" Display="Dynamic"></asp:CompareValidator>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                E-mail:
                              </td>
                              <td>
                                <asp:TextBox ID="LoginEmailTextBox" runat="server" Width="200px"></asp:TextBox>
                              </td>
                            </tr>
                          </table>
                      <br />
                      

                    </asp:Panel>

                    <ajaxToolkit:CollapsiblePanelExtender ID="cpeDemo" runat="Server"
                      TargetControlID="QuickRegistrPanel"
                      ExpandControlID="QuickRegistrHeadPanel"
                      CollapseControlID="QuickRegistrHeadPanel" 
                      Collapsed="True"
                      TextLabelID="QuickRegistrLabel"
                      ImageControlID="QuickRegistrImage"    
                      ExpandedText="(Скрыть панель регистрации...)"
                      CollapsedText="(Быстрая регистрация...)"
                      ExpandedImage="~/Images/collapse_blue.jpg"
                      CollapsedImage="~/Images/expand_blue.jpg"
                      SuppressPostBack="true"
                      SkinID="" />
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                    </LoggedInTemplate>
                  </asp:LoginView>
          <asp:Label ID="QuickRegisterStatusLabel" runat="server" Font-Bold="True" 
                      ForeColor="#FF3300"></asp:Label>