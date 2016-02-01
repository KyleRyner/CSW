using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace CswLibrarySite.Models
{
    public class Book
    {
        public int BookID { get; set; }
        
        [MaxLength(13)]
        [Display(Name = "Barcode")]
        [Required(ErrorMessage = "Barcode is required")]
        public string CodeBar { get; set; }      // EAN / UPC

        [Required(ErrorMessage = "Title is required")]
        public string Title { get; set; }        // Title of the book.

        [Required(ErrorMessage = "Price is required")]
        public decimal Price { get; set; }       // Price of the book.
        public string Description { get; set; }      // Description of the book
        public int Pages { get; set; }                // Number of pages

        /*
        [ForeignKey("CategoryID")]
        public int CategoryID { get; set; } 
        public virtual Category Category { get; set; } // This is the book's category
        
        [ForeignKey("AuthorID")]
        public int AuthorID { get; set; }
        public virtual Author Author { get; set; } // This is the book's author
         */

        // The CategoryId property is scaffolded. It's what
        // gets set in the DropDownList.
        [Display(Name = "Category")]
        public int CategoryID { get; set; }

        // The Category property is the navigation property.
        // This property is not scaffolded but it creates the 
        // association between products and categories.
        public Category Category { get; set; }

        // The AuthorID property is scaffolded. It's what
        // gets set in the DropDownList.
        [Display(Name = "Author")]
        public int AuthorID { get; set; }

        // The Author property is the navigation property.
        // This property is not scaffolded but it creates the 
        // association between products and categories.
        public Author Author { get; set; }

        public class CswLibraryDbContext : DbContext
        {

            public DbSet<Book> Books { get; set; }

        }
    }
}