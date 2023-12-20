<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="CSFG.Utility.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Sources/css/Gallery/gallery.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="griding">
        <asp:Repeater ID="rep_gal" runat="server">
            <ItemTemplate>
                <div runat="server" class="galimg" id="filelink">
                    <asp:linkbutton cssclass="" id="img_profileimg" runat="server" href='<%#Eval("eve_link") %>' commandargument='<%#Eval("eve_link") %>'>                       
                        <img class="galdiaplayimge" src="../sources/img/<%# Eval("img_name") %>" alt="<%#Eval("img_name") %>" />
                    </asp:linkbutton>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
