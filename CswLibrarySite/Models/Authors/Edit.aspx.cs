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
namespace CswLibrarySite.Models.Authors
{
    public partial class Edit : System.Web.UI.Page
    {
		protected CswLibrarySite.Models.ApplicationDbContext _db = new CswLibrarySite.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Update methd to update the selected Author item
        // USAGE: <asp:FormView UpdateMethod="UpdateItem">
        public void UpdateItem(int  AuthorID)
        {
            using (_db)
            {
                var item = _db.Authors.Find(AuthorID);

                if (item == null)
                {
                    // The item wasn't found
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", AuthorID));
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

        // This is the Select method to selects a single Author item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public CswLibrarySite.Models.Author GetItem([FriendlyUrlSegmentsAttribute(0)]int? AuthorID)
        {
            if (AuthorID == null)
            {
                return null;
            }

            using (_db)
            {
                return _db.Authors.Find(AuthorID);
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
