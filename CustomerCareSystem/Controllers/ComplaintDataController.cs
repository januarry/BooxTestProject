using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CustomerCareSystem.Models;

namespace CustomerCareSystem.Controllers
{
    
    public class ComplaintDataController : ApiController
    {
        CustomerCareDBEntities db = new CustomerCareDBEntities();
        public IQueryable<Complaints> GetComplaints()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.Complaints;
        }

        public Complaints GetComplaints(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.Complaints.Find(id);
        }
    }
}
