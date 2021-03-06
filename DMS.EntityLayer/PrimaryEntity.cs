﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DMS.EntityLayer
{
   public class PrimaryEntity
    {
        public int UserID { get; set; }
        public int ProjectID { get; set; }
        public int FileUploadID { get; set; }

        
        public string UsrEmail { get; set; }
        public string UsrName { get; set; }
        public int RoleID { get; set; }
        public int ShiftID { get; set; }
        public int ErrorCode { get; set; }
        public string RespMsg { get; set; }
    }
}
