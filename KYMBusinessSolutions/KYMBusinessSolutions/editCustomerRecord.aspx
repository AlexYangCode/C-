<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editCustomerRecord.aspx.cs" Inherits="KYMBusinessSolutions.editCustomerRecord" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.Objects.SqlClient" %>
<%@ Import Namespace="System.Data.Sql" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System" %>

<html>
  <head>
    <title>Edit Customer Record</title>
     
  </head>

  <body style="background-color:#EEEEEE">
  <form id="CustomerEditForm" runat="server">
        <table id="Table2" runat="server" width="100%" cellpadding="2" >
          <tr>
            <td>
                &nbsp;</td>
          </tr>
        </table>

        <center>
          <table id="values" cellpadding="2" style="background-color:#56789A">

            <tr>
              <td align="right">
                  Customer ID:</td>
              <td align="left">
                <asp:TextBox id="customerIDtbx" runat="server"  MaxLength="255" />
              </td>
            </tr>

            <tr>
              <td align="right">
                  Business Name:</td>
              <td align="left">
                <asp:TextBox id="BusinessNametbx" runat="server"  MaxLength="255" />
              </td>
            </tr>
            <tr>
              <td align="right">
                First Name:
              </td>
              <td align="left">
                <asp:TextBox id="fnametbx"  MaxLength="50" runat="server" />
              </td>
            </tr>
            <tr>
              <td align="right">
                Last Name:
              </td>
              <td align="left">
                <asp:TextBox id="lnametbx"  MaxLength="50" runat="server" />
              </td>
            </tr>

            <tr>
              <td align="right">
                  Email Address:
              </td>
              <td align="left">
                <asp:TextBox id="emailtbx" MaxLength="50" runat="server" />
              </td>
            </tr>
            
            <tr>
              <td align="right">
                Address:
              </td>
              <td align="left">
                <asp:TextBox id="addresstbx" MaxLength="200" runat="server" />
              </td>
            </tr>
            
            <tr>
              <td align="right">
                  City:
              </td>
              <td align="left">
                <asp:TextBox id="citytbx" MaxLength="50" runat="server" />
              </td>
            </tr>
            
            <tr>
              <td align="right">
                  State:
              </td>
              <td align="left">
                <asp:TextBox id="statetbx" MaxLength="2" runat="server" />
              </td>
            </tr>
            
            <tr>
              <td align="right">
                  Zip Code:
              </td>
              <td align="left">
                <asp:TextBox id="zipcodetbx" MaxLength="5" runat="server" />
              </td>
            </tr>
            
            <tr>
              <td align="right">
                  Telephone:
              </td>
              <td align="left">
                <asp:TextBox id="telephonetbx" MaxLength="10" runat="server" />
              </td>
            </tr>

            <tr>
              <td align="right">
                  Fax:
              </td>
              <td align="left">
                <asp:TextBox id="faxtbx" MaxLength="10" runat="server" />
              </td>
            </tr>
            
            <tr>
              <td>
                <asp:Button id="update" runat="server" onclick="save" width="100%" text="Submit Changes" />
              </td>
            </tr>
          </table>
          <br />
        </center>
  </form>

  
  </body>
</html>



<script language="C#" runat="server">

  void Page_Load(Object sender, EventArgs e)
  {
    if (IsPostBack)
      return;
    
    lblCustomerID2.text = Context.User.Identity.Name;
    string userID = Context.User.Identity.Name;

    
    if (userID != "") // A user is logged in
    {       
          try
          {
            int suppID;
            using (var conn = new SqlConnection(connectionString))
                {var sql = "select customerID from accounts where userID = @userID";
                 using var cmd = new SqlCommand(sql, conn)) {
                    cmd.Parameters.AddWithValue("@userID",userID);
                    conn.Open();
                    cmd.connection = conn; 
                    custID=(int)cmd.ExecuteScalar();
                    }
                }

            string query = "select * from customer where customerID='" + custID + "'";
                             
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["connectstring"]);
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            object[] values = ds.Tables[0].Rows[0].ItemArray;
 
            customerIDtbx.BackColor = System.Drawing.Color.LightGray;
            customerIDtbx.ReadOnly = true;
            customerIDtbx.TextBoxMode.SingleLine;
            customerIDtbx.Text = (string) values[0];           

            BusinessNametbx.Text = (string) values[1];
            fnametbx.Text = (string) values[2];          
            lnametbx.Text = (string) values[3];
            emailtbx.Text = (string) values[4];
            addresstbx.Text = (string) values[5];
            citytbx.Text = (string) values[6];
            statetbx.Text = (string)values[7];
            zipcodetbx.Text = (string)values[8];
            faxtbx.Text = (string)values[9];           
            telephonetbx.Text = (string)values[10];

            
          }
          catch (Exception f)
          {
            output.Text = f.ToString();
          }
        }
      }
      
    }
  }

  void save(Object sender, EventArgs e)
  {

    string userID = Context.User.Identity.Name;

    string query;

    query = @"UPDATE customer SET CustomerBusiness_Name='" + BusinessNametbx.Text + @"', ContactFname='" + fnametbx.Text + @"', ContactLname='"
        + lnametbx.Text + @"', Email='" + emailtbx.Text + @"', Address='" + addresstbx.Text + @"', City='"
        + citytbx.Text + @"', State='" +  statetbx.Text + @"',ZipCode='" + zipcodetbx.Text + @"',Fax='"+faxtbx.Text + @"',Telephone='"+
        telephonetbx.Text+ @"' WHERE customerID='" + customerIDtbx.text + "'";
  
    try
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["connectstring"]);
      SqlCommand cmd = new SqlCommand(query, connection);

      connection.Open();
      cmd.ExecuteNonQuery();
      Response.Redirect("SHome.aspx");
    }
    catch (Exception ef)
    {
      output.Text = ef.ToString();
    }


  // Returns the role of the currently signed in user.
  string getRole(string userid)
  {
    string query = "select role from accounts where userID='" + userid + "'";

    try
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["connectstring"]);
      SqlCommand cmd = new SqlCommand(query, connection);


      connection.Open();
      cmd.ExecuteNonQuery();
      return (string)cmd.ExecuteScalar();
    }
    catch (Exception)
    {
      return "";
    }
  }

</script>