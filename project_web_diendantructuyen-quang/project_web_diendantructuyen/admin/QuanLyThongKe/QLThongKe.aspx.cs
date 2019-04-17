using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_web_diendantructuyen.admin.QuanLyThongKe
{
    public partial class QLThongKe : System.Web.UI.Page
    {
        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadTongSoThanhVien();
            }
        }
        void loadTongSoThanhVien()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_ThongKeTungMuc";
                    //cmd.Parameters.AddWithValue("@HoTen", ten);
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        GridViewThongKe.DataSource = tb;
                        GridViewThongKe.DataBind();
                    }
                }
            }
        }
    }
}