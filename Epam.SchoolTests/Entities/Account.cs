using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Account
    {
        public int Id { get; set; }

        public string Login { get; set; }

        public string Password { get; set; }

        public string Role { get; set; }
        public Account(string login, string password)
        {
            Login = login;
            Password = password;
        }
        public Account(string login, int id)
        {
            Login = login;
            Id = id;
        }
        public Account(int id, string login, string role)
        {
            Login = login;
            Role = role;
            Id = id;
        }

        public Account(string login, string password, string role)
        {
            Login = login;
            Password = password;
            Role = role;
        }

    }
}
