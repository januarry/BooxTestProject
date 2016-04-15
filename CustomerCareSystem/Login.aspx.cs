using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using CustomerCareSystem.Models;

namespace CustomerCareSystem
{
    public partial class Login : System.Web.UI.Page
    {
        private string role;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.cmdLogin.ServerClick += new System.EventHandler(this.cmdLogin_ServerClick);
        }

        private void cmdLogin_ServerClick(object sender, System.EventArgs e)
        {
            if (ValidateUser(txtId.Value, txtUserPass.Value))
            {
                FormsAuthenticationTicket tkt;
                string cookiestr;
                HttpCookie ck;
                tkt = new FormsAuthenticationTicket(1, txtId.Value, DateTime.Now,
                    DateTime.Now.AddMinutes(30), true, role);
                cookiestr = FormsAuthentication.Encrypt(tkt);
                ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                ck.Expires = tkt.Expiration;
                ck.Path = FormsAuthentication.FormsCookiePath;
                Response.Cookies.Add(ck);
                string strRedirect;
                strRedirect = Request["ReturnUrl"];
                if (strRedirect == null)
                {
                    strRedirect = "Dashboard.aspx";
                }
                Response.Redirect(strRedirect, true);
            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }
        }


        private bool ValidateUser(string id, string password)
        {
            CustomerCareDBEntities CustomerCareContext = new CustomerCareDBEntities();
            Users user = CustomerCareContext.Users.Where(u => u.Username == id && u.Password == password).SingleOrDefault();
            if (user == null)
            {
                return false;
            }
            else
            {
                role = user.Role;
                return true;
            }
        }
    }
}