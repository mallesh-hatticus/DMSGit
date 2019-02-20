using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DMS.EntityLayer
{
    public class Login:PrimaryEntity
    {
        [EmailAddress(ErrorMessage = "The email address is required")]
        
        [Display(Name = "Email")]
        public string Log_Email { get; set; }

        [Required(ErrorMessage = "Please Enter Password")]
        [Display(Name = "Password")]
        [DataType(DataType.Password)]
        public string Log_Pwd { get; set; }
    }
}
