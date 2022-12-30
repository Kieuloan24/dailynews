using SportNews.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportNews.Models.Function
{
    public class ArticleFunction
    {
        private MyDB context;

        public ArticleFunction()
        {
            context = new MyDB();
        }

        public Article GetArticleSlide()
        {
            var listArticles = context.Articles.FirstOrDefault();
            return listArticles;
        }

        public List<Article> GetArticleVietNam()
        {
            var listArticles = context.Articles.Where(x => x.id_category == 1).Take(3).ToList();
            return listArticles;
        }

        public List<Article> GetArticleGlobal()
        {
            var listArticles = context.Articles.Where(x => x.id_category == 2).Take(4).ToList();
            return listArticles;
        }

        public Article GetArticleHotLeft()
        {
            var result = context.Articles.Where(x => x.Category.name == "Bóng đá Việt Nam").FirstOrDefault();
            return result;
        }

        public Article GetArticleHotRight()
        {
            var result = context.Articles.Where(x => x.Category.name == "Bóng đá Quốc tế").FirstOrDefault();
            return result;
        }

        public List<Article> GetArticlesTranfer()
        {
            var listArticles = context.Articles.Where(x => x.Category.name == "Chuyển Nhượng").Take(3).ToList();
            return listArticles;
        }
        public Article GetArticlesTranferHot()
        {
            var result = context.Articles.Where(x => x.Category.name == "Chuyển Nhượng").FirstOrDefault();
            return result;
        }

        public List<Article> GetArticlesEsports()
        {
            var listArticles = context.Articles.Where(x => x.Category.name == "Esport").Take(3).ToList();
            return listArticles;
        }

        public Article GetArticlesEsportsHot()
        {
            var result = context.Articles.Where(x => x.Category.name == "Esport").FirstOrDefault();
            return result;
        }

        public Article FindEntity(int id)
        {
            Article dbEntry = context.Articles.Find(id);
            return dbEntry;
        }

        public List<Article> GetArticleByCategoriesId(int id)
        {
            var listNews = context.Articles.Where(x => x.id_category == id).Take(5).ToList();
            return listNews;
        }
    }
}