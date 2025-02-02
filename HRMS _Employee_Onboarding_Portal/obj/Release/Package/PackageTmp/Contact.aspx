<%--<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="HRMS__Employee_Onboarding_Portal.Contact" %>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="HRMS__Employee_Onboarding_Portal.Contact" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>

    <style type="text/css">
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
        .contact-form {
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
        }
        .auto-style input.input-box, .auto-style textarea.input-box {
            width: calc(100% - 24px);
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            margin-top: 5px;
        }
        .auto-style input.input-box:focus, .auto-style textarea.input-box:focus {
            border-color: #573b8a;
            outline: none;
        }
        .button-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
            align-items: center;
        }
        .button {
            width: 100%;
            border: none;
            color: white;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s, box-shadow 0.3s;
        }
        .button.submit {
            background-color: #573b8a;
        }
        .button.submit:hover {
            background-color: #6d44b8;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }
        .link-container {
            margin-top: 10px;
            font-size: 14px;
        }
        .link-container a {
            text-decoration: none;
            margin: 0 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="ContactForm" runat="server">
        <div class="contact-form">
            <asp:Label ID="Title" runat="server" Text="Contact Us"></asp:Label>
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
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <asp:Label ID="Label3" runat="server" Text="Phone (Optional)"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="phone" runat="server" CssClass="input-box"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <asp:Label ID="Label4" runat="server" Text="Message"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="message" runat="server" CssClass="input-box" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="button-container">
                            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="button submit" OnClick="btn_Submit" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

