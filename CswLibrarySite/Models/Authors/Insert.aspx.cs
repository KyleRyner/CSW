using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using CswLibrarySite.Models;

namespace CswLibrarySite.Models.Authors
{
    public partial class Insert : System.Web.UI.Page
    {
		protected CswLibrarySite.Models.ApplicationDbContext _db = new CswLibrarySite.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // This is the Insert method to insert the entered Author item
        // USAGE: <asp:FormView InsertMethod="InsertItem">
        public void InsertItem()
        {
            using (_db)
            {
                var item = new CswLibrarySite.Models.Author();

                TryUpdateModel(item);

                if (ModelState.IsValid)
                {
                    // Save changes
                    _db.Authors.Add(item);
                    _db.SaveChanges();

                    Response.Redirect("Default");
                }
            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("Default");
            }
        }
    }
}
