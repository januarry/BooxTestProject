using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CustomerCareSystem.Models;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CustomerCareSystem
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                LoadStores();
            }

            if (Context.User.Identity.Name == "admin")
            {
                btnModalAdd.Visible = false;
                GridViewComplaints.Columns[0].Visible = true;
            }
        }

        protected void LoadStores()
        {
            string queryString = null;
            if(Context.User.Identity.Name == "admin"){
                queryString = "SELECT ID, CustomerID, Complaint, CreateDate, Status FROM COMPLAINTS ORDER BY CreateDate DESC ";
            }else{
                queryString = "SELECT C.CustomerID, C.Complaint, C.CreateDate, C.Status FROM Users as U INNER JOIN Complaints as C on U.id = C.CustomerID WHERE U.Username = '" + Context.User.Identity.Name + "' ORDER BY C.CreateDate DESC";
            }
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CustomerCareConnection"].ConnectionString);
            SqlDataAdapter sda = new SqlDataAdapter(queryString, con);
            sda.Fill(ds);
            GridViewComplaints.DataSource = ds;
            GridViewComplaints.DataBind();
            GridViewComplaints.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void ModalAdd_Click(object sender, EventArgs e)
        {
            this.ModalPopupExtender1.Show();
        }

        protected void AddComplaint_Click(object sender, EventArgs e)
        {
            using (CustomerCareDBEntities entityContext = new CustomerCareDBEntities())
            {
                var user = entityContext.Users.Where(q => q.Username == Context.User.Identity.Name).Single();

                Complaints complaint = new Complaints();
                complaint.CustomerID = user.ID;
                complaint.Complaint = txtComplaint.Text;
                complaint.CreateDate = DateTime.Now;
                complaint.Status = "S";

                entityContext.Complaints.Add(complaint);
                entityContext.SaveChanges();
            }

            Response.Redirect("~/Dashboard.aspx", true);
        }


        protected void ModalStatus_Click(object sender, EventArgs e)
        {
            GridViewRow gRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            int indexRow = gRow.RowIndex;
            lblId.Text = GridViewComplaints.Rows[indexRow].Cells[1].Text;
            txtShowComplaint.Text = GridViewComplaints.Rows[indexRow].Cells[3].Text;
            this.ModalPopupExtender2.Show();
        }

        protected void EditStatus_Click(object sender, EventArgs e)
        {
           using(CustomerCareDBEntities entityContext = new CustomerCareDBEntities())
           {
               Complaints complaint = entityContext.Complaints.Find(Convert.ToInt32(lblId.Text));
               complaint.Status = selectStatus.Value == "Finished" ? "F" : "O";
               entityContext.SaveChanges();
           }

           Response.Redirect("~/Dashboard.aspx", true);

        }



    }
}