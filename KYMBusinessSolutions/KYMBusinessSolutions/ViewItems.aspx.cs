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
    public partial class ViewItems : System.Web.UI.Page
    {
        public DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewItemsGridView1.Visible = true;
            string sql = "SELECT * FROM Inventory";
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);

            connection.Open();
            dataadapter.Fill(ds, "Inventory");
            Session["datatable"] = ds.Tables["Inventory"];
            connection.Close();
            ViewItemsGridView1.DataSource = ds.Tables["Inventory"];
            ViewItemsGridView1.DataBind();
        }

        
        //public string getWhileLoopData()
        //{
        //    string htmlStr = "";
        //    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        //    //SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);
        //    connection.Open();
        //    string checkuser = "Select * from Inventory";
        //    SqlCommand cmd = new SqlCommand(checkuser, connection);
        //    SqlDataReader reader = cmd.ExecuteReader();
        //    while (reader.Read())
        //    {
        //        String ItemID = reader.GetString(0);
        //        string ItemName = reader.GetString(1);
        //        string ItemDesc = reader.GetString(2);
        //        string UOM = reader.GetString(3);
        //        Decimal ItemCost = reader.GetDecimal(4);
        //        char MaterialCode = reader.GetChar(5);
        //        int OnHandQuantity = reader.GetInt32(6);
        //        int SupplierID = reader.GetInt32(7);

        //        htmlStr += "<tr><td>" + ItemID + "</td><td>" + ItemName + "</td><td>" + ItemDesc + "</td><td>" + UOM + "</td><td>" +
        //          ItemCost + "</td><td>" + MaterialCode + "</td><td>" + OnHandQuantity + "</td><td>" + SupplierID + "</td></tr>";
        //    }

        //    connection.Close();
        //    return htmlStr;
        //}
    }
}