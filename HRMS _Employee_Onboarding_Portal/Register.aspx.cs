using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;

namespace HRMS__Employee_Onboarding_Portal
{
    public partial class Register : System.Web.UI.Page
    {
        private readonly string _connectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Page Load logic here if needed

        }


        protected void submit_Click(object sender, EventArgs e)
        {
            // Validate input fields


            if (string.IsNullOrEmpty(email.Text) || string.IsNullOrEmpty(fullName.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Email or Full Name cannot be empty.')</script>");
                return;
            }

            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                try
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("proc_employee_details", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Add parameters to the command
                        cmd.Parameters.AddWithValue("@type", "saveData");
                        cmd.Parameters.AddWithValue("@FirstName", firstName.Text);
                        cmd.Parameters.AddWithValue("@LastName", lastName.Text);
                        cmd.Parameters.AddWithValue("@FullName", fullName.Text);
                        cmd.Parameters.AddWithValue("@UserName", username.Text);
                        cmd.Parameters.AddWithValue("@Password", password.Text);
                        cmd.Parameters.AddWithValue("@MaritalStatus", maritalStatus.Text);
                        cmd.Parameters.AddWithValue("@dateOfBirth", DateTime.Parse(dob.Text));
                        cmd.Parameters.AddWithValue("@Gender", gender.Text);
                        cmd.Parameters.AddWithValue("@mobileNumber", mobilenumber.Text);
                        cmd.Parameters.AddWithValue("@Email", email.Text);
                        cmd.Parameters.AddWithValue("@JobTitle", jobtitle.Text);
                        cmd.Parameters.AddWithValue("@department", Department.Text);
                        cmd.Parameters.AddWithValue("@address", streetAddress.Text);
                        cmd.Parameters.AddWithValue("@City", city.Text);
                        cmd.Parameters.AddWithValue("@State", state.Text);
                        cmd.Parameters.AddWithValue("@ZipCode", zipCode.Text);
                        cmd.Parameters.AddWithValue("@CompanyName", companyName.Text);
                        cmd.Parameters.AddWithValue("@Position", position.Text);
                        cmd.Parameters.AddWithValue("@Experience", int.Parse(Experience.Text));
                        cmd.Parameters.AddWithValue("@EndDate", DateTime.Parse(endDate.Text));
                        cmd.Parameters.AddWithValue("@CurrentSalary", int.Parse(currentSalary.Text));
                        cmd.Parameters.AddWithValue("@Joining_Date", DateTime.Parse(Joining_Date.Text));

                        // Execute the command
                        int result = cmd.ExecuteNonQuery();

                        // Check result to determine success
                        if (result > 0)
                        {
                            // Send the confirmation email
                            SendMail1(email.Text, fullName.Text, username.Text, password.Text, mobilenumber.Text, "Admin", "Your details have been successfully submitted.");

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Submit Successfully !!')</script>");
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Submission failed.')</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log exception details here if necessary
                    Page.ClientScript.RegisterStartupScript(this.GetType(), $"Scripts", $"<script>alert('An error occurred: {ex.Message}')</script>");
                }
            }
        }




        public void SendMail1(string email, string fullName, string userName, string password, string mobilenumber, string sender, string message)
        {
            // Validate input
            if (email != null)
            {



                // Sample HTML email template with placeholders
                string emailTemplate = @"
             <html>
             <body>
             <p>Hi {0},<br></p>
             <p>Welcome to our company!</p>
             <p>Here are your details:</p>
             <ul>
             <li><strong>Full Name:</strong> {1}</li>
             <li><strong>Username:</strong> {2}</li>
             <li><strong>Password:</strong> {3}</li>
             <li><strong>Email:</strong> {4}</li>
              <li><strong>Contact:</strong> {5}</li>
             </ul>
              <p>{6}</p>
             <p>Best of luck,</p>
              <p>Thank you and regards,</p>
              <p>{7}</p>
             <p>

           </p>
             </body>
              </html>";

                // Format the email body with dynamic content
                string emailBody = string.Format(emailTemplate, fullName, fullName, userName, password, email, mobilenumber, message, sender);

                try
                {
                    // Create the mail message
                    MailMessage mm = new MailMessage
                    {
                        From = new MailAddress(ConfigurationManager.AppSettings["userName"]),
                        Subject = "Welcome to Our Service!",
                        Body = emailBody,
                        IsBodyHtml = true
                    };

                    mm.To.Add(new MailAddress(email));

                    // SMTP client setup
                    var smtpHost = ConfigurationManager.AppSettings["Host"];
                    var smtpPort = int.Parse(ConfigurationManager.AppSettings["port"]);
                    var smtpUser = ConfigurationManager.AppSettings["userName"];
                    var smtpPass = ConfigurationManager.AppSettings["password"];
                    var enableSsl = bool.Parse(ConfigurationManager.AppSettings["enableSsl"]);

                    SmtpClient smtp = new SmtpClient
                    {
                        Host = smtpHost,
                        Port = smtpPort,
                        EnableSsl = enableSsl,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(smtpUser, smtpPass)
                    };

                    // Send the email
                    smtp.Send(mm);
                }

                catch (Exception ex)
                {
                    // Log or handle the exception as needed
                    System.Diagnostics.Debug.WriteLine("Email send failed: " + ex.Message);
                    throw; // Optional: Re-throw the exception if you want to propagate it
                }
            }

        }

    }
}
