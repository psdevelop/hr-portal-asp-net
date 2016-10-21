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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Вход в систему. RABOTA-YUG.RU";
    }
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        //Session["Username"] = Context.User.Identity.Name;
        //if (!Context.User.IsInRole("Administrators") &&
        //    !Context.User.IsInRole("Friends") &&
        //    !Context.User.IsInRole("Clients") &&
        //    !Context.User.IsInRole("Guests"))
        //{
        //    Roles.AddUserToRole(Context.User.Identity.Name, "Guests");
        //}
    }
}
