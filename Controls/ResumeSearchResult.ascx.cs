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

public partial class Controls_ResumeSearchResult : System.Web.UI.UserControl
{

    bool _dsSelectByLogin;
    bool has_params = false;

    SqlParameter myParm;

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
        if (Request.QueryString["Resume_ID"] != null)
        {
            QueryParamsLabel.Text = QueryParamsLabel.Text + " <b>по номеру вакансии</b> \"" + Request.QueryString["Resume_ID"] + "\" ";
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
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool unsuccessfull = false;   

        //Удаление резюме
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

                //Операция по удалению резюме
                myCommand.CommandText =
                    "ResumeByIDDeleteCommand";
                myCommand.CommandType = CommandType.StoredProcedure;
                //Создание параметров для операции добавления в таблицу РЕЗЮМЕ
                myCommand.Parameters.Clear();
                myParm = myCommand.Parameters.Add("@Original_Resume_ID",
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
                throw new Exception("Неудачное прохождение транзакции на удаление резюме! Попробуйте еще раз. Исключение: ",
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
