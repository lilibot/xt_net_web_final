using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ICategoryLogic
    {
        bool Add(Category category);
        IEnumerable<Category> GetAll();
        Category GetById(int id);
        bool DeleteById(int id);
        bool Update(int id, Category newCategory);
    }
}
