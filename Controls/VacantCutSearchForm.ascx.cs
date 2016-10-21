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

public partial class Controls_VacantCutSearchForm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ddlCutPrGroupList.SelectedIndex =
        //    (Int32)Session["Region_ID"];
        //ddlCutPrGroupList.SelectedIndex =
        //    (Int32)Session["ProfGroup_ID"];
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string QuestionStr = "";
        int KeyStrParse;

        QuestionStr = "~/VakantSearch.aspx?ProfGroup_ID=" +
            ddlCutPrGroupList.SelectedValue+
            "&Region_ID="+
            ddlCutSrchRegion.SelectedValue;
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
                  "&LIKESPN=%" +
                    KeyTextBox.Text+"%";
            }
        }
        Response.Redirect(QuestionStr);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string QuestionStr = "";
        int KeyStrParse;

        QuestionStr = "~/VakantSearch.aspx?ProfGroup_ID=" +
            ddlCutPrGroupList.SelectedValue +
            "&Region_ID=" +
            ddlCutSrchRegion.SelectedValue;
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
                  "&LIKESPN=%" +
                    KeyTextBox.Text + "%";
            }
        }
        if (LastDayCountTextBox.Text != "")
        {
            QuestionStr = QuestionStr +
                  "&LastDayCount=" +
                    LastDayCountTextBox.Text;
        }
        Response.Redirect(QuestionStr);
    }
}
