using BLL.Interfaces;
using Entities;
using Ioc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebPL.Models
{
    public class Common
    {
        public Account Account { get; set; }
        public static string DateFormat
        {
            get { return "yyyy-MM-dd"; }
            private set { }
        }
    }
}