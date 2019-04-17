<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="project_web_diendantructuyen.admin.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web dien dan truc tuyen</title>
</head>
    <style>
    body {font-family: Arial, Helvetica, sans-serif;width:25%;margin: 0 auto;}
  

    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }
    h2{
        text-align: center;
    }

    .btn-primary {
      background-color: #4CAF50;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      width: 100%;
    }

    button:hover {
      opacity: 0.8;
    }

    .cancelbtn {
      width: auto;
      padding: 10px 18px;
      background-color: #f44336;
    }

    .container {
      padding: 16px;
    }

    span.psw {
      float: right;
      padding-top: 16px;
    }

    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 300px) {
      span.psw {
         display: block;
         float: none;
      }
      .cancelbtn {
         width: 100%;
      }
    }
</style>
<body>
   <h2>Login</h2>

<form runat="server" id="login">
     <em>
        <asp:Label ID="lblcheck" runat="server" ForeColor="Red" Font-Size="14px"></asp:Label>
    </em>
    <%--  <asp:RequiredFieldValidator ID="valiTen" runat="server" ControlToValidate="txtHoTen" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <em>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Tên phải có độ dài từ 2-50 ký tự có phân biệt hoa thường" ValidationExpression="^[0-9a-zA-Z_]{2,50}$" ControlToValidate="txtHoTen" ></asp:RegularExpressionValidator>
            </em><br/>--%>
                <label for="author">Họ tên:</label>
                <asp:TextBox name="hoten" class="required input_field form-control"  ID="txtHoTen" runat="server"></asp:TextBox>
                     
        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <em>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Độ dài password phải lớn hơn 3 kí tự" ValidationExpression="^[0-9a-zA-Z_]{4,50}$" ControlToValidate="txtPassword" ></asp:RegularExpressionValidator>
        </em><br/>--%>
        <label for="phone">Password:</label>
        <asp:TextBox class="input_field form-control" TextMode="Password" name="password" ID="txtPassword" runat="server"></asp:TextBox>
        
     <asp:Button   runat="server" class="btn btn-primary" Text="Login" OnClick="btn_login" />
    </form>
    <em>
        <asp:Label ID="lblthongbao" runat="server" Style="color: red; font-size: 16px"></asp:Label>
    </em>
</body>
</html>
