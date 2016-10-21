<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>
<%@ Register Src="~/Controls/LastClauses.ascx" TagPrefix="User" 
TagName="LastClauses"%>
<%@ Register Src="~/Controls/HotVakantiesContent.ascx" TagPrefix="User" 
TagName="HotVakantiesContent"%>
<%@ Register Src="~/Controls/HotResumesContentl.ascx" TagPrefix="User" 
TagName="HotResumesContentl"%>
<%@ Register Src="~/Controls/VacantCutSearchForm.ascx" TagPrefix="User" 
TagName="VacantCutSearchForm"%>
<%@ Register Src="~/Controls/CutVacancyCatalog.ascx" TagPrefix="User" 
TagName="CutVacancyCatalog"%>
<%@ Register Src="~/Controls/LastActualFAQs.ascx" TagPrefix="User" 
TagName="LastActualFAQs"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainMenuContentPlaceHolder" runat="server">
    <div id="menu_tabs_header">
          <ul>
            <li id="menu_tabs_current" onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/Default.aspx">Главная</a></li>
            <li onclick="select_menu_tab(this);"><a href=" <%Response.Write(Session["BaseAdress"].ToString());%>/VakantSearch.aspx">Искать работу</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/AddNewPersComlectOrder.aspx">Подбор персонала</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/Infos.aspx">Советы, карьера</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/ForumsList.aspx">Общение</a></li>
            <li onclick="select_menu_tab(this);"><a href="<%Response.Write(Session["BaseAdress"].ToString());%>/ForAll/Contacts.aspx">О нас</a></li>
          </ul>
        </div>
      </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table border="0" cellpadding="2" cellspacing="2"><tr><td valign="top">
  <User:VacantCutSearchForm id="VacantCutSearchForm" runat="server" /> 
  <h2>Выбирайте нас!</h2> 
  <div style="text-align:justify">Преимущество&nbsp; сотрудничества с нашей фирмой: Вы 
  работаете со  специалистами высокого класса, которые 
  учитывают специфику Вашей организации (предприятия). 
  Действия специалистов направлены на получение максимальной 
  выгоды для Вас при минимальном вмешательстве в процессы 
  производства.
  
  Если у Вас есть необходимость увеличить количество 
  сотрудников или подобрать специалиста-профессионала, мы готовы 
  помочь Вам в этом вопросе.
  На рынке подбора персонала фирма «Рамэна» находится с 2002 года.
  Специалисты выполняющие подбор персонала имеют высшее профильное 
  образование, опыт работы, квалификацию «психолог». Работа специалистов
  ведется как офисе, так но и на территории клиента, по договоренности.
  </div> <br />
  <div>
    <h3>РАБОТОДАТЕЛЮ</h3>
     Работа с нами это: 
       МАКСИМУМ КАЧЕСТВА КАДРОВ;
       МИНИМУМ ВМЕШАТЕЛЬСТВА; 
       РАБОТА С ПРОФЕССИОНАЛАМИ СВОЕГО ДЕЛА;
     <h3>БЕСПЛАТНО</h3>

      подбор кадров по Вашим Заявкам;
      участие Ваших свободных рабочих мест в ярмарках вакансий:
      консультации специалистов кадровой службы

     <h3>НА ВЗАИМОВЫГОДНЫХ УСЛОВИЯХ</h3>

      подбор ТОР-специалистов;
      подбор эксклюзивных специалистов;
      представление Ваших интересов на работных Интернет сайтах

     <h3>СОИСКАТЕЛЮ</h3>
      Работая с нами Вы:

      Трудоустраиваетесь с учетом Ваших запросов
      Находитесь в базе предприятия для дальнейшего сотрудничества
      Повышение квалификации
      Дополнительное образование
      Тестирование на профпригодность
      Освоение смежных специальностей
      Изменение профессии
      Вакансия с боле высокой платой труда
      Cоставление резюме
      Размещение резюме на работных сайтах края и др.регионах.
     </div>
   </td>
   <td valign="top" width="200px">
     <table width="100%">
       <tr><td>
         <user:HotVakantiesContent id="HotVakantiesContent" runat="server" />
       </td></tr>
       <tr>
         <td align="left">
           <user:hotresumescontentl id="HotResumesContentl" runat="server" /> 
         </td>
       </tr>
       <tr><td>
         <User:CutVacancyCatalog id="CutVacancyCatalog" runat="server" />
       </td></tr>
       <tr><td>
         <User:LastClauses id="LastClauses1" runat="server" />
       </td></tr>
        <tr>
                 <td>
                   <User:LastActualFAQs id="LastActualFAQs" runat="server" />
                 </td>
        </tr>
        <tr>
            <td>
              
             
            </td> 
        </tr>
     </table>    
   </td></tr></table> 
    
</asp:Content>

