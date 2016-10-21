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

public partial class Controls_ResumeManip : System.Web.UI.UserControl
{

    string _dsMode;
    string _AccessLogin = "Denied";

    public string dsMode
    {
        get
        {
            return _dsMode;
        }

        set
        {
            _dsMode = value;
        }
    }

    public string AccessLogin
    {
        get
        {
            return _AccessLogin;
        }

        set
        {
            _AccessLogin = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        fvResumeManip.DefaultMode = FormViewMode.ReadOnly;
        if (_dsMode == "insert")
        {
            fvResumeManip.DefaultMode = FormViewMode.Insert;
        }

        if (_dsMode == "read")
        {
            fvResumeManip.DefaultMode = FormViewMode.ReadOnly;
        }

        if (_dsMode == "edit")
        {
            fvResumeManip.DefaultMode = FormViewMode.Edit;
        }

        if (Context.User.Identity.IsAuthenticated)
            Session["UserName"] = Context.User.Identity.Name;
        else
            Session["UserName"] = "Denied";
        
        if (Request.QueryString["SelByLogin"] == "1")
        {
           hfAccessLogin.Value = Session["UserName"].ToString();
        }
        else 
        {
        if (_AccessLogin == "all")
        {
            hfAccessLogin.Value = "Guest";
        }
        else
            hfAccessLogin.Value = Session["UserName"].ToString();
        }

        if (Context.User.Identity.IsAuthenticated) 
          if (Context.User.Identity.Name=="administrator")
            hfAccessLogin.Value = "administrator";
        //Context.User.Identity.IsAuthenticated
        //
        //if (Eval("Resume_ID") == "ddd")
        //{
        //     
        //}
        //odsEditResume.
        //Eval("UserLogin")
        //int k=(Eval("UserLogin").ToString() == Context.User.Identity.Name)?1:0;
        //System.Boolean(Eval("UserLogin") == Context.User.Identity.Name);
        //(System.Boolean)(Eval("UserLogin") == Context.User.Identity.Name)
    }

    protected void ReportButton_Click(object sender, EventArgs e)
    {
        myMV.ActiveViewIndex = 1;
    }
	
	protected void ShortViewButton_Click(object sender, EventArgs e)
    {
        myMV.ActiveViewIndex = 0;
    }
}
