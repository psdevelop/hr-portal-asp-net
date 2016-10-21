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

public partial class Controls_VacantSearchResult : System.Web.UI.UserControl
{

    SqlParameter myParm, myParm2, myParm3, myParm4, myParm5, myParm6,
    myParm7, myParm8, myParm9, myParm10, myParm11, myParm12, myParm13,
    myParm14, myParm15, myParm16, myParm17, myParm18, myParm19, myParm20,
    myParm21, myParm22, myParm23, myParm24, myParm25, myParm26, myParm27,
    myParm28, myParm29, myParm30, myParm100, myParm101, myParm102, myParm103,
    myParm104, myParm105, myParm106, myParm107, myParm108, myParm109,
    myParm110, myParm111, myParm112, myParm113, myParm114, myParm115,
    myParm116, myParm117, myParm118, myParm119, myParm120;
    
    bool _dsSelectByLogin;
    bool has_params = false;

    SqlConnection myConnection;
    SqlCommand myCommand;
    SqlTransaction trans;

    public bool dsSelectByLogin
    {
        get
        {
            return _dsSelectByLogin;
        }

        set
        {
            _dsSelectByLogin = value;
        }
    }

    Boolean _dsEnableEdit;

    public bool dsEnableEdit
    {
        get
        {
            return _dsEnableEdit;
        }

        set
        {
            _dsEnableEdit = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (_dsSelectByLogin)
        {
            hfSelectByLogin.Value = "1";
        }
        else
        {
            hfSelectByLogin.Value = "0";
        }
        QueryParamsLabel.Text = "";
        QueryParamsHeadLabel.Visible = false;
        if (Request.QueryString["LIKESPN"] != null)
        {
            QueryParamsLabel.Text = QueryParamsLabel.Text + " <b>по вхождению словосочетания</b> \""+Request.QueryString["LIKESPN"]+"\" ";
            has_params = true;
        }
        if (Request.QueryString["Vakant_ID"] != null)
        {
            QueryParamsLabel.Text = QueryParamsLabel.Text + " <b>по номеру вакансии</b> \"" + Request.QueryString["Vakant_ID"] + "\" ";
            has_params = true;
        }
        if (has_params)
        {
            QueryParamsHeadLabel.Visible = true;
        }
        if (Context.User.Identity.IsAuthenticated)
            Session["UserName"] = Context.User.Identity.Name;
        else
            Session["UserName"] = "Guest";
            
        //TextBox1.Text = hfSelectByLogin.Value.ToString() + Session["UserName"].ToString();
        //ListView1.ItemTemplate.
    }

    protected void SendResumeDocButton_Click(object sender, EventArgs e)
    {
        bool unsuccessfull = false;
        String fileExtension = "";
        String UploadImageFileName = "";
        Boolean fileOK = false;
        Boolean fileLoadOk = false;
        string LoadedFileName = "";
        //String path = Server.MapPath("~/UploadedImages/");
        string path = HttpContext.Current.Server.MapPath(@"~/UploadedImages/");
        if (((sender as Button).Parent.Parent.FindControl("ResumeDocFileUpload") as FileUpload).HasFile)
        {
            fileExtension =
                System.IO.Path.GetExtension(((sender as Button).Parent.Parent.FindControl("ResumeDocFileUpload") as FileUpload).FileName).ToLower();
            String[] allowedExtensions = { ".doc", ".odt", ".txt", ".xls", ".htm", ".html", ".xml" };
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
                UploadImageFileName = "img"
                  + DateTime.Now.Day.ToString()
                    + DateTime.Now.Month.ToString()
                    + DateTime.Now.Year.ToString()
                    + DateTime.Now.Hour.ToString()
                    + DateTime.Now.Minute.ToString()
                    + DateTime.Now.Second.ToString()
                    + Session.SessionID
                    + fileExtension;

                if (((sender as Button).Parent.Parent.FindControl("ResumeDocFileUpload") as FileUpload).FileContent != null)
                {
                    //UserPhotoFileUpload.PostedFile.SaveAs(path
                    //    + UploadImageFileName);
                    ((sender as Button).Parent.Parent.FindControl("ResumeDocFileUpload") as FileUpload).PostedFile.SaveAs(path + UploadImageFileName);
                    ((sender as Button).Parent.Parent.FindControl("ResumeDocStatusLabel") as Label).Text = "Файл успешно загружен.";
                    //((sender as Button).Parent.Parent.FindControl("ResumeDocFileUpload") as FileUpload).Enabled = false;
                    //UserPhotoPreviewImage.ImageUrl = "~/UploadedImages/" +
                    //    UploadImageFileName;
                    LoadedFileName = "~/UploadedImages/" +
                        UploadImageFileName;
                    fileLoadOk = true;
                }
                else
                    ((sender as Button).Parent.Parent.FindControl("ResumeDocStatusLabel") as Label).Text = "Не определен файл для загрузки.";

            }
            catch (Exception ex)
            {
                ((sender as Button).Parent.Parent.FindControl("ResumeDocStatusLabel") as Label).Text = path + ((sender as Button).Parent.Parent.FindControl("ResumeDocFileUpload") as FileUpload).PostedFile.FileName + "Загрузка файла прошла неудачно! Ошибка: " + ex.Message + ".";
            }
        }
        else
        {
            ((sender as Button).Parent.Parent.FindControl("ResumeDocStatusLabel") as Label).Text = "Данный тип файлов не поддерживается для загрузки (допустимы .doc, .odt, .txt, .xls, .htm, .html, .xml)!";
        }


        if (fileLoadOk)
        if (((sender as Button).Parent.FindControl("RandomCodeImage") as Sota.Web.UI.WebControls.RandomCodeImage).IsValid
            (((sender as Button).Parent.FindControl("acknowledgementTextBox") as TextBox).Text))
        {


            if (((sender as Button).Parent.FindControl("QuickUserCreateControl") as ASP.controls_quickusercreatecontrol_ascx).CheckUserData() || Context.User.Identity.IsAuthenticated)
            {
                if (Page.IsValid)
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

                        //Операция по добавлению резюме
                        myCommand.CommandText =
                            "ResumeWithDetails2InsertCommand";
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
                        myParm119 = myCommand.Parameters.Add("@ResumeDocPath",
                          SqlDbType.VarChar, 255);
                        myParm120 = myCommand.Parameters.Add("@Vakancy_ID",
                          SqlDbType.Int);

                        //DateTime BDDateTime = new DateTime(
                        //    Int32.Parse(BirthDayYearTextBox.Text),
                        //    Int32.Parse(ddlBirthDayMonth.SelectedValue),
                        //    Int32.Parse(BirthDayDayTextBox.Text));
                        //int year_dif = DateTime.Today.Year - BDDateTime.Year;
                        //if ((BDDateTime.Month > DateTime.Today.Month) ||
                        //    ((BDDateTime.Month == DateTime.Today.Month) &&
                        //     (BDDateTime.Day > DateTime.Today.Day)))
                        //{
                        //    year_dif = year_dif - 1;
                        //}
                        //Параметры личных данных
                        myParm2.Value = 0;
                        myParm24.Value = DateTime.Now;
                        myParm25.Value = "";// ResumeNameTextBox.Text;
                        myParm26.Value = "";//ResumeLastNameTextBox.Text;
                        myParm27.Value = "";//ResumeSurnameTextBox.Text;
                        myParm15.Value = "";//AdressTextBox.Text;
                        myParm16.Value = "";//FactAdressTextBox.Text;
                        myParm17.Value = 1;//ddlSex.SelectedValue;

                        myParm20.Value = Convert.ToString(1);//(String)ddlResumeState.SelectedValue; 

                        myParm4.Value = false;
                        myParm5.Value = true;
                        myParm6.Value = false;
                        myParm9.Value = false;
                        myParm10.Value = false;

                        if (Context.User.Identity.IsAuthenticated)
                            Session["UserName"] = Context.User.Identity.Name;
                        else
                            Session["UserName"] = "Guest";

                        if (((sender as Button).Parent.FindControl("QuickUserCreateControl") as ASP.controls_quickusercreatecontrol_ascx).success_create_user)
                        {
                            Session["UserName"] =
                               ((sender as Button).Parent.FindControl("QuickUserCreateControl") as ASP.controls_quickusercreatecontrol_ascx).user_name;
                            myParm22.Value = ((sender as Button).Parent.FindControl("QuickUserCreateControl") as ASP.controls_quickusercreatecontrol_ascx).user_name;
                        }
                        else
                        {
                            myParm22.Value = Session["UserName"];
                        }

                        //Основные данные резюме
                        myParm.Value = (0).ToString();//ResumeWorkStageTextBox.Text;
                        myParm8.Value = Convert.ToString(1);//ddlResumeProfGroup.SelectedValue;
                        myParm18.Value = Convert.ToString(1);//myParm18.Value = ddlResumeSpec.SelectedValue;
                        myParm29.Value = Convert.ToString(1);//ddlResumeRegion.SelectedValue;
                        myParm30.Value = Convert.ToString(1);//myParm30.Value = ddlResumeCountry.SelectedValue;
                        myParm7.Value = "В прикрепленном файле";//if (EcpecProfNameTextBox.Text != "")
                        myParm21.Value = (0).ToString();//if (SalaryMinTextBox.Text == "")
                        myParm19.Value = "1";//ddlBuildingType.SelectedValue;
                        myParm23.Value = "1";// ddlWorkMode.SelectedValue;
                        myParm12.Value = "";//SpecWorkModeTextBox.Text;
                        myParm11.Value = "";// SpecIfsTextBox.Text;
                        myParm13.Value = "";
                        myParm14.Value = "";
                        myParm114.Value = Session.SessionID;
                        myParm115.Value = "";// hfUserFotoFilePath.Value.ToString();
                        myParm116.Value = "";//PhonesTextBox.Text;
                        myParm117.Value = "";//EmailTextBox.Text;
                        myParm118.Value = "";//WebsiteTextBox.Text;
                        myParm119.Value = UploadImageFileName;
                        myParm120.Value = (sender as Button).CommandArgument;

                        //UserPhotoFileUpload.

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
                            ((sender as Button).Parent.Parent.FindControl("ResumeDocStatusLabel") as Label).Text =
                                "Неудачная отправка.";
                        }
                        else
                        {
                            ((sender as Button).Parent.Parent.FindControl("ResumeDocStatusLabel") as Label).Text =
                                "Резюме с файлом " + ((sender as Button).Parent.Parent.FindControl("ResumeDocFileUpload") as FileUpload).FileName +
                                    " отправлено.";
                            if (Context.User.Identity.IsAuthenticated)
                            {
                                //Response.Redirect("~/PrivateCab.aspx");
                            }
                            else
                            {
                            }
                        }
                        // Response.Redirect("~/AddFunction/SuccessOperation.aspx");
                    }


                }
                else
                {
                    ((sender as Button).Parent.Parent.FindControl("ResumeDocStatusLabel") as Label).Text =
                      "Неправильно введены параметры на одном из шагов создания резюме!";

                }
            }
            else
            {
                ((sender as Button).Parent.Parent.FindControl("ResumeDocStatusLabel") as Label).Text =
                      "Неподходящие параметры нового пользователя!";

            }

        }
        else
        {
            ((sender as Button).Parent.Parent.FindControl("ResumeDocStatusLabel") as Label).Text =
              "Неверный код подтверждения!";
            ((sender as Button).Parent.Parent.FindControl("ImageAckStatusLabel") as Label).Text =
              "Неверный код подтверждения!";
        }

    }

    protected void AlternatSendResumeDocButton_Click(object sender, EventArgs e)
    {
        bool unsuccessfull = false;
        String fileExtension = "";
        String UploadImageFileName = "";
        Boolean fileOK = false;
        Boolean fileLoadOk = false;
        string LoadedFileName = "";
        //String path = Server.MapPath("~/UploadedImages/");
        string path = HttpContext.Current.Server.MapPath(@"~/UploadedImages/");
        if (((sender as Button).Parent.Parent.FindControl("AlternatResumeDocFileUpload") as FileUpload).HasFile)
        {
            fileExtension =
                System.IO.Path.GetExtension(((sender as Button).Parent.Parent.FindControl("AlternatResumeDocFileUpload") as FileUpload).FileName).ToLower();
            String[] allowedExtensions = { ".doc", ".odt", ".txt", ".xls", ".htm", ".html", ".xml" };
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
                UploadImageFileName = "img"
                  + DateTime.Now.Day.ToString()
                    + DateTime.Now.Month.ToString()
                    + DateTime.Now.Year.ToString()
                    + DateTime.Now.Hour.ToString()
                    + DateTime.Now.Minute.ToString()
                    + DateTime.Now.Second.ToString()
                    + Session.SessionID
                    + fileExtension;

                if (((sender as Button).Parent.Parent.FindControl("AlternatResumeDocFileUpload") as FileUpload).FileContent != null)
                {
                    //UserPhotoFileUpload.PostedFile.SaveAs(path
                    //    + UploadImageFileName);
                    ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocFileUpload") as FileUpload).PostedFile.SaveAs(path + UploadImageFileName);
                    ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocStatusLabel") as Label).Text = "Файл успешно загружен.";
                    //((sender as Button).Parent.Parent.FindControl("ResumeDocFileUpload") as FileUpload).Enabled = false;
                    //UserPhotoPreviewImage.ImageUrl = "~/UploadedImages/" +
                    //    UploadImageFileName;
                    LoadedFileName = "~/UploadedImages/" +
                        UploadImageFileName;
                    fileLoadOk = true;
                }
                else
                    ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocStatusLabel") as Label).Text = "Не определен файл для загрузки.";

            }
            catch (Exception ex)
            {
                ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocStatusLabel") as Label).Text = path + ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocFileUpload") as FileUpload).PostedFile.FileName + "Загрузка файла прошла неудачно! Ошибка: " + ex.Message + ".";
            }
        }
        else
        {
            ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocStatusLabel") as Label).Text = "Данный тип файлов не поддерживается для загрузки (допустимы .doc, .odt, .txt, .xls, .htm, .html, .xml)!";
        }


        if (fileLoadOk)
            if (((sender as Button).Parent.FindControl("AlternatRandomCodeImage") as Sota.Web.UI.WebControls.RandomCodeImage).IsValid
                (((sender as Button).Parent.FindControl("AlternatacknowledgementTextBox") as TextBox).Text))
            {


                if (((sender as Button).Parent.FindControl("AlternatQuickUserCreateControl") as ASP.controls_quickusercreatecontrol_ascx).CheckUserData() || Context.User.Identity.IsAuthenticated)
                {
                    if (Page.IsValid)
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

                            //Операция по добавлению резюме
                            myCommand.CommandText =
                                "ResumeWithDetails2InsertCommand";
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
                            myParm119 = myCommand.Parameters.Add("@ResumeDocPath",
                              SqlDbType.VarChar, 255);
                            myParm120 = myCommand.Parameters.Add("@Vakancy_ID",
                              SqlDbType.Int);

                            //DateTime BDDateTime = new DateTime(
                            //    Int32.Parse(BirthDayYearTextBox.Text),
                            //    Int32.Parse(ddlBirthDayMonth.SelectedValue),
                            //    Int32.Parse(BirthDayDayTextBox.Text));
                            //int year_dif = DateTime.Today.Year - BDDateTime.Year;
                            //if ((BDDateTime.Month > DateTime.Today.Month) ||
                            //    ((BDDateTime.Month == DateTime.Today.Month) &&
                            //     (BDDateTime.Day > DateTime.Today.Day)))
                            //{
                            //    year_dif = year_dif - 1;
                            //}
                            //Параметры личных данных
                            myParm2.Value = 0;
                            myParm24.Value = DateTime.Now;
                            myParm25.Value = "";// ResumeNameTextBox.Text;
                            myParm26.Value = "";//ResumeLastNameTextBox.Text;
                            myParm27.Value = "";//ResumeSurnameTextBox.Text;
                            myParm15.Value = "";//AdressTextBox.Text;
                            myParm16.Value = "";//FactAdressTextBox.Text;
                            myParm17.Value = 1;//ddlSex.SelectedValue;

                            myParm20.Value = Convert.ToString(1);//(String)ddlResumeState.SelectedValue; 

                            myParm4.Value = false;
                            myParm5.Value = true;
                            myParm6.Value = false;
                            myParm9.Value = false;
                            myParm10.Value = false;

                            if (Context.User.Identity.IsAuthenticated)
                                Session["UserName"] = Context.User.Identity.Name;
                            else
                                Session["UserName"] = "Guest";

                            if (((sender as Button).Parent.FindControl("AlternatQuickUserCreateControl") as ASP.controls_quickusercreatecontrol_ascx).success_create_user)
                            {
                                Session["UserName"] =
                                   ((sender as Button).Parent.FindControl("AlternatQuickUserCreateControl") as ASP.controls_quickusercreatecontrol_ascx).user_name;
                                myParm22.Value = ((sender as Button).Parent.FindControl("AlternatQuickUserCreateControl") as ASP.controls_quickusercreatecontrol_ascx).user_name;
                            }
                            else
                            {
                                myParm22.Value = Session["UserName"];
                            }

                            //Основные данные резюме
                            myParm.Value = (0).ToString();//ResumeWorkStageTextBox.Text;
                            myParm8.Value = Convert.ToString(1);//ddlResumeProfGroup.SelectedValue;
                            myParm18.Value = Convert.ToString(1);//myParm18.Value = ddlResumeSpec.SelectedValue;
                            myParm29.Value = Convert.ToString(1);//ddlResumeRegion.SelectedValue;
                            myParm30.Value = Convert.ToString(1);//myParm30.Value = ddlResumeCountry.SelectedValue;
                            myParm7.Value = "В прикрепленном файле";//if (EcpecProfNameTextBox.Text != "")
                            myParm21.Value = (0).ToString();//if (SalaryMinTextBox.Text == "")
                            myParm19.Value = "1";//ddlBuildingType.SelectedValue;
                            myParm23.Value = "1";// ddlWorkMode.SelectedValue;
                            myParm12.Value = "";//SpecWorkModeTextBox.Text;
                            myParm11.Value = "";// SpecIfsTextBox.Text;
                            myParm13.Value = "";
                            myParm14.Value = "";
                            myParm114.Value = Session.SessionID;
                            myParm115.Value = "";// hfUserFotoFilePath.Value.ToString();
                            myParm116.Value = "";//PhonesTextBox.Text;
                            myParm117.Value = "";//EmailTextBox.Text;
                            myParm118.Value = "";//WebsiteTextBox.Text;
                            myParm119.Value = UploadImageFileName;
                            myParm120.Value = (sender as Button).CommandArgument;

                            //UserPhotoFileUpload.

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
                                ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocStatusLabel") as Label).Text =
                                    "Неудачная отправка.";
                            }
                            else
                            {
                                ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocStatusLabel") as Label).Text =
                                    "Резюме с файлом " + ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocFileUpload") as FileUpload).FileName +
                                        " отправлено.";
                                if (Context.User.Identity.IsAuthenticated)
                                {
                                    //Response.Redirect("~/PrivateCab.aspx");
                                }
                                else
                                {
                                }
                            }
                            // Response.Redirect("~/AddFunction/SuccessOperation.aspx");
                        }


                    }
                    else
                    {
                        ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocStatusLabel") as Label).Text =
                          "Неправильно введены параметры на одном из шагов создания резюме!";

                    }
                }
                else
                {
                    ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocStatusLabel") as Label).Text =
                          "Неподходящие параметры нового пользователя!";

                }

            }
            else
            {
                ((sender as Button).Parent.Parent.FindControl("AlternatResumeDocStatusLabel") as Label).Text =
                  "Неверный код подтверждения!";
                ((sender as Button).Parent.Parent.FindControl("AlternatImageAckStatusLabel") as Label).Text =
                  "Неверный код подтверждения!";
            }

    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool unsuccessfull = false;   

        //Удаление вакансии
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

                //Операция по удалению вакансии
                myCommand.CommandText =
                    "VacancyDeleteCommand";
                myCommand.CommandType = CommandType.StoredProcedure;
                //Создание параметров для операции добавления в таблицу РЕЗЮМЕ
                myCommand.Parameters.Clear();
                myParm = myCommand.Parameters.Add("@Original_Vakant_ID",
                    SqlDbType.Int);
                
                myParm.Value = (sender as Button).CommandArgument;

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
                throw new Exception("Неудачное прохождение транзакции на удаление вакансии! Попробуйте еще раз. Исключение: ",
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
                    Response.Redirect("~/AddFunction/SuccessOperation.aspx");
            }
    }        
 
}
