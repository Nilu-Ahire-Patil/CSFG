<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSFG.home" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <link href="Sources/css/Default/default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <ul style="list-style: none;">
            <li><a href="../Utility/Notes.aspx">Notes </a></li>
            <li><a href="../Utility/Activities.aspx">Activities</a></li>
            <li><a href="../Utility/Events.aspx">Events</a></li>
            <li><a href="../Utility/Gallery.aspx">Gallery</a></li>
            <li><a href="../Utility/Upcomming.aspx">Upcomming</a></li>
        </ul>
    </div>
    <div class="editarea">
    </div>
</asp:Content>
