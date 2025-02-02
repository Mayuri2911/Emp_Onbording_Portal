<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="HRMS__Employee_Onboarding_Portal.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
    <style>
        body {
            background-image: url('/img/bg3.jpg');
            background-size: cover;              
            background-repeat: no-repeat;      
            background-position: center;          
            background-attachment: fixed;         
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center; 
        }
        .SignUp-form {
            width: 100%;
            max-width: 500px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px; 
            box-shadow: 5px 20px 50px rgba(0, 0, 0, 0.3); 
            padding: 20px; 
            box-sizing: border-box; 
            text-align: center; 
        }
        #Title {
            font-size: 28px;
            font-weight: bold;
            color: #573b8a;
            margin-bottom: 20px;
        }
        .auto-style {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto; 
        }
        .auto-style td {
            padding: 10px;
        }
        .auto-style .label {
            text-align: right;
            padding-right: 10px;
            color: #573b8a;
            font-size: 16px;
            vertical-align: middle;
        }
        .auto-style input.input-box {
            width: calc(100% - 24px);
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            margin-top: 5px;
        }
        .auto-style input.input-box:focus {
            border-color: #573b8a;
            outline: none;
        }
        .button-container {
            display: flex;
            flex-direction: row; /* Arrange buttons in a row */
            gap: 10px;
            margin-top: 20px;
            justify-content: center; /* Center buttons horizontally */
        }
        #Button1, #Button2 {
            width: 45%;
            border: none;
            color: white;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s, box-shadow 0.3s;
        }
        #Button1 {
            background-color: #573b8a;
        }
        #Button1:hover {
            background-color: #6d44b8;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }
        #Button2 {
            background-color: #ff3333;
        }
        #Button2:hover {
            background-color: #c82333;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }
        .error-message {
            color: red;
        }
        .success-message {
            color: green;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
        }
        .register-container {
            margin-top: 10px; /* Add spacing between buttons and link */
            text-align: center;
        }
        .register-link {
            font-size: 16px;
            color: #573b8a;
            text-decoration: none;
        }
        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="SignUp" runat="server">
        <div class="SignUp-form">
            <asp:Label ID="Title" runat="server" Text="SignUp"></asp:Label>
            <table class="auto-style">
                <tr>
                    <td class="label">
                        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="name" runat="server" CssClass="input-box"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="email" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="remail" 
                            runat="server" 
                            ControlToValidate="email" 
                            ErrorMessage="*Required" 
                            CssClass="error-message" 
                            Display="Dynamic" 
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="password" 
                            runat="server" 
                            CssClass="input-box" 
                            TextMode="Password">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <asp:Label ID="Label4" runat="server" Text="Repeat Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="RepeatPassword" 
                            runat="server" 
                            CssClass="input-box" 
                            TextMode="Password">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <asp:Label ID="Label5" runat="server" Text="Username"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="username" runat="server" CssClass="input-box"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="button-container">
                            <asp:Button ID="Button1" runat="server" Text="Signup" CssClass="button" />
                            <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="button" OnClick="CancelButton_Click" />
                        </div>
                        <div class="register-container">
                            <a href="Register.aspx" class="register-link">Register</a>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

