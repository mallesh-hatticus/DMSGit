using DMS.DataAccess;
using DMS.EntityLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DMS.Business
{
    public class UserBusiness : IUserBusiness
    {

        private readonly IUserData _IUserData;

        public UserBusiness() : this (new UserData())
        {}

        public UserBusiness(IUserData IUserData)
        {
            _IUserData=IUserData;
        }

        public User InsertProduct(User UserObj)
        {
            try
            {
                UserObj = _IUserData.InsertProduct(UserObj);
            }
            catch(Exception ex)
            {
                throw ex;
            }
            return UserObj;
        }

    }
}
