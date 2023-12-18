<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="CSFG.Utility.Notes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Sources/css/Notes/notes.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="griding">
        <asp:Repeater ID="rep_notes" runat="server">
            <ItemTemplate>
                <div runat="server" class="element" id="filelink">
                    <asp:LinkButton CssClass="displayimage" ID="img_profileimg" runat="server" href='<%#Eval("note_link") %>' CommandArgument='<%#Eval("note_link") %>'>
                       
                        <img class="displayimage" src="../Sources/img/<%# Eval("img_name") %>" alt="<%#Eval("img_name") %>" />
                    </asp:LinkButton>
                    <asp:LinkButton ID="txt_sub_name" CssClass="text" href='<%#Eval("note_link") %>' runat="server" Text='<%# Eval("sub_name") %>' CommandArgument='<%#Eval("note_link") %>'> </asp:LinkButton>
                    <asp:Label ID="txt_sub_code" CssClass="text" runat="server" Text='<%# Eval("sub_code") %>'></asp:Label>
                    <asp:Label ID="txt_upload_by" CssClass="text" runat="server" Text='<%# Eval("stu_name") %>'></asp:Label>
                    <asp:Label ID="txt_upl_date" CssClass="text" runat="server" Text='<%# Eval("note_date") %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
    