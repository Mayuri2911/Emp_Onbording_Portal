<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadDocuments.aspx.cs" Inherits="HRMS__Employee_Onboarding_Portal.UploadDocuments" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Documents</title>
    <style>
   body {
    background-image: url('/img/bg2.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
    margin: 0;
    font-family: Arial, sans-serif;
    color: #333;
}

.container {
    width: 90%;
    max-width: 800px;
    margin: auto;
    padding: 20px;
    background: rgba(255, 255, 255, 0.9);
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

h2, h3 {
    color: #333;
    margin-bottom: 20px;
}

.upload-controls {
    margin-bottom: 20px;
}

.upload-controls input,
.upload-controls textarea,
.upload-controls button {
    display: block;
    margin-bottom: 10px;
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

.upload-controls textarea {
    resize: vertical;
}

.upload-controls input[type="file"] {
    padding: 0;
}

.upload-controls button {
    background-color: #008000;
    color: white;
    border: none;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.upload-controls button:hover {
    background-color: #1e7e34;
    transform: scale(1.05);
}

.upload-controls button:active {
    background-color: #008000;
    transform: scale(0.95);
}

.document-list {
    margin-top: 20px;
}

.document-list .gridview {
    width: 100%;
    border-collapse: collapse;
}

.document-list .gridview th,
.document-list .gridview td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: left;
}

.document-list .gridview th {
    background-color: #f4f4f4;
}

.document-list .gridview td {
    vertical-align: middle;
}

.document-list .gridview .btnDownload {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.document-list .gridview .btnDownload:hover {
    background-color: #218838;
    transform: scale(1.05);
}

.document-list .gridview .btnDownload:active {
    background-color: #1e7e34;
    transform: scale(0.95);
}
.btn-upload{
    background-color:#008000;
    color:white;
    width:50px;
    
}
.btn-download{
    background-color:#FF0000;
    color:white;
    padding:10px;
    border-radius:10px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Upload Documents</h2>
            <div class="upload-controls">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:TextBox ID="txtTitle" runat="server" Placeholder="Document Title" />
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" Placeholder="Document Description" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn-upload" OnClick="btnUpload_Click" />
            </div>

            <h3>Document List</h3>
            <div class="document-list">
                <asp:GridView ID="gvDocuments" runat="server" AutoGenerateColumns="False" CssClass="gridview" OnRowCommand="gvDocuments_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="FileName" HeaderText="File Name" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDownload" runat="server" Text="Download" CommandName="Download" CssClass="btn-download" CommandArgument='<%# Eval("FileName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
