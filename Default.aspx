<%@ Page Title="Portal Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainPageImage">
        <div class="container h-100">
            <div class="row align-items-center h-100">
                <div class="col-sm-4 ml-auto">
                    <div class="cardl">
                        <div class="cardh text-center">
                            <img src="images/advertel-logo.png" width="90%" height="auto" alt="advertel logo" />
                        </div>
                        <div class="cardb">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                            <asp:Login ID="Login1" runat="server" RenderOuterTable="false" DestinationPageUrl="~/dashboard/Default.aspx" FailureText="Your Username or Password is Incorrect.">
                                <LayoutTemplate>                     
                                    <asp:Label runat="server" AssociatedControlID="UserName" ID="UserNameLabel">Username:</asp:Label></td>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="UserName"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ValidationGroup="Login1" CssClass="error" ToolTip="User Name is required." ID="UserNameRequired"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:Label runat="server" AssociatedControlID="Password" ID="PasswordLabel">Password:</asp:Label></td>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" ID="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ValidationGroup="Login1" CssClass="error" ToolTip="Password is required." ID="PasswordRequired"></asp:RequiredFieldValidator>
                                    <a href="forgot.aspx" class="float-right">Forgot Password?</a>
                                    <br />
                                   
                                    <asp:CheckBox runat="server" Text="&nbsp;Remember me" ID="RememberMe"></asp:CheckBox><br />
                                                        
                                    <asp:label runat="server" ID="FailureText" EnableViewState="False" CssClass="error" ></asp:label>
                                    <br />
                                    <br />
                                    <asp:Button runat="server" CssClass="lightblueButton" CommandName="Login" Text="Log In" ValidationGroup="Login1" ID="LoginButton"></asp:Button>

                                </LayoutTemplate>
                            </asp:Login>
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
