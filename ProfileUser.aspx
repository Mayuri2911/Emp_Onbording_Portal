<%@ Page 
    Language="C#" 
    AutoEventWireup="true" 
    CodeBehind="ProfileUser.aspx.cs" 
    Inherits="HRMS_Employee_Onboarding_Portal.ProfileUser" 
%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>
    <style>
    body {
        background-image: url('/img/bg2.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        background-attachment: fixed;
        margin: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Arial, sans-serif;
        overflow: hidden; /* Prevents body from scrolling */
    }

    #form1 {
        background-color: rgba(255, 255, 255, 0.9);
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        width: 80%;
        max-width: 800px;
        max-height: 80vh; /* Set maximum height */
        overflow-y: auto; /* Enable vertical scrolling */
    }

    .title {
        text-align: center;
        margin-bottom: 20px;
    }

    .form-row {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #333;
    }

    .label-value {
        display: block;
        margin-bottom: 10px;
        color: #555;
    }
    .title {
            text-align: center;
            margin-bottom: 20px;
        }

        .title h1 {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

</style>


</head>

<body>
  <form id="form1" runat="server">
        <div>
           
            <div class="title">
                <h1>PROFILE</h1>
            </div>
            <div class="form-row">
          

                <asp:Label ID="firstNameLabel" runat="server" CssClass="label" Text="First Name:"></asp:Label>
                <asp:Label ID="firstName" runat="server" CssClass="label-value"></asp:Label>

                <asp:Label ID="lastNameLabel" runat="server" CssClass="label" Text="Last Name:"></asp:Label>
                <asp:Label ID="lastName" runat="server" CssClass="label-value"></asp:Label>

                <asp:Label ID="fullNameLabel" runat="server" CssClass="label" Text="Full Name:"></asp:Label>
                <asp:Label ID="fullName" runat="server" CssClass="label-value"></asp:Label>

                <asp:Label ID="maritalStatusLabel" runat="server" CssClass="label" Text="Marital Status:"></asp:Label>
                <asp:Label ID="maritalStatus" runat="server" CssClass="label-value"></asp:Label>



                <asp:Label ID="genderLabel" runat="server" CssClass="label" Text="Gender:"></asp:Label>
                <asp:Label ID="gender" runat="server" CssClass="label-value"></asp:Label>

                <asp:Label ID="mobileNumberLabel" runat="server" CssClass="label" Text="Mobile Number:"></asp:Label>
                <asp:Label ID="mobileNumber" runat="server" CssClass="label-value"></asp:Label>

                <asp:Label ID="emailLabel" runat="server" CssClass="label" Text="Email:"></asp:Label>
                <asp:Label ID="email" runat="server" CssClass="label-value"></asp:Label>

                <asp:Label ID="jobTitleLabel" runat="server" CssClass="label" Text="Job Title:"></asp:Label>
                <asp:Label ID="jobTitle" runat="server" CssClass="label-value"></asp:Label>

                <asp:Label ID="departmentLabel" runat="server" CssClass="label" Text="Department:"></asp:Label>
                <asp:Label ID="department" runat="server" CssClass="label-value"></asp:Label>

                <asp:Label ID="addressLabel" runat="server" CssClass="label" Text="Address:"></asp:Label>
                <asp:Label ID="address" runat="server" CssClass="label-value"></asp:Label>

                <asp:Label ID="cityLabel" runat="server" CssClass="label" Text="City:"></asp:Label>
                <asp:Label ID="city" runat="server" CssClass="label-value"></asp:Label>

                <asp:Label ID="stateLabel" runat="server" CssClass="label" Text="State:"></asp:Label>
                <asp:Label ID="state" runat="server" CssClass="label-value"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
