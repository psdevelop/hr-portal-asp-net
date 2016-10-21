// (c) Copyright Microsoft Corporation.
// This source is subject to the Microsoft Permissive License.
// See http://www.microsoft.com/resources/sharedsource/licensingbasics/sharedsourcelicenses.mspx.
// All other rights reserved.
using System;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using System.Xml;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Helper web service for CascadingDropDown sample
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class CarsService : WebService
{
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

    /// <summary>
    /// Helper web service method
    /// </summary>
    /// <param name="knownCategoryValues">private storage format string</param>
    /// <param name="category">category of DropDownList to populate</param>
    /// <returns>list of content items</returns>
    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetDropDownContents(string knownCategoryValues, string category)
    {
        dsProfGroupsTableAdapters.PSP_ProfGroupTableAdapter ProfGroupsAdapter = 
            new dsProfGroupsTableAdapters.PSP_ProfGroupTableAdapter();


        List<AjaxControlToolkit.CascadingDropDownNameValue> ProfGroupsValues =
            new List<AjaxControlToolkit.CascadingDropDownNameValue>();

        foreach (DataRow Row in ProfGroupsAdapter.GetAllProfGroups())
            {
                ProfGroupsValues.Add((new AjaxControlToolkit.CascadingDropDownNameValue(Row["Name"].ToString(), Row["ProfGroup_ID"].ToString())));
            }
        return ProfGroupsValues.ToArray();
    
    }

    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetProfs(string knownCategoryValues, string category)
    {
        StringDictionary kv = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        int ProfGroup_ID;
        List<AjaxControlToolkit.CascadingDropDownNameValue> ProfsValues =
            new List<AjaxControlToolkit.CascadingDropDownNameValue>();

        //kv.
        if ((!kv.ContainsKey("ProfGroup")) || (!Int32.TryParse(kv["ProfGroup"].ToString(), out ProfGroup_ID)))
            return null;

        dsProfByProfGroup_IDTableAdapters.PSP_ProfessionalsTableAdapter
            ProfsByPGroupIDAdapter =
            new dsProfByProfGroup_IDTableAdapters.PSP_ProfessionalsTableAdapter();


        //ProfsByPGroupIDAdapter.GetProfsByProfGroup_ID(ProfGroup_ID);

        foreach (DataRow Row in ProfsByPGroupIDAdapter.GetProfsByProfGroup_ID(ProfGroup_ID))
        {
            ProfsValues.Add((new AjaxControlToolkit.CascadingDropDownNameValue(Row["Name"].ToString(), Row["Professional_ID"].ToString())));
        }


        return ProfsValues.ToArray();
    }

}
