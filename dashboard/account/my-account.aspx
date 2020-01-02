<%@ Page Title="My Account" Language="C#" MasterPageFile="~/dashboard/dashboard.master" AutoEventWireup="true" CodeFile="my-account.aspx.cs" Inherits="dashboard_account_my_account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentArea" Runat="Server">
    <h1>My Account</h1>
    <p>Here you can view and edit your account details</p>
    <br />
    <div class="noeditarea">
        <h2>Plan Details</h2>
        <b>Phone Number:</b> <asp:Label ID="LblPhoneNumber" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <div class="row">
            <div class="col-md-6">
        <h2>Change Password</h2>
        <asp:ChangePassword ID="ChangePassword1" RenderOuterTable="false" runat="server">
            <ChangePasswordTemplate>
                
                                        <asp:Label runat="server" AssociatedControlID="CurrentPassword" ID="CurrentPasswordLabel">Password:</asp:Label></td>
                                  
                                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="CurrentPassword"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Password is required." ValidationGroup="ChangePassword1" ToolTip="Password is required." ID="CurrentPasswordRequired">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:Label runat="server" AssociatedControlID="NewPassword" ID="NewPasswordLabel">New Password:</asp:Label></td>
                                   
                                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="NewPassword"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword" ErrorMessage="New Password is required." ValidationGroup="ChangePassword1" ToolTip="New Password is required." ID="NewPasswordRequired">*</asp:RequiredFieldValidator>
 
                                        <br />
                                        <asp:Label runat="server" AssociatedControlID="ConfirmNewPassword" ID="ConfirmNewPasswordLabel">Confirm New Password:</asp:Label></td>
                               
                                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="ConfirmNewPassword"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Confirm New Password is required." ValidationGroup="ChangePassword1" ToolTip="Confirm New Password is required." ID="ConfirmNewPasswordRequired">*</asp:RequiredFieldValidator>
            
                                        <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" ErrorMessage="The Confirm New Password must match the New Password entry." Display="Dynamic" ValidationGroup="ChangePassword1" ID="NewPasswordCompare"></asp:CompareValidator>

                                        <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
                                        <br />
                                        <asp:Button runat="server" CommandName="ChangePassword" Text="Change Password" CssClass="btn btn-secondary" ValidationGroup="ChangePassword1" ID="ChangePasswordPushButton"></asp:Button>

                                        
            </ChangePasswordTemplate>
        </asp:ChangePassword>
        </div>
            </div>
        </div>
    <br />
</asp:Content>

