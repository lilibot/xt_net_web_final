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
    public class TestLogic : ITestLogic
    {
        private ITestDao _testDao;
        public TestLogic(ITestDao testDao)
        {
            _testDao = testDao;
        }
        public bool AddTest(Test test)
        {
            return _testDao.AddTest(test);
        }

        public bool AddTestingResult(Testing testingResult)
        {
            return _testDao.AddTestingResult(testingResult);
        }

        public Test GetAllTestById(int testId)
        {
            return _testDao.GetAllTestById(testId);
        }

        public IEnumerable<Answer> GetCorrectAnswersByTestId(int testId)
        {
            return _testDao.GetCorrectAnswersByTestId(testId);
        }

        public IEnumerable<Test> GetListOfTests()
        {
            return _testDao.GetListOfTests();
        }
    }
}
