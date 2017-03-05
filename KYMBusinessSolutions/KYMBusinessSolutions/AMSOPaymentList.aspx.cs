using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace KYMBusinessSolutions
{
    public partial class AMSOPaymentList : System.Web.UI.Page
    {
        public DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"].ToString() == "")
                Response.Redirect("Login.aspx");
            if (Session["Role"].ToString() != "AM")
                Response.Redirect("Login.aspx");

            SOGridView.Visible = true;
            string sql = @"SELECT SOInvoiceNum, SONumber,Customer.CustomerBusiness_Name,Amount, Discount, Terms, TaxRate, FinalAmount, Status 
                    FROM SOPayments,Customer where SOPayments.CustomerID = Customer.CustomerID";
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);

            connection.Open();
            dataadapter.Fill(ds, "SOPayments");
            Session["datatable"] = ds.Tables["SOPayments"];
            connection.Close();
            SOGridView.DataSource = ds.Tables["SOPayments"];
            SOGridView.DataBind();
        }
    }
}