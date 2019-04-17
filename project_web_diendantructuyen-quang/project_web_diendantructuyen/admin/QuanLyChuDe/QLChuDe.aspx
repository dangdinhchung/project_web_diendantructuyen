<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Server.Master" AutoEventWireup="true" CodeBehind="QLChuDe.aspx.cs" Inherits="project_web_diendantructuyen.admin.QuanLyChuDe.QLChuDe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Quản lý chủ đề</h2>
           <%--bên trái--%>
           <div class="col-s-12 col-m-6">
            <div class="container">
                <asp:HiddenField ID="df_contactID" runat="server" />
                <%-- <asp:RequiredFieldValidator ID="valiTen" runat="server" ControlToValidate="txtHoTen" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <em>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Tên phải có độ dài từ 2-50 ký tự có phân biệt hoa thường" ValidationExpression="^[0-9a-zA-Z_]{2,50}$" ControlToValidate="txtHoTen" ></asp:RegularExpressionValidator>
                </em><br/>--%>
                <label for="author">Tên chủ đề:</label>
                <asp:TextBox name="tenchude" class="required input_field form-control"  ID="txtTenChuDe" runat="server"></asp:TextBox>
                  <label for="author" Visible="false"></label>
                <asp:TextBox name="machude" Visible="false" class="required input_field form-control"  ID="txtMaChuDe" runat="server"></asp:TextBox>
                </div>
            </div>
           <%--end bên trái--%>

           <%--Bên phải--%>
             <div class="col-s-12 col-m-6">
                
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
            <div class="grid_view1">
                <%--AllowPaging="True" OnPageIndexChanging="gv_dsChuDe_PageIndexChanging" PageSize="5"--%>
                <asp:GridView ID="gv_dsChuDe" runat="server" AutoGenerateColumns="false" >
                    <Columns>
                        <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="tenchude" HeaderText="Tên chủ đề" />
                        <asp:BoundField DataField="trangthai" HeaderText="Trạng thái" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkView" CommandArgument='<%# Eval("MaChuDe") %>' runat="server" OnClick="lnk_OnClick" >Xem</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
           <%--end grid view--%>
</asp:Content>
