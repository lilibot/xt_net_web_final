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
    public class SubjectLogic : ISubjectLogic
    {
        private ISubjectDao _subjectDao;
        public SubjectLogic(ISubjectDao subjectDao)
        {
            _subjectDao = subjectDao;
        }
        public bool Add(Subject subject)
        {
            return _subjectDao.Add(subject);
        }

        public bool DeleteById(int id)
        {
            return _subjectDao.DeleteById(id);
        }

        public IEnumerable<Subject> GetAll()
        {
            return _subjectDao.GetAll();
        }

        public Subject GetById(int id)
        {
            return _subjectDao.GetById(id);
        }

        public bool Update(int id, Subject newSubject)
        {
            return _subjectDao.Update(id, newSubject);
        }
    }
}
