using DMS.EntityLayer;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DMS.Constat;
using System.Data;
using NLog;

namespace DMS.DataAccess
{
    public class UserData : IUserData
    {
        private static Logger logger = LogManager.GetCurrentClassLogger();
        public User InsertProduct(User UserObj)
        {

            Database database = null;
            DbCommand dbCommand = null;
            try
            {
                DatabaseProviderFactory factory = new DatabaseProviderFactory();
                database = factory.Create(DdataLayerConstat.ConnectionString);
                dbCommand = database.GetStoredProcCommand(DdataLayerConstat.DMS_sp_adduser);
                database.AddInParameter(dbCommand, DdataLayerConstat.Paramusrname, DbType.String, UserObj.UsrName);
                database.AddInParameter(dbCommand, DdataLayerConstat.Paramemail, DbType.String, UserObj.UsrEmail);
                database.AddInParameter(dbCommand, DdataLayerConstat.Parampwd, DbType.String, UserObj.password);
                database.AddOutParameter(dbCommand, DdataLayerConstat.error_code, DbType.Int32, default(int));
                database.AddOutParameter(dbCommand, DdataLayerConstat.error_message, DbType.String, 500);

                database.ExecuteNonQuery(dbCommand);


                int errorcode = Convert.ToInt32(database.GetParameterValue(dbCommand, DdataLayerConstat.error_code));
                string errmsg = Convert.ToString(database.GetParameterValue(dbCommand, DdataLayerConstat.error_message));
                if (errorcode != 0 && errorcode <= 50000)
                {
                    throw new Exception(string.Format("{0},{1}", errorcode, database.GetParameterValue(dbCommand, DdataLayerConstat.error_message).ToString()));
                }
                else if (errorcode == 0)
                {
                    UserObj.RespMsg = database.GetParameterValue(dbCommand, DdataLayerConstat.error_message).ToString();
                }
                else
                {
                    logger.Error("This is an error message");
                }

            }
            catch (Exception ex)
            {

                logger.Error(ex.Message);
                throw ex;
            }
            finally
            {
                database = null;

            }

            return UserObj;
        }


        public User ValidateLoggedUsr(Login ObjLogin)
        {
            Database database;
            DbCommand dbCommand;
            User ObjUser = null;
            ObjUser = new User();
            try
            {
                DatabaseProviderFactory factory = new DatabaseProviderFactory();
                database = factory.Create(DdataLayerConstat.ConnectionString);
                dbCommand = database.GetStoredProcCommand(DdataLayerConstat.DMMS_sp_LoggedUsr);

                database.AddInParameter(dbCommand, DdataLayerConstat.ParamLogEmail, DbType.String, ObjLogin.Log_Email);
                database.AddInParameter(dbCommand, DdataLayerConstat.ParamLogPwd, DbType.String, ObjLogin.Log_Pwd);

                database.AddOutParameter(dbCommand, DdataLayerConstat.error_code, DbType.Int32, default(int));
                database.AddOutParameter(dbCommand, DdataLayerConstat.error_message, DbType.String, 500);



                using (IDataReader objReader = database.ExecuteReader(dbCommand))
                {

                    while (objReader.Read())
                    {
                        User respuser = new User();

                        respuser.UsrEmail = objReader[DdataLayerConstat.UserEmail] != DBNull.Value ?
                            Convert.ToString(objReader[DdataLayerConstat.UserEmail]) : respuser.UsrEmail = null;

                        respuser.UsrName = objReader[DdataLayerConstat.UserName] != DBNull.Value ?
                            Convert.ToString(objReader[DdataLayerConstat.UserEmail]) : respuser.UsrName = null;

                        respuser.RoleID = objReader[DdataLayerConstat.UserRoleId] != DBNull.Value ?
                            Convert.ToInt32(objReader[DdataLayerConstat.UserRoleId]) : respuser.RoleID = default(Int32);
                    }
                }

                int errorcode = Convert.ToInt32(database.GetParameterValue(dbCommand, DdataLayerConstat.error_code));

                if (errorcode != 0 && errorcode <= 50000)
                {
                    throw new Exception("Error No:" + Convert.ToString(errorcode) + "  Error Msg:  " + Convert.ToString(database.GetParameterValue(dbCommand, DdataLayerConstat.error_message)) + " ");
                }
                else if(errorcode.Equals(560001))
                {
                    ObjUser.RespMsg = Convert.ToString(errorcode);
                }
                else
                {
                    ObjUser.RespMsg = "SUCCESS";
                }


            }
            catch (Exception ex)
            {

            }
            return ObjUser;
        }

    }
}
