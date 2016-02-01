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
    public partial class Edit : System.Web.UI.Page
    {
		protected CswLibrarySite.Models.ApplicationDbContext _db = new CswLibrarySite.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Update methd to update the selected Category item
        // USAGE: <asp:FormView UpdateMethod="UpdateItem">
        public void UpdateItem(int  CategoryID)
        {
            using (_db)
            {
                var item = _db.Categories.Find(CategoryID);

                if (item == null)
                {
                    // The item wasn't found
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", CategoryID));
                    return;
                }

                TryUpdateModel(item);

                if (ModelState.IsValid)
                {
                    // Save changes here
                    _db.SaveChanges();
                    Response.Redirect("../Default");
                }
            }
        }

        // This is the Select method to selects a single Category item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public CswLibrarySite.Models.Category GetItem([FriendlyUrlSegmentsAttribute(0)]int? CategoryID)
        {
            if (CategoryID == null)
            {
                return null;
            }

            using (_db)
            {
                return _db.Categories.Find(CategoryID);
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
