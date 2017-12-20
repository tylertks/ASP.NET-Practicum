using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MAT2_Practicum
{
    public partial class TrackRegistrations : System.Web.UI.Page
    {
        int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Auth"] != "true")
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            GridView1.DataBind();
            Response.Redirect("TrackRegistrations.aspx");
        }
        protected void DetailsView1_ItemUpdated(object sender, DetailsViewCommandEventHandler e)
        {
            GridView1.DataBind();
            Response.Redirect("Default.aspx");

        }

        protected void DetailsView1_ItemUpdated1(object sender, DetailsViewUpdatedEventArgs e)
        {
            //SqlDataSource2.Update();
            GridView1.DataBind();
        }

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView1.DataBind();
        }
    }
}