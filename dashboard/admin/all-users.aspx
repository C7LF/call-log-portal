<%@ Page Title="All Users" Language="C#" MasterPageFile="~/dashboard/dashboard.master" AutoEventWireup="true" CodeFile="all-users.aspx.cs" Inherits="dashboard_admin_all_users" %>

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
        <div id="dvGrid">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
            DataKeyNames="UserId" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" CssClass="table table-striped table-dark alusers" AllowPaging ="true" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" EmptyDataText="No records has been added.">
            <Columns>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUserName" runat="server" Text='<%# Eval("Username") %>' ReadOnly="true"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone Number">
                    <ItemTemplate>
                        <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                    EditText='<i class="fas fa-pen"></i>' UpdateText='<i class="fas fa-check"></i>' DeleteText='<i class="fas fa-times"></i>' />
            </Columns>
        </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>
</div>
</asp:Content>

