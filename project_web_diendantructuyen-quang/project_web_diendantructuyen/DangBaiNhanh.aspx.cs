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
    public partial class DangBaiNhanh : System.Web.UI.Page
    {
        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDSChuDe();
            }
        }
        void LoadDSChuDe()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_layDSChuDe";
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        DsChuDe.DataSource = tb;
                        DsChuDe.DataTextField = "tenchude";
                        DsChuDe.DataValueField = "MaChuDe";
                        DsChuDe.DataBind();
                    }
                }
            }
        }
        protected void btnDangBai_Click(object sender, EventArgs e)
        {
            if (Session["hoten"] != null){
                 string tb = Server.HtmlDecode(noidung.InnerText);
                //goi sp dang bai moi
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_TaoBaiDangMoi";
                        cmd.Parameters.AddWithValue("@tieude", txtTieuDe.Value);
                        cmd.Parameters.AddWithValue("@noidung", Server.HtmlDecode(noidung.InnerHtml));
                        cmd.Parameters.AddWithValue("@MaUser", Session["MaUser"]);
                        cmd.Parameters.AddWithValue("@MaChuDe", DsChuDe.SelectedValue);
                        cnn.Open();
                        SqlDataReader rd = cmd.ExecuteReader();
                        cnn.Close();
                        Response.Write("<script> var k=confirm('Đăng bài thành công,bài đăng của bạn sẽ sớm được duyệt');" +
                               "if(k==true){window.location='http://localhost:64825/TrangChu.aspx'}else{window.location='http://localhost:64825/DangBaiNhanh.aspx'};</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script> var k=confirm('Bạn phải đăng nhập mới đăng được bài');" +
                      "if(k==true){window.location='http://localhost:64825/DangNhap.aspx'}else{window.location='http://localhost:64825/DangBaiNhanh.aspx'};</script>");
            }
           
        }
    }
}