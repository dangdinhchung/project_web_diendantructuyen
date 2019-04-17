using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_web_diendantructuyen
{
    public partial class DangKy : System.Web.UI.Page
    {
        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_dangky(object sender, EventArgs e)
        {
            //check khi thêm email trùng nhau
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_checkEmail";
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                    cnn.Open();
                    int kt = (int)cmd.ExecuteScalar();
                    if (kt > 0)
                    {
                        lblThongBao.Text = "Tài khoản của bạn đã có người dùng, xin mời bạn nhập lại!";
                    }
                    else
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "UserCreateFront";
                        //upload image
                        if (txtanh.HasFile)
                        {
                            string duoianh = System.IO.Path.GetExtension(txtanh.FileName);
                            if (duoianh == ".jpg" || duoianh == ".png" || duoianh == ".jpeg")
                            {
                                //string path = Server.MapPath("Images\\");
                                string path = "C:\\Users\\a\\Desktop\\BTLLTWNC\\project_web_diendantructuyen\\Images";
                                txtanh.SaveAs(path + txtanh.FileName);

                                string tenanh = "Images/" + txtanh.FileName;

                                cmd.Parameters.AddWithValue("@anhdaidien", tenanh);
                            }
                            else
                            {
                                lblError.Text = "Không đúng định dạng file ảnh";
                            }
                        }
                        else
                        {
                            string tenanh = "Images/no-img.png";
                            cmd.Parameters.AddWithValue("@anhdaidien", tenanh);
                            //lblError.Text = "Bạn chưa chọn ảnh";
                        }
                        cmd.Parameters.AddWithValue("@hoten", txtHoTen.Text.Trim());
                        cmd.Parameters.AddWithValue("@matkhau", txtPassword.Text.Trim());
                        int i = (int)cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            lblThongBao.Text = "Đăng ký thành công, mời bạn đăng nhập để xem chi tiết hơn!";
                            HyperLinkLogin.Visible = true;
                        }
                        else
                        {
                            lblError.Text = "Đăng ký thất bại!";
                        }
                        cnn.Close();
                        Clear();
                      }
                }
            }
        }
        public void Clear()
        {
            txtEmail.Text = txtHoTen.Text = txtPassword.Text = "";
            //lblError.Text = lblThongBao.Text = "";

        }
    }
}