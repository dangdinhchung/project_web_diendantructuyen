<%@ Page Title="Đăng Nhập" Language="C#" MasterPageFile="~/MasterPage/Client.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="project_web_diendantructuyen.DangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="site-nav" role="navigation">
            <div class="chunk">
                <h2>Đăng nhập</h2>
            </div>
        </div>
        <a id="start_here" class="anchor"></a>
       <div id="wrap-body" style="height: 392px;">
            <div class="chunk">
                <em>
                    <asp:Label ID="lblThongbao" runat="server" Style="color: red; font-size: 16px"></asp:Label>
                </em>

               
                    <div class="col-s-12 col-m-6">
                        <div class="container">
                            <asp:RequiredFieldValidator ID="valiTen" runat="server" ControlToValidate="txtHoTen" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <em>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Tên phải có độ dài từ 2-50 ký tự có phân biệt hoa thường" ValidationExpression="^[0-9a-zA-Z_]{2,50}$" ControlToValidate="txtHoTen" ></asp:RegularExpressionValidator>
                            </em><br/>
                            <label for="author" class="font">Họ tên:</label>
                            <asp:TextBox name="hoten" class="required input_field form-control"  ID="txtHoTen" runat="server"></asp:TextBox>
                            
                            <asp:RequiredFieldValidator ID="valiPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                              <em>
                                <asp:RegularExpressionValidator ID="regupass" runat="server" ErrorMessage="Độ dài password phải lớn hơn 3 kí tự" ValidationExpression="^[0-9a-zA-Z_]{4,50}$" ControlToValidate="txtPassword" ></asp:RegularExpressionValidator>
                            </em><br/>
                            <label for="phone" class="font">Password:</label>
                            <asp:TextBox class="input_field form-control" TextMode="Password" name="password" ID="txtPassword" runat="server"></asp:TextBox>
                        </div>
                     </div>
                     <div class="button_process2">
                        <asp:Button runat="server" class="btn btn-primary" ID="btnLogin" Text="Đăng Nhập" OnClick="btnLogin_Click"   />
                    </div>

                   <%-- <p style="text-align: center">
                        Nếu bạn chưa có tài khoản vui lòng nhấn lòng nhấn
                        <asp:HyperLink ID="HyperLinkDangky" runat="server" ForeColor="Red" NavigateUrl="~/DangKy.aspx">Đăng ký</asp:HyperLink>
                    </p>--%>

                    <%--<div class="panel">
                        <div class="inner">
                            <div class="content">
                                <fieldset class="fields1">
                                    <dl>
                                        <dt><label for="username">Họ Tên:</label></dt>
                                        <dd><input type="text" tabindex="1" name="username" id="username" size="25" value="" class="inputbox autowidth" /></dd>
                                    </dl>
                                    <dl>
                                        <dt><label for="password">Mật khẩu:</label></dt>
                                        <dd><input type="password" tabindex="2" id="password" name="password" size="25" class="inputbox autowidth" autocomplete="off" /></dd>
                                    </dl>
                                    <dl>
                                        <dt>&nbsp;</dt>
                                        <dd>
                                            <input type="submit" name="login" tabindex="6" value="Đăng nhập" class="button1" />
                                        </dd>
                                    </dl>
                                    </fieldset>
                                </div>
                            </div>
                        </div>--%>
                   
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
        </div>
</asp:Content>
