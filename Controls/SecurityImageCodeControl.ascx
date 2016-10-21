<%@ Control Language="C#" %>
<%@ Register TagPrefix="sc" Namespace="SecurityImageCode" Assembly="SecurityImageCode" %>
<script runat="server">

    void btnSubmit_Click(object sender, System.EventArgs e)
    {
        if (Page.IsValid)
        {
            //Response.Write("Данные корректные !");
            Response.Redirect("Registration.aspx");
        }
    }

</script>
          <sc:SecurityCode ID="sc1" BackColor="#EEEEEE" Width="320"
			     ImageUrl="security_image.aspx" TitleImageCode="Код проверки" DescriptionCode="этот код необходимо ввести для защиты процедуры регистрации от спам-программ"
			     TitleErrorMessage="Неверный код" Runat="server">
          </sc:SecurityCode>
