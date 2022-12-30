using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace SportNews.Models.Entities
{
    [Table("Contact")]
    public class Contact
    {
        public Contact()
        {
            createddate = DateTime.Now;
        }
        public int id { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string contents { get; set; }
        public DateTime createddate { get; set; }
    }
}