using BLL.Interfaces;
using DAL.Interfaces;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class CategoryLogic : ICategoryLogic
    {
        private ICategoryDao _categoryDao;
        public CategoryLogic(ICategoryDao categoryDao)
        {
            _categoryDao = categoryDao;
        }
        public bool Add(Category category)
        {
            return _categoryDao.Add(category);
        }

        public bool DeleteById(int id)
        {
            return _categoryDao.DeleteById(id);
        }

        public IEnumerable<Category> GetAll()
        {
            return _categoryDao.GetAll();
        }

        public Category GetById(int id)
        {
            return _categoryDao.GetById(id);
        }

        public bool Update(int id, Category newCategory)
        {
            return _categoryDao.Update(id, newCategory);
        }
    }
}
