using DMS.EntityLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DMS.Business
{
    public interface IUserBusiness
    {
        User InsertProduct(User UserObj);

        User ValidateLoggedUsr(Login ObjLogin);
    }
}
