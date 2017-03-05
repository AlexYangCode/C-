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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
            //SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);
            connection.Open();
            string checkuser = "Select count(*) from accounts where userID = '" + TextBoxUserName.Text + "'";
            SqlCommand cmd = new SqlCommand(checkuser, connection);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            connection.Close();
            if(temp == 1)
            {
                connection.Open();
                string checkpassword = "Select UserPassword from accounts where userID = '" + TextBoxUserName.Text + "'";
                SqlCommand pwdcmd = new SqlCommand(checkpassword, connection);
                string password = pwdcmd.ExecuteScalar().ToString();
                if(password ==TextBoxPassword.Text)
                {
                    Session["New"] = TextBoxUserName.Text;
                    Response.Write("Password is correct");
                    string checkrole = "Select Role from accounts where userID = '" + TextBoxUserName.Text + "' and userPassword = '" + TextBoxPassword.Text + "'";
                    SqlCommand rolecmd = new SqlCommand(checkrole, connection);
                    string role = rolecmd.ExecuteScalar().ToString();
                    if(role=="IM")
                    {
                        Response.Redirect("IMHome.aspx");
                    }
                    else if(role=="C")
                    {
                        Response.Redirect("CHome.aspx");
                    }
                    else if (role == "S")
                    {
                        Response.Redirect("SHome.aspx");
                    }
                    else if(role == "AM")
                    {
                        Session["Role"] = "AM";
                        Response.Redirect("AMHome.aspx");
                    }
                    else
                    {
                        Response.Redirect("AdminHome.aspx");
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Password is not correct! Please try again!'); location.href='login.aspx';", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('UserID is not correct! Please try again!'); location.href='login.aspx';", true);
            }
            
        }
    }
}