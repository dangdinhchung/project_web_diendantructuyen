using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_web_diendantructuyen.admin.user
{
    public partial class danh_sach_user : System.Web.UI.Page
    {
            string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    btndelete.Enabled = false;
                    FillGridView();
                }
                if (Session["HoTen"] != null)
                {
                    FillGridView();
                }
                else
                {
                    Response.Redirect("../login.aspx");
                }
            }

            protected void btn_clear(object sender, EventArgs e)
            {
                Clear();
            }
            public void Clear()
            {
                df_contactID.Value = "";
                txtEmail.Text = txtHoTen.Text = txtPassword.Text = "";
                lblError.Text = lblThongBao.Text = "";
                btndelete.Enabled = false;
                btnupdate.Enabled = false;
                btnthem.Enabled = true;
            }

            protected void btnthem_Click(object sender, EventArgs e)
            {
            if(Convert.ToInt32(Session["admin"]) == 1)
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "UserCreate";
                        if (txtanh.HasFile)
                        {
                            string duoianh = System.IO.Path.GetExtension(txtanh.FileName);
                            if (duoianh == ".jpg" || duoianh == ".png" || duoianh == ".jpeg")
                            {
                                string path = Server.MapPath("Images\\");
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
                        }
                        cmd.Parameters.AddWithValue("@hoten", txtHoTen.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@matkhau", txtPassword.Text.Trim());
                        cmd.Parameters.AddWithValue("@quyen", ddl_quyen.Text.Trim());
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

            void FillGridView()
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_LoadDanhSachUser";
                        using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                        {
                            DataTable tb = new DataTable();
                            ad.Fill(tb);
                            gv_dsUSer.DataSource = tb;
                            gv_dsUSer.DataBind();
                        }
                        cnn.Close();
                    }
                }
            }
            protected void lnk_OnClick(Object sender, EventArgs e)
            {
            btnthem.Enabled = false;
            btnupdate.Enabled = true;
            int UserID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "UserViewByID";
                    cmd.Parameters.AddWithValue("@MaUser", UserID);
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        cnn.Close();
                        txtEmail.Text = tb.Rows[0]["email"].ToString();
                        txtHoTen.Text = tb.Rows[0]["hoten"].ToString();
                        ddl_quyen.Text = tb.Rows[0]["quyen"].ToString();
                        txtPassword.Text = tb.Rows[0]["matkhau"].ToString();
                        txtMaUser.Text = tb.Rows[0]["mauser"].ToString();
                        btndelete.Enabled = true;
                    }
                }
            }
        }

            protected void btndelete_Click(object sender, EventArgs e)
            {
            if (Convert.ToInt32(Session["admin"]) == 1)
            {
                int UserID = Convert.ToInt32(txtMaUser.Text);
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "UserDelete";
                        cmd.Parameters.AddWithValue("@MaUser", UserID);
                        cnn.Open();
                        cmd.ExecuteNonQuery();
                        Clear();
                        FillGridView();
                        lblThongBao.Text = "Xoá thành công!";
                        cnn.Close();
                    }
                }
                }else{
                    string str = "Bạn không đủ quyền để thực hiện hành động này!";
                    Response.Write("<script language=javascript>alert('" + str + "');</script>");
            }
        }
            int stt = 1;
            public string get_stt()
            {
                return Convert.ToString(stt++);
            }
            protected void gv_dsUSer_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
            gv_dsUSer.PageIndex = e.NewPageIndex;   //trang hien tai
            int trang_thu = e.NewPageIndex;      //the hien trang thu may
            int so_dong = gv_dsUSer.PageSize;       //moi trang co bao nhieu dong
            stt = trang_thu * so_dong + 1;
            FillGridView();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["admin"]) == 1)
            {
                int UserID = Convert.ToInt32(txtMaUser.Text);
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "UserUpdate";
                        cmd.Parameters.AddWithValue("@MaUser", UserID);
                        if (txtanh.HasFile)
                        {
                            string duoianh = System.IO.Path.GetExtension(txtanh.FileName);
                            if (duoianh == ".jpg" || duoianh == ".png" || duoianh == ".jpeg")
                            {
                                string path = Server.MapPath("Images\\");
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
                        }
                        cmd.Parameters.AddWithValue("@hoten", txtHoTen.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@matkhau", txtPassword.Text.Trim());
                        cmd.Parameters.AddWithValue("@quyen", ddl_quyen.Text.Trim());
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