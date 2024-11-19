using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assewssment
{
    public partial class Submit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Request.Form["name"];
            string email = Request.Form["email"];
            string phone = Request.Form["phone"];
            string signature = Request.Form["signature"];

            
            SaveSubmission(name, email, phone, signature);
        }

        private void SaveSubmission(string name, string email, string phone, string signature)
        {
            string connectionString = "Data Source=(localdb)MSSQLLocalDB;Initial Catalog=Steve;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            //change the database connection string before u run

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO Signatures (Name, Email, Phone, Signature) VALUES (@Name, @Email, @Phone, @Signature)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Signature", signature);

                cmd.ExecuteNonQuery();
                // Save the data to the database
            }
        }
    }
}