using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static HRMS__Employee_Onboarding_Portal.Login;

namespace HRMS__Employee_Onboarding_Portal
{
    public partial class Contact : Page
    {
        private readonly string _connectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_Submit(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(name.Text) || string.IsNullOrWhiteSpace(email.Text) ||
      string.IsNullOrWhiteSpace(phone.Text) || string.IsNullOrWhiteSpace(message.Text))
            {
                // Show alert if any field is empty
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts",
                    "<script>alert('Please fill in all fields before submitting.')</script>");
                return; 
            }
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("proc_contactus", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@type", "saveData");
                        cmd.Parameters.AddWithValue("name", name.Text);
                        cmd.Parameters.AddWithValue("email", email.Text);
                        cmd.Parameters.AddWithValue("phone", phone.Text);
                        cmd.Parameters.AddWithValue("message", message.Text);
                        int result = cmd.ExecuteNonQuery();

                        // Check result to determine success
                        if (result > 0)
                        {


                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Contact Submit Successfully !!')</script>");
                            name.Text = string.Empty;
                            email.Text = string.Empty;
                            phone.Text = string.Empty;
                            message.Text = string.Empty;
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Contact Submission failed.')</script>");
                        }




                    }
                }

                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), $"Scripts", $"<script>alert('An error occurred: {ex.Message}')</script>");
                }
            }
        }
    }
}
            
            


            
       
    
