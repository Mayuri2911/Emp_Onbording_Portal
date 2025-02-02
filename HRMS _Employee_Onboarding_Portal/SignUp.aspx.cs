using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS__Employee_Onboarding_Portal
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    // Check if all fields are filled and valid
        //    if (IsValid)
        //    {
        //        // Show success message
        //        SuccessMessage.Text = "Sign Up Successful!";
        //        SuccessMessage.Visible = true;
        //    }
        //    else
        //    {
        //        // Hide success message if form validation fails
        //        SuccessMessage.Visible = false;
        //    }
        //}

      
    }
}