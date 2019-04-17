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
    public partial class TrangChu : System.Web.UI.Page
    {
        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTop3LuotThichDsBaiDang();
                LoadTop3LuotXemDsBaiDang();
                LoadTop3NgayDangGanDayDsBaiDang();
                LoadBaiVietNenXem();
                LoadDSChuDe();
            }
        }
        private void LoadTop3LuotThichDsBaiDang()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_getDSBaiDangTop3LuotThich";
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        rptLoadTop3LuotThichDsBaiDang.DataSource = tb;
                        rptLoadTop3LuotThichDsBaiDang.DataBind();
                    }
                }
            }
        }
        private void LoadTop3LuotXemDsBaiDang()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_getDSBaiDangTop3LuotXem";
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        rptLoadTop3LuotXemDsBaiDang.DataSource = tb;
                        rptLoadTop3LuotXemDsBaiDang.DataBind();
                    }
                }
            }
        }
        private void LoadTop3NgayDangGanDayDsBaiDang()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_getDSBaiDangTop3NgayDangGanNhat";
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        rptLoadTop3NgayDangGanDayDsBaiDang.DataSource = tb;
                        rptLoadTop3NgayDangGanDayDsBaiDang.DataBind();
                    }
                }
            }
        }

        private void LoadBaiVietNenXem()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_getDSBaiDangTop3LuotXem";
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        rptLoadBaiVietNenXem.DataSource = tb;
                        rptLoadBaiVietNenXem.DataBind();
                    }
                }
            }
        }
        private void LoadDSChuDe()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_getDSChuDe";
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        rptDanhSachChuDe.DataSource = tb;
                        rptDanhSachChuDe.DataBind();
                    }
                }
            }
        }
    }
}