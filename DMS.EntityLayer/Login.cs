using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DMS.EntityLayer
{
    public class Login:PrimaryEntity
    {
        public string Log_Email { get; set; }
        public string Log_Pwd { get; set; }
    }
}
