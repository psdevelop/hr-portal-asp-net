using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;

/// <summary>
/// Сводное описание для wsBuildOrgNameAutoComplete
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Чтобы разрешить вызывать веб-службу из сценария с помощью ASP.NET AJAX, раскомментируйте следующую строку. 
[System.Web.Script.Services.ScriptService]
public class wsBuildOrgNameAutoComplete : System.Web.Services.WebService {

    public wsBuildOrgNameAutoComplete () {

        //Раскомментируйте следующую строку в случае использования сконструированных компонентов 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetCompletionList(string prefixText, int count)
    {
        dsBuildOrgsCompletionListTableAdapters.PSP_BuildOrgsTableAdapter
            BuildOrgCompleteList = new dsBuildOrgsCompletionListTableAdapters.PSP_BuildOrgsTableAdapter();

        if (count == 0)
        {
            count = 10;
        }

        if (prefixText == "")
        {
            return new string[0];
        }

        //Random random = new Random();
        List<string> items = new List<string>(count);

        foreach (DataRow Row in BuildOrgCompleteList.GetBuildOrgCompletionData(10, prefixText))
        {
            items.Add(Row["InstName"].ToString());
        }
        return items.ToArray();
    }
    
}

