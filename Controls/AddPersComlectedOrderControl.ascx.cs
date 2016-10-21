using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Controls_AddPersComlectedOrderControl : System.Web.UI.UserControl
{
    SqlParameter myParm100, myParm101, myParm102, myParm103,
        myParm104, myParm105, myParm106, myParm107, myParm108, myParm109,
        myParm110, myParm111, myParm112, myParm113;

    SqlConnection myConnection;
    SqlCommand myCommand;
    SqlTransaction trans;

    bool bad_params = false;
    bool _addToRegisteredCompany = false;
    int _CompanyID = 0;

    public bool addToRegisteredCompany
    {
        get
        {
            return _addToRegisteredCompany;
        }

        set
        {
            _addToRegisteredCompany = value;
        }
    }

    public int CompanyID
    {
        get
        {
            return _CompanyID;
        }

        set
        {
            _CompanyID = value;
        }
    }

    protected bool HasCompanyChanges = false;
    protected string OldComp_ID = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
            Session["UserName"] = Context.User.Identity.Name;
        else
            Session["UserName"] = "Guest";
        if (Context.User.Identity.IsAuthenticated)
        {
            if ((Context.User.Identity.Name == "administrator") && (OrgNameTextBox.Text==""))    
            {
                OrgNameTextBox.Text="Фирма \"Рамэна OOO\"";
                HeadNameTextBox.Text="Гюлева Людмила Николаевна";
                OrgAdressTextBox.Text = "353440, г.Анапа, ул.Гоголя, д.55";
                OrgEMailTextBox.Text = "rabota-yug@mail.ru";
                OrgWebTextBox.Text = "www.rabota-yug.ru";
                //OrgWorkQuantLabel.Text = OrgWQTextBox.Text;
                OrgPhonesTextBox.Text = "8(86133)-32213, сот. 8918-164-89-95";
            }
        }
        if (_addToRegisteredCompany)
        {
            VacancyOrderWizard.ActiveStepIndex = 1;
            hfCompanyID.Value = Request.QueryString["CompanyID"].ToString();
            CompInfoMultiView.ActiveViewIndex = 1;
        }
    }

    protected void VacancyOrderWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        int NewCountryID = 1, NewRegionID = 1, NewStateID = 1, NewProfGroupID = 1, NewSpecID = 1;
        bool unsuccessfull = false;
        
        if (RandomCodeImage.IsValid(acknowledgementTextBox.Text)) {
            if (QuickUserCreateControl1.CheckUserData() || Context.User.Identity.IsAuthenticated )
            {
                    if (!bad_params)
                    {
                        try
                        {

                            myConnection = new
                                SqlConnection(WebConfigurationManager.
                                ConnectionStrings["PMConnectionString"].
                                ConnectionString);
                            myCommand = new SqlCommand();
                            myCommand.Connection = myConnection;
                            
                            myCommand.Connection.Open();

                            trans = myCommand.Connection.BeginTransaction();

                            myCommand.Transaction = trans;

                            if (NewCountryTextBox.Text != "")
                            {
                                //Если необходимо добавить новую отрасль
                                myCommand.CommandText =
                                    "CountryInsertRetIDCommand";
                                myCommand.CommandType = CommandType.StoredProcedure;
                                myCommand.Parameters.Clear();
                                myParm100 = myCommand.Parameters.Add("@Name",
                                    SqlDbType.VarChar, 50);
                                myParm101 = myCommand.Parameters.Add("@NewCountryID",
                                    SqlDbType.Int);

                                myParm101.Direction = ParameterDirection.Output;

                                myParm100.Value = NewCountryTextBox.Text;

                                try
                                {
                                    myCommand.ExecuteNonQuery();
                                    NewCountryID =
                                        Int32.Parse(myCommand.Parameters["@NewCountryID"].Value.ToString());
                                    hfVacancyCountry.Value = NewCountryID.ToString();
                                }
                                catch (Exception Ex)
                                {
                                    AlertLabel.Text =
                                       "Неудачное добавление новой страны в список!";
                                    throw new Exception("Неудачное добавление новой страны в список! Попробуйте еще раз. Исключение: "+Ex.Message,
                                        Ex);
                                }
                                finally
                                {
                                }
                            }
                            else
                                if (ddlOrgCountry.SelectedValue != "")
                                    hfVacancyCountry.Value = ddlOrgCountry.SelectedValue;
                                else
                                    hfVacancyCountry.Value = (1).ToString();

                            if (NewRegionTextBox.Text != "")
                            {
                                //Если необходимо добавить новую отрасль
                                myCommand.CommandText =
                                    "RegionToCountryInsertRetIDCommand";
                                myCommand.CommandType = CommandType.StoredProcedure;
                                myCommand.Parameters.Clear();
                                myParm102 = myCommand.Parameters.Add("@Name",
                                    SqlDbType.VarChar, 150);
                                myParm103 = myCommand.Parameters.Add("@NewRegionID",
                                    SqlDbType.Int);
                                myParm104 = myCommand.Parameters.Add("@Country_ID",
                                    SqlDbType.Int);

                                myParm103.Direction = ParameterDirection.Output;

                                myParm102.Value = NewRegionTextBox.Text;
                                if (NewCountryTextBox.Text != "")
                                    myParm104.Value = NewCountryID;
                                else
                                    myParm104.Value = ddlOrgCountry.SelectedValue;

                                try
                                {
                                    myCommand.ExecuteNonQuery();
                                    NewRegionID =
                                        Int32.Parse(myCommand.Parameters["@NewRegionID"].Value.ToString());
                                    hfVacancyRegion.Value =
                                        NewRegionID.ToString();
                                }
                                catch (Exception Ex)
                                {
                                    AlertLabel.Text =
                                       "Неудачное добавление нового региона в список!";
                                    throw new Exception("Неудачное добавление нового региона в список! Попробуйте еще раз. Исключение: "+Ex.Message,
                                        Ex);
                                }
                                finally
                                {
                                }
                            }
                            else
                                if (ddlOrgRegion.SelectedValue != "")
                                    hfVacancyRegion.Value = ddlOrgRegion.SelectedValue;
                                else
                                    hfVacancyRegion.Value = (1).ToString();

                            if (NewStateTextBox.Text!="")
                            {
                                //Если необходимо добавить новую отрасль
                                myCommand.CommandText =
                                    "StateToRegionInsertRetIDCommand";
                                myCommand.CommandType = CommandType.StoredProcedure;
                                myCommand.Parameters.Clear();
                                myParm105 = myCommand.Parameters.Add("@Name",
                                    SqlDbType.VarChar, 50);
                                myParm106 = myCommand.Parameters.Add("@NewStateID",
                                    SqlDbType.Int);
                                myParm107 = myCommand.Parameters.Add("@Region_ID",
                                    SqlDbType.Int);

                                myParm106.Direction = ParameterDirection.Output;

                                myParm105.Value = NewStateTextBox.Text;

                                if (NewRegionTextBox.Text != "")
                                    myParm107.Value = NewRegionID;
                                else
                                    myParm107.Value = ddlOrgRegion.SelectedValue;

                                try
                                {
                                    myCommand.ExecuteNonQuery();
                                    NewStateID =
                                        Int32.Parse(myCommand.Parameters["@NewStateID"].Value.ToString());
                                    hfVacancyState.Value =
                                        NewStateID.ToString();
                                }
                                catch (Exception Ex)
                                {
                                    AlertLabel.Text =
                                       "Неудачное добавление нового населенного пункта в список!";
                                    throw new Exception("Неудачное добавление нового населенного пункта в список! Попробуйте еще раз. Исключение: "+Ex.Message,
                                        Ex);
                                }
                                finally
                                {
                                }
                            }
                            else
                                if (ddlOrgState.SelectedValue != "")
                                    hfVacancyState.Value = ddlOrgState.SelectedValue;
                                else
                                    hfVacancyState.Value = (1).ToString();
                            
                            if (NewPrGroupTextBox.Text!="")
                            {
                                //Если необходимо добавить новую отрасль
                                myCommand.CommandText =
                                    "ProfGroupWithIDRetInsertCommand";
                                myCommand.CommandType = CommandType.StoredProcedure;
                                myCommand.Parameters.Clear();
                                myParm108 = myCommand.Parameters.Add("@Name",
                                    SqlDbType.VarChar, 255);
                                myParm109 = myCommand.Parameters.Add("@Description",
                                    SqlDbType.VarChar, 255);
                                myParm110 = myCommand.Parameters.Add("@NewPrGroupID",
                                    SqlDbType.Int);

                                myParm110.Direction = ParameterDirection.Output;

                                myParm108.Value = NewPrGroupTextBox.Text;
                                myParm109.Value = "без описания";

                                try
                                {
                                    myCommand.ExecuteNonQuery();
                                    NewProfGroupID =
                                        Int32.Parse(myCommand.Parameters["@NewPrGroupID"].Value.ToString());
                                    hfVacancyProfGroup.Value =
                                        NewProfGroupID.ToString();
                                }
                                catch (Exception Ex)
                                {
                                    AlertLabel.Text =
                                       "Неудачное добавление новой отрасли в список!";
                                    throw new Exception("Неудачное добавление новой отрасли в список! Попробуйте еще раз. Исключение: "+Ex.Message,
                                        Ex);
                                }
                                finally
                                {
                                }
                            }
                            else
                                if (ddlVacancyProfGroup.SelectedValue != "")
                                    hfVacancyProfGroup.Value = ddlVacancyProfGroup.SelectedValue;
                                else
                                    hfVacancyProfGroup.Value = (1).ToString();

                            if (NewResumeSpecTextBox.Text!="")
                            {
                                //Если необходимо добавить новую специальность в отрасли
                                myCommand.CommandText =
                                    "SpecWithRetIDInsertCommand";
                                myCommand.CommandType = CommandType.StoredProcedure;
                                myCommand.Parameters.Clear();
                                myParm111 = myCommand.Parameters.Add("@Name",
                                    SqlDbType.VarChar, 50);
                                myParm112 = myCommand.Parameters.Add("@NewSpecID",
                                    SqlDbType.Int);
                                myParm113 = myCommand.Parameters.Add("@ProfGroup_ID",
                                    SqlDbType.Int);

                                myParm112.Direction = ParameterDirection.Output;

                                myParm111.Value = NewResumeSpecTextBox.Text;

                                if (NewPrGroupTextBox.Text != "")
                                    myParm113.Value = NewProfGroupID;
                                else
                                    myParm113.Value = ddlVacancySpec.SelectedValue;

                                try
                                {
                                    myCommand.ExecuteNonQuery();
                                    NewSpecID =
                                        Int32.Parse(myCommand.Parameters["@NewSpecID"].Value.ToString());
                                    hfVacancySpec.Value =
                                        NewSpecID.ToString();
                                }
                                catch (Exception Ex)
                                {
                                    AlertLabel.Text =
                                       "Неудачное добавление новой специальности в список!";
                                    throw new Exception("Неудачное добавление новой специальности в список! Попробуйте еще раз. Исключение: "+Ex.Message,
                                        Ex);
                                }
                                finally
                                {
                                }
                            }
                            else
                                if (ddlVacancySpec.SelectedValue != "")
                                    hfVacancySpec.Value = ddlVacancySpec.SelectedValue;
                                else
                                    hfVacancySpec.Value = (1).ToString();

                            if (Context.User.Identity.IsAuthenticated)
                                Session["UserName"] = Context.User.Identity.Name;
                            else
                                Session["UserName"] = "Guest";

                            if (QuickUserCreateControl1.success_create_user)
                            {
                                //AlertLabel.Text = QuickUserCreateControl1.user_name;
                                Session["UserName"] =
                                   QuickUserCreateControl1.user_name; 
                            }
                            
                            //Добавление записи резюме
                            if (hfCompanyID.Value != "-1")
                            {
                                sdsInsertVacancyWithRegistCompany.Insert();
                            }
                            else
                                sdsInsertVacancyWithCompany.Insert();
                            trans.Commit();
                            
                        }
                        catch (SqlException SqlEx)
                        {
                            if (trans != null)
                            {
                                trans.Rollback();
                            }
                            unsuccessfull = true;
                            throw new Exception("Неудачное прохождение транзакции на добавление новой вакансии! Попробуйте еще раз. Исключение: " + SqlEx.Message,
                                SqlEx);
                        }
                        finally
                        {
                            if (myConnection != null)
                            {
                                myConnection.Close();
                            }
                            if (unsuccessfull)
                            {
                                Response.Redirect("~/AddFunction/UnsuccessOperation.aspx");
                            }
                            else
                            {
                                if (Context.User.Identity.IsAuthenticated)
                                {
                                    Response.Redirect("~/PrivateCab.aspx");
                                }
                                else if ((QuickUserCreateControl1.user_name != "") && (QuickUserCreateControl1.user_name != "Guest"))
                                    FormsAuthentication.RedirectFromLoginPage(QuickUserCreateControl1.user_name, true);
                                else
                                {
                                    Response.Redirect("~/AddFunction/SuccessOperation.aspx");
                                }
                            }
                                
                        }


                    }
                    else
                    {
                        AlertLabel.Text =
                          "Неправильно введены параметры на одном из шагов создания резюме!";
                    }

            }
            else
            {
                AlertLabel.Text =
                      "Неподходящие параметры нового пользователя!";

            }

        }
        else
        {
            AlertLabel.Text =
              "Неверный код подтверждения!";
            ImageAckStatusLabel.Text =
              "Неверный код подтверждения!";
        }


    }

    protected void VacancyOrderWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        OrgNameLabel.Text = OrgNameTextBox.Text;
        HeadFullNameLabel.Text = HeadNameTextBox.Text;
        if (ddlOrgProfType.SelectedValue != "")
            hfOrgProfGroup.Value = ddlOrgProfType.SelectedValue;
        else
            hfOrgProfGroup.Value = (1).ToString();
        //hfOrgRegion.Value = ddlOrgRegion.SelectedValue;
        OrgPrGroupLabel.Text = ddlOrgProfType.SelectedItem.Text;
        OrgAdressLabel.Text = OrgAdressTextBox.Text;
        OrgAgeLabel.Text = OrgAgeTextBox.Text;
        OrgEmailLabel.Text = OrgEMailTextBox.Text;
        OrgWWWLabel.Text = OrgWebTextBox.Text;
        //OrgWorkQuantLabel.Text = OrgWQTextBox.Text;
        OrgPhonesLabel.Text = OrgPhonesTextBox.Text;
    }
}
