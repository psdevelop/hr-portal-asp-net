<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Administration_Default" Culture="Auto" UICulture="RU-ru" EnableEventValidation="true" %>

<%@ Register src="../Controls/SecurityImageCodeControl.ascx" tagname="SecurityImageCodeControl" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <center>
    <h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        Создание новой учетной записи
        </h1></div>
     <asp:CreateUserWizard ID="CreateUserWizard1" 
             
            runat="server" oncreatinguser="CreateUserWizard1_CreatingUser" 
            StartNextButtonText="Следующий шаг" StepNextButtonText="Следующий шаг" 
            CompleteSuccessText="Учетная запись удачно создана." 
            ConfirmPasswordLabelText="Повтор пароля:" ContinueButtonText="На главную страницу" 
            DuplicateEmailErrorMessage="E-mail, введенный Вами уже используется. Введите другой адрес почты." 
            
            DuplicateUserNameErrorMessage="Пожалуйста, введите другой логин пользователя." 
            AnswerLabelText="Ответ на контрольный вопрос:" 
            AnswerRequiredErrorMessage="Требуется ввести ответ на контрольный вопрос." 
            BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid" 
            BorderWidth="1px" CancelDestinationPageUrl="~/Default.aspx" 
            ConfirmPasswordCompareErrorMessage="Пароль и его повтор должны быть одинаковыми." 
            ConfirmPasswordRequiredErrorMessage="Требуется ввести повтор пароля." 
            ContinueDestinationPageUrl="~/Default.aspx" EmailLabelText="E-mail адрес:" 
            emailregularexpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
            EmailRegularExpressionErrorMessage="Пожалуйста, введите корректный e-mail адрес." 
            EmailRequiredErrorMessage="E-mail не введен." 
            FinishCompleteButtonText="Зарегистрировать" 
            FinishDestinationPageUrl="~/Default.aspx" FinishPreviousButtonText="Назад" 
            Font-Names="Verdana" Font-Size="0.8em" 
            InvalidAnswerErrorMessage="Пожалуйста введите иной ответ на контрольный вопрос." 
            InvalidEmailErrorMessage="Пожалуйста, введите корректный e-mail адрес." 
            InvalidPasswordErrorMessage="Пароль введен неверно. Минимальная длина пароля - 7 символов. Он должен содержать латинские буквы и цифры." 
            InvalidQuestionErrorMessage="Пожалуйста, установите другой контрольный вопрос." 
            oncontinuebuttonclick="CreateUserWizard1_ContinueButtonClick" 
            oncreateduser="CreateUserWizard1_CreatedUser" 
              
            PasswordRegularExpressionErrorMessage="Неподходящий пароль." 
            PasswordRequiredErrorMessage="Требуется ввести пароль." 
            QuestionLabelText="Контрольный вопрос:" 
            QuestionRequiredErrorMessage="Установите контрольный вопрос." 
            StepPreviousButtonText="Назад" 
            UnknownErrorMessage="Ваша учетная запись не была создана. Пожалуйста, попробуйте еще раз." 
            UserNameLabelText="Логин пользователя:" 
            UserNameRequiredErrorMessage="Введите логин пользователя." 
            ActiveStepIndex="1" 
            
            
            
            
            InstructionText="Длина пароля - не менее 7 символов (латинские буквы и цифры)" 
            PasswordRegularExpression="(.{7,})">
            <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" 
                VerticalAlign="Top" />
            <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
            <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                ForeColor="#284775" />
            <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                ForeColor="#284775" />
            <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
                Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
            <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                ForeColor="#284775" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <StepStyle BorderWidth="0px" />
            <WizardSteps>
              <asp:wizardstep ID="Wizardstep1" runat="server" steptype="Start" title="Identification">
              
              <table width="100%" style="text-align:left">
                <tr>
                  <td colspan=2 style="text-align:center; font-weight:bold;">
                    Введите основные данные
                  </td>
                </tr>
                <tr>
                  <td>
                    Фамилия:</td>
                  <td>
                    <asp:textbox id="firstName" runat="server" Width="150px" /></td>
                </tr>
                <tr>
                  <td>
                    Имя:</td>
                  <td>
                    <asp:textbox id="lastName" runat="server" Width="150px" /></td>
                </tr>
                <tr>
                  <td>
                    Отчество:</td>
                  <td>
                    <asp:textbox id="Textbox13" runat="server" Width="150px" /></td>
                </tr>
                 <tr>
                 <td>
                   Дата рождения:
                 </td>
                 <td>
                   <asp:TextBox ID="TextBox14" runat="server" Width="150" TextMode="SingleLine"></asp:TextBox>         
                 </td>
            
                </tr>
                <tr>
                  <td colspan=2 style="text-align:center; font-weight:bold;">
                    Дополнительные параметры (рекомендуется указать для Ваших вакансий и резюме):
                  </td>
                </tr>
                <tr>
                 <td>
                   Полный стаж:
                 </td>
                 <td>
                   <asp:TextBox ID="TextBox15" runat="server" Width="150" TextMode="SingleLine"></asp:TextBox>         
                 </td>
            
                </tr>
                <tr>
                 <td>
                   Гражданство:
                 </td>
                 <td>
                   <asp:TextBox ID="TextBox16" runat="server" Width="150" TextMode="SingleLine"></asp:TextBox>         
                 </td>
            
                </tr>
                <tr>
                 <td>
                   Пол:
                 </td>
                 <td>
                     <asp:DropDownList ID="DropDownList4" runat="server" Width="150px">
                       <asp:ListItem Value=0 Selected="True">Не указан</asp:ListItem>
                     </asp:DropDownList>        
                 </td>
            
                </tr>
                <tr>
                 <td>
                   Семейное положение:
                 </td>
                 <td>
                     <asp:DropDownList ID="DropDownList5" runat="server" Width="150px">
                       <asp:ListItem Value=0 Selected="True">Не указано</asp:ListItem>
                     </asp:DropDownList>        
                 </td>
            
                </tr>
              </table>
            </asp:wizardstep>

                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" >
                    <ContentTemplate>
                        <table border="0" style="font-family:Verdana;font-size:100%;">
                            <tr>
                                <td align="center" colspan="2" 
                                    style="color:White;background-color:#5D7B9D;font-weight:bold;">
                                    Зарегистрировать новую учетную запись</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    Длина пароля - не менее 7 символов (латинские буквы и цифры)</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Логин пользователя:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="Введите логин пользователя." 
                                        ToolTip="Введите логин пользователя." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Пароль:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Требуется ввести пароль." 
                                        ToolTip="Требуется ввести пароль." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                        AssociatedControlID="ConfirmPassword">Повтор пароля:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                        ControlToValidate="ConfirmPassword" 
                                        ErrorMessage="Требуется ввести повтор пароля." 
                                        ToolTip="Требуется ввести повтор пароля." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail адрес:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                        ControlToValidate="Email" ErrorMessage="E-mail не введен." 
                                        ToolTip="E-mail не введен." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Контрольный вопрос:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                        ControlToValidate="Question" ErrorMessage="Установите контрольный вопрос." 
                                        ToolTip="Установите контрольный вопрос." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Ответ на контрольный вопрос:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                        ControlToValidate="Answer" 
                                        ErrorMessage="Требуется ввести ответ на контрольный вопрос." 
                                        ToolTip="Требуется ввести ответ на контрольный вопрос." 
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <uc1:SecurityImageCodeControl ID="SecurityImageCodeControl1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                        ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                        Display="Dynamic" ErrorMessage="Пароль и его повтор должны быть одинаковыми." 
                                        ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:RegularExpressionValidator ID="PasswordRegExp" runat="server" 
                                        ControlToValidate="Password" Display="Dynamic" 
                                        ErrorMessage="Неподходящий пароль." ValidationExpression="(.{7,})" 
                                        ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:RegularExpressionValidator ID="EmailRegExp" runat="server" 
                                        ControlToValidate="Email" Display="Dynamic" 
                                        ErrorMessage="Пожалуйста, введите корректный e-mail адрес." 
                                        ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" 
                                        ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" />
            </WizardSteps>
        </asp:CreateUserWizard>   
    
    </center>
    </form>
    </body>
</html>
