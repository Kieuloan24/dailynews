using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace SportNews.Models.Entities
{
    [Table("Comment")]
    public class Comment
    {
        public Comment()
        {
            createddate = DateTime.Now;
        }
        public int id { get; set; }
        public int news_id { get; set; }
        public int subscriber_id { get; set; }
        public string contents { get; set; }
        public DateTime createddate { get; set; }
        //public virtual Subscriber Subscriber { get; set; }
    }
}