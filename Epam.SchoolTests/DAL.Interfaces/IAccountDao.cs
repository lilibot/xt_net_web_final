using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IAccountDao
    {
        int GetId(string login);
        bool Add(Account account);
        string GetRole(string login);
        bool CheckUser(string login, string password);
        IEnumerable<Account> GetAll();
        bool UpdateRole(int idAccount, int idRole);
    }
}
