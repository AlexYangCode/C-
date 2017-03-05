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
    public partial class PlaceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string ItemID = Request.QueryString["ItemID"];
           // string ItemName = Request.QueryString["ItemName"];
            TextBox ID = txtboxItemID.FindControl("txtboxItemID") as TextBox;
            ID.Text = Request.QueryString["ItemID"];
            ID.ReadOnly = true;
            TextBox itemName = txtboxItemName.FindControl("txtboxItemName") as TextBox;
            itemName.Text = Request.QueryString["ItemName"];
            itemName.ReadOnly = true;
            TextBox itemDesc = TxtboxItemDesc.FindControl("TxtboxItemDesc") as TextBox;
            itemDesc.Text = Request.QueryString["ItemDesc"];
            itemDesc.ReadOnly = true;
            TextBox itemCost = TxtBoxCost.FindControl("TxtBoxCost") as TextBox;
            itemCost.Text = Request.QueryString["ItemCost"];
            itemCost.ReadOnly = true;
            TextBox SupplierID = TxtBoxSupplier.FindControl("TxtBoxSupplier") as TextBox;
            SupplierID.Text = Request.QueryString["SupplierID"];
            SupplierID.ReadOnly = true;
        }

        protected void ButtonPlaceOrder_Click(object sender, EventArgs e)
        {
            decimal checkNumber;
            int checkQuantity;
            // Check if the point entered is numeric or not
            if (Decimal.TryParse(TxtBoxCost.Text, out checkNumber) == false || int.TryParse(TxtBoxQuantity.Text, out checkQuantity) == false)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Wrong Price or OnHandQuantity entered! Please try again!'); location.href = 'AddItem.aspx';", true);
            }
            else
            {
                //int POStatus = 0;
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
                SqlCommand cmd = new SqlCommand("CreatePO", connection);
                connection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@SupplierID", SqlDbType.VarChar).Value = TxtBoxSupplier.Text;
                cmd.Parameters.Add("@ItemID", SqlDbType.VarChar).Value = txtboxItemID.Text;
                cmd.Parameters.Add("@UnitPrice", SqlDbType.VarChar).Value = TxtBoxCost.Text;
                cmd.Parameters.Add("@Quantity", SqlDbType.Decimal).Value = TxtBoxQuantity.Text;
                // cmd.Parameters.Add("@OnHandQuantity", SqlDbType.Int).Value = TextBox4.Text;

                cmd.Parameters.Add("@POStatus", SqlDbType.VarChar, 2);
                cmd.Parameters["@POStatus"].Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                //Retrieve the value of the output parameter
                String id = cmd.Parameters["@POStatus"].Value.ToString();

                //SqlParameter returnParameter = cmd.Parameters.Add("@POStatus", SqlDbType.Int);
                //returnParameter.Direction = ParameterDirection.ReturnValue;


                //int id = (int)returnParameter.Value;

                if (id == "1")

                {
                    connection.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Purchase Order created Successfully!'); location.href = 'IMHome.aspx';", true);
                }
                else
                {
                    connection.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Please try again!'); location.href = 'Buy.aspx';", true);

                }

            }
        }
    }
}