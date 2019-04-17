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
    public partial class DanhSachBaiDangByChuDe : System.Web.UI.Page
    {
        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        public DataTable tb;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBaiDangTheoChuDe();
            }
        }
        private void LoadBaiDangTheoChuDe()
        {
            string MaChuDe = Request.QueryString["id"];
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_getDsBaiDangByChuDe";
                    cmd.Parameters.AddWithValue("@MaChuDe", MaChuDe);
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        tb = new DataTable();
                        ad.Fill(tb);
                        rptDSBaiDangTheoChuDe.DataSource = tb;
                        rptDSBaiDangTheoChuDe.DataBind();
                    }
                }
            }
        }
    }
}