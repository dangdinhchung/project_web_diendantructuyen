<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Server.Master" AutoEventWireup="true" CodeBehind="danh-sach-user.aspx.cs" Inherits="project_web_diendantructuyen.admin.user.danh_sach_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Quản lý user</h2>
           <%--bên trái--%>
           <div class="col-s-12 col-m-6">
            <div class="container">
                <asp:HiddenField ID="df_contactID" runat="server" />
                <%-- <asp:RequiredFieldValidator ID="valiTen" runat="server" ControlToValidate="txtHoTen" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <em>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Tên phải có độ dài từ 2-50 ký tự có phân biệt hoa thường" ValidationExpression="^[0-9a-zA-Z_]{2,50}$" ControlToValidate="txtHoTen" ></asp:RegularExpressionValidator>
                </em><br/>--%>

                 <label for="author" Visible="false"></label>
                <asp:TextBox name="mauser" Visible="false" class="required input_field form-control"  ID="txtMaUser" runat="server"></asp:TextBox>

                <label for="author">Họ tên:</label>
                <asp:TextBox name="hoten" class="required input_field form-control"  ID="txtHoTen" runat="server"></asp:TextBox>
                   
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <em>
                    <asp:RegularExpressionValidator ID="valiemail" runat="server" ControlToValidate="txtemail" ErrorMessage="* Sai định dạng" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Style="font-size: 15px"></asp:RegularExpressionValidator>
                </em><br/>--%>
                <label for="email">Email:</label>
                <asp:TextBox name="email" class="validate-email required input_field form-control" ID="txtEmail" runat="server"></asp:TextBox>

               <%-- <label for="email">Ngày đăng ký:</label>
                <asp:TextBox name="ngaydangky" textmode="Date" class="validate-ngaydangky required input_field form-control" ID="txtngaydangky" runat="server"></asp:TextBox>--%>

                <label for="email">Ảnh đại diện:</label>
                <asp:FileUpload ID="txtanh" runat="server" class="validate-image required input_field form-control" />
                    <%--<asp:Image ID="Image1" Width="100px" Height="100px" src="https://c.wallhere.com/photos/58/52/mel_gibson_man_brunette_eyes_actor_celebrity-717676.jpg!d" runat="server" />--%>
                </div>
            </div>
           <%--end bên trái--%>

           <%--Bên phải--%>
             <div class="col-s-12 col-m-6">
                <div class="container">
                    <%-- <asp:RequiredFieldValidator ID="valiPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                      <em>
                        <asp:RegularExpressionValidator ID="regupass" runat="server" ErrorMessage="Độ dài password phải lớn hơn 3 kí tự" ValidationExpression="^[0-9a-zA-Z_]{4,50}$" ControlToValidate="txtPassword" ></asp:RegularExpressionValidator>
                    </em><br/>--%>
                    <label for="phone">Password:</label>
                    <asp:TextBox class="input_field form-control" TextMode="Password" name="matkhau" ID="txtPassword" runat="server"></asp:TextBox>
                    
                  <%--  <asp:RequiredFieldValidator ID="valiRePassword" runat="server" ControlToValidate="txtRePassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <em>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRePassword" ErrorMessage="*Mật khẩu không trùng khớp" ForeColor="Red" Style="font-size: 15px"></asp:CompareValidator>
                    </em><br/>--%>
                    <label for="phone">Nhập lại Password:</label>
                    <asp:TextBox class="input_field form-control" TextMode="Password" name="re_password" ID="txtRePassword" runat="server"></asp:TextBox>

                    <label for="formGroupExampleInput2">Quyền</label>
                    <asp:DropDownList ID="ddl_quyen" runat="server" class="form-control form-control-1">
                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                        <asp:ListItem Text="Member" Value="Member"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
           <%--end bên phải--%>
             <%--Button xử lý--%>
            <div class="button_process">
                <asp:Button  runat="server" class="btn btn-primary" ID="btnthem" Text="Thêm" OnClick="btnthem_Click"  />
                <asp:Button  runat="server" class="btn btn-primary" ID="btnupdate" Text="Cập nhật" OnClick="btnupdate_Click"  />
                <asp:Button  runat="server" class="btn btn-primary" ID="btndelete" Text="Xóa" onClientClick="javascript:return confirm('Bạn có muốn xóa không?');" OnClick="btndelete_Click"  />
                <asp:Button  runat="server" class="btn btn-primary" ID="btnlear" Text="Hủy" OnClick="btn_clear" />
            </div>
            <br/>
           <%--end button xử lý--%>
            <%--Thông báo--%>
            <asp:Label ID="lblThongBao" runat="server" ForeColor="Green" Font-Size="16px"></asp:Label>
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="16px"></asp:Label>
            <br/>
           <%--end thông báo--%>
            <%--grid view--%>
            <div class="grid_view">
                <asp:GridView ID="gv_dsUSer" runat="server" AutoGenerateColumns="false" AllowPaging="True" OnPageIndexChanging="gv_dsUSer_PageIndexChanging" PageSize="5">
                    <Columns>
                        <asp:BoundField DataField="hoten" HeaderText="Họ Tên" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
                        <asp:BoundField DataField="ngaydangky" HeaderText="Ngày đăng ký" />
                        <%--<asp:BoundField DataField="matkhau" Visible="true" HeaderText="Mật khẩu" />--%>
                        <asp:ImageField  DataImageUrlField="anhdaidien" NullImageUrl="~/images/noimage.jpg" HeaderText="Ảnh đại diện">
                            <ControlStyle Height="50px" Width="50px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="quyen" HeaderText="Quyền" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkView" CommandArgument='<%# Eval("MaUser") %>' runat="server" OnClick="lnk_OnClick" >Xem</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
           <%--end grid view--%>
</asp:Content>
