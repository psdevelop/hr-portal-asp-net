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

public partial class Controls_CompanyManip : System.Web.UI.UserControl
{
    bool _IsForVakantAdd;

    public bool IsForVakantAdd
    {
        get
        {
            return _IsForVakantAdd;
        }

        set
        {
            _IsForVakantAdd = value;
        }
    }

    string _dsMode;

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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        fvCompanyManip.DefaultMode = FormViewMode.ReadOnly;
        if (_dsMode == "insert")
        {
            fvCompanyManip.DefaultMode = FormViewMode.Insert;
        }

        if (_dsMode == "read")
        {
            fvCompanyManip.DefaultMode = FormViewMode.ReadOnly;
        }

        if (_dsMode == "edit")
        {
            fvCompanyManip.DefaultMode = FormViewMode.Edit;
        }
    }
}
