using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSFG.Utility
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (cls_userInitial.loginStatus())
                    cls_userInitial.logOut();         
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('[ERROR]'" + ex.Message + "'');</script>");
                cls_sql.putLog(ex.Message, cls_userInitial.getUserId());
            }
        }

        protected void btn_forgotpass_request_Click(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_login_user_name.Text != null && txt_password.Text != null)
                {
                    if (cls_userInitial.validateUser(int.Parse(txt_login_user_name.Text), txt_password.Text))
                    {
                        Response.Write("<script>alert('[SUCCESS] Login Successfully');</script>");
                        cls_sql.putLog("LOGIN SUCCESSFULLY", cls_userInitial.getUserId());
                        Response.Redirect("../Default.aspx");
                    }
                    Response.Write("<script>alert('[ERROR] Detail Not Fund Try Again Or Register First Incase Of New User');</script>");
                }
                else
                { 
                    Response.Write("<script>alert('[WARNING] Empty Input');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('[ERROR]'" + ex.Message + "'');</script>");
                cls_sql.putLog(ex.Message, cls_userInitial.getUserId());
            }
        }
    }
}