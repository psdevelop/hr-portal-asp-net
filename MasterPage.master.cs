using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MasterPage : System.Web.UI.MasterPage
{

    public int has_role;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //Page.Title = Session["BASETITLE"] + " - Главная.";
        //if (Request.QueryString["Country_ID"] != null)
        //{
        //    Session["Country_ID"] = Request.QueryString["Country_ID"]; 
        //}

        //if (Request.QueryString["Region_ID"] != null)
        //{
        //    Session["Region_ID"] = Request.QueryString["Region_ID"]; 
        //}
        //StartPopUp. 
		//if (!Roles.RoleExists("SuperUsers"))
        //       Roles.CreateRole("SuperUsers");
				
		//Membership.DeleteUser("administrator");
		//Membership.CreateUser("administrator","fgd4ysey1ol985","psdevelop@yandex.ru");
    }
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
       Session["Region_ID"] =
        (sender as LinkButton).CommandArgument;
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Session["Country_ID"] =
        (sender as LinkButton).CommandArgument;
        Session["Region_ID"] = 1;
    }
    protected void GeographySetButton_Click(object sender, EventArgs e)
    {
      
      if (ddlStartCountrySelect.SelectedValue=="")
          Session["Country_ID"] = 1;
      else
          Session["Country_ID"] = Int32.Parse(ddlStartCountrySelect.SelectedValue);
      
      if (ddlStartRegionSelect.SelectedValue=="")
          Session["Region_ID"] = 1;
      else
          Session["Region_ID"] = Int32.Parse(ddlStartRegionSelect.SelectedValue);

      Response.Redirect("~/Default.aspx");
    
    }
    protected void Login1_LoggingIn(object sender, LoginCancelEventArgs e)
    {
        
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
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
    protected void Login1_LoggedIn1(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
            Session["UserName"] = Context.User.Identity.Name;
        else
            Session["UserName"] = "Guest";
        //Label7.Text = Session["UserName"].ToString();
    }
    protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
    {
        
    }
}
