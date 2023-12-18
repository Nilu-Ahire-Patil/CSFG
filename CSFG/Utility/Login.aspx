<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CSFG.Utility.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Sources/css/Login/StyleSheetMain.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="borderbox" style="max-width:397px">
        <h2>Sign in</h2>
        <div class="inputbox">
            <asp:TextBox ID="txt_login_user_name" type="text" required="required" runat="server"></asp:TextBox>
            <span>Username</span>
            <i></i>
        </div>
        <div class="inputbox">
            <asp:TextBox ID="txt_password" type="password" required="required" runat="server"></asp:TextBox>
            <span>Password</span>
            <i></i>
        </div>
        <div class="links">
            <asp:LinkButton ID="btn_forgotpass_request" OnClick="btn_forgotpass_request_Click" runat="server">Forgot Password Request</asp:LinkButton>
            <a href="signup.aspx">Sign Up</a>
        </div>
        <asp:Button ID="btn_login" OnClick="btn_login_Click" type="submit" value="Login" runat="server" Text="Login" />
    </div>
   
</asp:Content>
