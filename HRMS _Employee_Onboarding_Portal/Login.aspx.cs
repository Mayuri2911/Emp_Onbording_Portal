using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Threading.Tasks;
using System.Web.UI;

namespace HRMS__Employee_Onboarding_Portal
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly string _connectionString;

        public Login()
        {
            // Initialize the connection string
            _connectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        // Authentication class to handle user validation
        public class Authentication
        {
            private readonly string _connectionString;

         
            public Authentication(string connectionString)
            {
                _connectionString = connectionString;
            }

       
            public bool ValidateUser(string userName, string password)
            {
                using (SqlConnection con = new SqlConnection(_connectionString))
                {
                    string query = "SELECT COUNT(*) FROM tbl_employee_details WHERE userName = @userName AND Password = @password";
                    SqlCommand command = new SqlCommand(query, con);
                    command.Parameters.AddWithValue("@userName", userName);
                    command.Parameters.AddWithValue("@password", password); // Ensure passwords are hashed in real applications
                    //command.Parameters.AddWithValue("@Id", Id);
                    con.Open();
                    int userCount = (int)command.ExecuteScalar();

                    // Return true if userCount is greater than 0
                    return userCount > 0;
                }
            }
        }


        protected void btn_Login(object sender, EventArgs e)
        {
            try
            {
                Authentication auth = new Authentication(_connectionString);

                bool isValidUser = auth.ValidateUser(username.Text, password.Text);

                if (isValidUser)
                {
                    // Store username in session
                    Session["userName"] = username.Text;
                   // Session["password"] = password.Text;

                    // Redirect to Home.aspx
                    Response.Redirect("UserProfile.aspx");
                }
                else
                {
                    // Login failed
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Login!');", true);
                }
            }
            catch (Exception ex)
            {
                // Log the exception (not shown here for brevity)
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred. Please try again later.');", true);
            }
        }
       
    }
}
