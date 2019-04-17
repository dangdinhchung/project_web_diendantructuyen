<%@ Page Title="Bài Viết" Language="C#" MasterPageFile="~/MasterPage/Client.Master" AutoEventWireup="true" CodeBehind="ChiTietBaiViet.aspx.cs" Inherits="project_web_diendantructuyen.ChiTietBaiViet" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="site-nav">
    </div>
    <a id="start_here" class="anchor"></a>
    <div id="wrap-body">
        <div class="chunk-main">
            <div id="sidebar">
                <div class="side-block side-login">
                    <h4 class="side-block-head"><a href="n">Thành viên</a></h4>
                    <div class="side-block-body">
                        <fieldset>
                            <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" />
                            <p>Họ Tên : <i>
                                <asp:Label ID="lblhoten" runat="server" Text="Label"></asp:Label></i> </p>
                            <p>Email : <i>
                                <asp:Label ID="lblemail" runat="server" Text="Label"></asp:Label></i> </p>
                            <p>Ngày đăng ký : <i>
                                <asp:Label ID="lblngaydangky" runat="server" Text="Label"></asp:Label></i> </p>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div id="forumlist">
                <div id="forumlist-inner">
                    <div class="forabg">
                        <div class="inner">
                            <ul class="topiclist">
                                <li class="header">
                                    <dl class="icon">
                                        <dt>
                                            <div class="list-inner"><a href="">Bài viết</a></div>
                                        </dt>
                                    </dl>
                                </li>
                            </ul>
                            <asp:Repeater ID="rptChiTietDsbaiDangByID" runat="server">
                                <ItemTemplate>
                                    <ul class="topiclist forums">
                                        <li class="row1">
                                            <dl class="icon forum_read">
                                                <dt title="No unread posts">
                                                    <span class="ico_forum_read"></span>
                                                    <div class="list-inner1">
                                                        <b>Tiêu đề : <%#:Eval("tieude") %></b>
                                                        <p class="content-chitiet"><%# System.Web.HttpUtility.HtmlDecode(Eval("noidung").ToString()) %></p>
                                                    </div>
                                                </dt>

                                            </dl>
                                        </li>
                                        <li class="row2">
                                            <dl class="icon forum_read">
                                                <dd class="topics"><%#:Eval("soluotxem") %> <i class="fas fa-eye"></i></dd>
                                                <dd class="btn-dd">
                                                    <asp:Button CssClass="btn-like" ID="btnShow" runat="server" Text='<%#:Eval("soluotthich") %>' Width="29px"
                                                        OnClick="btn_updateLuotThich" /><i class="far fa-thumbs-up"></i></dd>
                                                <%--<Button onclick="btn_updateLuotThich"><dd class="posts"><%#:Eval("soluotthich") %><i class="far fa-thumbs-up"></i></Button>--%>
                                                <dd class="lastpost">Đăng bởi <a href="#" style="color: #AA0000;" class="username-coloured"><%#:Eval("hoten") %></a>
                                                    <%#:Eval("ngaydang") %>
                                            </dl>
                                            </dd>
                                        </li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <!-- Câu trả lời -->
                    <div class="forabg">
                        <div class="inner">
                            <ul class="topiclist">
                                <li class="header">
                                    <dl class="icon">
                                        <dt>
                                            <div class="list-inner"><a href="">Trả lời</a></div>
                                        </dt>
                                    </dl>
                                </li>
                            </ul>
                            <asp:Repeater ID="rptDsBinhLuan" runat="server">
                                <ItemTemplate>
                                    <ul class="topiclist forums">
                                        <li class="row1">
                                            <dl class="icon forum_read">
                                                <dt title="No unread posts">
                                                    <span class="ico_forum_read"></span>
                                                    <div class="list-inner1">
                                                        <hr />
                                                        <p><%# System.Web.HttpUtility.HtmlDecode(Eval("noidung").ToString()) %></p>
                                                    </div>
                                                </dt>
                                            </dl>
                                        </li>
                                        <li class="row2">
                                            <dl class="icon forum_read">
                                                <dd class="posts">
                                                    <asp:Button ID="btn_Like" runat="server" CssClass="forumtitle" OnClick="btn_Like_Click" Text='<%# Eval("soluotthich") %>'/>
                                                    <asp:Label ID="MaBinhLuan" runat="server" Text='<%# Eval("MaBinhluan") %>' Visible="false"></asp:Label>
                                                    <i class="far fa-thumbs-up"></i></dd>
                                                <dd class="lastpost">
                                                    <p>
                                                        <a href="" class="lastsubject">Đăng bởi</a>
                                                        <a href="" style="color: #AA0000;" class="username-coloured"><%#:Eval("hoten") %></a>
                                                        <%#:Eval("ngaybinhluan") %>
                                                    </p>

                                                </dd>
                                            </dl>
                                        </li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                    <!-- Bình luận -->
                    <div class="forabg">
                        <div class="inner">
                            <ul class="topiclist">
                                <li class="header">
                                    <dl class="icon">
                                        <dt>
                                            <div class="list-inner"><a href="">Bình luận</a></div>
                                        </dt>
                                    </dl>
                                </li>
                            </ul>
                            <ul class="topiclist forums">
                                <li class="row">
                                    <dl class="icon forum_read">
                                        <dt title="No unread posts">
                                            <span class="ico_forum_read"></span>
                                            <div class="list-inner" style="width: 100%">
                                                <%--<form action="chi-tiet-bai-viet_submit" method="get" accept-charset="utf-8">--%>
                                                <textarea name="content" id="noidung" runat="server" class="inputbox autowidth">                      
                                                </textarea>
                                                <br>
                                               <%-- <input type="submit" name="register" tabindex="6" value="Bình luận" class="button1" />--%>
                                                <asp:Button ID="btn_binhluan" runat="server" Text="Bình luận" CssClass="button1" OnClick="btn_binhluan_Click" />
                                                <%-- </form>--%>
                                            </div>
                                        </dt>
                                    </dl>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <div id="wrap-footer">
        <div id="site-footer">
            <div class="chunk">
                <div id="foot-left">
                    <ul class="site-footer-nav" role="menubar">
                        <li><a href="">Liên hệ</a></li>
                        <li class="icon-delete-cookies"><a href="">Địa chỉ</a></li>
                        <li class="icon-team"><a href="">Theo dõi</a></li>
                    </ul>
                </div>
                <div id="foot-right">
                    <ul>
                        <li>Team LTWNC</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script>
        $(document).ready(function () {
            tinymce.init({
                selector: 'textarea'
            });
        });
    </script>
</asp:Content>
