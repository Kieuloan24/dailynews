using SportNews.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SportNews.Controllers
{
    public class CommentController : Controller
    {
        private readonly MyDB _contect;
        public CommentController()
        {
            _contect = new MyDB();
        }
        // GET: Comment
        public ActionResult SendComment(Comment comment)
        {
            if (comment != null)
            {
                _contect.Comments.Add(comment);
                _contect.SaveChanges();
                return Redirect("/home/detail/" + comment.news_id);
            }
            return View();
        }
    }
}