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
    public partial class CBuy : System.Web.UI.Page
    {

        public DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

            BuyItemsGridView.Visible = true;
            string sql = "SELECT itemID, itemName, itemDesc, UOM, ItemCost, OnHandQuantity, materialCode FROM Inventory where materialcode = 'F'";
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);

            connection.Open();
            dataadapter.Fill(ds, "Inventory");
            Session["datatable"] = ds.Tables["Inventory"];
            connection.Close();
            BuyItemsGridView.DataSource = ds.Tables["Inventory"];
            BuyItemsGridView.DataBind();
        }

        protected void BuyItemsGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void BuyItemsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int index = gvr.RowIndex;
           // string CustomerID = tbxCustomerID.Text;
            string ItemID = (string)BuyItemsGridView.DataKeys[index].Values["ItemID"];
            string ItemName = (string)BuyItemsGridView.DataKeys[index].Values["ItemName"];
            string ItemDesc = (string)BuyItemsGridView.DataKeys[index].Values["ItemDesc"];
            string UOM = (string)BuyItemsGridView.DataKeys[index].Values["UOM"];
            Decimal ItemCost = (Decimal)BuyItemsGridView.DataKeys[index].Values["ItemCost"];
            string MaterialCode = (string)BuyItemsGridView.DataKeys[index].Values["MaterialCode"];
            int OnHandQuantity = (int)BuyItemsGridView.DataKeys[index].Values["OnHandQuantity"];
            

            Response.Redirect("CPlaceOrder.aspx?ItemID=" + ItemID + "&ItemName=" + ItemName + "&ItemDesc=" + ItemDesc + "&UOM=" + UOM
                + "&ItemCost=" + ItemCost + "&MaterialCode=" + MaterialCode + "&OnHandQuantity=" + OnHandQuantity);


        }
    }
}