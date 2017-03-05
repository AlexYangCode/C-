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
    public partial class AMPOPaymentEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"].ToString() == "")
                Response.Redirect("Login.aspx");
            if (Session["Role"].ToString() != "AM")
                Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {
                int POInvoiceNum = Convert.ToInt32(Request.QueryString["POInvoiceNum"]);

                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
                connection.Open();                
                string sql = "Select * from POPayments where POInvoiceNum = " + POInvoiceNum;
                SqlCommand cmd = new SqlCommand(sql, connection);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();
                    string PONumber = Convert.ToString(dr["PONumber"]);
                    string SupplierID = Convert.ToString(dr["SupplierID"]);
                    Amount.Text = Convert.ToString(dr["Amount"]);
                    Discount.Text = Convert.ToString(dr["Discount"]);
                    Terms.Text = Convert.ToString(dr["Terms"]);
                    TaxRate.Text = Convert.ToString(dr["TaxRate"]);
                    FinalAmount.Text = Convert.ToString(dr["FinalAmount"]);
                    Status.Text = Convert.ToString(dr["status"]);
                    dr.Close();                    

                    sql = "Select * from PurchaseOrder";
                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter(sql, connection);
                    da.Fill(ds, "PurchaseOrder");
                    ddlPONumber.DataSource = ds.Tables[0].DefaultView;
                    ddlPONumber.DataTextField = "PONumber";
                    ddlPONumber.DataValueField = "PONumber";
                    ddlPONumber.DataBind();
                    ListItem item = new ListItem();
                    item.Text = PONumber;
                    item.Value = PONumber;
                    ddlPONumber.Items.Insert(0, item);
                

                    sql = "Select * from Supplier";
                    ds = new DataSet();
                    da = new SqlDataAdapter(sql, connection);
                    da.Fill(ds, "Supplier");
                    ddlSupplier.DataSource = ds.Tables[0].DefaultView;
                    ddlSupplier.DataTextField = "SupplierBusiness_Name";
                    ddlSupplier.DataValueField = "SupplierID";
                    ddlSupplier.DataBind();


                    sql = "Select * from Supplier where SupplierID = '" + SupplierID + "'";
                    cmd = new SqlCommand(sql, connection);
                    SqlDataReader dr2 = cmd.ExecuteReader();
                    dr2.Read();
                    item = new ListItem();
                    item.Text = Convert.ToString(dr2["SupplierBusiness_Name"]);
                    item.Value = Convert.ToString(dr2["SupplierID"]);
                    ddlSupplier.Items.Insert(0, item);
                    dr2.Close();
                    connection.Close();
                }
                else
                {
                    dr.Close();
                    connection.Close();
                }
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            int POInvoiceNum = Convert.ToInt32(Request.QueryString["POInvoiceNum"]);
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
            connection.Open();
            //string sql = string.Format("Update POPayments Set  PONumber= '{0}',SupplierID='{1}',Amount='{2}',Discount='{3}',Terms='{4}', TaxRate='{5}', FinalAmount='{6}', Status='{7}' Where POInvoiceNum = '{8}'",
            //  ddlPONumber.SelectedItem.Value, 
            //  ddlSupplier.SelectedItem.Value,
            //  Amount.Text, 
            //  Discount.Text,Terms.Text,
            //  TaxRate.Text, FinalAmount.
            //  Text, Status.Text, POInvoiceNum);
            string sql = string.Format("Update POPayments Set  PONumber= '{0}',SupplierID='{1}',Amount='{2}',Discount='{3}',Terms='{4}', TaxRate='{5}', Status='{6}' Where POInvoiceNum = '{7}'",
              ddlPONumber.SelectedItem.Value,
              ddlSupplier.SelectedItem.Value,
              Amount.Text,
              Discount.Text, Terms.Text,
              TaxRate.Text, Status.Text, POInvoiceNum);
            using (SqlCommand cmd = new SqlCommand(sql, connection))
            {
                cmd.ExecuteNonQuery();
            }
            connection.Close();
            Response.Redirect("AMPOPaymentList.aspx");

        }

    }
}