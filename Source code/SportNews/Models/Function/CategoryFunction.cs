using SportNews.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportNews.Models.Function
{
    public class CategoryFunction
    {
        private MyDB context;

        public CategoryFunction()
        {
            context = new MyDB(); 
        }

        public List<Category> GetAll()
        {
            var listCategories = context.Categories.ToList();
            return listCategories;
        }
    }
}