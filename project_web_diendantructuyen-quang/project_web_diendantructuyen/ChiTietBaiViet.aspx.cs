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
    public partial class ChiTietBaiViet : System.Web.UI.Page
    {

        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["hoten"] != null)
                {
                    //fill vao thành viên
                    lblhoten.Text = Session["hoten"].ToString();
                    lblemail.Text = Session["email"].ToString();
                    lblngaydangky.Text = Session["ngaydangky"].ToString();
                    Image1.ImageUrl = "admin/user/" + Session["anhdaidien"].ToString();
                    LoadChiTietTin();
                    LoadDsBinhLuan();
                    UpdateSoLuotXem();
                    //UpdateSoLuotThichBinhLuan();

                }
                else
                {
                    Response.Write("<script> var k=confirm('Bạn phải đăng nhập mới xem được chi tiết tin');" +
                       "if(k==true){window.location='http://localhost:64825/DangNhap.aspx'}else{window.location='http://localhost:64825/TrangChu.aspx'};</script>");
                }
            }
        }
        void LoadChiTietTin()
        {
            string MaBaiDang = Request.QueryString["id"];
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_getDSBaiDangByID";
                    cmd.Parameters.AddWithValue("@MaBaiDang", MaBaiDang);
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        rptChiTietDsbaiDangByID.DataSource = tb;
                        rptChiTietDsbaiDangByID.DataBind();
                        cnn.Close();
                    }
                }
            }
        }
        void LoadDsBinhLuan()
        {
            string MaBaiDang = Request.QueryString["id"];
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_getDSBinhLuanByBaiDang";
                    cmd.Parameters.AddWithValue("@MaBaiDang", MaBaiDang);
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        //txtNoiDung.Text = Server.HtmlDecode(Server.HtmlEncode(Convert.ToString(rd.GetString(0))));
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        rptDsBinhLuan.DataSource = tb;
                        rptDsBinhLuan.DataBind();
                        cnn.Close();
                    }
                }
            }
        }
        void UpdateSoLuotXem()
        {
            string MaBaiDang = Request.QueryString["id"];
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_UpdateSoLuotXem";
                    cmd.Parameters.AddWithValue("@MaBaiDang", MaBaiDang);
                    cnn.Open();
                    cmd.ExecuteNonQuery();
                    cnn.Close();
                }
            }
        }

        protected void btn_updateLuotThich(object sender, EventArgs e)
        {
            string MaBaiDang = Request.QueryString["id"];
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_UpdateSoLuotThichBaiDang";
                    cmd.Parameters.AddWithValue("@MaBaiDang", MaBaiDang);
                    cnn.Open();
                    cmd.ExecuteNonQuery();
                    cnn.Close();
                    Response.Redirect("ChiTietBaiViet.aspx?id=" + MaBaiDang);

                }
            }
        }

        protected void btn_Like_Click(object sender, EventArgs e)
        {
            
            string MaBaiDang = Request.QueryString["id"];
            string maBinhLuan = "";
            int outPut = 0;
            foreach (RepeaterItem item in rptDsBinhLuan.Items)
            {
                Label label = (Label)item.FindControl("MaBinhLuan");
                maBinhLuan = label.Text;
                break;
            }
            int.TryParse(maBinhLuan, out outPut);
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_UpdateLikeBinhLuan";
                    cmd.Parameters.AddWithValue("@MaBinhLuan", outPut);
                    cnn.Open();
                    cmd.ExecuteNonQuery();
                    cnn.Close();
                    Response.Redirect("ChiTietBaiViet.aspx?id=" + MaBaiDang);
                }
            }
        }

        protected void btn_binhluan_Click(object sender, EventArgs e)
        {
            string MaBaiDang = Request.QueryString["id"];
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_ThemBinhLuan";
                    cmd.Parameters.AddWithValue("@MaBaiDang", MaBaiDang);
                    cmd.Parameters.AddWithValue("@MaUser", Session["MaUser"]);
                    cmd.Parameters.AddWithValue("@noidung", Server.HtmlDecode(noidung.InnerHtml));
                    cnn.Open();
                    cmd.ExecuteNonQuery();
                    cnn.Close();
                    Response.Write("<script>alert('Bình luận thành công!');</script>");
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                    "setTimeout(function() { window.location.replace('ChiTietBaiViet.aspx?id=' + MaBaiDang) }, 2);", true);

                }
            }
        }
    }

}
