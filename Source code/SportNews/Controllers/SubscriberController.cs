using SportNews.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SportNews.Controllers
{
    public class SubscriberController : Controller
    {
        private readonly MyDB _context;
        public SubscriberController()
        {
            _context = new MyDB();
        }
        // GET: Subscriber
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(Subscriber subscriber)
        {
            if (subscriber != null)
            {
                _context.Subscribers.Add(subscriber);
                _context.SaveChanges();
                return Redirect("/subscriber/success");
            }
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Subscriber subscriber)
        {
            if (subscriber == null)
            {
                return View();
            }

            if (ModelState.IsValid)
            {
                using (MyDB db = new MyDB())
                {
                    var obj = db.Subscribers.Where(a => a.username.Equals(subscriber.username) && a.password.Equals(subscriber.password)).FirstOrDefault();
                    if (obj != null)
                    {
                        Session["SubscriberID"] = obj.id.ToString();
                        Session["SubscriberName"] = obj.username.ToString();
                        return Redirect("/home/index");
                    }
                }
            }
            return View(subscriber);
        }

        public ActionResult Success()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session["SubscriberID"] = "";
            Session["SubscriberName"] = "";
            return Redirect("/home/index");
        }
    }
}