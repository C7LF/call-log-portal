<%@ Page Title="Settings" Language="C#" MasterPageFile="~/dashboard/dashboard.master" AutoEventWireup="true" CodeFile="settings.aspx.cs" Inherits="dashboard_settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentArea" Runat="Server">
    <div class="container-fluid">
    <div class="row">
    <div class="col-sm-5">
    <h1>Settings</h1>
    <br />
    <h2>Theme Options</h2>
    <p>Select your preferred theme from the dropdown below.</p>
    <asp:DropDownList ID="ThemeList" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ThemeList_SelectedIndexChanged">
        <asp:ListItem>Default</asp:ListItem>
        <asp:ListItem>Light</asp:ListItem>
    </asp:DropDownList>
    </div>
            </div>
    </div>
</asp:Content>

