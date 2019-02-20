using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DMS.EntityLayer
{
    public class User:PrimaryEntity
    {
       // public string UserName { get; set; }
       
        public string password { get; set; }
    }
}
