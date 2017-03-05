using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KYMBusinessSolutions
{
    public partial class AMPOPaymentReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"].ToString() == "")
                Response.Redirect("Login.aspx");
            if (Session["Role"].ToString() != "AM")
                Response.Redirect("Login.aspx");
        }
    }
}