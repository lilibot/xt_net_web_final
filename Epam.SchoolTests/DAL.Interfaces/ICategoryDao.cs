using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface ICategoryDao
    {
        bool Add(Category category);
        IEnumerable<Category> GetAll();
        Category GetById(int id);
        bool Update(int id, Category newCategory);
        bool DeleteById(int id);
    }
}
