<%@ Page Title="Đăng Bài" Language="C#" MasterPageFile="~/MasterPage/Client.Master" AutoEventWireup="true" CodeBehind="DangBaiNhanh.aspx.cs" Inherits="project_web_diendantructuyen.DangBaiNhanh" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="site-nav" role="navigation">
            <div class="chunk">
                <h2>Đăng bài nhanh</h2>
                <!-- <p>Hãy đăng bài bằng sự chân thành!</p> -->
            </div>
        </div>
        <a id="start_here" class="anchor"></a>
       <div id="wrap-body" style="height: 392px;">
            <div class="chunk">
                
                    <div class="panel">
                        <div class="inner">
                            <div class="content">
                                <fieldset class="fields1">
                                    <%--<dl>
                                        <dt><label for="username">Họ Tên:</label></dt>
                                        <dd><input type="text" tabindex="1" name="username" id="username" size="25" value="" class="inputbox autowidth" /></dd>
                                    </dl>--%>
                                    <dl>
                                        <dt><label for="title">Tiêu đề:</label></dt>
                                        <dd><input type="text" runat="server" tabindex="2" id="txtTieuDe" name="title" size="25" class="inputbox autowidth" autocomplete="off" /></dd>
                                    </dl>
                                     <dl>
                                        <dt><label for="desc">Thuộc chủ đề:</label></dt>
                                        <dd> <asp:DropDownList ID="DsChuDe" runat="server"></asp:DropDownList></dd>
                                    </dl>
                                     <dl>
                                        <dt><label for="password">Nội dung bài viết:</label></dt>
                                        <dd>
                                          <textarea name="content" runat="server" class="inputbox autowidth" id="noidung">                      
                                          </textarea>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>&nbsp;</dt>
                                        <dd>
                                            <%--<input type="submit" name="register" tabindex="6" value="Đăng bài nhanh" class="button1" />--%>
                                            <asp:Button ID="btnDangBai" runat="server" Text="Đăng bài" class="button1" OnClick="btnDangBai_Click" />
                                        </dd>
                                    </dl>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    
                </div>
            </div>
        <div id="wrap-footer" style="margin-top: 20%;">
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
        <script>
            $(document).ready(function(){
                tinymce.init({
                    selector : 'textarea'
                });
            });
        </script>
</asp:Content>
