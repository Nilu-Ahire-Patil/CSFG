using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace CSFG
{
    
    public class cls_sql
    {
        /// <summary>
        /// Connection String
        /// </summary>
        private static String ConnString = ConfigurationManager.ConnectionStrings["csfg_db_configuration"].ConnectionString;
        private static SqlConnection Conn = new SqlConnection(ConnString);


        public static string view_verified_note = "select * from view_verified_note order by view_verified_note.note_date desc";
        public static string view_pending_note = "select * from view_pending_note order by view_pending_note.note_date desc";
        public static string view_all_note = "select * from view_all_note order by view_all_note.note_date desc";

        public static string view_all_event = "select * from view_all_event order by view_all_event.eve_date desc";
        public static string view_delete_event = "select * from view_delete_event order by view_all_event.eve_date desc";

        public static string view_csfg_member = "select * from view_csfg_member order by view_csfg_member.stu_name desc";
        /// <summary>
        /// if connection is close it open it
        /// </summary>
        public static void ConnOpen() 
        {
            try
            {
                if (Conn.State == ConnectionState.Closed)
                    Conn.Open();
            }
            catch (Exception)
            {
               
                throw;
            }
        }

        /// <summary>
        /// when connection is open it close it
        /// </summary>
        public static void ConnClose() 
        {
            try
            {
                if (Conn.State == ConnectionState.Open)
                    Conn.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static bool validateUser(int _id, string _pass)
        {
            try
            {
                System.Data.DataTable dt = cls_sql.getDataTable("select tbl_stu.stu_id,tbl_stu.stu_name,tbl_stu.stu_pass from tbl_stu where tbl_stu.stu_id = '"+_id+ "' and tbl_stu.stu_pass = '"+_pass+"'");
                if (dt.Rows.Count > 0)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                cls_sql.putLog(ex.Message, cls_userInitial.getUserId());
            }
            return false;
        }

        /// <summary>
        /// return datatable from fired query
        /// </summary>
        /// <param name="Query"></param>
        /// <returns></returns>
        public static System.Data.DataTable getDataTable(string Query) 
        {
            try
            {
                ConnOpen();
                DataTable Dt = new DataTable();
                SqlCommand Cmd = new SqlCommand(Query, Conn);
                // Cmd.CommandTimeout = 0;
                SqlDataAdapter Da = new SqlDataAdapter(Cmd);
                Da.Fill(Dt);
                ConnClose();
                return Dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        
        /// <summary>
        /// creating log of error and user triger things.
        /// </summary>
        /// <param name="text">Error or log Text</param>
        /// <param name="stu_id">User id</param>
        public static void putLog(string text, int stu_id)
        {
            try
            {

            }
            catch (Exception)
            {
                throw;
            }
        }
        

        /// <summary>
        /// Checks the user is valid or not.
        /// </summary>
        /// <param name="stu_id"></param>
        /// <param name="stu_pass"></param>
        /// <returns></returns>
        public static bool isValidUser(string stu_id, string stu_pass)
        {
            try
            {

                return true;
            }
            catch (Exception)
            { 
                throw;
            }
        }
    }
}