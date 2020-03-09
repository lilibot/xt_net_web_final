using BLL;
using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Epam.SchoolTests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ioc
{
    public class DependencyResolver
    {
        public static IAccountLogic AccountLogic { get; private set; }
        public static IAccountDao AccountDao { get; private set; }
        public static ICategoryLogic CategoryLogic { get; private set; }
        public static ICategoryDao CategoryDao { get; private set; }
        public static ISubjectLogic SubjectLogic { get; private set; }
        public static ISubjectDao SubjectDao { get; private set; }
        public static ITestLogic TestLogic { get; private set; }
        public static ITestDao TestDao { get; private set; }
        static DependencyResolver()
        {
            AccountDao = new AccountDao();
            AccountLogic = new AccountLogic(AccountDao);
            CategoryDao = new CategoryDao();
            CategoryLogic = new CategoryLogic(CategoryDao);
            SubjectDao = new SubjectDao();
            SubjectLogic = new SubjectLogic(SubjectDao);
            TestDao = new TestDao();
            TestLogic = new TestLogic(TestDao);
        }
    }
}
