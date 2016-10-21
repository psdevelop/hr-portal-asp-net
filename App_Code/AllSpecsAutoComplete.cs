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
/// Summary description for AllSpecsAutoComplete
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class AllSpecsAutoComplete : System.Web.Services.WebService {

    public AllSpecsAutoComplete () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetCompletionList(string prefixText, int count)
    {
        dsSpecCompletionListTableAdapters.PSP_ProfessionalsTableAdapter
            SpecsCompleteList = new dsSpecCompletionListTableAdapters.PSP_ProfessionalsTableAdapter();

        if (count == 0)
        {
            count = 10;
        }

        if (prefixText=="")
        {
            return new string[0];
        }

        //Random random = new Random();
        List<string> items = new List<string>(count);

        foreach (DataRow Row in SpecsCompleteList.GetSpecsComplete(10, prefixText))
        {
            items.Add(Row["SpecComlpName"].ToString());
        }
        return items.ToArray();
    }
    
}

