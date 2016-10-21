using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mail;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Administration_SendUserMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Отослать нам письмо." + Session["BASETITLE"];
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        bool success = true;
        try
        {
            MailMessage send_mail = new MailMessage();
            send_mail.From = "rabotayug@yandex.ru";
            send_mail.To = "rabotayug@yandex.ru";
            send_mail.BodyFormat = MailFormat.Text;
            send_mail.BodyEncoding = System.Text.Encoding.GetEncoding("windows-1251");
            send_mail.Subject =
                "UCLogin[" + Context.User.Identity.Name + "]" +
                tbSubjName.Text + ": " + tbTheme.Text;
            send_mail.Body = tbMailText.Text;
            // для аутентификации на SMTP сервере
            send_mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", 1);
            send_mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "rabotayug");
            send_mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "wieusrkhwfdqwdh");
            SmtpMail.SmtpServer = "smtp.yandex.ru";
            SmtpMail.Send(send_mail);
        }
        catch (Exception Ex)
        {
            success = false;
            SendMsgStatusLabel.Text = "Ошибка при отправке сообщения, сообщение: " + Ex.Message;
        }
        finally
        {
            if (success)
            {
                SendMsgStatusLabel.Text = "Сообщение успешно отправлено!";
            }
        }
    }

}
