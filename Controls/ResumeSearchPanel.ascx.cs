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

public partial class Controls_ResumeSearchPanel : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string QuestionStr = "";
        int KeyStrParse;

        if (ddlProfGroups.SelectedValue == "")
            QuestionStr = "~/ResumeSearch.aspx?ProfGroup_ID=1";
        else
            QuestionStr = "~/ResumeSearch.aspx?ProfGroup_ID=" +
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
                  "&Resume_ID=" +
                    KeyStrParse.ToString();
            }
            else
            {
                QuestionStr = QuestionStr +
                  "&LIKESPN=%" +
                    KeyTextBox.Text+"%";
            }
        }

        if (AgeMinSearchTextBox.Text != "")
            QuestionStr = QuestionStr + "&AgeMin=" +
              AgeMinSearchTextBox.Text;

        if (AgeMaxSearchTextBox.Text != "")
            QuestionStr = QuestionStr + "&AgeMax=" +
              AgeMaxSearchTextBox.Text;

        if (ddlBuildingType.SelectedValue != "")
            QuestionStr = QuestionStr + "&BuildingType_ID=" +
            ddlBuildingType.SelectedValue;

        if (ddlSearchSexValue.SelectedValue != "")
            QuestionStr = QuestionStr + "&Sex=" +
            ddlSearchSexValue.SelectedValue;

        if (WStageTextBox.Text != "")
            QuestionStr = QuestionStr + "&WorkStage=" +
              WStageTextBox.Text;

        if (SearchSalaryMinTextBox.Text != "")
            QuestionStr = QuestionStr + "&SalaryMin=" +
              SearchSalaryMinTextBox.Text;

        if (SearchSalaryMaxTextBox.Text != "")
            QuestionStr = QuestionStr + "&SalaryMax=" +
              SearchSalaryMaxTextBox.Text;

        if (ddlSearchWorkMode.SelectedValue != "")
            QuestionStr = QuestionStr + "&WorkMode_ID=" +
            ddlSearchWorkMode.SelectedValue;

        Response.Redirect(QuestionStr);
    }
}
