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


        #region DMS_sp_adduser sp and param
        public static string DMS_sp_adduser = "DMS_sp_adduser";
        /*parameters*/
        public static string Paramusrname = "usrname";
        public static string Paramemail = "email";
        public static string Parampwd = "pwd";
        #endregion




        #region  DMMS_sp_LoggedUsr
        public static string DMMS_sp_LoggedUsr = "DMMS_sp_LoggedUsr";
        /*parameters*/
        public static string ParamLogEmail = "Log_Email";
        public static string ParamLogPwd = "Log_Pwd";

        #endregion


        #region response constants
        public static string UserName = "UserName";
        public static string UserEmail = "UserEmail";
        public static string UserRoleId = "UserRoleId";
        #endregion

        #region common parameters
        public static string error_code = "error_code";
        public static string error_message = "error_message";
        #endregion

    }
}
