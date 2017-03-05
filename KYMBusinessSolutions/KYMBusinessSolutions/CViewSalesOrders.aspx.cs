using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace KYMBusinessSolutions
{
    public partial class CViewSalesOrders : System.Web.UI.Page
    {
        public DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            customerSOdatagrid.Visible = false;
        }

        protected void getCustomerOrders_Click(object sender, EventArgs e)
        {
            string query= "select * from salesOrder where CustomerID='"+ tbxCustomerID.Text+"'";
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
            SqlDataAdapter dataadapter = new SqlDataAdapter(query, connection);
            dataadapter.Fill(ds, "salesOrder");
            Session["datatable"] = ds.Tables["salesOrder"];
            connection.Close();
            customerSOdatagrid.DataSource = ds.Tables["salesOrder"];
            customerSOdatagrid.DataBind();
            
            customerSOdatagrid.Visible = true;
        }

       

    }
}
