<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Team.aspx.cs" Inherits="CSFG.Team" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Sources/css/Team/team.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="griding">
        <div class="element">
            <asp:Image ID="profileimg" AlternateText="404!" CssClass="displayimage" ImageUrl="Sources/img/dept.jpg" runat="server" />
            <asp:Label ID="name" CssClass="text" runat="server" Text="Name"></asp:Label>
            <asp:Label ID="roll_no" CssClass="text" runat="server" Text="Roll No."></asp:Label>
            <asp:Label ID="number" CssClass="text" runat="server" Text="Number"></asp:Label>
            <asp:Label ID="email" CssClass="text" runat="server" Text="Email"></asp:Label>
        </div>
    </div>
</asp:Content>
