<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditResume.aspx.cs" Inherits="EditResume" Title="Untitled Page" %>
<%@ Register Src="~/Controls/ResumeOldWorksManip.ascx" TagPrefix="User" 
TagName="ResumeOldWorksManip"%>
<%@ Register Src="~/Controls/ResumeBuildingsManip.ascx" TagPrefix="User" 
TagName="ResumeBuildingsManip"%>
<%@ Register Src="~/Controls/ResumeManip.ascx" TagPrefix="User" 
TagName="ResumeManip"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
    Правка данных резюме
    </h1>
    <ajaxToolkit:TabContainer ID="tcResume" runat="server" Width="571px" ActiveTabIndex="0" Font-Size="Large">
      <ajaxToolkit:TabPanel ID="tpBase_" runat="server" HeaderText="Основное">
         <HeaderTemplate><b>Основное</b></HeaderTemplate>
         <ContentTemplate><user:ResumeManip id="ResumeManip2" dsMode="edit" runat="server" />
         </ContentTemplate>
      </ajaxToolkit:TabPanel>
      <ajaxToolkit:TabPanel ID="tpOldWorks" runat="server">
         <HeaderTemplate><b>Прежняя деятельность</b></HeaderTemplate>
         <ContentTemplate><user:ResumeOldWorksManip id="ResumeOldWorksManip" dsMode="edit" runat="server" /> 
         </ContentTemplate>
      </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel1" runat="server">           
            <HeaderTemplate><b>Образование</b></HeaderTemplate>
            <ContentTemplate><user:ResumeBuildingsManip id="ResumeBuildingsManip" dsMode="edit" runat="server" />  
            </ContentTemplate>   
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer> 
  </asp:Content>

