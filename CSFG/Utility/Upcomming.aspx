<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Upcomming.aspx.cs" Inherits="CSFG.Utility.Upcomming" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Sources/css/Upcomming/upcomming.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="griding">
        <asp:Repeater ID="rep_event" runat="server">
            <ItemTemplate>
                <div runat="server" class="element" id="filelink">
                    <asp:LinkButton CssClass="displayimage" ID="img_profileimg" runat="server" href='<%#Eval("eve_link") %>' CommandArgument='<%#Eval("eve_link") %>'>
                        <img class="displayimage" src="../Sources/img/<%# Eval("img_name") %>" alt="<%#Eval("img_name") %>" />
                    </asp:LinkButton>
                    <asp:LinkButton ID="txt_sub_name" CssClass="text" href='<%#Eval("eve_link") %>' runat="server" Text='<%# Eval("eve_name") %>' CommandArgument='<%#Eval("eve_link") %>'> </asp:LinkButton>
                    <asp:Label ID="txt_eve_date" CssClass="text" runat="server" Text='<%# Eval("eve_date") %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
