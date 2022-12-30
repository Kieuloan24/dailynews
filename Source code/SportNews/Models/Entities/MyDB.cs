namespace SportNews.Models.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyDB : DbContext
    {
        public MyDB()
            : base("name=MyDB")
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Article> Articles { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Permission> Permissions { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<Subscriber> Subscribers { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>()
                .Property(e => e.phonenumber)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .Property(e => e.username)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.Articles)
                .WithRequired(e => e.Account)
                .HasForeignKey(e => e.createdById)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Articles)
                .WithOptional(e => e.Category)
                .HasForeignKey(e => e.id_category);

            //modelBuilder.Entity<Subscriber>()
            //    .HasMany(e => e.Comments)
            //    .WithOptional(e => e.Subscriber)
            //    .HasForeignKey(e => e.subscriber_id);

            modelBuilder.Entity<Permission>()
                .HasMany(e => e.Accounts)
                .WithRequired(e => e.Permission)
                .HasForeignKey(e => e.id_permission)
                .WillCascadeOnDelete(false);
        }
    }
}
