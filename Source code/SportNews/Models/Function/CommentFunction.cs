using SportNews.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportNews.Models.Function
{
    public class CommentFunction
    {
        private readonly MyDB _context;
        public CommentFunction()
        {
            _context = new MyDB();
        }

        public string GetSubcriberComment(int id)
        {
            var result =  _context.Subscribers.Where(x => x.id == id)
                .Select(x => x.name)
                .FirstOrDefault();
            return result;
        }
    }
}