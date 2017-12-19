using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MAT2_Practicum
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Auth"] = "false";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            DataView view = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if(view.Count > 0)
            {
                Label1.Text = "Student with that username already exists";
            }
            else
            {
                SqlDataSource1.Insert();
                Label1.Text = "Student registered successfully";
            }           
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DataView view = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if(TextBox6.Text == view[0][1].ToString())
            {
                Session["Auth"] = "true";
            }
        }
    }
}