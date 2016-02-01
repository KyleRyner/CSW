using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using CswLibrarySite.Models;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;

namespace CswLibrarySite.Models.Authors
{
    public partial class Default : System.Web.UI.Page
    {
		protected CswLibrarySite.Models.ApplicationDbContext _db = new CswLibrarySite.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Model binding method to get List of Author entries
        // USAGE: <asp:ListView SelectMethod="GetData">
        public IQueryable<CswLibrarySite.Models.Author> GetData()
        {
            return _db.Authors;
        }

        /*
        public IQueryable<CswLibrarySite.Models.Book> GetBooksByAuthor([FriendlyUrlSegmentsAttribute(0)]int? AuthorID)
        {
            return _db.Books.Find(AuthorID); ;
        }
        */
    }
}

