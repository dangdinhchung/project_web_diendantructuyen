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
    public partial class cap_nhat_user : System.Web.UI.Page
    {
        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["hoten"] != null)
            {
                txtHoTen.Text = Session["hoten"].ToString();
                txtEmail.Text = Session["email"].ToString();
                ddl_quyen.Text = Session["quyen"].ToString();
                Image1.ImageUrl = Session["anhdaidien"].ToString();
            }
            else
            {
                Response.Redirect("../login.aspx");
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if(Convert.ToInt32(Session["Admin"]) == 1)
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "UserUpdate";
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
                        cmd.Parameters.AddWithValue("@quyen", ddl_quyen.Text.Trim());
                        cmd.Parameters.AddWithValue("@anhdaidien", Session["anhdaidien"]);
                        cnn.Open();
                        cmd.ExecuteNonQuery();
                        cnn.Close();
                        lblThongBao.Text = "Cập nhật thành công";
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