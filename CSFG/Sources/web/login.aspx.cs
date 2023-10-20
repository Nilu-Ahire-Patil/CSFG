using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSFG.web
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void printErrror(string message)
        {
            lab_error.Text = message;
            lab_error.Visible = true;
        }
       
        protected void btn_login_Click(object sender, EventArgs e)
        {
            try
            {
                if(txt_rollno.Text != "" && txt_password.Text != "")
                {
                    cls_main.ValidationReturn vr = cls_sql.validateUser(txt_rollno.Text, txt_password.Text);
                    if(vr.ID != 0)
                    {
                        
                    }
                    else
                    {
                        printErrror(vr.Message);
                    }
                }
            }
            catch(Exception ex)
            {
                printErrror(ex.Message);
            }
        }
    }
}