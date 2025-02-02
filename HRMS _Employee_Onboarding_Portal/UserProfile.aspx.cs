using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS__Employee_Onboarding_Portal
{
    public partial class UserProfile : System.Web.UI.Page
    {
        private readonly string _connectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null )
            {
                // Retrieve the username from the session
                string username = Session["username"].ToString();
               // string password = Session["password"].ToString();
              


                lblWelcome.Text = $"Welcome, {username}";
            }
            else
            {
                // Redirect to the login page if the session is null
                Response.Redirect("Login.aspx");
            }

        }

     


    }
}
