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
    public partial class CapNhatUser : System.Web.UI.Page
    {
        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["hoten"] != null)
                {
                    txtHoTen.Text = Session["hoten"].ToString();
                    txtEmail.Text = Session["email"].ToString();
                    Image1.ImageUrl = "admin/user/" + Session["anhdaidien"].ToString();
                }
                else
                {
                    Response.Redirect("TrangChu.aspx");
                }
            }
        }

        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "UserUpdateClient";
                    cmd.Parameters.AddWithValue("@MaUser", Session["MaUser"]);
                    cmd.Parameters.AddWithValue("@hoten", txtHoTen.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", Session["email"]);
                    if (txtPassword.Text.Trim() == "")
                    {
                        cmd.Parameters.AddWithValue("@matkhau", Session["matkhau"]);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@matkhau", txtPassword.Text.Trim());
                    }
                    cmd.Parameters.AddWithValue("@anhdaidien", Session["anhdaidien"]);
                    cnn.Open();
                    cmd.ExecuteNonQuery();
                    cnn.Close();
                    lblThongBao.Text = "Cập nhật thành công";
                }
            }
        }
    }
}