<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HomePage</title>
    <link rel="stylesheet" type="text/css" href="/css/StyleSheet.css">
    <!-- Bootstrap CSS -->
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
            color: white !important; /* Ensure text color is white */
        }

        .navbar-nav .nav-link.active {
            background-color: #FFFF00; /* Background color for active link */
            color: black !important; /* Ensure text color is black for active link */
        }
        
        .navbar-nav .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2); /* Light background on hover */
            color: #FFFF2E !important; /* Change text color on hover */
            transition: background-color 0.3s; /* Smooth transition */
        }

        /* Specific style for the Login button */
        .navbar-nav .nav-item.login-item .nav-link {
            background-color: #FF2400; /* Set background color for the Login button */
            border-radius: 5px; /* Optional: rounded corners for the button */
            padding: 10px 20px; /* Optional: padding around the button text */
            color: white !important; /* Ensure text color is white */
            font-weight: bold; /* Optional: make the button text bold */
        }
        
        .navbar-nav .nav-item.login-item .nav-link:hover {
            background-color: #D22B2B; /* Darker background on hover for the Login button */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Bootstrap Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Register.aspx">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="EmpReport.aspx">EmployeeReport</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item login-item">
                        <a class="nav-link" href="Login.aspx">Login</a>
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
