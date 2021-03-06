﻿using System;
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

public partial class Controls_ResumeOldWorksManip : System.Web.UI.UserControl
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
        gwResumeOldWorks.AutoGenerateDeleteButton = false;
        fvAddResumeOldWorks.Visible = false;
        gwResumeOldWorks.Enabled = true;

        if (_dsMode == "insert")
        {
            fvAddResumeOldWorks.Visible = true;
        }

        if (_dsMode == "read")
        {
            gwResumeOldWorks.Enabled = false;
        }

        if (_dsMode == "edit")
        {
            gwResumeOldWorks.AutoGenerateDeleteButton = true;
            fvAddResumeOldWorks.Visible = true;
        }

        if (_AccessLogin == "all")
        {
            hfAccessLogin.Value = "Guest";
        }
        else
            hfAccessLogin.Value = Context.User.Identity.Name;

    }
}
