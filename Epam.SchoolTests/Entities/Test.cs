using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Test
    {
        public int ID { get; set; }
        public string Description { get; set; }
        public int Time { get; set; }
        public Category Category { get; set; }
        public Subject Subject { get; set; }
        public IEnumerable<Question> Questions { get; set; }
        public Test()
        {
            Questions =new List<Question>();
        }
    }
}
