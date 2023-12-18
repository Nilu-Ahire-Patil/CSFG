using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CSFG.Utility
{
    public partial class Notes : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                rep_notes.DataSource = cls_sql.getDataTable(cls_sql.view_verified_note);
                rep_notes.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('[ERROR]'"+ex.Message+"'');</script>");
                cls_sql.putLog(ex.Message,cls_userInitial.getUserId());
            }
        }

        protected void open_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (sender as Button);
                string id = btn.CommandArgument;    
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('[ERROR]'" + ex.Message + "'');</script>");
                cls_sql.putLog(ex.Message, cls_userInitial.getUserId());
            }
        }
    }
}