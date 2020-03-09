using BLL.Interfaces;
using DAL.Interfaces;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Epam.SchoolTests
{
    public class AccountLogic : IAccountLogic
    {
        private IAccountDao _accountDao;

        public AccountLogic(IAccountDao accountDao)
        {
            _accountDao = accountDao;
        }
        public bool Add(Account account)
        {
            account.Password = GetPasswordsHash(account.Password);
            return _accountDao.Add(account);
        }
        public string GetRole(string login)
        {
            return _accountDao.GetRole(login);
        }

        public bool CheckUser(string login, string password)
        {
            var passHash = GetPasswordsHash(password);
            return _accountDao.CheckUser(login, passHash);
        }
        public IEnumerable<Account> GetAll()
        {
            return _accountDao.GetAll();
        }
        public bool UpdateRole(int idAccount, int idRole)
        {
            return _accountDao.UpdateRole(idAccount, idRole);
        }
        
        private static string GetPasswordsHash(string input)
        {
            var bytes = System.Text.Encoding.UTF8.GetBytes(input);
            using (var hash = System.Security.Cryptography.SHA512.Create())
            {
                var hashedInputBytes = hash.ComputeHash(bytes);

                var hashedInputStringBuilder = new System.Text.StringBuilder(128);
                foreach (var b in hashedInputBytes)
                {
                    hashedInputStringBuilder.Append(b.ToString("X2"));
                }

                return hashedInputStringBuilder.ToString();
            }
        }

        public int GetId(string login)
        {
            return _accountDao.GetId(login);
        }
    }
}
