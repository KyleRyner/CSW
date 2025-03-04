﻿using System;
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
    public partial class Delete : System.Web.UI.Page
    {
		protected CswLibrarySite.Models.ApplicationDbContext _db = new CswLibrarySite.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected Author item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int AuthorID)
        {
            using (_db)
            {
                var item = _db.Authors.Find(AuthorID);

                if (item != null)
                {
                    _db.Authors.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single Author item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public CswLibrarySite.Models.Author GetItem([FriendlyUrlSegmentsAttribute(0)]int? AuthorID)
        {
            if (AuthorID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.Authors.Where(m => m.AuthorID == AuthorID).FirstOrDefault();
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

