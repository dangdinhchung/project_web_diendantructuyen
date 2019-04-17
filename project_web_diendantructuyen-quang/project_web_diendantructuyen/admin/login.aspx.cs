using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_web_diendantructuyen.admin
{
    public partial class login : System.Web.UI.Page
    {
        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login(object sender, EventArgs e)
        {
            string hoten = txtHoTen.Text;
            string matkhau = txtPassword.Text;
            if (txtHoTen.Text.Trim() == "" || txtPassword.Text.Trim() == "")
            {
                lblcheck.Text = "Bạn chưa nhập thông tin!";
                txtHoTen.Focus();
            }
            else
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_loginAdmin";
                        cmd.Parameters.AddWithValue("@hoten", hoten);
                        cmd.Parameters.AddWithValue("@matkhau", matkhau);
                        cnn.Open();
                        cmd.ExecuteNonQuery();
                        SqlDataReader datareader = cmd.ExecuteReader();
                        datareader.Read();
                        if (datareader.HasRows)
                        {
                            string user = datareader["hoten"].ToString();
                            string pass = datareader["matkhau"].ToString();
                            user = user.TrimEnd();
                            pass = pass.TrimEnd();
                            string user_nhap = txtHoTen.Text;
                            string pass_nhap = txtPassword.Text;
                            if (pass == pass_nhap && user == user_nhap)
                            {
                                if (Convert.ToString(datareader["quyen"]) == "Member")
                                {
                                    Session["member"] = "2";
                                    Session["hoten"] = datareader["hoten"].ToString();
                                    Session["email"] = datareader["email"].ToString();
                                    Session["MaUser"] = Convert.ToInt32(datareader["MaUser"].ToString());
                                    Session["matkhau"] = datareader["matkhau"].ToString();
                                    Session["quyen"] = datareader["quyen"].ToString();
                                    Session["anhdaidien"] = datareader["anhdaidien"].ToString();
                                    Session["ngaydangky"] = Convert.ToDateTime(datareader["ngaydangky"].ToString());
                                    Session["trangthai"] = datareader["trangthai"].ToString();
                                    Response.Write("<script> var k=confirm('Đăng nhập thành công tài khoản Member');" +
                                    "if(k==true){window.location='http://localhost:64825/admin/user/danh-sach-user.aspx'}else{window.location='http://localhost:64825/login.aspx'};</script>");
                                }
                                if (Convert.ToString(datareader["quyen"]) == "Admin")
                                {
                                    Session["admin"] = "1";
                                    Session["hoten"] = datareader["hoten"].ToString();
                                    Session["email"] = datareader["email"].ToString();
                                    Session["MaUser"] = Convert.ToInt32(datareader["MaUser"].ToString());
                                    Session["matkhau"] = datareader["matkhau"].ToString();
                                    Session["quyen"] = datareader["quyen"].ToString();
                                    Session["anhdaidien"] = datareader["anhdaidien"].ToString();
                                    Session["ngaydangky"] = Convert.ToDateTime(datareader["ngaydangky"].ToString());
                                    Session["trangthai"] = datareader["trangthai"].ToString();
                                    Response.Write("<script> var k=confirm('Đăng nhập thành công tài khoản Admin');" +
                                      "if(k==true){window.location='http://localhost:64825/admin/user/danh-sach-user.aspx'}else{window.location='http://localhost:64825/login.aspx'};</script>");
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Tên tài khoản hoặc mật khẩu sai')", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Tên tài khoản chưa được đăng ký, vui lòng nhập lại')", true);

                        }
                        cnn.Close();
                    }
                }
            }
        }
    }
}