using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace CswLibrarySite.Models
{
    public class Author
    {
        public int AuthorID { get; set; }

        [Required(ErrorMessage = "Name is Required")]
        public string Name { get; set; }
        public string Bio { get; set; }

        public ICollection<Book> Books { get; set; } // This is the list of books

        public class CswLibraryDbContext : DbContext
        {

            public DbSet<Author> Authors { get; set; }

        }
    }
}