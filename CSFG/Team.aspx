<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Team.aspx.cs" Inherits="CSFG.Team" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Sources/css/Team/team.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="griding">
                
        <asp:Repeater ID="rep_member" runat="server">
            <ItemTemplate>
                <div runat="server" class="element" id="filelink">
                    <asp:LinkButton CssClass="displayimage" ID="img_profileimg" runat="server" href='<%#Eval("stu_link") %>' CommandArgument='<%#Eval("stu_link") %>'>                       
                        <img class="displayimage" src="../Sources/img/<%# Eval("img_name") %>" alt="<%#Eval("img_name") %>" />
                    </asp:LinkButton>
                    <asp:LinkButton ID="txt_sub_name" CssClass="text" href='<%#Eval("stu_link") %>' runat="server" Text='<%# Eval("stu_name") %>' CommandArgument='<%#Eval("stu_link") %>'> </asp:LinkButton>
                    <asp:Label ID="txt_stu_roll" CssClass="text" runat="server" Text='<%# Eval("stu_id") %>'></asp:Label>
                    <asp:LinkButton ID="txt_tu_mo" CssClass="text" runat="server" href='tel:<%#Eval("stu_mo") %>' Text='<%# Eval("stu_mo") %>' CommandArgument='tel:<%#Eval("stu_mo") %>'></asp:LinkButton>
                    <asp:LinkButton ID="txt_stu_mail" CssClass="text" runat="server" href='mailto:<%#Eval("stu_mail") %>' Text='<%# Eval("stu_mail") %>' CommandArgument='mailto:<%#Eval("stu_mo") %>'></asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:Repeater>

     </div>
</asp:Content>
