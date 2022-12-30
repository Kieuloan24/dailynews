namespace SportNews.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Article")]
    public partial class Article
    {
        public Article()
        {
            createdDate = DateTime.Now;
        }

        public int id { get; set; }

        public int? id_category { get; set; }

        public string title { get; set; }

        public string contents { get; set; }

        [StringLength(250)]
        public string images { get; set; }

        public DateTime createdDate { get; set; }

        public int createdById { get; set; }

        [Required]
        public string cre { get; set; }
        public string tags { get; set; }

        public virtual Account Account { get; set; }

        public virtual Category Category { get; set; }
    }
}
