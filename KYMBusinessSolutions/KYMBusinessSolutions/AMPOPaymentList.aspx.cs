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
    public partial class AMPOPayment : System.Web.UI.Page
    {
        public DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"].ToString() == "")
                Response.Redirect("Login.aspx");
            if (Session["Role"].ToString() != "AM")
                Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {
                POGridView.Visible = true;
                string sql = @"SELECT POInvoiceNum, PONumber,Supplier.SupplierBusiness_Name,Amount, Discount, Terms, TaxRate, FinalAmount, Status 
                    FROM POPayments,Supplier where POPayments.SupplierID = Supplier.SupplierID";
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ToString());
                SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);

                connection.Open();
                dataadapter.Fill(ds, "POPayments");
                Session["datatable"] = ds.Tables["POPayments"];
                connection.Close();
                POGridView.DataSource = ds.Tables["POPayments"];
                POGridView.DataBind();
            }
        }

        protected void POGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int POInvoiceNum = (int)POGridView.DataKeys[e.RowIndex].Values["POInvoiceNum"];             

        }

        protected void Report_Click(object sender, EventArgs e)
        {
            Response.Redirect("AMPOPaymentReport.aspx");
        }

      
    }
}