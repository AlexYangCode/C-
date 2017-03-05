<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewSalesOrders.aspx.cs" Inherits="KYMBusinessSolutions.ViewSalesOrders" %>
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
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="m1">
            <ul>
                <li><a href = "UpdateCustomerInfo.aspx">View/Edit Customer Information </a> - Update your company contact information</li>
                <li><a href ="ViewSalesOrders.aspx">View Sales Orders</a> - View customer orders</li>
            <li><a href ="login.aspx">Sign Out</a></li></ul>
        </div>
    <div class="auto-style1">
        <br />
  <asp:DataGrid id="customerSOdatagrid"
            AutoGenerateColumns="false" CellPadding="2"
            BorderWidth="1" BorderColor="lightgray"
             GridLines="vertical" Width="100%"
             RunAt="server">
            <Columns>
              <asp:BoundColumn HeaderText="SO Number" DataField="sonumber" />
              <asp:BoundColumn HeaderText="Customer ID" DataField="customerID" />
              <asp:BoundColumn HeaderText="Order Date" DataField="OrderDate" />
              <asp:BoundColumn HeaderText="Item" DataField="itemiD" />
              <asp:BoundColumn HeaderText="Item Name" DataField="Item Name" />
              <asp:BoundColumn HeaderText="Unit Price" DataField="UnitPrice" />
              <asp:BoundColumn HeaderText="Quantity" DataField="quantity" />
              <asp:BoundColumn HeaderText="Order Status" DataField="orderStatus" />
                       
            </Columns>
            <HeaderStyle BackColor="#56789A" ForeColor="white" Font-Bold="true" />
            <ItemStyle BackColor="white" />
            <AlternatingItemStyle BackColor="beige" />
        </asp:DataGrid>
    </div>
    </form>

</body>
</html>


<script language="C#" runat="server"> 
 void Page_Load(Object sender, EventArgs e) {

   if (IsPostBack)
      return;

    int suppID;
    using (var conn = new SqlConnection(connectionString))
        {var sql = "select customerID from accounts where userID = @userID";
            using var cmd = new SqlCommand(sql, conn)) {
            cmd.Parameters.AddWithValue("@userID",userID);
            conn.Open();
            cmd.connection = conn; 
            suppID=(int)cmd.ExecuteScalar();
            }

            string query = "select s.sonumber, s.customerID, s.orderdate, s.itemid, i.itemname, s.unitprice, s.quantity, s.orderstatus
            from salesorder s inner join inventory i on p.itemID =i.itemID where customerID='" + custID + "'";
                             
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["connectstring"]);
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
  }

 

      </script>
