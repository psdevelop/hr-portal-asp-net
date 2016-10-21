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

public partial class Controls_VakantSearchPanel : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["LIKESPN"] != null)
        {
            //KeyTextBox.Text = Request.QueryString["LIKESPN"]; 
        }
        if (Request.QueryString["Vakant_ID"] != null)
        {
            //KeyTextBox.Text = Request.QueryString["Vakant_ID"];
        }
        //Region_ID
        if (Request.QueryString["ProfGroup_ID"] != null)
        {
            //ddlProfGroups.SelectedValue = Request.QueryString["ProfGroup_ID"]; 
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string QuestionStr = "";
        int KeyStrParse;

        if (ddlProfGroups.SelectedValue == "")
            QuestionStr = "~/VakantSearch.aspx?ProfGroup_ID=1";
        else
            QuestionStr = "~/VakantSearch.aspx?ProfGroup_ID=" +
            ddlProfGroups.SelectedValue;

        if (ddlProfs.SelectedValue != "")
            QuestionStr = QuestionStr + "&Professional_ID=" +
            ddlProfs.SelectedValue;

        if (ddlSrchStates.SelectedValue != "")
            QuestionStr = QuestionStr + "&State_ID=" +
            ddlSrchStates.SelectedValue;

        if (KeyTextBox.Text != "")
        {
            if (Int32.TryParse(KeyTextBox.Text, out KeyStrParse))
            {
                QuestionStr = QuestionStr +
                  "&Vakant_ID=" +
                    KeyStrParse.ToString();
            }
            else
            {
                QuestionStr = QuestionStr +
                  "&LIKESPN=" +"%"+
                    KeyTextBox.Text+"%";
            }
        }

        if (AgeSearchTextBox.Text != "")
            QuestionStr = QuestionStr + "&Age=" +
              AgeSearchTextBox.Text;

        if (ddlBuildingType.SelectedValue != "")
            QuestionStr = QuestionStr + "&BuildingType_ID=" +
            ddlBuildingType.SelectedValue;

        if (ddlSearchSexValue.SelectedValue != "")
            QuestionStr = QuestionStr + "&Sex=" +
            ddlSearchSexValue.SelectedValue;

        if (WStageTextBox.Text != "")
            QuestionStr = QuestionStr + "&WorkStageMin=" +
              WStageTextBox.Text;

        if (SearchSalaryTextBox.Text != "")
            QuestionStr = QuestionStr + "&Salary=" +
              SearchSalaryTextBox.Text;

        if (ddlSearchWorkMode.SelectedValue != "")
            QuestionStr = QuestionStr + "&WorkMode_ID=" +
            ddlSearchWorkMode.SelectedValue;

        Response.Redirect(QuestionStr);
        
    }
}
