<%@ Page Title="Quản lý thống kê" Language="C#" MasterPageFile="~/MasterPage/Server.Master" AutoEventWireup="true" CodeBehind="QLThongKe.aspx.cs" Inherits="project_web_diendantructuyen.admin.QuanLyThongKe.QLThongKe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 3px;
        }
        .auto-style5 {
            text-align: center;
            width: 306px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Quản lý thống kê</h2>
       <div class="col-s-12 col-m-9 thongke">
            <asp:GridView ID="GridViewThongKe" runat="server" AutoGenerateColumns="true" CssClass="auto-style1" Width="491px">
            </asp:GridView>
       </div>
</asp:Content>
