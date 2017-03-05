using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KYMBusinessSolutions
{
    public partial class CHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* did not work
            // Make sure the user has logined
            if (Session["New"].ToString() == "")
                Response.Redirect("Login.aspx");
            //make sure the user has the right to visit your page.
            if (Session["Role"].ToString() != "AM")
                Response.Redirect("Login.aspx");

            */ 
      String CustID = Request.QueryString["CustomerID"];
        }
    }
}