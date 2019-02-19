using DMS.Business;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DMS.Web.Controllers
{
    public class UserController : Controller
    {

         

        private readonly IUserBusiness _IUserBusiness;

        public UserController(): this (new UserBusiness()){}

        public UserController(IUserBusiness IUserBusiness)
        {
            _IUserBusiness=IUserBusiness;
        }

        private static Logger logger = LogManager.GetCurrentClassLogger();

        //
        // GET: /User/
        public ActionResult Index()
        {
            try
            {
                logger.Error("mallesh");
                //int x = 0, y = 20;
                //int sum = y/ x;
            }
            catch(Exception ex)
            {
                logger.Error(ex.Message);
            }
          
            return View();
        }
	}
}