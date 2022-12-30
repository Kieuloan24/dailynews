using SportNews.Models.Entities;
using SportNews.Models.Function;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace SportNews.Controllers
{
    public class HomeController : Controller
    {
        private readonly MyDB _context;
        public HomeController()
        {
            _context = new MyDB();
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Detail(int id)
        {
            var result = new ArticleFunction().FindEntity(id);
            var listComments = new List<Comment>();
            listComments = _context.Comments.ToList()
                .Where(x => x.news_id == id).ToList();
            ViewBag.ListComments = listComments;
            return View(result);
        }

        public ActionResult Category(int id)
        {
            var result = new ArticleFunction().GetArticleByCategoriesId(id);
            return View(result);
        }

        public ActionResult KQTimKiem(string txttimkiem)
        {
            var db = new MyDB();
            var article = db.Articles.Where(p => string.IsNullOrEmpty(p.title) == false &&
                                                    p.title.ToLower().Contains(txttimkiem))
                                                    .ToList();
            return View(article);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult SendRequest(Contact contact)
        {
            if (contact != null)
            {
                _context.Contacts.Add(contact);
                _context.SaveChanges();
                return Redirect("/home/sendsucces");
            }
            return View();
        }

        public ActionResult SendSucces()
        {
            return View();
        }
    }
}