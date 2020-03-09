using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ITestLogic
    {
        bool AddTest(Test test);
        IEnumerable<Test> GetListOfTests();
        Test GetAllTestById(int testId);
        IEnumerable<Answer> GetCorrectAnswersByTestId(int testId);
        bool AddTestingResult(Testing testingResult);
    }
}
