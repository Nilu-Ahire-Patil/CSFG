using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSFG.Utility
{
    public partial class Upcomming : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                rep_event.DataSource = cls_sql.getDataTable(cls_sql.view_upcomming_event);
                rep_event.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('[ERROR]'" + ex.Message + "'');</script>");
                cls_sql.putLog(ex.Message, cls_userInitial.getUserId());
            }
        }
    }
}