using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.Adapters;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Windows.Forms;

public struct ResBuild
{
    public string Name;
    public string Spec;
    public int StartYear, StartMonth, EndYear, EndMonth;
    public string BuildMode;
    public int BuildID;
}

public struct ResOldWork
{
    public string OrgName;
    public string OrgDesc;
    public int StartYear, StartMonth, EndYear, EndMonth;
    public string DismissalReason;
    public string SpecName;
    public string WorkSpec;
}

public partial class AddNewResume : System.Web.UI.Page
{
    SqlParameter myParm, myParm2, myParm3, myParm4, myParm5, myParm6,
        myParm7, myParm8, myParm9, myParm10, myParm11, myParm12, myParm13,
        myParm14, myParm15, myParm16, myParm17, myParm18, myParm19, myParm20,
        myParm21, myParm22, myParm23, myParm24, myParm25, myParm26, myParm27,
        myParm28, myParm29, myParm30, myParm100, myParm101, myParm102, myParm103,
        myParm104, myParm105, myParm106, myParm107, myParm108, myParm109,
        myParm110, myParm111, myParm112, myParm113, myParm114, myParm115,
        myParm116, myParm117, myParm118;

    SqlConnection myConnection;
    SqlCommand myCommand;
    SqlTransaction trans;
    
    private bool bad_params = false;
    //private bool has_new_build_elm = true;
    //private bool has_new_oldwork_elm = true;

    List<ResOldWork> ResOldWorkValues =
            new List<ResOldWork>();

