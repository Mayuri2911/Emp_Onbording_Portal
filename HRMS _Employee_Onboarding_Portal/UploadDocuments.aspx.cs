using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace HRMS__Employee_Onboarding_Portal
{
    public partial class UploadDocuments : System.Web.UI.Page
    {
        private readonly string _connectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();
      
        private static List<Document> DocumentList
        {
            get
            {
                if (HttpContext.Current.Session["DocumentList"] == null)
                {
                    HttpContext.Current.Session["DocumentList"] = new List<Document>();
                }
                return (List<Document>)HttpContext.Current.Session["DocumentList"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDocumentList();
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string filepath = Server.MapPath("~/Uploads/") + filename;
                    FileUpload1.SaveAs(filepath);

                    var document = new Document
                    {
                        FileName = filename,
                        Title = txtTitle.Text,
                        Description = txtDescription.Text
                    };

                    DocumentList.Add(document);
                    BindDocumentList();
                    Response.Write("Upload Status: File uploaded successfully!");
                }
                catch (Exception ex)
                {
                    Response.Write("Upload Status: File not uploaded. Error: " + ex.Message);
                }
            }
        }

        private void BindDocumentList()
        {
            gvDocuments.DataSource = DocumentList;
            gvDocuments.DataBind();
        }

        protected void gvDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                string fileName = e.CommandArgument.ToString();
                string filePath = Server.MapPath("~/Uploads/") + fileName;

                if (File.Exists(filePath))
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
                    Response.WriteFile(filePath);
                    Response.End();
                }
            }
        }

        //protected void btnUpload_Click(object sender, EventArgs e)
        //{
        //    if (FileUpload1.HasFile)
        //    {
        //        try
        //        {
        //            // Get file name and save the file to the server
        //            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        //            string filepath = Server.MapPath("~/Uploads/") + filename;
        //            FileUpload1.SaveAs(filepath);

        //            // Create a Document object with the information to save
        //            var document = new Document
        //            {
        //                FileName = filename,
        //                Title = txtTitle.Text,
        //                Description = txtDescription.Text
        //            };

        //            // Save the document details to the database
        //            SaveDocumentToDatabase(document);

        //            // Optionally, add the document to the session list (if needed for grid binding)
        //            DocumentList.Add(document);
        //            BindDocumentList();

        //            // Inform the user of the successful upload
        //            Response.Write("Upload Status: File uploaded and data saved successfully!");
        //        }
        //        catch (Exception ex)
        //        {
        //            Response.Write("Upload Status: File not uploaded. Error: " + ex.Message);
        //        }
        //    }
        //}
        //private void BindDocumentList()
        //{
        //    gvDocuments.DataSource = DocumentList;
        //    gvDocuments.DataBind();
        //}

        //private void SaveDocumentToDatabase(Document document)
        //{
        //    using (SqlConnection con = new SqlConnection(_connectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("[proc_documnet_details]", con))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@","SaveData");
        //            cmd.Parameters.AddWithValue("@FileName", document.FileName);
        //            cmd.Parameters.AddWithValue("@Title", document.Title);
        //            cmd.Parameters.AddWithValue("@Description", document.Description);

        //            try
        //            {
        //                con.Open();
        //                cmd.ExecuteNonQuery();
        //            }
        //            catch (Exception ex)
        //            {
        //                // Handle exception (e.g., log it, rethrow it, etc.)
        //                throw new Exception("Error saving document to database: " + ex.Message);
        //            }
        //        }
        //    }
        //}

        public class Document
        {
            public string FileName { get; set; }
            public string Title { get; set; }
            public string Description { get; set; }
        }
    }
}
