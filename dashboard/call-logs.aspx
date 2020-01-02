<%@ Page Title="Call Logs" Language="C#" MasterPageFile="~/dashboard/dashboard.master" AutoEventWireup="true" CodeFile="call-logs.aspx.cs" Inherits="dashboard_call_logs"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentArea" Runat="Server">

     <h1>Call Logs</h1>

    <br />
            <asp:GridView ID="GridView1" runat="server" AutoPostBack="true" CssClass="table table-striped table-dark" AutoGenerateColumns="False"  AllowPaging="True" PageSize="12" AllowSorting="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnSorting="gridViewSorting" >
                <Columns>
                    <asp:BoundField DataField="CallDate" HeaderText="Date" SortExpression="CallDate" DataFormatString="{0:MM/dd/yyyy}"></asp:BoundField>
                    <asp:BoundField DataField="CallerLineIdentity" HeaderText="Number" SortExpression="CallerLineIdentity"></asp:BoundField>
                    <asp:BoundField DataField="CallTime" HeaderText="Call Time" SortExpression="CallTime"></asp:BoundField>
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration"></asp:BoundField>
                </Columns>
            </asp:GridView>
</asp:Content>



