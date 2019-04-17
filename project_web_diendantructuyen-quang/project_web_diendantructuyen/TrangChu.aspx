<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Client.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="project_web_diendantructuyen.TrangChu" %>
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
                    </div>
                     <div class="side-block">
                        <h4 class="side-block-head">Danh sách chủ đề</h4>
                         <asp:Repeater ID="rptDanhSachChuDe" runat="server">
                                <ItemTemplate>
                         <div class="list-inner-new" style="margin-left: 20px">
                            <a href="DanhSachBaiDangByChuDe.aspx?id=<%#:Eval("MaChuDe") %>" class=""><%#:Eval("tenchude") %></a> <br /><br />  
                        </div>
                             </ItemTemplate>
                             
                    </asp:Repeater>
                        <div class="side-block-body" id="sidebar-recent-posts"></div>
                    </div>

                    <div class="side-block">
                        <h4 class="side-block-head">Bài viết nên xem</h4>
                         <asp:Repeater ID="rptLoadBaiVietNenXem" runat="server">
                                <ItemTemplate>
                         <div class="list-inner-new" style="margin-left: 20px">
                            <a href="ChiTietBaiViet.aspx?id=<%#:Eval("MaBaiDang") %>" class=""><%#:Eval("tieude") %></a> <br />   <br />  
                        </div>
                             </ItemTemplate>
                             
                    </asp:Repeater>
                        <div class="side-block-body" id="sidebar-recent-posts"></div>
                    </div>

                </div>
                <div id="forumlist">
                    <div id="forumlist-inner">
                          <div class="forabg">
                            <div class="inner">
                                <ul class="topiclist">
                                    <li class="header">
                                        <dl class="icon">
                                            <dt><div class="list-inner"><a href="">Bài viết gần đây</a></div></dt>
                                        </dl>
                                    </li>
                                </ul>
                                 <asp:Repeater ID="rptLoadTop3NgayDangGanDayDsBaiDang" runat="server">
                                    <ItemTemplate>
                                <ul class="topiclist forums">
                                    <li class="row">
                                        <dl class="icon forum_read_locked">
                                            <dt>
                                                <span class="ico_forum_read_locked"></span>
                                                <div class="list-inner">
                                                    <a href="ChiTietBaiViet.aspx?id=<%#:Eval("MaBaiDang") %>" class="forumtitle"> <%#:Eval("tieude") %></a>
                                                    <br /><b>Chủ đề</b> : <%#:Eval("tenchude") %>                                            
                                                    <div class="responsive-show" style="display: none;">
                                                        Topics: <strong>1</strong>
                                                    </div>
                                                </div>
                                            </dt>
                                            <dd class="topics"> <%#:Eval("soluotxem") %><dfn><i class="fas fa-eye"></i> Lượt xem</dfn></dd>
                                            <dd class="posts"> <%#:Eval("soluotthich") %><dfn><i class="far fa-thumbs-up"></i> Lượt thích</dfn></dd>
                                            <dd class="lastpost1">
                                                Đăng bởi <a href=""  style="color: #AA0000;" class="username-coloured"> <%#:Eval("hoten") %></a>
                                             <%#:Eval("ngaydang") %></dd>
                                        </dl>
                                    </li>
                                </ul>
                                        </ItemTemplate>
                            </asp:Repeater>
                            </div>
                        </div>
                        <div class="forabg">
                            <div class="inner">
                                <ul class="topiclist">
                                    <li class="header">
                                        <dl class="icon">
                                            <dt><div class="list-inner"><a href="#">Bài viết hót</a></div></dt>
                                        </dl>
                                    </li>
                                </ul>
                              <asp:Repeater ID="rptLoadTop3LuotThichDsBaiDang" runat="server">
                                    <ItemTemplate>
                                <ul class="topiclist forums">
                                    <li class="row">
                                        <dl class="icon forum_read">
                                            <dt title="No unread posts">
                                                <span class="ico_forum_read"></span>
                                                <div class="list-inner">
                                                    <a href="ChiTietBaiViet.aspx?id=<%#:Eval("MaBaiDang") %>" class="forumtitle"><%#:Eval("tieude") %></a>
                                                    <br /><b>Chủ đề</b> : <%#:Eval("tenchude") %>
                                                </div>
                                            </dt>
                                            <dd class="topics"><%#:Eval("soluotxem") %><dfn><i class="fas fa-eye"></i> Lượt xem</dfn></dd>
                                            <dd class="posts"><%#:Eval("soluotthich") %><dfn><i class="far fa-thumbs-up"></i> Lượt thích</dfn></dd>
                                            <dd class="lastpost1">
                                                Đăng bởi <a href="" style="color: #AA0000;" class="username-coloured"><%#:Eval("hoten") %></a>
                                            <%#:Eval("ngaydang") %> </dd>
                                        </dl>
                                    </li>
                                </ul>
                         </ItemTemplate>
                    </asp:Repeater>
                            </div>
                        </div>
                        <div class="forabg">
                            <div class="inner">
                                <ul class="topiclist">
                                    <li class="header">
                                        <dl class="icon">
                                            <dt><div class="list-inner"><a href="">Bài viết nhiều người xem</a></div></dt>
                                        </dl>
                                    </li>
                                </ul>
                            <asp:Repeater ID="rptLoadTop3LuotXemDsBaiDang" runat="server">
                                <ItemTemplate>
                                <ul class="topiclist forums">
                                    <li class="row">
                                        <dl class="icon forum_read">
                                            <dt>
                                                <span class="ico_forum_read"></span>
                                                <div class="list-inner">
                                                    <a href="ChiTietBaiViet.aspx?id=<%#:Eval("MaBaiDang") %>" class="forumtitle"><%#:Eval("tieude") %></a>
                                                    <br /><b>Chủ đề</b> : <%#:Eval("tenchude") %>                                           
                                                    <div class="responsive-show" style="display: none;">
                                                        Topics: <strong>1</strong>
                                                    </div>
                                                </div>
                                            </dt>
                                            <dd class="topics"><%#:Eval("soluotxem") %><dfn><i class="fas fa-eye"></i> Lượt xem</dfn></dd>
                                            <dd class="posts"><%#:Eval("soluotthich") %><dfn><i class="far fa-thumbs-up"></i> Lượt thích</dfn></dd>
                                            <dd class="lastpost1">
                                                Đăng bởi <a href="" style="color: #AA0000;" class="username-coloured"><%#:Eval("hoten") %></a>
                                            <%#:Eval("ngaydang") %> </dd>
                                        </dl>
                                    </li>
                                </ul>
                                      </ItemTemplate>
                            </asp:Repeater>
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
                            <li class="icon-delete-cookies"><a href="" >Địa chỉ</a></li>
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
</asp:Content>
