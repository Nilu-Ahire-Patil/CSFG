<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CSFG.web.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CSFG Login</title>
    <link href="../css/login.css" rel="stylesheet" />
</head>
<body>
    <form id="form_login" runat="server">
        <div horizontalalign="Center">
            <asp:Panel ID="pan_login" class="pan_login" runat="server" HorizontalAlign="Center" BackColor="#FFFFeC" BorderColor="#FF3300" BorderStyle="Solid" BorderWidth="1px" Height="470px" Width="360px">
                <div class="input_box">
                    <asp:Label ID="lab_rollno" CssClass="label" runat="server" Text="Roll No."></asp:Label>
                    <asp:TextBox ID="txt_rollno" CssClass="text_input" runat="server"></asp:TextBox>

                    <asp:Label ID="lab_password" CssClass="label" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="txt_password" class="text_input" runat="server"></asp:TextBox>

                    <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn_login" OnClick="btn_login_Click" />

                    <asp:Label ID="lab_error" runat="server" CssClass="label_error" BorderColor="Red" ForeColor="Red" Visible="False"></asp:Label>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