    List<ResBuild> ResBuildValues =
            new List<ResBuild>();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Добавление резюме." + Session["BASETITLE"];
        //AddBuildToList();
        if (hfStartLoadStatus.Value == "1")
        {   
            sdsDeleteUnattachedWHistory.Delete();
            sdsDeleteUnattachedBuilds.Delete();
            hfStartLoadStatus.Value = "0";
        }

    }

    public void WriteYearInterval(int starty, int endy)
    {
        for (int i = starty; i >= endy; i--)
        {
            Response.Write("<asp:ListItem Value=\"");
            Response.Write(i);
            Response.Write("\">");
            Response.Write(i);
            Response.Write("</asp:ListItem>");
        }
          
    }
    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        
    }

    public void ExecuteStoredProcedure(string ProcedureName,
      string myConnectionString, int id)
    {

    }

    public void RunTransaction(string[] Queries, string
myConnectionString)
    {
        SqlConnection conn = null;
        SqlTransaction trans = null;
        try
        {
            conn = new SqlConnection(myConnectionString);
            conn.Open();

            trans = conn.BeginTransaction();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.Transaction = trans;
            foreach (string Query in Queries)
            {
                cmd.CommandText = Query;
                cmd.ExecuteNonQuery();
            }
            trans.Commit();
        }
        catch (SqlException SqlEx)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            throw new Exception("An error occurred while transaction",
      SqlEx);
           
        }
        finally
        {
            if (conn != null)
            {
                conn.Close();
            }
        }
    }

    public static string GetConnectionString()
    {
        return WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

    protected void AddNewResumeWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        int NewResumeID=1, NewCountryID=1, NewRegionID=1, NewStateID=1, NewProfGroupID=1, NewSpecID=1;
        bool unsuccessfull = false;

        if (RandomCodeImage.IsValid(acknowledgementTextBox.Text)) {


        if (QuickUserCreateControl1.CheckUserData() || Context.User.Identity.IsAuthenticated )
        {
            if (!bad_params && Page.IsValid)
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
                        }
                        catch (Exception Ex)
                        {
                            AlertLabel.Text =
                               "Неудачное добавление новой страны в список!";
                            throw new Exception("Неудачное добавление новой страны в список! Попробуйте еще раз. Исключение: ",
                                Ex);
                        }
                        finally
                        {
                        }
                    }


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
                            myParm104.Value = ddlResumeCountry.SelectedValue;

                        try
                        {

                            myCommand.ExecuteNonQuery();
                            NewRegionID =
                                Int32.Parse(myCommand.Parameters["@NewRegionID"].Value.ToString());
                        }
                        catch (Exception Ex)
                        {
                            AlertLabel.Text =
                               "Неудачное добавление нового региона в список!";
                            throw new Exception("Неудачное добавление нового региона в список! Попробуйте еще раз. Исключение: ",
                                Ex);
                        }
                        finally
                        {
                        }

                    }

                    if (NewStateTextBox.Text != "")
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
                            myParm107.Value = ddlResumeRegion.SelectedValue;

                        try
                        {
                            myCommand.ExecuteNonQuery();
                            NewStateID =
                                Int32.Parse(myCommand.Parameters["@NewStateID"].Value.ToString());
                        }
                        catch (Exception Ex)
                        {
                            AlertLabel.Text =
                               "Неудачное добавление нового населенного пункта в список!";
                            throw new Exception("Неудачное добавление нового населенного пункта в список! Попробуйте еще раз. Исключение: ",
                                Ex);
                        }
                        finally
                        {
                        }

                    }

                    if (NewPrGroupTextBox.Text != "")
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
                        }
                        catch (Exception Ex)
                        {
                            AlertLabel.Text =
                               "Неудачное добавление новой отрасли в список!";
                            throw new Exception("Неудачное добавление новой отрасли в список! Попробуйте еще раз. Исключение: ",
                                Ex);
                        }
                        finally
                        {
                        }

                    }

                    if (NewResumeSpecTextBox.Text != "")
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
                            myParm113.Value = ddlResumeProfGroup.SelectedValue;

                        try
                        {
                            myCommand.ExecuteNonQuery();
                            NewSpecID =
                                Int32.Parse(myCommand.Parameters["@NewSpecID"].Value.ToString());
                        }
                        catch (Exception Ex)
                        {
                            AlertLabel.Text =
                               "Неудачное добавление новой специальности в список!";
                            throw new Exception("Неудачное добавление новой специальности в список! Попробуйте еще раз. Исключение: ",
                                Ex);
                        }
                        finally
                        {
                        }

                    }

                    //Операция по добавлению резюме
                    myCommand.CommandText =
                        "ResumeWithDetailsInsertCommand";
                    myCommand.CommandType = CommandType.StoredProcedure;
                    //Создание параметров для операции добавления в таблицу РЕЗЮМЕ
                    myCommand.Parameters.Clear();
                    myParm = myCommand.Parameters.Add("@WorkStage",
                        SqlDbType.Float);
                    myParm2 = myCommand.Parameters.Add("@Age",
                      SqlDbType.Int);

                    //myParm3 = myCommand.Parameters.Add("@WorkPosition_ID",
                    //  SqlDbType.Int);
                    myParm4 = myCommand.Parameters.Add("@IsHot",
                      SqlDbType.Bit);
                    myParm5 = myCommand.Parameters.Add("@IsProtect",
                      SqlDbType.Bit);
                    myParm6 = myCommand.Parameters.Add("@IsOld",
                      SqlDbType.Bit);
                    myParm7 = myCommand.Parameters.Add("@EcpecProfName",
                      SqlDbType.VarChar, 255);
                    myParm8 = myCommand.Parameters.Add("@ProfGroup_ID",
                      SqlDbType.Int);
                    myParm9 = myCommand.Parameters.Add("@IsModerated",
                      SqlDbType.Bit);
                    myParm10 = myCommand.Parameters.Add("@IsOccuped",
                      SqlDbType.Bit);
                    myParm11 = myCommand.Parameters.Add("@OtherInfo",
                      SqlDbType.VarChar, 500);
                    myParm12 = myCommand.Parameters.Add("@ProfEmp",
                      SqlDbType.VarChar, 1000);
                    myParm13 = myCommand.Parameters.Add("@HightProjects",
                      SqlDbType.VarChar, 500);
                    myParm14 = myCommand.Parameters.Add("@FullName",
                      SqlDbType.VarChar, 150);
                    myParm15 = myCommand.Parameters.Add("@Adress",
                      SqlDbType.VarChar, 255);
                    myParm16 = myCommand.Parameters.Add("@FactAdress",
                      SqlDbType.VarChar, 255);
                    myParm17 = myCommand.Parameters.Add("@Sex",
                      SqlDbType.Int);
                    myParm18 = myCommand.Parameters.Add("@Professional_ID",
                      SqlDbType.Int);
                    myParm19 = myCommand.Parameters.Add("@BuildingType_ID",
                      SqlDbType.Int);
                    myParm20 = myCommand.Parameters.Add("@State_ID",
                      SqlDbType.Int);
                    myParm21 = myCommand.Parameters.Add("@SalaryMin",
                      SqlDbType.Float);
                    myParm22 = myCommand.Parameters.Add("@UserLogin",
                      SqlDbType.VarChar, 50);
                    myParm23 = myCommand.Parameters.Add("@WorkMode_ID",
                      SqlDbType.Int);
                    myParm24 = myCommand.Parameters.Add("@BirthDay",
                      SqlDbType.DateTime);
                    myParm25 = myCommand.Parameters.Add("@FirstName",
                      SqlDbType.VarChar, 50);
                    myParm26 = myCommand.Parameters.Add("@LastName",
                      SqlDbType.VarChar, 50);
                    myParm27 = myCommand.Parameters.Add("@SurName",
                      SqlDbType.VarChar, 50);
                    myParm28 = myCommand.Parameters.Add("@NewResumeID",
                      SqlDbType.Int);
                    myParm29 = myCommand.Parameters.Add("@Region_ID",
                      SqlDbType.Int);
                    myParm30 = myCommand.Parameters.Add("@Country_ID",
                      SqlDbType.Int);
                    myParm28.Direction = ParameterDirection.Output;
                    myParm114 = myCommand.Parameters.Add("@INSSession_ID",
                      SqlDbType.VarChar, 255);
                    myParm115 = myCommand.Parameters.Add("@UserPhotoFilePath",
                      SqlDbType.VarChar, 255);
                    myParm116 = myCommand.Parameters.Add("@Phones",
                      SqlDbType.VarChar, 255);
                    myParm117 = myCommand.Parameters.Add("@Email",
                      SqlDbType.VarChar, 255);
                    myParm118 = myCommand.Parameters.Add("@Website",
                      SqlDbType.VarChar, 255);

                    DateTime BDDateTime = new DateTime(
                        Int32.Parse(BirthDayYearTextBox.Text),
                        Int32.Parse(ddlBirthDayMonth.SelectedValue),
                        Int32.Parse(BirthDayDayTextBox.Text));
                    int year_dif = DateTime.Today.Year - BDDateTime.Year;
                    if ((BDDateTime.Month > DateTime.Today.Month) ||
                        ((BDDateTime.Month == DateTime.Today.Month) &&
                         (BDDateTime.Day > DateTime.Today.Day)))
                    {
                        year_dif = year_dif - 1;
                    }
                    //Параметры личных данных
                    myParm2.Value = year_dif;
                    myParm24.Value = BDDateTime;
                    myParm25.Value = ResumeNameTextBox.Text;
                    myParm26.Value = ResumeLastNameTextBox.Text;
                    myParm27.Value = ResumeSurnameTextBox.Text;
                    myParm15.Value = AdressTextBox.Text;
                    myParm16.Value = FactAdressTextBox.Text;
                    myParm17.Value = 1;//ddlSex.SelectedValue;

                    if (NewStateID != 1)
                        myParm20.Value = NewStateID;
                    else
                        if (ddlResumeState.SelectedValue == "")
                            myParm20.Value = Convert.ToString(1);
                        else
                            myParm20.Value = (String)ddlResumeState.SelectedValue;

                    myParm4.Value = IsHotCheckBox.Checked;
                    myParm5.Value = true;
                    myParm6.Value = false;
                    myParm9.Value = false;
                    myParm10.Value = false;

                    if (Context.User.Identity.IsAuthenticated)
                        Session["UserName"] = Context.User.Identity.Name;
                    else
                        Session["UserName"] = "Guest";

                    if (QuickUserCreateControl1.success_create_user)
                    {
                        Session["UserName"] =
                           QuickUserCreateControl1.user_name;
                        myParm22.Value = QuickUserCreateControl1.user_name;
                    }
                    else
                    {
                        myParm22.Value = Session["UserName"];
                    }

                    //Основные данные резюме
                    if (ResumeWorkStageTextBox.Text == "")
                        myParm.Value = (0).ToString();
                    else
                        myParm.Value = ResumeWorkStageTextBox.Text;

                    if (NewProfGroupID != 1)
                        myParm8.Value = NewProfGroupID;
                    else
                        if (ddlResumeProfGroup.SelectedValue == "")
                        {
                            myParm8.Value = Convert.ToString(1);
                        }
                        else
                        {
                            myParm8.Value = ddlResumeProfGroup.SelectedValue;
                        }

                    if (NewSpecID != 1)
                        myParm18.Value = NewSpecID;
                    else
                        if (ddlResumeSpec.SelectedValue == "")
                        {
                            myParm18.Value = Convert.ToString(1);
                        }
                        else
                        {
                            myParm18.Value = ddlResumeSpec.SelectedValue;
                        }

                    if (NewRegionID != 1)
                        myParm29.Value = NewRegionID;
                    else
                        if (ddlResumeRegion.SelectedValue == "")
                        {
                            myParm29.Value = Convert.ToString(1);
                        }
                        else
                        {
                            myParm29.Value = ddlResumeRegion.SelectedValue;
                        }

                    if (NewCountryID != 1)
                        myParm30.Value = NewCountryID;
                    else
                        if (ddlResumeCountry.SelectedValue == "")
                        {
                            myParm30.Value = Convert.ToString(1);
                        }
                        else
                        {
                            myParm30.Value = ddlResumeCountry.SelectedValue;
                        }

                    if (EcpecProfNameTextBox.Text != "")
                        myParm7.Value = EcpecProfNameTextBox.Text;
                    else
                        myParm7.Value = "Не указана";
                    if (SalaryMinTextBox.Text == "")
                        myParm21.Value = (0).ToString();
                    else
                        myParm21.Value = SalaryMinTextBox.Text;
                    myParm19.Value = ddlBuildingType.SelectedValue;
                    if (myParm19.Value == "")
                    {
                        myParm19.Value = "1";
                    }
                    myParm23.Value = ddlWorkMode.SelectedValue;
                    if (myParm23.Value == "")
                    {
                        myParm23.Value = "1";
                    }
                    myParm12.Value = SpecWorkModeTextBox.Text;
                    myParm11.Value = SpecIfsTextBox.Text;
                    myParm13.Value = "";
                    myParm14.Value = "";
                    myParm114.Value = Session.SessionID;
                    myParm115.Value = hfUserFotoFilePath.Value.ToString();
                    myParm116.Value = PhonesTextBox.Text;
                    myParm117.Value = EmailTextBox.Text;
                    myParm118.Value = WebsiteTextBox.Text;

                    //UserPhotoFileUpload.

                    myCommand.ExecuteNonQuery();
                    NewResumeID =
                        Int32.Parse(myCommand.Parameters["@NewResumeID"].Value.ToString());


                    trans.Commit();

                }
                catch (SqlException SqlEx)
                {
                    if (trans != null)
                    {
                        trans.Rollback();
                    }
                    unsuccessfull = true;
                    throw new Exception("Неудачное прохождение транзакции на добавление нового резюме! Попробуйте еще раз. Исключение: ",
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
                        //AlertLabel.Text ="Неудачно!";
                        Response.Redirect("~/AddFunction/UnsuccessOperation.aspx");
                    }
                    else
                    {
                        AlertLabel.Text = "Удачно!";
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

    protected void AddBuildToList()
    {
        SqlParameter mylParm, mylParm2, mylParm3, mylParm5, mylParm6,
            mylParm7, mylParm8, mylParm9, mylParm10, mylParm11;
        bool unsuccessfull = false;
        
        if (BuildOrgNameTextBox.Text!="")
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

                myCommand.CommandText =
                    "ResumeBuildInsertWithSessionIDRetIDCommand";
                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.Parameters.Clear();
                mylParm = myCommand.Parameters.Add("@SpName",
                    SqlDbType.VarChar, 150);
                mylParm2 = myCommand.Parameters.Add("@BegYear",
                    SqlDbType.Int);
                mylParm3 = myCommand.Parameters.Add("@EndYear",
                    SqlDbType.Int);
                mylParm5 = myCommand.Parameters.Add("@Resume_ID",
                    SqlDbType.Int);
                mylParm6 = myCommand.Parameters.Add("@InstName",
                    SqlDbType.VarChar, 255);
                mylParm7 = myCommand.Parameters.Add("@BegMonth",
                    SqlDbType.VarChar, 10);
                mylParm8 = myCommand.Parameters.Add("@EndMonth",
                    SqlDbType.VarChar, 10);
                mylParm9 = myCommand.Parameters.Add("@LearnMode",
                    SqlDbType.VarChar, 20);
                mylParm10 = myCommand.Parameters.Add("@BuildingType_ID",
                    SqlDbType.Int);
                mylParm11 = myCommand.Parameters.Add("@INSSession_ID",
                    SqlDbType.VarChar, 255);

                mylParm6.Value = BuildOrgNameTextBox.Text;
                mylParm.Value = BuildSpecNameTextBox.Text;

                if (BegYearTextBox.Text == "")
                    mylParm2.Value = 0;
                else
                    mylParm2.Value = Int32.Parse(BegYearTextBox.Text);
                mylParm7.Value = ddlBuildBegMonth.Text;

                if (EndYearTextBox.Text == "")
                    mylParm3.Value = 0;
                else
                    mylParm3.Value = Int32.Parse(EndYearTextBox.Text);
                mylParm8.Value = ddlBuildEndMonth.Text;

                mylParm5.Value = -1;

                mylParm9.Value = ddlBuildMode.Text;
                if (ddlBuildingType.SelectedValue == "")
                    mylParm10.Value = 1;
                else
                    mylParm10.Value = Int32.Parse(ddlBuildingType.SelectedValue);

                mylParm11.Value = Session.SessionID;

                myCommand.ExecuteNonQuery();
           
                trans.Commit();

            }
            catch (SqlException SqlEx)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                unsuccessfull = true;
                throw new Exception("Неудачное прохождение транзакции на добавление образования! Попробуйте еще раз. Исключение: ",
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
                    BuildCountLabel.Text = "Добавлено";
                    //ResBuildsBulletedList.Items.Add(new ListItem(BuildOrgNameTextBox.Text));
                }
                    
            }


        }
        else
        {
            AlertLabel.Text=
              "Неправильно введены параметры образования!";
        }
        
    }

    protected void AddOldWorkToList()
    {

        SqlParameter mylParm, mylParm2, mylParm3, mylParm4, mylParm5, mylParm6,
            mylParm7, mylParm8, mylParm9, mylParm10, mylParm11;
        bool unsuccessfull = false;

        if (OWOrgNameTextBox.Text != "")
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

                myCommand.CommandText =
                    "ResumeOldWorkWithSessionIDInsertCommand";
                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.Parameters.Clear();
                mylParm = myCommand.Parameters.Add("@SpecialName",
                    SqlDbType.VarChar, 255);
                mylParm2 = myCommand.Parameters.Add("@BeginYear",
                    SqlDbType.Int);
                mylParm3 = myCommand.Parameters.Add("@EndYear",
                    SqlDbType.Int);
                mylParm4 = myCommand.Parameters.Add("@OrgName",
                    SqlDbType.VarChar, 255);
                mylParm5 = myCommand.Parameters.Add("@Resume_ID",
                    SqlDbType.Int);
                mylParm6 = myCommand.Parameters.Add("@OrgDescript",
                    SqlDbType.VarChar, 50);
                mylParm7 = myCommand.Parameters.Add("@BeginMonth",
                    SqlDbType.VarChar, 10);
                mylParm8 = myCommand.Parameters.Add("@EndMonth",
                    SqlDbType.VarChar, 10);
                mylParm9 = myCommand.Parameters.Add("@DismissalReason",
                    SqlDbType.VarChar, 50);
                mylParm10 = myCommand.Parameters.Add("@WorkSpecific",
                    SqlDbType.VarChar, 500);
                mylParm11 = myCommand.Parameters.Add("@INSSession_ID",
                    SqlDbType.VarChar, 255);

                mylParm4.Value = OWOrgNameTextBox.Text;
                mylParm.Value = OWSpecNameTextBox.Text;

                if (OWStartYearTextBox.Text == "")
                    mylParm2.Value = 0;
                else
                    mylParm2.Value = Int32.Parse(OWStartYearTextBox.Text);
                mylParm7.Value = ddlOWStartMonth.Text;

                if (OWEndYearTextBox.Text == "")
                    mylParm3.Value = 0;
                else
                    mylParm3.Value = Int32.Parse(OWEndYearTextBox.Text);
                mylParm8.Value = ddlOWEndMonth.Text;

                mylParm5.Value = -1;

                mylParm9.Value = OWDismissingReason.Text;
                mylParm10.Value = OWWorkModeTextBox.Text;
                mylParm6.Value = OWOrgSpecTextBox.Text;

                mylParm11.Value = Session.SessionID;

                myCommand.ExecuteNonQuery();

                trans.Commit();

            }
            catch (SqlException SqlEx)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                unsuccessfull = true;
                throw new Exception("Неудачное прохождение транзакции на добавление предыдущей работы! Попробуйте еще раз. Исключение: ",
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
                    OldWorkCountLabel.Text = "Добавлено";
                }

            }


        }
        else
        {
            AlertLabel.Text =
              "Неправильно введены параметры предыдущей работы!";
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        AddBuildToList();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        AddOldWorkToList();
    }


    protected void UploadButton_Click(object sender, EventArgs e)
    {
        String fileExtension = "";
        String UploadImageFileName = "";
        Boolean fileOK = false;
        //String path = Server.MapPath("~/UploadedImages/");
        string path = HttpContext.Current.Server.MapPath(@"~/UploadedImages/");
        if (UserPhotoFileUpload.HasFile)
        {
            fileExtension =
                System.IO.Path.GetExtension(UserPhotoFileUpload.FileName).ToLower();
            String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    fileOK = true;
                }
            }
        }

        if (fileOK)
        {
            try
            {
                UploadImageFileName ="img" 
                  +DateTime.Now.Day.ToString()
                    +DateTime.Now.Month.ToString()
                    +DateTime.Now.Year.ToString()
                    +DateTime.Now.Hour.ToString()
                    +DateTime.Now.Minute.ToString()
                    +DateTime.Now.Second.ToString()
                    +Session.SessionID
                    +fileExtension;
                
                if (UserPhotoFileUpload.FileContent != null)
                {
                    //UserPhotoFileUpload.PostedFile.SaveAs(path
                    //    + UploadImageFileName);
                    UserPhotoFileUpload.PostedFile.SaveAs(path + UploadImageFileName);
                    UploadingStateLabel.Text = "Файл успешно загружен.";
                    UserPhotoFileUpload.Enabled = false;
                    UserPhotoPreviewImage.ImageUrl = "~/UploadedImages/"+
                        UploadImageFileName;
                    hfUserFotoFilePath.Value = "~/UploadedImages/" +
                        UploadImageFileName;
                }
                else
                    UploadingStateLabel.Text = "Не определен файл для загрузки.";

            }
            catch (Exception ex)
            {
                UploadingStateLabel.Text = path + UserPhotoFileUpload.PostedFile.FileName+"Загрузка файла прошла неудачно! Ошибка: "+ex.Message+".";
            }
        }
        else
        {
            UploadingStateLabel.Text = "Данный тип файлов не поддерживается для загрузки!";
        }

    }
    protected void AddNewResumeWizard_ActiveStepChanged(object sender, EventArgs e)
    {
        int res_int;
        switch (AddNewResumeWizard.ActiveStepIndex)
        {
            case 1:
                {
                    AddNewResumeWizard.DisplaySideBar = true;
                    //RandomCodeImage1.
                    //myParm25.Value = ResumeNameTextBox.Text;
                    //myParm26.Value = ResumeLastNameTextBox;
                    //myParm27.Value = ResumeSurnameTextBox;
                    //myParm15.Value = AdressTextBox.Text;
                    //myParm16.Value = FactAdressTextBox.Text;
                    //myParm17.Value = ddlSex.SelectedValue;
                    //if (ddlResumeState.Items.Count == 0)
                    //    myParm20.Value = Convert.ToString(1);
                    //else
                    //    myParm20.Value = (String)ddlResumeState.SelectedValue;
                    //myParm4.Value = IsHotCheckBox.Checked;
                    break;

                }
            case 2:
                {
                    if (Int32.TryParse(SalaryMinTextBox.Text, out res_int) &&
                        Int32.TryParse(ResumeWorkStageTextBox.Text, out res_int))
                    {
                        //myParm.Value = ResumeWorkStageTextBox.Text;
                        //myParm8.Value = ddlResumeProfGroup.SelectedValue;
                        //myParm18.Value = ddlResumeSpec.SelectedValue;
                        //myParm7.Value = EcpecProfNameTextBox.Text;
                        //myParm21.Value = SalaryMinTextBox.Text;
                        //myParm19.Value = ddlBuildingType.SelectedValue;
                        //myParm23.Value = ddlWorkMode.SelectedValue;
                        //myParm12.Value = SpecWorkModeTextBox.Text;
                        //myParm11.Value = SpecIfsTextBox.Text;
                        bad_params = false;
                    }
                    else
                    {
                        bad_params = true;
                        AlertLabel.Text =
                            "Неправильно введены поля с числовыми значениями!";
                    }

                    break;
                }
            case 3:
                {
                    break;
                }
            case 4:
                {
                    //(AddNewResumeLoginView.FindControl("LoginEmailTextBox") as System.Web.UI.WebControls.TextBox).Text = EmailTextBox.Text;
                    break;
                }
            default:
                {
                    break;
                }
        }
    }
    protected void ImChangeButton_Click(object sender, EventArgs e)
    {
        //RandomCodeImage.
    }
}
