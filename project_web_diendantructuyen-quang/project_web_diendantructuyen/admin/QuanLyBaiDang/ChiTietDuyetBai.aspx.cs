using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_web_diendantructuyen.admin.QuanLyBaiDang
{
    public partial class ChiTietDuyetBai : System.Web.UI.Page
    {
        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idChiTietBaiDang = Convert.ToInt16(Request.QueryString["idChiTietBaiDang"]);
                loadChiTietBaiDang(idChiTietBaiDang);
            }
        }
        void loadChiTietBaiDang(int id)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_chiTietBaiDangTheoID";
                    cmd.Parameters.AddWithValue("@MaBaiDang", id);
                    cnn.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        txtNoiDung.Text = Server.HtmlDecode(Server.HtmlEncode(Convert.ToString(rd.GetString(0))));
                        txtTieuDe.Text = Convert.ToString(rd.GetString(2));
                        txtTrangThai.Text = Convert.ToString(rd.GetString(3));
                        txtThanhVienDang.Text = Convert.ToString(rd.GetString(4));
                        txtQuyen.Text = Convert.ToString(rd.GetString(5));
                        txtThoiGian.Text = Convert.ToString(rd.GetDateTime(7));
                    }
                    rd.Close();
                    if (txtTrangThai.Text.Equals("Đã Duyệt"))
                    {
                        btnDuyet.Visible = false;
                    }
                    if (txtTrangThai.Text.Equals("Không Chấp nhận"))
                    {
                        btnDuyet.Visible = false;
                        btnKhongDuyet.Visible = false;
                    }
                }
            }
        }
        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            int idChiTietBaiDang = Convert.ToInt16(Request.QueryString["idChiTietBaiDang"]);
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_DuyetBaiDang";
                    cmd.Parameters.AddWithValue("@MaBaiDang", idChiTietBaiDang);
                    cnn.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    rd.Close();
                    Response.Write("<script>alert('Duyệt bài thành công!');</script>");
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                    "setTimeout(function() { window.location.replace('QLBaiDang.aspx') }, 2);", true);
                }
            }
        }
        protected void btnKhongDuyet_Click(object sender, EventArgs e)
        {
            int idChiTietBaiDang = Convert.ToInt16(Request.QueryString["idChiTietBaiDang"]);
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_KhongDuyetBaiDang";
                    cmd.Parameters.AddWithValue("@MaBaiDang", idChiTietBaiDang);
                    cnn.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    rd.Close();
                    Response.Write("<script>alert('Thành Công!Bài viết sẽ bị ẩn');</script>");
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                    "setTimeout(function() { window.location.replace('QLBaiDang.aspx') }, 2);", true);
                }
            }
        }
    }
}