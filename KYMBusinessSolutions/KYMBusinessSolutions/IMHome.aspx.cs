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
    public partial class IMHome : System.Web.UI.Page
    {
        public DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OrdersGridView.Visible = true;
                string sql = "SELECT SONumber, CustomerBusiness_Name, OrderDate, ItemName, UnitPrice, Quantity FROM SalesOrder s, customer c, inventory i where s.CustomerID = c.CustomerID and s.ItemID = i.ItemID and Upper(orderstatus) = 'O'";
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
                    var SONumber = row.FindControl("lblSONumber") as Label;
                    string sql = "Update SalesOrder set orderStatus = 'P' where SONumber = @SoNumber";
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    cmd.Parameters.AddWithValue("@SONumber", SONumber.Text);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    i++;

                }
                else
                {
                    var SONumber = row.FindControl("lblSONumber") as Label;
                    string sql = "Update SalesOrder set orderStatus = 'R' where SONumber = @SONumber";
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    cmd.Parameters.AddWithValue("@SONumber", SONumber.Text);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    i++;
                }
               
            }
            OrdersGridView.DataSource = ds.Tables["SalesOrder"];
            OrdersGridView.DataBind();
            ButtonAccept.Visible = false;
        }

        //protected void OrdersGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
        //    int index = gvr.RowIndex;
        //    string SONumber = (string)OrdersGridView.DataKeys[index].Values["SONumber"];
        //    if (e.CommandName == "Accept")
        //    {
        //        string sql = "Update SalesOrder set orderStatus = 'P' where SONumber = SoNumber";
        //        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
        //        SqlCommand cmd = new SqlCommand(sql, connection);
        //        connection.Open();
        //        cmd.ExecuteNonQuery();
        //        connection.Close();
        //    }
        //    else if (e.CommandName == "Reject")
        //    {
        //        string sql = "Update SalesOrder set orderStatus = 'R' where SONumber = SoNumber";
        //        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
        //        SqlCommand cmd = new SqlCommand(sql, connection);
        //        connection.Open();
        //        cmd.ExecuteNonQuery();
        //        connection.Close();
        //    }

        //string ItemName = (string)OrdersGridView.DataKeys[index].Values["ItemName"];
        //string ItemDesc = (string)OrdersGridView.DataKeys[index].Values["ItemDesc"];
        //string UOM = (string)OrdersGridView.DataKeys[index].Values["UOM"];
        //Decimal ItemCost = (Decimal)OrdersGridView.DataKeys[index].Values["ItemCost"];
        //string MaterialCode = (string)OrdersGridView.DataKeys[index].Values["MaterialCode"];
        //int OnHandQuantity = (int)OrdersGridView.DataKeys[index].Values["OnHandQuantity"];
        //int SupplierID = (int)OrdersGridView.DataKeys[index].Values["SupplierID"]

        //}
    }
    }
