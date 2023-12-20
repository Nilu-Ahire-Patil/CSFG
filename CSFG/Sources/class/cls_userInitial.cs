using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CSFG
{
    
    public static class cls_userInitial
    {
        private static int user_id = -1;
        private static string user_name = null;
        private static string user_pass = null;
        private static bool islogin = false;

        public static bool loginStatus()
        {
            try
            {
                if(islogin && user_id != -1 && user_name != null && user_pass != null)
                    return true;
            }
            catch (Exception ex)
            {
                cls_sql.putLog(ex.Message, cls_userInitial.getUserId());
            }
            return false;
        }

        public static bool logOut()
        {
            try
            {
                islogin = false;
                user_id = -1;
                user_name = null;
                user_pass = null;
                return true;
            }
            catch (Exception ex)
            {
                cls_sql.putLog(ex.Message, cls_userInitial.getUserId());
            }
            return false;
        }

        public static int getUserId()
        {
            return cls_userInitial.user_id;
        }
        public static void setUserId(int _id)
        {
            cls_userInitial.user_id = _id;
        }
        public static void setUserName(string _name)
        {
            cls_userInitial.user_name = _name;
        }
        public static void setUserPass(string _pass)
        {
            cls_userInitial.user_pass = _pass;
        }


        public static bool setandvalidateUser(int _id, string _pass)
        {
            try
            {
                if (cls_sql.validateUser(_id, _pass))
                {
                    islogin = true;
                    user_id = _id;
                    user_name = null;//get string return from 'cls_sql.validateUser(_id, _pass)' this function and asign it
                    user_pass = _pass;
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                cls_sql.putLog(ex.Message, cls_userInitial.getUserId());
            }
            return false;
        }
    }
}
