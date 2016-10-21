using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Data;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Xml;
using System.Text.RegularExpressions;
using AjaxControlToolkit;

/// <summary>
/// Сводное описание для ProfsService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Чтобы разрешить вызывать веб-службу из сценария с помощью ASP.NET AJAX, раскомментируйте следующую строку. 
// [System.Web.Script.Services.ScriptService]
public class ProfsService : System.Web.Services.WebService {

    public ProfsService () {

        //Раскомментируйте следующую строку в случае использования сконструированных компонентов 
        //InitializeComponent(); 
    }
    
    // Member variables
    private static XmlDocument _document;
    private static Regex _inputValidationRegex;
    private static object _lock = new object();

    // we make these public statics just so we can call them from externally for the
    // page method call
    public static XmlDocument Document
    {
        get
        {
            lock (_lock)
            {
                if (_document == null)
                {
                    // Read XML data from disk
                    _document = new XmlDocument();
                    _document.Load(HttpContext.Current.Server.MapPath("~/App_Data/CarsService.xml"));
                }
            }
            return _document;
        }
    }

    public static string[] Hierarchy
    {
        get { return new string[] { "make", "model" }; }
    }

    public static Regex InputValidationRegex
    {
        get
        {
            lock (_lock)
            {
                if (null == _inputValidationRegex)
                {
                    _inputValidationRegex = new Regex("^[0-9a-zA-Z \\(\\)]*$");
                }
            }
            return _inputValidationRegex;
        }
    }
    
    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetDropDownContents(string knownCategoryValues, string category)
    {
        // Get a dictionary of known category/value pairs
        StringDictionary knownCategoryValuesDictionary = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

        // Perform a simple query against the data document
        return AjaxControlToolkit.CascadingDropDown.QuerySimpleCascadingDropDownDocument(Document, Hierarchy, knownCategoryValuesDictionary, category, InputValidationRegex);
    }

    [WebMethod]
    public CascadingDropDownNameValue[] GetProfGroup(string knownCategoryValues, string category)
    {
        
        //dsProfGroupsTableAdapters.PSP_ProfGroupTableAdapter ProfGroupsAdapter = 
        //    new dsProfGroupsTableAdapters.PSP_ProfGroupTableAdapter();
        

        //List<CascadingDropDownNameValue> ProfGroupsValues = 
        //    new List<CascadingDropDownNameValue>();

        //CascadingDropDownNameValue aaa = new

        //CascadingDropDownNameValue www =
        //    new CascadingDropDownNameValue("lll","1");
        //ProfGroupsValues.Add(www);
        //ProfGroupsValues.Add((new CascadingDropDownNameValue("sssqqq", "0")));
        //foreach (DataRow Row in ProfGroupsAdapter.GetAllProfGroups())
        //    {
        //       ProfGroupsValues.Add((new CascadingDropDownNameValue(Row["Name"].ToString(), Row["ProfGroup_ID"].ToString())));
        //    }
        //return ProfGroupsValues.ToArray();

        CascadingDropDownNameValue[] continents = new CascadingDropDownNameValue[2];
        continents[0] = new CascadingDropDownNameValue("North America", "North America");
        continents[1] = new CascadingDropDownNameValue("Europe", "Europe");
        return continents;
 
    }

    
    
}

