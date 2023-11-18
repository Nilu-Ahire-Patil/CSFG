<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="CSFG.Utility.Notes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Sources/css/Notes/notes.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="griding" >
        <div runat="server" class="element" onclick="" id="filelink">
            <asp:Image ID="profileimg" AlternateText="404!" CssClass="displayimage" ImageUrl="../Sources/img/dept.jpg" runat="server" />
            <asp:LinkButton ID="sub_name" CssClass="text" href="/Default.aspx" runat="server" Text="sub_name"></asp:LinkButton>
            <asp:Label ID="sub_code" CssClass="text" runat="server" Text="sub_code"></asp:Label>
            <asp:Label ID="upload_by" CssClass="text" runat="server" Text="upload_by"></asp:Label>
            <asp:Label ID="date" CssClass="text" runat="server" Text="date"></asp:Label>
        </div>
    </div>
</asp:Content>
