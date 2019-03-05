using DMS.Business;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DMS.EntityLayer;
using DMS.Constat;

namespace DMS.Web.Controllers
{
    public class UserController : Controller
    {



        private readonly IUserBusiness _IUserBusiness;

        public UserController() : this(new UserBusiness()) { }

        public UserController(IUserBusiness IUserBusiness)
        {
            _IUserBusiness = IUserBusiness;
        }

        private static Logger logger = LogManager.GetCurrentClassLogger();


        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Login ObjLoginvalidate)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    User objloggedusr = new User();
                    objloggedusr = _IUserBusiness.ValidateLoggedUsr(ObjLoginvalidate);
                    ObjLoginvalidate.RespMsg = ObjLoginvalidate.RespMsg;
                    if (objloggedusr.RespMsg.ToLower() == WebConstat.success.ToLower())
                    {
                        return RedirectToAction("Success");

                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, objloggedusr.RespMsg);
                        return View(ObjLoginvalidate);
                      
                    }
                   


                }
                else
                {
                    //ModelState.AddModelError(string.Empty, "The item cannot be removed");
                    return View(ObjLoginvalidate);
                }

            }
            catch
            {
                return View();
            }
        }


        public ActionResult Success()
        {
            return View();
        }

        public ActionResult Registration_Page()
        {
            try
            {
                User objuser = new User();
                objuser.UsrName = "santosh";
                objuser.password = "abc123";
                objuser.UsrEmail = "santosh@gmail.comm";



                objuser = _IUserBusiness.InsertProduct(objuser);
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
            }

            return View();
        }
    }
}