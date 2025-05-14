using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginPage
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Retrieve values from the GridView row that is being updated
            string sno = GridView2.DataKeys[e.RowIndex].Value.ToString();
            //string partNo = ((TextBox)GridView2.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
           // string code = ((TextBox)GridView2.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

            // Debugging: print out or log the values being passed
            Debug.WriteLine($"Updating record: Sno={sno}");

            // Ensure the values match what's expected
        }

        protected void GridView2_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.AffectedRows > 0)
                Label1.Text = "Owner details updated successfully!";
            else
                Label1.Text = "No changes were made.Update function not working commit to branch1";
        }
        
    }
}
