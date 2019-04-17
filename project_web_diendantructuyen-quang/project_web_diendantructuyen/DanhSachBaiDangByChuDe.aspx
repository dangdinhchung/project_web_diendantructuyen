<%@ Page Title="Danh sách chủ đề" Language="C#" MasterPageFile="~/MasterPage/Client.Master" AutoEventWireup="true" CodeBehind="DanhSachBaiDangByChuDe.aspx.cs" Inherits="project_web_diendantructuyen.DanhSachBaiDangByChuDe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="wrap-body">
     <div class="chunk-main">
                 <div id="forumlist">
                    <div id="forumlist-inner">
                        <div class="forabg">
                            <div class="inner">
                                <ul class="topiclist">
                                    <li class="header">
                                        <dl class="icon">
                                            <dt><div class="list-inner"><a href="#">Chủ đề : <%=tb.Rows[0]["tenchude"] %> </a></div></dt>
                                        </dl>
                                    </li>
                                </ul>
                              <asp:Repeater ID="rptDSBaiDangTheoChuDe" runat="server">
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
                                            <dd class="lastpost12">
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
      <%--<asp:Repeater ID="rptPages" runat="server" OnItemCommand="rptPages_ItemCommand">

<ItemTemplate>

<asp:LinkButton ID="btnPage"

 style="padding:10px 16px; margin:6px; background:#fff; border:solid 1px #666; font:12pt tahoma;color:blue;"

CommandName="Page" CommandArgument="<%# Container.DataItem %>"

runat="server"><%# Container.DataItem %>

</asp:LinkButton>

</ItemTemplate>

</asp:Repeater>--%>
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
</asp:Content>
