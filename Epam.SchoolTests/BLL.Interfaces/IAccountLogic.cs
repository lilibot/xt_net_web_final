using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IAccountLogic
    {
        bool Add(Account account);
        string GetRole(string login);
        bool CheckUser(string login, string password);
        IEnumerable<Account> GetAll();
        bool UpdateRole(int idAccount, int idRole);
        int GetId(string login);
    }
}
