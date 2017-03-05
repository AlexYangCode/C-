using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace KYMBusinessSolutions
{
    public partial class AMSOPaymentDel : System.Web.UI.Page
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
                string sql = string.Format("delete from SOPayments where SOInvoiceNum = '{0}'", SOInvoiceNum);
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.ExecuteNonQuery();
                }
                connection.Close();
                Response.Redirect("AMSOPaymentList.aspx");
            }
        }
    }
}