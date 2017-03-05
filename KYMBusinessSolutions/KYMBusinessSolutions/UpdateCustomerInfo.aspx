<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateSupplierInfo.aspx.cs" Inherits="KYMBusinessSolutions.UpdateCustomerInfo" %>
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


<html xmlns="http://www.w3.org/1999/xhtml">
  <head><title><"View and Edit Customer Record">  </title></head>
      <a href="SHome.aspx">Supplier Home</a>
        <div class="m1">
            <ul>
                <li>
                    <a href ="editCustomerRecord.aspx">Edit Customer Information</a>
                </li>
                <li><a href ="ViewSalesOrders.aspx">View Sales Orders</a> - View existing 
                    pending orders for the customer</li>
                
            <li><a href ="Login.aspx">Sign Out</a></li></ul>
        </div>

  <body >
    <center>
      <form id="CustomerForm1" runat="server">

        <table id="CustomerTable2"  runat="server" >
          <tr>
            <td>
                <h1>Customer Information</h1></td>
          </tr>
        </table>
        <asp:DataGrid id="Customerdatagrid"
            AutoGenerateColumns="false" CellPadding="2"
            BorderWidth="1" BorderColor="lightgray"
            OnItemCommand="onItemCommand" RunAt="server">
            <Columns>
              <asp:BoundColumn HeaderText="Business Name" DataField="CustomerBusiness_Name" />
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

    lblCustomerID.text = Context.User.Identity.Name;
    string userID2 = Context.User.Identity.Name;
     
      string ConnectString = ConfigurationSettings.AppSettings["connectString"];
      SqlDataAdapter adapter = new SqlDataAdapter
         ("select * from accounts where role='customer' and userID ='"+userID2+"'", ConnectString);
      DataSet ds = new DataSet();
      adapter.Fill(ds);
      datagrid.DataSource = ds;
      datagrid.DataBind();    
  }

  void onItemCommand(Object sender, DataGridCommandEventArgs e)
  {
    string userID = Context.User.Identity.Name;
    Response.Redirect("editCustomerRecord.aspx"+userID);
  }


  void onLogout(Object sender, EventArgs e)
  {
    FormsAuthentication.SignOut();
    </script>