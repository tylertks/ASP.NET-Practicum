using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MAT2_Practicum
{
    public partial class RegisterForCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Auth"] != "true")
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            DataView view = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if(view.Count > 0)
            {
                //Label1.Text = view[0][3].ToString();
                if(view[0][3].ToString().ToLower() == "true")
                {
                    SqlDataSource3.Update();
                }
                else
                {
                    Label1.Text = "Student #" + view[0][1].ToString() + " is already registered for class " + view[0][2].ToString();
                }
            }
            else
            {
                SqlDataSource3.Insert();
            }
            
            
        }
    }
}