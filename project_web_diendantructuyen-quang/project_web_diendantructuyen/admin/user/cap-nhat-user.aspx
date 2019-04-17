<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Server.Master" AutoEventWireup="true" CodeBehind="cap-nhat-user.aspx.cs" Inherits="project_web_diendantructuyen.admin.user.cap_nhat_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Cập nhật user</h2>
           <%--bên trái--%>
           <div class="col-s-12 col-m-6">
            <div class="container">
                <asp:HiddenField ID="df_contactID" runat="server" />
                 <asp:RequiredFieldValidator ID="valiTen" runat="server" ControlToValidate="txtHoTen" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <em>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Tên phải có độ dài từ 2-50 ký tự có phân biệt hoa thường" ValidationExpression="^[0-9a-zA-Z_]{2,50}$" ControlToValidate="txtHoTen" ></asp:RegularExpressionValidator>
                </em><br/>

                 <label for="author" Visible="false"></label>
                <asp:TextBox name="mauser" Visible="false" class="required input_field form-control"  ID="txtMaUser" runat="server"></asp:TextBox>

                <label for="author">Họ tên:</label>
                <asp:TextBox name="hoten" class="required input_field form-control"  ID="txtHoTen" runat="server"></asp:TextBox>
                   
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <em>
                    <asp:RegularExpressionValidator ID="valiemail" runat="server" ControlToValidate="txtemail" ErrorMessage="* Sai định dạng" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Style="font-size: 15px"></asp:RegularExpressionValidator>
                </em><br/>
                <label for="email">Email:</label>
                <asp:TextBox name="email" ReadOnly="true" class="validate-email required input_field form-control" ID="txtEmail" runat="server"></asp:TextBox>

             

                <label for="email">Ảnh đại diện:</label>
                    <asp:Image ID="Image1" runat="server"   Width="100px" Height="100px"/>
                </div>
            </div>
           <%--end bên trái--%>

           <%--Bên phải--%>
             <div class="col-s-12 col-m-6">
                <div class="container">
                    
                     <%--<asp:RequiredFieldValidator ID="valiPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                      <em>
                        <asp:RegularExpressionValidator ID="regupass" runat="server" ErrorMessage="Độ dài password phải lớn hơn 3 kí tự" ValidationExpression="^[0-9a-zA-Z_]{4,50}$" ControlToValidate="txtPassword" ></asp:RegularExpressionValidator>
                    </em><br/>
                    <label for="phone">Mật khẩu mới:</label>
                    <asp:TextBox class="input_field form-control" TextMode="Password" name="matkhau" ID="txtPassword" runat="server"></asp:TextBox>
                    
                    <%--<asp:RequiredFieldValidator ID="valiRePassword" runat="server" ControlToValidate="txtRePassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <em>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRePassword" ErrorMessage="*Mật khẩu không trùng khớp" ForeColor="Red" Style="font-size: 15px"></asp:CompareValidator>
                    </em><br/>
                    <label for="phone">Nhập lại mật khẩu mới:</label>
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
                <asp:Button  runat="server" class="btn btn-primary" ID="btnupdate" Text="Cập nhật" OnClick="btnupdate_Click"  />
            </div>
            <br/>
           <%--end button xử lý--%>
            <%--Thông báo--%>
            <asp:Label ID="lblThongBao" runat="server" ForeColor="Green" Font-Size="16px"></asp:Label>
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="16px"></asp:Label>
            <br/>
           <%--end thông báo--%>
</asp:Content>
