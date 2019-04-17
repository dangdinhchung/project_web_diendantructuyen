using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_web_diendantructuyen.admin.QuanLyChuDe
{
    public partial class QLChuDe : System.Web.UI.Page
    {
        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btndelete.Enabled = false;
                FillGridView();
            }
        }

        void FillGridView()
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
                        gv_dsChuDe.DataSource = tb;
                        gv_dsChuDe.DataBind();
                    }
                    cnn.Close();
                }
            }
        }
        protected void btn_clear(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            df_contactID.Value = "";
            txtTenChuDe.Text = "";
            lblError.Text = lblThongBao.Text = "";
            btndelete.Enabled = false;
            btnupdate.Enabled = false;
            btnthem.Enabled = true;
        }
        protected void btnthem_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["admin"]) == 1)
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_themchude";
                        cmd.Parameters.AddWithValue("@tenchude", txtTenChuDe.Text.Trim());
                        cnn.Open();
                        cmd.ExecuteNonQuery();
                        cnn.Close();
                        Clear();
                        lblThongBao.Text = "Thêm thành công";
                        FillGridView();
                    }
                }
            }
            else
            {
                string str = "Bạn không đủ quyền để thực hiện hành động này!";
                Response.Write("<script language=javascript>alert('" + str + "');</script>");
            }

        }
        protected void lnk_OnClick(Object sender, EventArgs e)
        {
            btnthem.Enabled = false;
            btnupdate.Enabled = true;
            int chuDeID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "ChuDeViewByID";
                    cmd.Parameters.AddWithValue("@MaChuDe", chuDeID);
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        cnn.Close();
                        txtTenChuDe.Text = tb.Rows[0]["tenchude"].ToString();
                        txtMaChuDe.Text = tb.Rows[0]["machude"].ToString();
                        btndelete.Enabled = true;
                    }
                }
            }
        }
        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["admin"]) == 1)
            {
                int ChuDeID = Convert.ToInt32(txtMaChuDe.Text);
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_checkchude";
                        cmd.Parameters.AddWithValue("@MaChuDe", ChuDeID);
                        cnn.Open();
                        int kt = (int)cmd.ExecuteScalar();
                        if (kt > 0)
                        {
                            lblThongBao.Text = "Không xóa được, chủ đề có chứa bài đăng!";
                        }
                        else
                        {
                            cmd.Connection = cnn;
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "ChuDeDelete";
                            cmd.ExecuteNonQuery();
                            Clear();
                            FillGridView();
                            lblThongBao.Text = "Xoá thành công!";
                            cnn.Close();
                        }
                    }
                }
            }
            else
            {
                string str = "Bạn không đủ quyền để thực hiện hành động này!";
                Response.Write("<script language=javascript>alert('" + str + "');</script>");
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["admin"]) == 1)
            {
                int ChuDeID = Convert.ToInt32(txtMaChuDe.Text);
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "ChuDeUpdate";
                        cmd.Parameters.AddWithValue("@MaChuDe", ChuDeID);
                        cmd.Parameters.AddWithValue("@tenchude", txtTenChuDe.Text.Trim());
                        cnn.Open();
                        cmd.ExecuteNonQuery();
                        cnn.Close();
                        Clear();
                        lblThongBao.Text = "Cập nhật thành công";
                        FillGridView();
                    }
                }
            }
            else
            {
                string str = "Bạn không đủ quyền để thực hiện hành động này!";
                Response.Write("<script language=javascript>alert('" + str + "');</script>");
            }
        }
    }
}