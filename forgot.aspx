<%@ Page Title="Portal Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="forgot.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainPageImage">
        <div class="container h-100">
            <div class="row align-items-center h-100">
                <div class="col-sm-4 ml-auto">
                    <div class="cardl">
                        <div class="cardh text-center">
                            <a href="Default.aspx"><img src="images/advertel-logo.png" width="90%" height="auto" alt="advertel logo" /></a>
                        </div>
                        <div class="cardb">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" RenderOuterTable="false">
                                        <UserNameTemplate>
                                            
                                         <h2>Forgot Your Password?</h2>
                                     
                                         <p>Enter your User Name to receive your password.</p>
             
                                         <asp:Label runat="server" AssociatedControlID="UserName" ID="UserNameLabel">User Name:</asp:Label></td>

                                         <asp:TextBox runat="server" ID="UserName" CssClass="form-control"></asp:TextBox>
                                         <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ValidationGroup="PasswordRecovery1" ToolTip="User Name is required." ID="UserNameRequired">*</asp:RequiredFieldValidator>
          
  
                                         <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>

                                         <br />

                                         <asp:Button runat="server" CssClass="btn btn-secondary" CommandName="Submit" Text="Submit" ValidationGroup="PasswordRecovery1" ID="SubmitButton"></asp:Button>

                                        </UserNameTemplate>
                                    </asp:PasswordRecovery>
                                </ContentTemplate>
                          </asp:UpdatePanel>
                        </div>
                        <div class="cardf text-center">
                            Need Help? &nbsp&nbsp Call <strong>01246 834600</strong> &nbsp; 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
