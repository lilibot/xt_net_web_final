using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Testing
    {
        public int ID { get; set; }
        public DateTime Date { get; set; }
        public int Test { get; set; }
        public int Account { get; set; }
        public List<TestingResult> TestingResult { get; set; }
        public Testing()
        {
            List<TestingResult> TestingResult = new List<TestingResult>();
        }
    }
}
