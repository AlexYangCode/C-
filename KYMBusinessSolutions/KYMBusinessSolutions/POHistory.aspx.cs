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
    public partial class POHistory : System.Web.UI.Page
    {
        public DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            POGridView.Visible = true;
            string sql = "SELECT PONumber, SupplierBusiness_Name, orderDate, ItemName, UnitPrice, Quantity, orderstatus FROM PurchaseOrder po, supplier s, inventory i where po.supplierID = s.SupplierID and po.ItemID = i.ItemID";
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);

            connection.Open();
            dataadapter.Fill(ds, "PurchaseOrder");
            Session["datatable"] = ds.Tables["PurchaseOrder"];
            connection.Close();
            POGridView.DataSource = ds.Tables["PurchaseOrder"];
            POGridView.DataBind();
        }
    }
}