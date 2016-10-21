using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Controls_QuickUserCreateControl : System.Web.UI.UserControl
{

    bool _success_create_user = false;
    bool _anonymus_resume_add = false;
    MembershipUser NewUser = null;
    string _status_msg="";
    string _user_name = "Guest";

    public bool success_create_user
    {
        get
        {
            return _success_create_user;
        }

        set
        {
            _success_create_user = value;
        }
    }

    public bool anonymus_resume_add
    {
        get
        {
            return _anonymus_resume_add;
        }

        set
        {
            _anonymus_resume_add = value;
        }
    }

    public string user_name
    {
        get
        {
            return _user_name;
        }

        set
        {
            _user_name = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public bool CheckUserData()
    {
        FormsAuthenticationTicket ticket;
        string strEncrypted;
        _success_create_user = false;
        _anonymus_resume_add = false;
        string _psw;
        if (!Context.User.Identity.IsAuthenticated)
        {
            if ((AddNewResumeLoginView.FindControl("NewLoginTextBox") as System.Web.UI.WebControls.TextBox).Text != "")
            {
                try
                {
                    _anonymus_resume_add = false;
                    NewUser = Membership.CreateUser((AddNewResumeLoginView.FindControl("NewLoginTextBox") as System.Web.UI.WebControls.TextBox).Text, (AddNewResumeLoginView.FindControl("NewPswTextBox") as System.Web.UI.WebControls.TextBox).Text, (AddNewResumeLoginView.FindControl("LoginEmailTextBox") as System.Web.UI.WebControls.TextBox).Text);
                    //NewUser = Membership.CreateUser("weuofhewmfhwu","asd!fg14hjkl","psdev@url.ru");
                    _success_create_user = true;
                    //QuickRegisterStatusLabel.Text = _user_name;
                    _user_name = (AddNewResumeLoginView.FindControl("NewLoginTextBox") as System.Web.UI.WebControls.TextBox).Text;
                    _psw = (AddNewResumeLoginView.FindControl("NewPswTextBox") as System.Web.UI.WebControls.TextBox).Text;
                    QuickRegisterStatusLabel.Text = "Пользователь "+_user_name+" создан.";
                    //
                    if (!FormsAuthentication.Authenticate(
                        _user_name,
                        _psw))
                    {
                        //QuickRegisterStatusLabel.Text = "Неудачная аутентификация вновь созданного пользователя!";
                    }
                    else 
                    {
                        //ticket = new FormsAuthenticationTicket(1, _user_name,
                        //    DateTime.Now, DateTime.Now.AddMinutes(20), false, "");
                        //strEncrypted = FormsAuthentication.Encrypt(ticket);
                        //FormsAuthentication.SetAuthCookie(_user_name, false);
                        //Response.Cookies.Add(new HttpCookie("UrlAuthz", strEncrypted));
                        //QuickRegisterStatusLabel.Text = HttpContext.Current.User.Identity.Name;
                        
                    }
                    //System.Web.
                }
                catch (Exception ex)
                {
                    QuickRegisterStatusLabel.Text = "Неудачное создание пользователя, попробуйте еще раз! Ошибка: " + ex.Message;
                }
                finally
                {

                }
            }
            else
                _anonymus_resume_add = true;
        }
        else
        {
            _anonymus_resume_add = false;
        }
        return (_success_create_user || _anonymus_resume_add);
    }

    public void EnterUser()
    {
        //Aut
    }
}
