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
    public partial class SAddSupplyItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ButtonAddItems.Attributes.Add("onclick", "popWin()");
            // Make sure the user has logined
            //if (Session["New"].ToString() == "")
            //    Response.Redirect("Login.aspx");
            ////make sure the user has the right to visit your page.
            //if (Session["Role"].ToString() != "AM")
            //    Response.Redirect("Login.aspx");
        }

        protected void ButtonAddItems_Click(object sender, EventArgs e)
        {
            Random rnd = new Random();
            int startNumber = rnd.Next(100, 1000);
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("AddNewMItem", connection);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ItemID", SqlDbType.VarChar).Value = startNumber;
            cmd.Parameters.Add("@ItemName", SqlDbType.VarChar).Value = tbxSupplyItemNm.Text;
            cmd.Parameters.Add("@ItemDesc", SqlDbType.VarChar).Value = tbxSupplyItemDesc.Text;
            cmd.Parameters.Add("@ItemCost", SqlDbType.Decimal).Value = tbxSupplyItemCost.Text;
            cmd.Parameters.Add("@OnHandQuantity", SqlDbType.Int).Value = tbxOnHandQty.Text;
            connection.Open();
            var resultSet = cmd.ExecuteNonQuery();

            if (!resultSet.Equals(0))
            {
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('New Item Added Successfully!'); window.open('SHome.aspx');", true);
            }
            else
            {
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Please try again!'); window.open('AddItem.aspx');", true);

            }
            connection.Close();

        }


    }
}
