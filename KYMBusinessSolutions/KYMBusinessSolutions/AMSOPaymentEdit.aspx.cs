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
    public partial class AMSOPaymentEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"].ToString() == "")
                Response.Redirect("Login.aspx");
            if (Session["Role"].ToString() != "AM")
                Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {
                int SOInvoiceNum = Convert.ToInt32(Request.QueryString["SOInvoiceNum"]);

                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
                connection.Open();
                string sql = "Select * from SOPayments where SOInvoiceNum = " + SOInvoiceNum;
                SqlCommand cmd = new SqlCommand(sql, connection);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();
                    string SONumber = Convert.ToString(dr["SONumber"]);
                    string CustomerID = Convert.ToString(dr["CustomerID"]);
                    Amount.Text = Convert.ToString(dr["Amount"]);
                    Discount.Text = Convert.ToString(dr["Discount"]);
                    Terms.Text = Convert.ToString(dr["Terms"]);
                    TaxRate.Text = Convert.ToString(dr["TaxRate"]);
                    FinalAmount.Text = Convert.ToString(dr["FinalAmount"]);
                    Status.Text = Convert.ToString(dr["status"]);
                    dr.Close();

                    sql = "Select * from SalesOrder";
                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter(sql, connection);
                    da.Fill(ds, "SalesOrder");
                    ddlSONumber.DataSource = ds.Tables[0].DefaultView;
                    ddlSONumber.DataTextField = "SONumber";
                    ddlSONumber.DataValueField = "SONumber";
                    ddlSONumber.DataBind();
                    ListItem item = new ListItem();
                    item.Text = SONumber;
                    item.Value = SONumber;
                    ddlSONumber.Items.Insert(0, item);


                    sql = "Select * from Customer";
                    ds = new DataSet();
                    da = new SqlDataAdapter(sql, connection);
                    da.Fill(ds, "Customer");
                    ddlCustomer.DataSource = ds.Tables[0].DefaultView;
                    ddlCustomer.DataTextField = "CustomerBusiness_Name";
                    ddlCustomer.DataValueField = "CustomerID";
                    ddlCustomer.DataBind();


                    sql = "Select * from Customer where CustomerID = '" + CustomerID + "'";
                    cmd = new SqlCommand(sql, connection);
                    SqlDataReader dr2 = cmd.ExecuteReader();
                    dr2.Read();
                    item = new ListItem();
                    item.Text = Convert.ToString(dr2["CustomerBusiness_Name"]);
                    item.Value = Convert.ToString(dr2["CustomerID"]);
                    ddlCustomer.Items.Insert(0, item);
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
            int SOInvoiceNum = Convert.ToInt32(Request.QueryString["SOInvoiceNum"]);
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
            connection.Open();
            //string sql = string.Format("Update SOPayments Set  SONumber= '{0}',CustomerID='{1}',Amount='{2}',Discount='{3}',Terms='{4}', TaxRate='{5}', FinalAmount='{6}', Status='{7}' Where SOInvoiceNum = '{8}'",
            //  ddlSONumber.SelectedItem.Value,
            //  ddlCustomer.SelectedItem.Value,
            //  Amount.Text,
            //  Discount.Text, Terms.Text,
            //  TaxRate.Text, FinalAmount.
            //  Text, Status.Text, SOInvoiceNum);
            string sql = string.Format("Update SOPayments Set  SONumber= '{0}',CustomerID='{1}',Amount='{2}',Discount='{3}',Terms='{4}', TaxRate='{5}', Status='{6}' Where SOInvoiceNum = '{7}'",
              ddlSONumber.SelectedItem.Value,
              ddlCustomer.SelectedItem.Value,
              Amount.Text,
              Discount.Text, Terms.Text,
              TaxRate.Text, Status.Text, SOInvoiceNum);
            using (SqlCommand cmd = new SqlCommand(sql, connection))
            {
                cmd.ExecuteNonQuery();
            }
            connection.Close();
            Response.Redirect("AMSOPaymentList.aspx");
        }

    }
}