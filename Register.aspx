<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HRMS__Employee_Onboarding_Portal.Register" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
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

        .Register-form {
            width: 90%;
            max-width: 1000px; /* Adjust max-width as needed */
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 5px 20px 50px rgba(0, 0, 0, 0.3);
            padding: 30px; /* Increased padding for better spacing */
            box-sizing: border-box;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            height: 90vh;
            overflow: auto; /* Allows scrolling inside the form if necessary */
        }

        .form-title, .form-section-title {
            color: #573b8a;
            text-align: center;
        }

        .form-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-section-title {
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 15px;
        }

        .form-row, .address-row {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }

        .form-row > div, .address-row > div {
            flex: 1 1 calc(50% - 20px);
            min-width: 0;
        }

        .address-row > div {
            flex: 1 1 100%;
        }

        .label {
            display: block;
            font-size: 16px;
            color: #573b8a;
            margin-bottom: 5px;
        }

        .input-box, .input-date {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .input-box:focus, .input-date:focus {
            border-color: #573b8a;
            outline: none;
        }

        .form-buttons {
            margin-top: 20px;
            text-align: center;
        }

        .form-buttons input {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 14px;
        }

        .form-buttons input[type="submit"] {
            background-color: #007BFF;
        }

        .form-buttons input[type="reset"] {
            background-color: #6c757d;
        }

        @media (max-width: 768px) {
            .form-row > div, .address-row > div {
                flex: 1 1 100%;
            }
        }

        @media (max-width: 480px) {
            .Register-form {
                padding: 10px;
            }

            .form-buttons input {
                padding: 8px 16px;
                font-size: 12px;
            }
        }

        .error-message {
            color: red;
        }
        
        .email-link {
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
            font-weight: bold;
            padding: 10px;
            border-radius: 5px;
            background-color: #f8f9fa;
            transition: background-color 0.3s ease;
        }

        .email-link:hover {
            background-color: #e2e6ea;
            color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="Register" runat="server">
        <div class="Register-form">
            <asp:Label ID="Title" runat="server" Text="Employee Registration" CssClass="form-title"></asp:Label>
            <asp:Label ID="Title2" runat="server" Text="Personal Information" CssClass="form-section-title"></asp:Label>
            
            <div class="form-row">
                <div>
                    <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="firstName" runat="server" CssClass="input-box" Placeholder="First Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfirstname" runat="server" ControlToValidate="firstName" ErrorMessage="*Required" CssClass="error-message" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="Label20" runat="server" Text="Last Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="lastName" runat="server" CssClass="input-box" Placeholder="Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rlastname" runat="server" ControlToValidate="lastName" ErrorMessage="*Required" CssClass="error-message" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="Label24" runat="server" Text="Full Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="fullName" runat="server" CssClass="input-box" Placeholder="Full Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfullname" runat="server" ControlToValidate="fullName" ErrorMessage="*Required" CssClass="error-message" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!-- Username and Password Section -->
        <%--    <asp:Label ID="Title6" runat="server" Text="Account Information" CssClass="form-section-title"></asp:Label>--%>
            <div class="form-row">
                <div>
                    <asp:Label ID="Label25" runat="server" Text="Username" CssClass="label"></asp:Label>
                    <asp:TextBox ID="username" runat="server" CssClass="input-box" Placeholder="Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rusername" runat="server" ControlToValidate="username" ErrorMessage="*Required" CssClass="error-message" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="Label26" runat="server" Text="Password" CssClass="label"></asp:Label>
                    <asp:TextBox ID="password" runat="server" CssClass="input-box" TextMode="Password" Placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rpassword" runat="server" ControlToValidate="password" ErrorMessage="*Required" CssClass="error-message" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-row">
                <div>
                    <asp:Label ID="Label2" runat="server" Text="Marital Status" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="maritalStatus" runat="server" CssClass="input-box">
                        <asp:ListItem Text="Single" Value="Single"></asp:ListItem>
                        <asp:ListItem Text="Married" Value="Married"></asp:ListItem>
                        <asp:ListItem Text="Divorced" Value="Divorced"></asp:ListItem>
                        <asp:ListItem Text="Widowed" Value="Widowed"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <asp:Label ID="Label3" runat="server" Text="Date of Birth" CssClass="label"></asp:Label>
                    <asp:TextBox ID="dob" runat="server" CssClass="input-date" TextMode="Date"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label4" runat="server" Text="Gender" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="gender" runat="server" CssClass="input-box">
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-row">
                <div>
                    <asp:Label ID="Label5" runat="server" Text="Mobile Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="mobilenumber" runat="server" CssClass="input-box" TextMode="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rmobilenumber" runat="server" ControlToValidate="mobilenumber" ErrorMessage="*Required" CssClass="error-message" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="Label6" runat="server" Text="Email" CssClass="label"></asp:Label>
                    <asp:TextBox ID="email" runat="server" CssClass="input-box" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="remail" runat="server" ControlToValidate="email" ErrorMessage="*Required" CssClass="error-message" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-row">
                <div>
                    <asp:Label ID="Label7" runat="server" Text="Job Title" CssClass="label"></asp:Label>
                    <asp:TextBox ID="jobtitle" runat="server" CssClass="input-box"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rjobtitle" runat="server" ControlToValidate="jobtitle" ErrorMessage="*Required" CssClass="error-message" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="Label8" runat="server" Text="Department" CssClass="label"></asp:Label>
                    <asp:TextBox ID="Department" runat="server" CssClass="input-box"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rDepartment" runat="server" ControlToValidate="Department" ErrorMessage="*Required" CssClass="error-message" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="address-row">
                <div>
                    <asp:Label ID="Label9" runat="server" Text="Address" CssClass="label"></asp:Label>
                    <asp:TextBox ID="streetAddress" runat="server" CssClass="input-box"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label10" runat="server" Text="City" CssClass="label"></asp:Label>
                    <asp:TextBox ID="city" runat="server" CssClass="input-box"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label11" runat="server" Text="State" CssClass="label"></asp:Label>
                    <asp:TextBox ID="state" runat="server" CssClass="input-box"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label12" runat="server" Text="Zip Code" CssClass="label"></asp:Label>
                    <asp:TextBox ID="zipCode" runat="server" CssClass="input-box"></asp:TextBox>
                </div>
            </div>

            <asp:Label ID="Title3" runat="server" Text="Work Experience" CssClass="form-section-title"></asp:Label>

            <div class="form-row">
                <div>
                    <asp:Label ID="Label13" runat="server" Text="Company Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="companyName" runat="server" CssClass="input-box"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label14" runat="server" Text="Position" CssClass="label"></asp:Label>
                    <asp:TextBox ID="position" runat="server" CssClass="input-box"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label19" runat="server" Text="Total Experience (Years)" CssClass="label"></asp:Label>
                    <asp:TextBox ID="Experience" runat="server" CssClass="input-box" TextMode="Number"></asp:TextBox>
                </div>
            </div>

            <div class="form-row">
                <div>
                    <asp:Label ID="Label15" runat="server" Text="Start Date" CssClass="label"></asp:Label>
                    <asp:TextBox ID="startDate" runat="server" CssClass="input-date" TextMode="Date"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label16" runat="server" Text="End Date" CssClass="label"></asp:Label>
                    <asp:TextBox ID="endDate" runat="server" CssClass="input-date" TextMode="Date"></asp:TextBox>
                </div>
            </div>

            <asp:Label ID="Title4" runat="server" Text="Salary Details" CssClass="form-section-title"></asp:Label>

            <div class="form-row">
                <div>
                    <asp:Label ID="Label17" runat="server" Text="Current Salary" CssClass="label"></asp:Label>
                    <asp:TextBox ID="currentSalary" runat="server" CssClass="input-box" TextMode="Number"></asp:TextBox>
                </div>
            </div>

            <asp:Label ID="Title5" runat="server" Text="Company Details" CssClass="form-section-title"></asp:Label>

            <div class="form-row">
                <div>
                    <asp:Label ID="Label23" runat="server" Text="Joining Date" CssClass="label"></asp:Label>
                    <asp:TextBox ID="Joining_Date" runat="server" CssClass="input-date" TextMode="Date"></asp:TextBox>
                </div>
            </div>

            <div class="form-buttons">
                <asp:Button CssClass="Button" ID="btnSubmit" runat="server" Text="Submit" OnClick="submit_Click" />
                <input type="reset" value="Reset" />
            </div>


        </div>
    </form>
</body>
</html>
