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
    public partial class SOHistory : System.Web.UI.Page
    {
        public DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            SOGridView.Visible = true;
            string sql = "SELECT SONumber, CustomerBusiness_Name, orderDate, ItemName, UnitPrice, Quantity, orderstatus FROM SalesOrder so, customer c, inventory i where so.customerid = c.customerid and so.ItemID = i.ItemID";
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);

            connection.Open();
            dataadapter.Fill(ds, "SalesOrder");
            Session["datatable"] = ds.Tables["SalesOrder"];
            connection.Close();
            SOGridView.DataSource = ds.Tables["SalesOrder"];
            SOGridView.DataBind();
        }
    }
}