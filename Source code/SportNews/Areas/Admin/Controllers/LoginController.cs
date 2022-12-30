using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SportNews.Models.Entities;

namespace SportNews.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(Account account)
        {
            if (account == null)
            {
                return View();
            }

            if (ModelState.IsValid)
            {
                using (MyDB db = new MyDB())
                {
                    var obj = db.Accounts.Where(a => a.username.Equals(account.username) && a.password.Equals(account.password)).FirstOrDefault();
                    if (obj != null)
                    {
                        Session["UserID"] = obj.id.ToString();
                        Session["UserName"] = obj.username.ToString();
                        return Redirect("/Admin/Homes/Index");
                    }
                }
            }
            return View(account);
        }
    }
}