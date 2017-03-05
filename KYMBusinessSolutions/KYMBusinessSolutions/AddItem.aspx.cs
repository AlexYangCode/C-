using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KYMBusinessSolutions
{
    public partial class AddItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ButtonLogin.Attributes.Add("onclick", "popWin()");
        }
       
        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            decimal checkNumber;
            // Check if the point entered is numeric or not
            if (Decimal.TryParse(TextBox3.Text, out checkNumber) == false || Decimal.TryParse(TextBox4.Text, out checkNumber) == false)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Wrong Price or OnHandQuantity entered! Please try again!'); location.href = 'AddItem.aspx';", true);
            }
            else
            {
                Random rnd = new Random();
                int startNumber = rnd.Next(100, 1000);
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
                SqlCommand cmd = new SqlCommand("AddNewFGItem", connection);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ItemID", SqlDbType.VarChar).Value = startNumber;
                cmd.Parameters.Add("@ItemName", SqlDbType.VarChar).Value = TextBox1.Text;
                cmd.Parameters.Add("@ItemDesc", SqlDbType.VarChar).Value = TextBox2.Text;
                cmd.Parameters.Add("@ItemCost", SqlDbType.Decimal).Value = TextBox3.Text;
                cmd.Parameters.Add("@OnHandQuantity", SqlDbType.Int).Value = TextBox4.Text;
                connection.Open();
                var resultSet = cmd.ExecuteNonQuery();

                if (!resultSet.Equals(0))

                {
                    connection.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('New Item Added Successfully!'); location.href = 'IMHome.aspx';", true);
                }
                else
                {
                    connection.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Please try again!'); location.href = 'AddItem.aspx';", true);

                }

            }
        }

       
    }
    }
