using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_web_diendantructuyen.MasterPage
{
    public partial class Server : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["hoten"] != null)
            {
                lblten.Text = " Xin chào, " + Session["hoten"].ToString();
                HyperLinkDangXuat.Visible = true;
            }
        }
    }
}