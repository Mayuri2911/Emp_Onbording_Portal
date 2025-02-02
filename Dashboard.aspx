<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HRMS__Employee_Onboarding_Portal.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DashBoard</title>
</head>
        <link rel="stylesheet" type="text/css" href="/css/StyleSheet.css">
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" >
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('/img/bg2.jpg'); 
            background-size: cover;           
            background-repeat: no-repeat;   
            background-position: center;          
            background-attachment: fixed;         
        }

        .navbar {
            background-color: rgba(101, 180, 224, 0.7); 
        }
         .navbar-nav .nav-link {
            color: white; /* Set default text color to white */
        }
        .navbar-nav .nav-link.active {
            background-color: #FFFF00;
            color: white;
        }
        
        .navbar-nav .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2); /* Light background on hover */
            color: #FFFF2E; /* Change text color on hover */
            transition: background-color 0.3s; /* Smooth transition */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Bootstrap Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light">
       <%--     <a class="navbar-brand" href="#">HRMS</a>--%>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="">Employee</a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#news">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Verification Doument</a>
                    </li>
                     <li class="nav-item">
     <a class="nav-link" href="#contact">Feedback</a>
 </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link active"  href="Login.aspx">Login</a>
                    </li>
                </ul>

            </div>
        </nav>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
