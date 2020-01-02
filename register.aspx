<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td align="center" colspan="2">Sign Up for Your New Account</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label runat="server" AssociatedControlID="UserName" ID="UserNameLabel">User Name:</asp:Label></td>
                                <td>
                                    <asp:TextBox runat="server" ID="UserName"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ValidationGroup="CreateUserWizard1" ToolTip="User Name is required." ID="UserNameRequired">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label runat="server" AssociatedControlID="Password" ID="PasswordLabel">Password:</asp:Label></td>
                                <td>
                                    <asp:TextBox runat="server" TextMode="Password" ID="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ValidationGroup="CreateUserWizard1" ToolTip="Password is required." ID="PasswordRequired">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword" ID="ConfirmPasswordLabel">Confirm Password:</asp:Label></td>
                                <td>
                                    <asp:TextBox runat="server" TextMode="Password" ID="ConfirmPassword"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ValidationGroup="CreateUserWizard1" ToolTip="Confirm Password is required." ID="ConfirmPasswordRequired">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>


                            <tr>
                                <td align="right">
                                    <asp:Label runat="server" ID="Label1">Phone Number:</asp:Label></td>
                                <td>
                                    <asp:TextBox runat="server" ID="PhoneNumber"></asp:TextBox>
                                </td>
                            </tr>


                            <tr>
                                <td align="right">
                                    <asp:Label runat="server" AssociatedControlID="Email" ID="EmailLabel">E-mail:</asp:Label></td>
                                <td>
                                    <asp:TextBox runat="server" ID="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ValidationGroup="CreateUserWizard1" ToolTip="E-mail is required." ID="EmailRequired">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label runat="server" AssociatedControlID="Question" ID="QuestionLabel">Security Question:</asp:Label></td>
                                <td>
                                    <asp:TextBox runat="server" ID="Question"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ValidationGroup="CreateUserWizard1" ToolTip="Security question is required." ID="QuestionRequired">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label runat="server" AssociatedControlID="Answer" ID="AnswerLabel">Security Answer:</asp:Label></td>
                                <td>
                                    <asp:TextBox runat="server" ID="Answer"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ValidationGroup="CreateUserWizard1" ToolTip="Security answer is required." ID="AnswerRequired">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="The Password and Confirmation Password must match." Display="Dynamic" ValidationGroup="CreateUserWizard1" ID="PasswordCompare"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: Red;">
                                    <asp:Literal runat="server" ID="ErrorMessage" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
    </form>
</body>
</html>
