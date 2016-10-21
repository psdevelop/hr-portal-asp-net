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

public partial class Controls_VakantManip : System.Web.UI.UserControl
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
        fwCompanyManip.DefaultMode = FormViewMode.ReadOnly;
        if (_dsMode == "insert")
        {
            fwCompanyManip.DefaultMode = FormViewMode.Insert;
        }

        if (_dsMode == "read")
        {
            fwCompanyManip.DefaultMode = FormViewMode.ReadOnly;
        }

        if (_dsMode == "edit")
        {
            fwCompanyManip.DefaultMode = FormViewMode.Edit;
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
    }
    protected void fwCompanyManip_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        //fwCompanyManip.InsertItemTemplate.
        //Response.Redirect("VakantManip.aspx?V_ID="+ odsVakantManip.InsertParameters["Vakant_ID"].ToString());
       
    }
}
