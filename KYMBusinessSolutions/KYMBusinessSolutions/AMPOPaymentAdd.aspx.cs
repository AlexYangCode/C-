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
    public partial class AMPOPaymentAdd : System.Web.UI.Page
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
                string sql = "Select * from PurchaseOrder";
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(sql, connection);
                da.Fill(ds, "PurchaseOrder");
                ddlPONumber.DataSource = ds.Tables[0].DefaultView;
                ddlPONumber.DataTextField = "PONumber";
                ddlPONumber.DataValueField = "PONumber";
                ddlPONumber.DataBind();

                sql = "Select * from Supplier";
                ds = new DataSet();
                da = new SqlDataAdapter(sql, connection);
                da.Fill(ds, "Supplier");
                ddlSupplier.DataSource = ds.Tables[0].DefaultView;
                ddlSupplier.DataTextField = "SupplierBusiness_Name";
                ddlSupplier.DataValueField = "SupplierID";
                ddlSupplier.DataBind();

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
                int sPONumber = Convert.ToInt32(ddlPONumber.SelectedItem.Value);
                int sSupplierID = Convert.ToInt32(ddlSupplier.SelectedItem.Value);
                float sAmount = Convert.ToSingle(Amount.Text);
                float sDiscount = Convert.ToSingle(Discount.Text);
                string sTerms = Terms.Text;
                float sTaxRate = Convert.ToSingle(TaxRate.Text);
                //float sFinalAmount = Convert.ToSingle(FinalAmount.Text);
                string sStatus = Status.Text;

                //string sql = string.Format("Insert Into POPayments" +
                //  "(PONumber, SupplierID, Amount, Discount, Terms, TaxRate, FinalAmount, Status) Values" +
                //  "('{0}', '{1}', '{2}', '{3}','{4}','{5}','{6}','{7}')", sPONumber, sSupplierID, sAmount, sDiscount, sTerms, sTaxRate, sFinalAmount, sStatus);
                string sql = string.Format("Insert Into POPayments" +
                  "(PONumber, SupplierID, Amount, Discount, Terms, TaxRate, Status) Values" +
                  "('{0}', '{1}', '{2}', '{3}','{4}','{5}','{6}')", sPONumber, sSupplierID, sAmount, sDiscount, sTerms, sTaxRate, sStatus);


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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Please try again!'); window.open('AMPOPaymentAdd.aspx');", true);
            }

                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('New Item Added Successfully!'); window.open('AMPOPaymentList.aspx');", true);
            
        }
    }
}