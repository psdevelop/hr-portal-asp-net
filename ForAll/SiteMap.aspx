<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SiteMap.aspx.cs" Inherits="SiteMap" Title="Untitled Page" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Карта сайта</h2>
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" 
             ImageSet="Simple">
             <ParentNodeStyle Font-Bold="False" />
             <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
             <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                 HorizontalPadding="0px" VerticalPadding="0px" />
             <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" 
                 HorizontalPadding="0px" NodeSpacing="0px" VerticalPadding="0px" />
         </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />     
</asp:Content>

