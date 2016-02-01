using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using CswLibrarySite.Models;

namespace CswLibrarySite.Models.Categories
{
    public partial class Default : System.Web.UI.Page
    {
		protected CswLibrarySite.Models.ApplicationDbContext _db = new CswLibrarySite.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Model binding method to get List of Category entries
        // USAGE: <asp:ListView SelectMethod="GetData">
        public IQueryable<CswLibrarySite.Models.Category> GetData()
        {
            return _db.Categories;
        }
    }
}

