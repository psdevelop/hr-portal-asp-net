<%@ Application Language="C#" %>

<script runat="server">

    bool bad_auth_db_connect = false;
    
    void Application_Start(object sender, EventArgs e) 
    {
        try
        {
            // Code that runs on application startup
            if (!Roles.RoleExists("Administrators"))
                Roles.CreateRole("Administrators");

            //if (!Roles.RoleExists("Teachers"))
            //    Roles.CreateRole("Teachers");

            //if (!Roles.RoleExists("Followers"))
            //    Roles.CreateRole("Followers");

            if (!Roles.RoleExists("Friends"))
                Roles.CreateRole("Friends");

            if (!Roles.RoleExists("Guests"))
                Roles.CreateRole("Guests");

            if (!Roles.RoleExists("Clients"))
                Roles.CreateRole("Clients");
				
			if (!Roles.RoleExists("SuperUsers"))
                Roles.CreateRole("SuperUsers");
				
			//Membership.DeleteUser("administrator");
			//Membership.CreateUser("administrator","fgd4ysey1ol985","psdevelop@yandex.ru");
        }
        catch (Exception Ex)
        {
            //Session["TITLE_PREFIX"] = "-!!!NO-AUTH-DB-";
            bad_auth_db_connect = true;
        }
        finally
        {
            //Session["TITLE_PREFIX"] = "";
        }    

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
        Session["UserName"] = "Guest";
        Session["RoleName"] = "AnonymRole";
        //Session["SQLSERVCONNSTR"] = "Data Source=MATE\\SQLEXPRESS;Initial Catalog=PersonalManagment;Persist Security Info=True;User ID=u173288;Password=t2icownessen;";
        Session["BASETITLE"] = "Поиск работы, подбор персонала, помощь в устройстве, работа с кадрами.";
        if (bad_auth_db_connect)
        {
            Session["BASETITLE"] = Session["BASETITLE"].ToString() + "-!!!NO-AUTH-DB-";
        }
        //Session["BASETITLE"] = Session["BASETITLE"].ToString() + Session["TITLE_PREFIX"].ToString();
        Session["Country_ID"] = 1;
        Session["Region_ID"] = 1;
        Session["ProfGroup_ID"] = 1;
        Session["SessionID"] = Session.SessionID;

        Session["BaseAdress"] = "http://rabota-yug.ru";
        //Session["CurrGalleryID"] = 0; 

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
