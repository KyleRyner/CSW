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

namespace CswLibrarySite.Models.Categories
{
    public partial class Delete : System.Web.UI.Page
    {
		protected CswLibrarySite.Models.ApplicationDbContext _db = new CswLibrarySite.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected Category item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int CategoryID)
        {
            using (_db)
            {
                var item = _db.Categories.Find(CategoryID);

                if (item != null)
                {
                    _db.Categories.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single Category item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public CswLibrarySite.Models.Category GetItem([FriendlyUrlSegmentsAttribute(0)]int? CategoryID)
        {
            if (CategoryID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.Categories.Where(m => m.CategoryID == CategoryID).FirstOrDefault();
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

