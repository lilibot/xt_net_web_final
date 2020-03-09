using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ISubjectLogic
    {
        bool Add(Subject category);
        IEnumerable<Subject> GetAll();
        Subject GetById(int id);
        bool Update(int id, Subject newSubject);
        bool DeleteById(int id);
    }
}
