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
    public partial class CPlaceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string ItemID = Request.QueryString["ItemID"];
            // string ItemName = Request.QueryString["ItemName"];
            TextBox CustID = tbxCustomerID.FindControl("tbxCustomerID") as TextBox;
          //  CustID.Text = Request.QueryString["CustomerID"];

            TextBox ID = txtboxItemID.FindControl("txtboxItemID") as TextBox;
            ID.Text = Request.QueryString["ItemID"];
            ID.ReadOnly = true;
            TextBox itemName = txtboxItemName.FindControl("txtboxItemName") as TextBox;
            itemName.Text = Request.QueryString["ItemName"];
            itemName.ReadOnly = true;
            TextBox itemDesc = TxtboxItemDesc.FindControl("TxtboxItemDesc") as TextBox;
            itemDesc.Text = Request.QueryString["ItemDesc"];
            itemDesc.ReadOnly = true;
            TextBox UOM = TextBoxUOM.FindControl("TextboxUOM") as TextBox;
            UOM.Text = Request.QueryString["UOM"];
            UOM.ReadOnly = true;
            TextBox itemCost = TxtBoxCost.FindControl("TxtBoxCost") as TextBox;
            itemCost.Text = Request.QueryString["ItemCost"];
            itemCost.ReadOnly = true;

        }

        protected void ButtonPlaceOrder_Click(object sender, EventArgs e)
        {
            //int POStatus = 0;
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("CreateSO", connection);
            connection.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CustomerID", SqlDbType.VarChar).Value = tbxCustomerID.Text;
            cmd.Parameters.Add("@ItemID", SqlDbType.VarChar).Value = txtboxItemID.Text;
            cmd.Parameters.Add("@UnitPrice", SqlDbType.VarChar).Value = TxtBoxCost.Text;
            cmd.Parameters.Add("@Quantity", SqlDbType.Decimal).Value = TxtBoxQuantity.Text;
            // cmd.Parameters.Add("@OnHandQuantity", SqlDbType.Int).Value = TextBox4.Text;

            cmd.Parameters.Add("@SOStatus", SqlDbType.VarChar, 2);
            cmd.Parameters["@SOStatus"].Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();
            //Retrieve the value of the output parameter
            String id = cmd.Parameters["@SOStatus"].Value.ToString();

            //SqlParameter returnParameter = cmd.Parameters.Add("@POStatus", SqlDbType.Int);
            //returnParameter.Direction = ParameterDirection.ReturnValue;


            //int id = (int)returnParameter.Value;

            if (id == "1")
            {
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Sales Order created Successfully!'); location.href = 'CHome.aspx';", true);
            }
            else
            {
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Please try again!'); location.href = 'CBuy.aspx';", true);

            }


        }
    }
}