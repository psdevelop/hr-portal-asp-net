using System;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Xml;

/// <summary>
/// Сводное описание для Geography
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//Чтобы разрешить вызывать веб-службу из сценария с помощью ASP.NET AJAX, раскомментируйте следующую строку. 
[System.Web.Script.Services.ScriptService]
public class Geography : System.Web.Services.WebService {

    public Geography () {

        //Раскомментируйте следующую строку в случае использования сконструированных компонентов 
        //InitializeComponent(); 
    }

    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetCountries(string knownCategoryValues, string category)
    {
        dsCountriesTableAdapters.PSP_CountryTableAdapter CountriesAdapter =
            new dsCountriesTableAdapters.PSP_CountryTableAdapter();

        List<AjaxControlToolkit.CascadingDropDownNameValue> CountriesValues =
            new List<AjaxControlToolkit.CascadingDropDownNameValue>();

        foreach (DataRow Row in CountriesAdapter.GetCountries())
        {
            CountriesValues.Add((new AjaxControlToolkit.CascadingDropDownNameValue(Row["Name"].ToString(), Row["Country_ID"].ToString())));
        }
        return CountriesValues.ToArray();
    }

    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetRegions(string knownCategoryValues, string category)
    {
        StringDictionary kv = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        int Country_ID;

        if ((!kv.ContainsKey("Country")) || (!Int32.TryParse(kv["Country"].ToString(), out Country_ID)))
            return null;

        dsRegionsTableAdapters.PSP_RegionTableAdapter RegionsAdapters =
            new dsRegionsTableAdapters.PSP_RegionTableAdapter();

        List<AjaxControlToolkit.CascadingDropDownNameValue> RegionsValues =
            new List<AjaxControlToolkit.CascadingDropDownNameValue>();

        foreach (DataRow Row in RegionsAdapters.GetRegionByCountry(Country_ID))
        {
            RegionsValues.Add((new AjaxControlToolkit.CascadingDropDownNameValue(Row["Name"].ToString(), Row["Region_ID"].ToString())));
        }
        return RegionsValues.ToArray();
    }

    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetStates(string knownCategoryValues, string category)
    {
        StringDictionary kv = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        int Region_ID;

        if ((!kv.ContainsKey("Region")) || (!Int32.TryParse(kv["Region"].ToString(), out Region_ID)))
            return null;

        dsStatesTableAdapters.PSP_StatesTableAdapter StatesAdapters =
            new dsStatesTableAdapters.PSP_StatesTableAdapter();

        List<AjaxControlToolkit.CascadingDropDownNameValue> StatesValues =
            new List<AjaxControlToolkit.CascadingDropDownNameValue>();

        foreach (DataRow Row in StatesAdapters.GetState(Region_ID))
        {
            StatesValues.Add((new AjaxControlToolkit.CascadingDropDownNameValue(Row["Name"].ToString(), Row["State_ID"].ToString())));
        }
        return StatesValues.ToArray();
    }
    
}

