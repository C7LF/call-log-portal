<%@ Page Title="Search" Language="C#" MasterPageFile="~/dashboard/dashboard.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="dashboard_search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentArea" Runat="Server">
    <h1>Search and Export</h1>
    <p>Enter a specific date below to return Call Data.</p>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="datepicker searchbarau"></asp:TextBox>
    <asp:Button ID="searchCalls" runat="server" Text="Search" OnClick="searchCalls_Click" CssClass="btn btn-secondary" /><br />
    <asp:Label ID="Label1" runat="server" Text="" CssClass="error"></asp:Label>

    <br />
    <br />
    <asp:Button ID="ButtonDownload" runat="server" Text="Export / Download" OnClick="ButtonDownload_Click" CssClass="btn btn-secondary" /><br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoPostBack="true" CssClass="table table-striped table-dark" AutoGenerateColumns="False"  OnPageIndexChanging="GridView1_PageIndexChanging" >
        <Columns>
            <asp:BoundField DataField="CallDate" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy}"></asp:BoundField>
            <asp:BoundField DataField="CallerLineIdentity" HeaderText="Number"></asp:BoundField>
            <asp:BoundField DataField="CallTime" HeaderText="Call Time"></asp:BoundField>
            <asp:BoundField DataField="Duration" HeaderText="Duration"></asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>


