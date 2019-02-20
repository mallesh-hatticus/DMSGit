using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DMS.Constat
{
    public static class DdataLayerConstat
    {
        /*DB connection*/
        public static string ConnectionString = "DMS";


        /*store procedure*/
        public static string DMS_sp_adduser = "DMS_sp_adduser";


        /*parameters*/

        public static string usrname = "usrname";
        public static string email = "email";
        public static string pwd = "pwd";
        public static string error_code = "error_code";
        public static string error_message = "error_message";
       
    }
}
