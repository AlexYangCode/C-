<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateSupplierInfo.aspx.cs" Inherits="KYMBusinessSolutions.UpdateSupplierInfo" %>
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
  <head><title><"View and Edit Supplier Record"></title>   </head>
      <a href="SHome.aspx">Supplier Home</a>
        <div class="m1">
            <ul>
                <li><a href ="ViewPurchaseOrders.aspx">View Purchase Orders</a> - Approve or reject existing 
                    pending orders for the supplier</li>
                <li><a href = "AddSupplyItems.aspx">Add new supply items</a> - Add newly offered items to the inventory</li>
            <li><a href ="Login.aspx">Sign Out</a></li></ul>
        </div>
       <asp:Label ID="lblSupplierID" runat="server" ></asp:Label>  
     

  <body >
    <center>
      <form id="SupplierForm1" runat="server">

        <table id="SupplierTable2"  runat="server" >
          <tr>
            <td>
              <h2>Supplier Information</h2>
            </td>
          </tr>
        </table>
        <asp:DataGrid id="supplierdatagrid"
            AutoGenerateColumns="false" CellPadding="2"
            BorderWidth="1" BorderColor="lightgray"
            OnItemCommand="onItemCommand" RunAt="server">
            <Columns>
              <asp:BoundColumn HeaderText="Business Name" DataField="SupplierBusiness_Name" />
              <asp:BoundColumn HeaderText="Contact First Name" DataField="ContactFname" />
              <asp:BoundColumn HeaderText="Contact Last Name" DataField="ContactLname" />
              <asp:BoundColumn HeaderText="Email Address" DataField="Email" />
              <asp:BoundColumn HeaderText="Address" DataField="Address" />
              <asp:BoundColumn HeaderText="City" DataField="City" />
              <asp:BoundColumn HeaderText="State" DataField="State" />
              <asp:BoundColumn HeaderText="Zip Code" DataField="ZipCode" />
              <asp:BoundColumn HeaderText="Telephone" DataField="Telephone" />
              <asp:BoundColumn HeaderText="Fax" DataField="Fax" />

                              
              <asp:ButtonColumn Text="Modify"
                HeaderStyle-HorizontalAlign="center"
                ItemStyle-HorizontalAlign="center"
                CommandName="EditRecord" />


            </Columns>
            <HeaderStyle BackColor="#56789A" ForeColor="white" Font-Bold="true" />
            <ItemStyle BackColor="white" />
            <AlternatingItemStyle BackColor="beige" />
        </asp:DataGrid>
      </form>
          <br />
    </center>
  </body>

</html>


<script language="C#" runat="server">


  void Page_Load(Object sender, EventArgs e) {

   if (IsPostBack)
      return;

    lblSupplierID.text = Context.User.Identity.Name;
    string userID2 = Context.User.Identity.Name;
     
      string ConnectString = ConfigurationSettings.AppSettings["connectString"];
      SqlDataAdapter adapter = new SqlDataAdapter
         ("select * from accounts where role='supplier' and userID ='"+userID2+"'", ConnectString);
      DataSet ds = new DataSet();
      adapter.Fill(ds);
      datagrid.DataSource = ds;
      datagrid.DataBind();    
  }

  void onItemCommand(Object sender, DataGridCommandEventArgs e)
  {
    string userID = Context.User.Identity.Name;
    Response.Redirect("editSupplierRecord.aspx"+userID);
  }


  void onLogout(Object sender, EventArgs e)
  {
    FormsAuthentication.SignOut();
    </script>