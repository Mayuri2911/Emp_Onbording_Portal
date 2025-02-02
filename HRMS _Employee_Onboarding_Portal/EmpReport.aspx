<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpReport.aspx.cs" Inherits="HRMS__Employee_Onboarding_Portal.EmpReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Report</title>
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
            font-family: Arial, sans-serif;
            overflow: hidden; /* Prevents body from scrolling */
        }

        #form1 {
            width: 100%;
            max-width: 1500px;
            padding: 20px;
            box-sizing: border-box;
            background: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            border-radius: 8px;
        }

        .gridview-container {
            max-height: 500px; /* Set a max height for scrolling */
            overflow-y: auto; /* Vertical scrollbar */
            border: 1px solid #ddd; /* Optional border */
        }

        .gridview-container table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        .gridview-container th,
        .gridview-container td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .gridview-container th {
            background-color: #4CAF50;
            color: white;
        }

        .gridview-container tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview-container tr:hover {
            background-color: #ddd;
        }

        .btn-container {
            display: flex;
            gap: 10px; /* Space between buttons */
            justify-content: center; /* Center buttons horizontally */
        }

        .action-button {
            border: none;
            padding: 8px 16px; /* Adjusted padding for better appearance */
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
            font-size: 14px;
            text-align: center;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .update-button {
            background-color: #4CAF50;
        }

        .update-button:hover {
            background-color: #45a049;
        }

        .delete-button {
            background-color: #FF0000;
        }

        .delete-button:hover {
            background-color: #da190b;
        }

        .pagination {
            text-align: center;
            margin-top: 10px;
        }

        .pagination a {
            padding: 8px 16px;
            margin: 0 4px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-decoration: none;
            color: #4CAF50;
        }

        .pagination a:hover {
            background-color: #ddd;
        }

        .pagination span {
            padding: 8px 16px;
            margin: 0 4px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="gridview-container">
            <asp:GridView 
                ID="GridView1" 
                runat="server" 
                AutoGenerateColumns="false" 
                CssClass="gridview"
                OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" />
                    <asp:BoundField DataField="fullName" HeaderText="Full Name" ReadOnly="True" />
                    <asp:BoundField DataField="mobileNumber" HeaderText="Mobile Number" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="jobTitle" HeaderText="Job Title" />
                    <asp:BoundField DataField="department" HeaderText="Department" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="city" HeaderText="City" />
                    <asp:BoundField DataField="state" HeaderText="State" />
                    <asp:BoundField DataField="position" HeaderText="Position" />
                    <asp:BoundField DataField="Joining_Date" HeaderText="Joining Date" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div class="btn-container">
                               <asp:Button 
                                 ID="btnUpdate" 
                                  runat ="server" 
                                   CssClass ="action-button update-button"
                                    CommandName="Update"  
                                    
                                    Text="Update"
                                    CommandArgument='<%# Eval("Id") %>'/>
                                <asp:Button 
                                    ID="btnDelete" 
                                    runat="server" 
                                    CssClass="action-button delete-button"
                                    CommandName="Delete"   
                              
                                    Text="Delete"
                                    CommandArgument='<%# Eval("Id") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>