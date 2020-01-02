<%@ Page Title="Help and Support" Language="C#" MasterPageFile="~/dashboard/dashboard.master" AutoEventWireup="true" CodeFile="help-support.aspx.cs" Inherits="dashboard_help_support" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContentArea" Runat="Server">
    
    <script>
  function validatePhoneNumbers(source, args)
  {
    var fn = document.getElementById('<%= FullName.Text %>');
    var ea = document.getElementById('<%= EAddress.Text %>');
    if (fn.value != '' || ea.value != '')
    {
      args.IsValid = true;
    }
    else
    {
      args.IsValid = false;
    }
  }
</script>

    <h1>Help and Support</h1>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
      <div class="row flex-row flex-row-reverse">
          <div class="col-lg-9">
                <label>Full Name:</label>
      <asp:TextBox ID="FullName" CssClass="form-control" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FullName" CssClass="ErrorMessage" Text="* Please enter your name" ErrorMessage="Please enter your name"></asp:RequiredFieldValidator>
      <br />

      <label>Email Address:</label>
      <asp:TextBox ID="EAddress" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="* Please enter your email" CssClass="ErrorMessage" ControlToValidate="EAddress" ErrorMessage="Please enter your emai"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="EmailValidator2" runat="server" ControlToValidate="EAddress" Text="* Please enter a valid email" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter a valid e-mail address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
       <br />


      <label>Phone Number:</label>
      <asp:TextBox ID="pnumber" CssClass="form-control" runat="server" TextMode="Phone"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="* Please enter your phone number" CssClass="ErrorMessage" ControlToValidate="pnumber" ErrorMessage="Please enter your phone number"></asp:RequiredFieldValidator>
       <br />


      <label>Message:</label>
      <asp:TextBox ID="message1" TextMode="multiline" CssClass="form-control" runat="server" Columns="50" Rows="6"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="* Please enter your message" CssClass="ErrorMessage" ControlToValidate="message1" ErrorMessage="Please enter your message" ></asp:RequiredFieldValidator>
       <br />

      <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrorMessage alert alert-danger blockerrormessage" ShowSummary="False" ShowMessageBox="True" />
      <asp:Button CssClass="btn btn-large btn-default" ID="submitform" runat="server" Text="Submit" OnClick="sendmessage_Click" />
      <asp:Label ID="success" runat="server" Text=""></asp:Label>
            </div>
          <div class="col-lg-3">
              <p>Having issues with our portal? or do you have any questions about your plan? Contact us using the contact form on this page, we will get back to you as soon as possible.</p>
          </div>
    </div>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
  <ProgressTemplate>
    <div class="PleaseWait">
      Sending...
    </div>
  </ProgressTemplate>
</asp:UpdateProgress>


</asp:Content>

