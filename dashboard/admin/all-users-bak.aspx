<%@ Page Title="All Users" Language="C#" MasterPageFile="~/dashboard/dashboard.master" AutoEventWireup="true" CodeFile="all-users-bak.aspx.cs" Inherits="dashboard_admin_all_users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentArea" Runat="Server">
    <div class="row">
        <div class="col-md-6">
            <h1>All Users</h1>
        </div>
        <div class="col-md-6 text-right">
            <asp:TextBox ID="txtSearch" runat="server" OnTextChanged="Search" AutoPostBack="true" CssClass="searchbarau" placeholder="Search"></asp:TextBox>
        </div>
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-dark" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName"></asp:BoundField>
            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber"></asp:BoundField>
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>    
</asp:Content>

