using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Web.UI;
using static System.Net.Mime.MediaTypeNames;
using System.Web.UI.WebControls;
using System.Reflection.Emit;

namespace HRMS_Employee_Onboarding_Portal
{
    public partial class ProfileUser : System.Web.UI.Page
    {
        private readonly string _connectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();
        //private object firstName;



        //  private readonly string _connectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["username"] != null )
                {
                    string username = Session["userName"].ToString();
                   // int Id = Session["Id"].ToString();
                    // Fetch user data from the database
                    UserModel user = GetUserData(username);
                 

                    if (user != null)
                    {
                        // Bind the user data to the controls
                      //  Id.Text = $"Id : {user.Id}";
                        firstName.Text = $"First Name: {user.firstName}";
                        lastName.Text = $"Last Name: {user.lastName}";
                        fullName.Text = $"Full Name: {user.fullName}";
                        maritalStatus.Text = $"MaritalStatus : {user.maritalStatus}";
                     //   dateOfBirth.Text = $"dateOfBirth: {user.dateOfBirth}";
                        gender.Text = $"Gender : {user. gender}";
                        mobileNumber.Text = $"Mobile Number : {user. mobileNumber}";
                        email.Text = $"Email ID: {user .email}";
                        jobTitle.Text = $"JobTitle : {user.jobTitle}";
                        department.Text = $"Department : {user.department}";
                        address.Text = $"Address : {user.Address}";
                        city.Text = $"City : {user.city}";
                        state.Text = $"State : {user.state}";
                    }
                    else
                    {
                        // Handle the case where user data is not found
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User data not found.');", true);
                    }
                }
                else
                {
                    // Redirect to login page if session is null
                    Response.Redirect("Login.aspx");
                }
            }
        }

        public UserModel GetUserData(string username)
        {
            UserModel user = null;
            string mobileNumber = string.Empty;

            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proc_employee_details", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", "fetchRecord");
                    cmd.Parameters.AddWithValue("@UserName", username); // Pass the username to the stored procedure

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            mobileNumber = reader["mobileNumber"].ToString();
                            // Retrieve user details from the database
                            user = new UserModel
                            {
                               // Id = reader["Id"].ToString(),
                                firstName = reader["FirstName"].ToString(),
                                lastName = reader["LastName"].ToString(),
                                fullName = reader["fullName"].ToString(),
                                maritalStatus = reader["maritalStatus"].ToString(),
                                // Retrieve the dateOfBirth as a string
                            
                                gender = reader["gender"].ToString(),
                                mobileNumber = reader["mobileNumber"].ToString(),
                                email = reader["email"].ToString(),
                                jobTitle = reader["jobTitle"].ToString(),
                                department = reader["department"].ToString(),
                                Address = reader["Address"].ToString(),
                                city = reader["city"].ToString(),
                                state = reader["state"].ToString()




                            };
                        }
                    }
                }
            }

            return user;
        }
    }

    public class UserModel
    {
      //  public string Username { get; set; }
       // public string Email { get; set; }
       public int Id { get; set; }  
        public string firstName { get; set; }
        public string lastName { get; set; }

        // Computed property for Full Name
        public string fullName { get; set; }

        public string maritalStatus { get; set; }
       // public DateTime dateOfBirth { get; set; }
        public string gender { get; set; }
        public string mobileNumber { get; set; }
        public string email { get; set; }
        public string jobTitle { get; set; }
        public string department { get; set; }
         public string Address { get; set; }
        public string city { get; set; }
        public string state { get; set; }

    }

}

