using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace CswLibrarySite.Models
{
    public class Category
    {
        public int CategoryID { get; set; }

        [Required(ErrorMessage = "Name is Required")]
        public string CategoryName { get; set; }

        public string Description { get; set; }

        public virtual ICollection<Book> Books { get; set; } // This is the list of books

        public class CswLibraryDbContext : DbContext
        {

            public DbSet<Category> Categories { get; set; }

        }
    }
}