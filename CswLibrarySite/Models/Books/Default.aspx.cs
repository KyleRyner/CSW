using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using CswLibrarySite.Models;

namespace CswLibrarySite.Models.Books
{
    public partial class Default : System.Web.UI.Page
    {
		protected CswLibrarySite.Models.ApplicationDbContext _db = new CswLibrarySite.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Model binding method to get List of Book entries
        // USAGE: <asp:ListView SelectMethod="GetData">
        public IQueryable<CswLibrarySite.Models.Book> GetData()
        {
            return _db.Books.Include(m => m.Author).Include(m => m.Category);
        }
    }
}

