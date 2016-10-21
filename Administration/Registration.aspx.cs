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

public partial class Administration_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Page.Title = "Регистрация аккаунта на RABOTA-YUG.RU";
        
    }


    protected void TextBox8_TextChanged(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        
    }



    protected void CreateUserWizard1_CreatingUser(object sender, LoginCancelEventArgs e)
    {
        //Profile.SetPropertyValue("FirstName", firstName.Text);
        //Profile.SetPropertyValue("LastName", lastName.Text);
    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
            Session["UserName"] = Context.User.Identity.Name;
        else
            Session["UserName"] = "Guest";
    }
    protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
    {
        //Profile.SetPropertyValue("FirstName", firstName.Text);
        //Profile.SetPropertyValue("LastName", lastName.Text);
    }
}
