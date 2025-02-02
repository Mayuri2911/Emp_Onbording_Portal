<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="HRMS__Employee_Onboarding_Portal.UserProfile" %>

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
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: rgba(101, 180, 224, 0.7);
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-nav {
            display: flex;
        }

        .navbar-nav .nav-link {
            padding: 10px 20px;
            text-decoration: none;
            color: #FFFFFF;
        }

        .navbar-nav .nav-link.active {
            background-color: #FFFF00;
            color: black;
        }

        .navbar-nav .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2); /* Light background on hover */
            color: #FFFF2E; /* Change text color on hover */
            transition: background-color 0.3s; /* Smooth transition */
        }

        .welcome-message {
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="navbar-nav">
                    <!-- Add your navigation links here -->
                    <a class="nav-link" href="Home.aspx">Home</a>
                    <a class="nav-link"  ID="Profile" href="ProfileUser.aspx">Profile</a>
                    <a class ="nav-link"  href="UploadDocuments.aspx" >Upload Documents </a>
                    <a class="nav-link" href="Login.aspx">Logout</a>
                </div>
                <div class="welcome-message">
                    <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
                </div>
            </nav>
        </div>
    </form>
</body>
</html>
