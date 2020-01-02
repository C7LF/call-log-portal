<%@ Page Title="Summary" Language="C#" MasterPageFile="~/dashboard/dashboard.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="dashboard_Default" %>
<asp:Content ContentPlaceHolderID="MainContentArea" runat="server">
    <div class="row">
        <div class="col-md-4">
            <div class="summarybox">
                <asp:Label ID="LabelYD1" runat="server" Text="" CssClass="ydd"></asp:Label>
                <p><asp:Label ID="LabelTN1" CssClass="numberm" runat="server" Text="Label"></asp:Label> &nbsp; <strong>TOTAL</strong> Calls</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="summarybox">
                <asp:Label ID="LabelYD2" runat="server" Text="" CssClass="ydd"></asp:Label>
                <p><asp:Label ID="LabelTN2" CssClass="numberm" runat="server" Text="Label"></asp:Label> &nbsp; <strong>NEW</strong> Callers</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="summarybox three">
                <asp:Label ID="LabelYD3" runat="server" Text="" CssClass="ydd"></asp:Label>
                <p><asp:Label ID="LabelTN3" CssClass="numberm" runat="server" Text=""></asp:Label> &nbsp; <strong class="missed">MISSED</strong> Calls</p>
            </div>
        </div>
    </div>
    <div class="row secondLvl">
        <div class="col-md-12">
            <asp:Label ID="LabelYD4" runat="server" Text="" CssClass="ydd"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoPostBack="true" CssClass="table table-striped table-dark" AutoGenerateColumns="False" AllowPaging="True" PagerSettings-Visible="false" PageSize="8">
                <Columns>
                    <asp:BoundField DataField="CallerLineIdentity" HeaderText="Number" SortExpression="CallerLineIdentity"></asp:BoundField>
                    <asp:BoundField DataField="CallTime" HeaderText="Call Time" SortExpression="CallTime"></asp:BoundField>
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>