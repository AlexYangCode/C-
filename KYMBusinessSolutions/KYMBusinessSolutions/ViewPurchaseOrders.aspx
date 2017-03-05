<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewPurchaseOrders.aspx.cs" Inherits="KYMBusinessSolutions.ViewPurchaseOrders" %>
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
                <li><a href ="ViewPurchaseOrders.aspx">View Purchase Orders</a> - Approve or reject existing 
                    pending orders for the supplier</li>
                <li><a href = "AddSupplyItems.aspx">Add new supply items</a> - Add newly offered items to the inventory</li>
            <li><a href ="login.aspx">Sign Out</a></li></ul>
        </div>
    <div class="auto-style1">
        <br />
  <asp:DataGrid id="supplierPOdatagrid"
            AutoGenerateColumns="false" CellPadding="2"
            BorderWidth="1" BorderColor="lightgray"
            Width="75%"
            OnItemCommand="onItemCommand" RunAt="server">
            <Columns>
              <asp:BoundColumn HeaderText="PO Number" DataField="ponumber" />
              <asp:BoundColumn HeaderText="Supplier ID" DataField="supplierID" />
              <asp:BoundColumn HeaderText="Order Date" DataField="OrderDate" />
              <asp:BoundColumn HeaderText="Item" DataField="itemiD" />
              <asp:BoundColumn HeaderText="Item Name" DataField="Item Name" />
              <asp:BoundColumn HeaderText="Unit Price" DataField="UnitPrice" />
              <asp:BoundColumn HeaderText="Quantity" DataField="quantity" />
              <asp:BoundColumn HeaderText="Order Status" DataField="orderStatus" />
                       
              <asp:ButtonColumn Text="Approve"
                HeaderStyle-HorizontalAlign="center"
                ItemStyle-HorizontalAlign="center"
                CommandName="ApproveOrder" />

              <asp:ButtonColumn Text="Reject"
                HeaderStyle-HorizontalAlign="center"
                ItemStyle-HorizontalAlign="center"
                CommandName="RejectOrder" />
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
        {var sql = "select supplierID from accounts where userID = @userID";
            using var cmd = new SqlCommand(sql, conn)) {
            cmd.Parameters.AddWithValue("@userID",userID);
            conn.Open();
            cmd.connection = conn; 
            suppID=(int)cmd.ExecuteScalar();
            }

            string query = "select p.ponumber, p.supplierID, p.orderdate, p.itemid, i.itemname, p.unitprice, p.quantity, p.orderstatus
            from purchaseorder p inner join inventory i on p.itemID =i.itemID where supplierID='" + suppID + "'";
                             
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["connectstring"]);
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
  }

  void onItemCommand(Object sender, DataGridCommandEventArgs e)
  {
     string userID = Context.User.Identity.Name;
   
     string ponumber = e.Item.Cells[0].Text;
     string queryA ="update table purchaseorder set orderstatus = 'A' where ponumber ='"+ponumber+"'";
     string queryR ="update table purchaseorder set orderstatus = 'R' where ponumber ='"+ponumber+"'";

     switch (e.CommandName)
    {
        case "ApproveOrder":       
            try
            { SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["connectstring"]);
              SqlDataAdapter adapter = new SqlDataAdapter(queryA, connection);
              DataSet ds = new DataSet();
              adapter.Fill(ds);
              
            }
            catch (Exception)
            {  }

            break;

        case "RejectOrder":
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["connectstring"]);
            SqlDataAdapter adapter = new SqlDataAdapter(queryR, connection);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            break;

        default:
            break;


  }

      </script>
