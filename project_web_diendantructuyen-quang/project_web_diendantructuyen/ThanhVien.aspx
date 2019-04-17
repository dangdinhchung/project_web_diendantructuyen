<%@ Page Title="Thành Viên" Language="C#" MasterPageFile="~/MasterPage/Client.Master" AutoEventWireup="true" CodeBehind="ThanhVien.aspx.cs" Inherits="project_web_diendantructuyen.ThanhVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="site-nav">
        </div>
        <a id="start_here" class="anchor"></a>
        <div id="wrap-body">
            <div class="chunk-main">
                <div id="sidebar">
                    <div class="side-block">
                        <h4 class="side-block-head">Thành viên mới</h4>
                         <%--<div class="list-inner-new" style="margin-left: 20px">
                        </div>--%>
                        <asp:Repeater ID="rptLay3ThanhVienMoiNhat" runat="server">
                                <ItemTemplate>
                                <ul class="topiclist forums">
                                    <li class="row">
                                        <dl class="icon forum_read">
                                            <dt title="No unread posts">
                                                <span class="ico_forum_read"></span>
                                                <div class="list-innerr">
                                                    Họ Tên : <b><a href="#" class="forumtitle"><%#:Eval("hoten") %></a></b>
                                                    <br />Email : <b><%#:Eval("email") %></b>
                                                </div>
                                            </dt>
                                        </dl>
                                    </li>
                                </ul>
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
                                            <dt><div class="list-inner"><a href="">Thành viên</a></div></dt>
                                        </dl>
                                    </li>
                                </ul>
                                 

                               
                       
                                <asp:DataList ID="dtlThanhVien" runat="server"  Width="100%" Height="58px" RepeatColumns="1" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <td> 
                                            <div class="img-info">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "admin/user/"+Eval("anhdaidien") %>'   Width="100px" Height="100px"/>
                                             </div>
                                                <br />
                                            <div class="info-fr">
                                            <p>Họ tên : <b><%#Eval("hoten") %></b> </p>
                                            <p> Email : <b><%#Eval("email") %></b> </p>
                                             <p>Thời gian đăng ký : <b><%#Eval("ngaydangky") %></b> </p>
                                            <br/>
                                            </div>
                                        </td>
                                    </ItemTemplate>
                                </asp:DataList>
                                <div class="pagi">

                               
                           <asp:Repeater ID="rptPages" runat="server" OnItemCommand="rptPages_ItemCommand">

                                <ItemTemplate>

                                <asp:LinkButton ID="btnPage"

                                style="padding:10px 16px; margin:6px; background:#fff; border:solid 1px #666; font:12pt tahoma;color:blue;"

                                CommandName="Page" CommandArgument="<%# Container.DataItem %>"

                                runat="server"><%# Container.DataItem %>

                                </asp:LinkButton>

                                </ItemTemplate>

                                </asp:Repeater>
                                     </div>



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
