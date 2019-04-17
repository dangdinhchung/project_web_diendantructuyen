<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Client.Master" AutoEventWireup="true" CodeBehind="CapNhatUser.aspx.cs" Inherits="project_web_diendantructuyen.CapNhatUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="site-nav" role="navigation">
            <div class="chunk">
                <h2>Cập nhật user</h2>
                 <asp:Label ID="lblThongBao" runat="server" ForeColor="Green" Font-Size="16px"></asp:Label><br/>
                <asp:HyperLink ID="HyperLinkLogin" Font-Size="16px" runat="server" ForeColor="Red" NavigateUrl="~/DangNhap.aspx" Visible="False">Đăng nhập</asp:HyperLink><br/>
                 <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="16px"></asp:Label>
            </div>
        </div>
        <a id="start_here" class="anchor"></a>
       <div id="wrap-body" style="height: 392px;">
            <div class="chunk">
                   <div class="col-s-12 col-m-6">
                    <div class="container">
                       <asp:HiddenField ID="df_contactID" runat="server" />

                    <asp:RequiredFieldValidator ID="valiTen" runat="server" ControlToValidate="txtHoTen" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                   <%-- <em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Tên phải có độ dài từ 2-50 ký tự có phân biệt hoa thường" ValidationExpression="^[0-9a-zA-Z_]{2,50}$" ControlToValidate="txtHoTen" ></asp:RegularExpressionValidator>
                    </em><br/>--%>
                    <label for="author" class="font">Họ tên:</label>
                    <asp:TextBox name="hoten" class="required input_field form-control"  ID="txtHoTen" runat="server"></asp:TextBox>
                   
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <em>
                        <asp:RegularExpressionValidator ID="valiemail" runat="server" ControlToValidate="txtemail" ErrorMessage="* Sai định dạng" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Style="font-size: 15px"></asp:RegularExpressionValidator>
                    </em><br/>
                    <label for="email" class="font">Email:</label>
                    <asp:TextBox name="email" ReadOnly="true" class="validate-email required input_field form-control" ID="txtEmail" runat="server"></asp:TextBox>  
                      <label for="email" class="font">Ảnh đại diện:</label>
                  <asp:Image ID="Image1" runat="server"   Width="100px" Height="100px"/>
                </div>
                </div>
             <div class="col-s-12 col-m-6">
                <div class="container">
                     <asp:RequiredFieldValidator ID="valiPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                      <em>
                        <asp:RegularExpressionValidator ID="regupass" runat="server" ErrorMessage="Độ dài password phải lớn hơn 3 kí tự" ValidationExpression="^[0-9a-zA-Z_]{4,50}$" ControlToValidate="txtPassword" ></asp:RegularExpressionValidator>
                    </em><br/>
                    <label for="phone" class="font">Password:</label>
                    <asp:TextBox class="input_field form-control" TextMode="Password" name="password" ID="txtPassword" runat="server"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="valiRePassword" runat="server" ControlToValidate="txtRePassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <em>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRePassword" ErrorMessage="*Mật khẩu không trùng khớp" ForeColor="Red" Style="font-size: 15px"></asp:CompareValidator>
                    </em><br/>
                    <label for="phone" class="font">Nhập lại Password:</label>
                    <asp:TextBox class="input_field form-control" TextMode="Password" name="re_password" ID="txtRePassword" runat="server"></asp:TextBox>
                    
                </div>
            </div>
                     
                    <div class="button_process1">
                        <asp:Button runat="server" class="btn btn-primary" ID="btnUpdateUser" Text="Cập nhật" OnClick="btnUpdateUser_Click"   />
                    </div>
                    <br/>
                      <%--Thông báo--%>
                    <br/>
                </div>
            </div>
        <div id="wrap-footer">
            <div id="site-footer">
                <div class="chunk">
                    <div id="foot-left">
                        <ul class="site-footer-nav" role="menubar">
                            <li><a href="#">Liên hệ</a></li>
                            <li class="icon-delete-cookies"><a href="#" >Địa chỉ</a></li>
                            <li class="icon-team"><a href="#">Theo dõi</a></li>
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
