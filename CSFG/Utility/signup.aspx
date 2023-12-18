<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="CSFG.Utility.signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Sources/css/Login/StyleSheetMain.css" rel="stylesheet" />
    <link href="../Sources/css/Login/StyleSheetNewAccount.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="borderbox" style="flex-direction: row">
        <div class="colflex">
            <h2>New Account Request</h2>

            <div class="inputbox">
                <asp:TextBox ID="txt_signup_name" type="text" required="required" runat="server"></asp:TextBox>
                <span>Name</span>
                <i></i>
            </div>
            <div class="inputbox">
                <asp:TextBox ID="txt_signup_user_name" type="text" required="required" runat="server"></asp:TextBox>
                <span>Roll Number</span>
                <i></i>
            </div>
            <div class="inputbox">
                <asp:TextBox ID="txt_signup_password" type="password" required="required" runat="server"></asp:TextBox>
                <span>Password</span>
                <i></i>
            </div>
            <div style="margin-top: 35px">
                <div class="styl">
                    <label >Profile Image</label>
                    <label >Gender</label>
                </div>
                <div class="styl">
                    <asp:FileUpload ID="file_proile_img" type="text" required="required" runat="server" />
                    <asp:DropDownList ID="drop_gender" DataTextField="Gender" required="required" runat="server">
                        <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>


        </div>
        <div class="colflex" style="padding-top: 35px">

            <div class="inputbox">
                <asp:TextBox ID="txt_use_mo" type="text" required="required" runat="server"></asp:TextBox>
                <span>Contact No</span>
                <i></i>
            </div>

            <div class="inputbox">
                <asp:TextBox ID="txt_usr_mail" type="text" required="required" runat="server"></asp:TextBox>
                <span>Mail ID</span>
                <i></i>
            </div>

            <div class="inputbox">
                <asp:TextBox ID="txt_link" type="text" required="required" runat="server"></asp:TextBox>
                <span>Link</span>
                <i></i>
            </div>
            <div style="display: flex; align-items: baseline; justify-content: space-between;">
                <asp:Button ID="btn_send_request" Style="margin-top: 20px" type="submit" value="Send" runat="server" Text="Send" />
                <a href="Login.aspx">Log In</a>
            </div>
        </div>
    </div>

</asp:Content>
