using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_web_diendantructuyen
{
    public partial class ThanhVien : System.Web.UI.Page
    {
        string constr = @"Data Source=CKUNGPC;Initial Catalog=project_web_diendantructuyen;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillFriend();
                Lay3ThanhVienMoiNhat();
            }
        }
       void Lay3ThanhVienMoiNhat()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_getDSTop3ThanhVienMoiNhat";
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        rptLay3ThanhVienMoiNhat.DataSource = tb;
                        rptLay3ThanhVienMoiNhat.DataBind();
                    }
                }
            }
        }
        void FillFriend()
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

                        //Tạo PagedDataSource
                        PagedDataSource pageSource = new PagedDataSource();
                        pageSource.DataSource = tb.DefaultView;
                        pageSource.AllowPaging = true;
                        pageSource.PageSize = 6;
                        pageSource.CurrentPageIndex = this.CurrentPage;
                        if (pageSource.PageCount > 1)
                        {
                            rptPages.Visible = true;
                            ArrayList pages = new ArrayList();
                            for (int i = 0; i <= pageSource.PageCount - 1; i++)
                            {
                                pages.Add((i + 1).ToString());
                            }
                            rptPages.DataSource = pages;
                            rptPages.DataBind();
                        }
                        else
                        {
                            rptPages.Visible = false;
                        }

                        dtlThanhVien.DataSource = pageSource;
                        dtlThanhVien.DataBind();
                        cnn.Close();
                    }
                }
            }
        }
        public int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] != null)
                {
                    return Convert.ToInt32(ViewState["CurrentPage"]);
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }
        protected void rptPages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            this.CurrentPage = Convert.ToInt32(e.CommandArgument) - 1;
            FillFriend();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}