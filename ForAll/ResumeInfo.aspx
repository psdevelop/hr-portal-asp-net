<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ResumeInfo.aspx.cs" Inherits="EditResume" Title="Untitled Page" %>
<%@ Register Src="~/Controls/ResumeManip.ascx" TagPrefix="User" 
TagName="ResumeManip"%>
<%@ Register Src="~/Controls/ResumeOldWorksManip.ascx" TagPrefix="User" 
TagName="ResumeOldWorksManip"%>
<%@ Register Src="~/Controls/ResumeBuildingsManip.ascx" TagPrefix="User" 
TagName="ResumeBuildingsManip"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>
    Данные резюме
</h1>
   <ajaxToolkit:TabContainer ID="tcResume" runat="server" Width="571px" ActiveTabIndex="0">
      <ajaxToolkit:TabPanel ID="tpBase_" runat="server" HeaderText="Основное">
         <HeaderTemplate><b>Основное</b></HeaderTemplate>
         <ContentTemplate><user:ResumeManip id="ResumeManip2" dsMode="read" runat="server" AccessLogin="all" />
         </ContentTemplate>
      </ajaxToolkit:TabPanel>
      <ajaxToolkit:TabPanel ID="tpOldWorks" runat="server" HeaderText="Предыдущая работа">
         <HeaderTemplate><b>Предыдущая работа</b></HeaderTemplate>
         <ContentTemplate><user:ResumeOldWorksManip id="ResumeOldWorksManip" dsMode="read" runat="server"  AccessLogin="all" /> 
         </ContentTemplate>
      </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="Полученое образование">           
            <HeaderTemplate><b>Полученое образование</b></HeaderTemplate>
            <ContentTemplate><user:ResumeBuildingsManip id="ResumeBuildingsManip" dsMode="read" runat="server"  AccessLogin="all" />  
            </ContentTemplate>   
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer> 

</asp:Content>
