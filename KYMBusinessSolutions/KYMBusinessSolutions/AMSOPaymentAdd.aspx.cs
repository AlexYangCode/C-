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
    public partial class AMSOPaymentAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"].ToString() == "")
                Response.Redirect("Login.aspx");
            if (Session["Role"].ToString() != "AM")
                Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
                connection.Open();
                string sql = "Select * from SalesOrder";
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(sql, connection);
                da.Fill(ds, "SalesOrder");
                ddlSONumber.DataSource = ds.Tables[0].DefaultView;
                ddlSONumber.DataTextField = "SONumber";
                ddlSONumber.DataValueField = "SONumber";
                ddlSONumber.DataBind();

                sql = "Select * from Customer";
                ds = new DataSet();
                da = new SqlDataAdapter(sql, connection);
                da.Fill(ds, "Customer");
                ddlCustomer.DataSource = ds.Tables[0].DefaultView;
                ddlCustomer.DataTextField = "CustomerBusiness_Name";
                ddlCustomer.DataValueField = "CustomerID";
                ddlCustomer.DataBind();

                connection.Close();

            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
            connection.Open();
            SqlTransaction tx = null;
            try
            {
                int sSONumber =  Convert.ToInt32(ddlSONumber.SelectedItem.Value);
                int sCustomerID = Convert.ToInt32(ddlCustomer.SelectedItem.Value);
                float sAmount = Convert.ToSingle(Amount.Text);
                float sDiscount = Convert.ToSingle(Discount.Text);
                string sTerms = Terms.Text;
                float sTaxRate = Convert.ToSingle(TaxRate.Text);
                //float sFinalAmount = Convert.ToSingle(FinalAmount.Text);
                string sStatus = Status.Text;

                //string sql = string.Format("Insert Into SOPayments" +
                //  "(SONumber, CustomerID, Amount, Discount, Terms, TaxRate, FinalAmount, Status) Values" +
                //  "('{0}', '{1}', '{2}', '{3}','{4}','{5}','{6}','{7}')", sSONumber, sCustomerID, sAmount, sDiscount, sTerms, sTaxRate, sFinalAmount, sStatus);
                string sql = string.Format("Insert Into SOPayments" +
                  "(SONumber, CustomerID, Amount, Discount, Terms, TaxRate, Status) Values" +
                  "('{0}', '{1}', '{2}', '{3}','{4}','{5}','{6}')", sSONumber, sCustomerID, sAmount, sDiscount, sTerms, sTaxRate, sStatus);


                // Execute using our connection.
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    tx = connection.BeginTransaction();
                    cmd.Transaction = tx;
                    cmd.ExecuteNonQuery();
                    tx.Commit();
                }
                connection.Close();
            }
            catch (Exception ex)
            {
                tx.Rollback();
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Please try again!'); location.href='AMSOPaymentAdd.aspx';", true);
            }

            connection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('New Item Added Successfully!'); window.open('AMSOPaymentList.aspx');", true);
            
        }
    }
}