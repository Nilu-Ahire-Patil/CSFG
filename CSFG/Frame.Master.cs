using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSFG
{
    public partial class Frame : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_btn_id.Text = (cls_userInitial.loginStatus()) ? cls_userInitial.getUserId().ToString() : "LOGIN";
        }
    }
}