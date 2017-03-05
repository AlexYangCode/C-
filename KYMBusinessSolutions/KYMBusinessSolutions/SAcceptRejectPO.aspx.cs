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
    public partial class SAcceptRejectPO : System.Web.UI.Page
    {

        public DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OrdersGridView.Visible = true;
                string sql = "SELECT PONumber, SupplierBusiness_Name, OrderDate, ItemName, UnitPrice, Quantity FROM PurchaseOrder p, supplier s, inventory i where p.SupplierID = s.SupplierID and p.ItemID = i.ItemID and Upper(orderstatus) = 'O'";
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
                SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);

                connection.Open();
                dataadapter.Fill(ds, "SalesOrder");
                Session["datatable"] = ds.Tables["SalesOrder"];
                connection.Close();
                OrdersGridView.DataSource = ds.Tables["SalesOrder"];
                OrdersGridView.DataBind();
                if (ds.Tables[0].Rows.Count == 0)
                {
                    ButtonAccept.Visible = false;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int i = 0;
            foreach (GridViewRow row in OrdersGridView.Rows)
            {
                // string id = "OrdersGridView_ChkBoxAccept_" +i+ "";
                var check = row.FindControl("ChkBoxAccept") as CheckBox;

                // CheckBox check = (CheckBox)row.FindControl("ChkBoxAccept");
                if (check.Checked)
                {
                    var PONumber = row.FindControl("lblPONumber") as Label;
                    string sql = "Update PurchaseOrder set orderStatus = 'P' where PONumber = @PONumber";
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    cmd.Parameters.AddWithValue("@PONumber", PONumber.Text);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    i++;

                }
                else
                {
                    var PONumber = row.FindControl("lblPONumber") as Label;
                    string sql = "Update PurchaseOrder set orderStatus = 'R' where PONumber = @PONumber";
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    cmd.Parameters.AddWithValue("@PONumber", PONumber.Text);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    i++;
                }

            }
            OrdersGridView.DataSource = ds.Tables["PurchaseOrder"];
            OrdersGridView.DataBind();
            ButtonAccept.Visible = false;
        }

        protected void getSupplierOrders_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            string query = "select * from purchaseOrder where uppercase(orderStatus) = 'O'";
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
            SqlDataAdapter dataadapter = new SqlDataAdapter(query, connection);
            dataadapter.Fill(ds, "purchaseOrder");
            Session["datatable"] = ds.Tables["purchaseOrder"];
            connection.Close();
            OrdersGridView.DataSource = ds.Tables["purchaseOrder"];
            OrdersGridView.DataBind();
            OrdersGridView.Visible = true;
            if (ds.Tables[0].Rows.Count >0)
            {
                ButtonAccept.Visible = true;
            }   
            
        }

    }
}
