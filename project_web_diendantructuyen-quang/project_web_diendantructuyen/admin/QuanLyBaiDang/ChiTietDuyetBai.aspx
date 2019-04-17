<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Server.Master" AutoEventWireup="true" CodeBehind="ChiTietDuyetBai.aspx.cs" Inherits="project_web_diendantructuyen.admin.QuanLyBaiDang.ChiTietDuyetBai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: 18px;
        }
        /*.auto-style2 {
            width: 550px;
            text-align: right;
        }*/
        /*.auto-style4 {
            margin-top: 0px;
        }*/
        .auto-style5 {
            width: 514px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h2>Quản lý duyệt bài đăng</h2>
    <div class="col-s-12 col-m-9 duyetbai">
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">Trạng thái :</td>
                <td>
                    <asp:Label ID="txtTrangThai" runat="server" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Tiêu đề bài viết:</td>
                <td>
                    <asp:Label ID="txtTieuDe" runat="server" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Thành viên đăng:</td>
                <td>
                    <asp:Label ID="txtThanhVienDang" runat="server" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Quyền:</td>
                <td>
                    <asp:Label ID="txtQuyen" runat="server" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Ngày đăng</td>
                <td>
                    <asp:Label ID="txtThoiGian" runat="server" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <table style="width: 100%;">
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style1"><strong>Chi Tiết bài đăng</strong></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="txtNoiDung" runat="server" BorderColor="#0066FF" Text="Label"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        </table>
        <table style="width: 74%;">
            <tr>
                <td class="auto-style5">
                    <asp:Button ID="btnDuyet" runat="server" OnClick="btnDuyet_Click" CssClass="button1" Text="Duyệt bài viết này" 
                        OnClientClick='return confirm("Are you sure?");' />
                </td>
                <td>
                    <asp:Button ID="btnKhongDuyet" runat="server" Text="Không duyệt bài viết" OnClientClick='return confirm("Are you sure?");'
                        CssClass="button111" OnClick="btnKhongDuyet_Click" />
                </td>
            </tr>
            </table>
        </div>
</asp:Content>
