using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Linq.Expressions;

namespace HRMS__Employee_Onboarding_Portal
{
    public partial class EmpReport : System.Web.UI.Page
    {
        private readonly string _connectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("proc_employee_details", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Type", "fetchData");

                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);
                            GridView1.DataSource = dataTable;
                            GridView1.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                  //  LogError(ex);
                    //ShowAlert("An error occurred while loading employee data.");
                }
            }
        }



        protected void btn_Update_Click()
        {

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                if (int.TryParse(e.CommandArgument.ToString(), out int employeeId))
                {
                    {
                        using (SqlConnection con = new SqlConnection(_connectionString))
                        {
                            try
                            {
                                con.Open();

                                using (SqlCommand cmd = new SqlCommand("proc_employee_details", con))
                                {
                                    cmd.CommandType = CommandType.StoredProcedure;

                                    // Add parameters to the command
                                    cmd.Parameters.AddWithValue("@type", "updateData");
                                    cmd.Parameters.AddWithValue("@Id", "Id");
                                    cmd.Parameters.AddWithValue("@FirstName", "firstName");
                                    cmd.Parameters.AddWithValue("@LastName", "lastName");
                                    cmd.Parameters.AddWithValue("@FullName", "fullName");
                                    cmd.Parameters.AddWithValue("@UserName", "username");
                                    cmd.Parameters.AddWithValue("@Password", "password");
                                    cmd.Parameters.AddWithValue("@MaritalStatus", "maritalStatus");
                                    cmd.Parameters.AddWithValue("@dateOfBirth", DateTime.Parse("dob"));
                                    cmd.Parameters.AddWithValue("@Gender", "gender");
                                    cmd.Parameters.AddWithValue("@mobileNumber", "mobilenumber");
                                    cmd.Parameters.AddWithValue("@Email", "email");
                                    cmd.Parameters.AddWithValue("@JobTitle", "jobtitle");
                                    cmd.Parameters.AddWithValue("@department", "Department");
                                    cmd.Parameters.AddWithValue("@address", "streetAddress");
                                    cmd.Parameters.AddWithValue("@City", "city");
                                    cmd.Parameters.AddWithValue("@State", "state");
                                    cmd.Parameters.AddWithValue("@ZipCode", "zipCode");
                                }
                            }
                            catch (Exception ex)
                            {
                                // Log exception details here if necessary
                                Page.ClientScript.RegisterStartupScript(this.GetType(), $"Scripts", $"<script>alert('An error occurred: {ex.Message}')</script>");
                            }
                        }



                        //else if (e.CommandName == "Delete")
                        //{
                        //    if (int.TryParse(e.CommandArgument.ToString(), out int employeeId))
                        //    {
                        //        DeleteEmployee(employeeId);
                        //    }
                        //    else
                        //    {
                        //        ShowAlert("Invalid employee ID.");
                        //    }
                    }
                }

            }

            //    protected void DeleteEmployee(int id)
            //    {
            //        using (SqlConnection con = new SqlConnection(_connectionString))
            //        {
            //            try
            //            {
            //                con.Open();
            //                using (SqlCommand cmd = new SqlCommand("proc_employee_details", con))
            //                {
            //                    cmd.CommandType = CommandType.StoredProcedure;
            //                    cmd.Parameters.AddWithValue("@Type", "deleteData");
            //                    cmd.Parameters.AddWithValue("@Id", id);

            //                    int result = cmd.ExecuteNonQuery();
            //                    if (result > 0)
            //                    {
            //                        BindGridView();
            //                        ShowAlert("Employee deleted successfully.");
            //                    }
            //                    else
            //                    {
            //                        ShowAlert("Error deleting employee.");
            //                    }
            //                }
            //            }
            //            catch (Exception ex)
            //            {
            //                LogError(ex);
            //                ShowAlert("An error occurred while deleting employee.");
            //            }
            //        }
            //    }
            //}
            //private void LogError(Exception ex)
            //{
            //    System.Diagnostics.Debug.WriteLine($"Error: {ex.Message}");
            //}

            //private void ShowAlert(string message)
            //{
            //    string script = $"alert('{message}');";
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            //}
        }
    }
}
