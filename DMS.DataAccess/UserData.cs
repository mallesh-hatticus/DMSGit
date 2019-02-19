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

namespace DMS.DataAccess
{
    public class UserData : IUserData
    {

        public static void InsertProduct(User UserObj)
        {
            Database database = null;
            DbCommand dbCommand = null;
            try
            {
                DatabaseProviderFactory factory = new DatabaseProviderFactory();
                database = factory.Create(DdataLayerConstat.ConnectionString);
                dbCommand = database.GetStoredProcCommand(DdataLayerConstat.DMS_sp_adduser);
                database.AddInParameter(dbCommand, DdataLayerConstat.usrname, DbType.String, UserObj.UserName);
                database.AddInParameter(dbCommand, DdataLayerConstat.email, DbType.String, UserObj.UsrEmail);
                database.AddInParameter(dbCommand, DdataLayerConstat.pwd, DbType.String, UserObj.password);
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

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                database = null;

            }
        }
    }
}
