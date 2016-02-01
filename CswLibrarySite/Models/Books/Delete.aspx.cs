using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using CswLibrarySite.Models;

namespace CswLibrarySite.Models.Books
{
    public partial class Delete : System.Web.UI.Page
    {
		protected CswLibrarySite.Models.ApplicationDbContext _db = new CswLibrarySite.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected Book item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int BookID)
        {
            using (_db)
            {
                var item = _db.Books.Find(BookID);

                if (item != null)
                {
                    _db.Books.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single Book item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public CswLibrarySite.Models.Book GetItem([FriendlyUrlSegmentsAttribute(0)]int? BookID)
        {
            if (BookID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.Books.Where(m => m.BookID == BookID).Include(m => m.Author).Include(m => m.Category).FirstOrDefault();
            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("../Default");
            }
        }
    }
}

