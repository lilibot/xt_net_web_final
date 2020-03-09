using DAL.Interfaces;
using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class AccountDao : IAccountDao
    {
        private string _connectionString = "Data Source=DESKTOP-DC73STR\\SQLEXPRESS;Initial Catalog=SchoolTests;Integrated Security=True";


        public bool Add(Account account)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "AddAccount";
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Login", account.Login);
                command.Parameters.AddWithValue("@Password", account.Password);
                command.Parameters.AddWithValue("@RoleId", account.Role);
                var returnValue = new SqlParameter()
                {
                    DbType = DbType.Int32,
                    ParameterName = "@Return",
                    Direction = ParameterDirection.ReturnValue,
                };
                command.Parameters.Add(returnValue);
                connection.Open();

                command.ExecuteNonQuery();
                var sotredProcResult = (int)returnValue.Value;
                if (sotredProcResult == 1)
                {
                    throw new Exception("Account with this login exists");
                }
                else
                {
                    return sotredProcResult == 0;
                }
            }
        }

        public bool CheckUser(string login, string password)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "GetAccountByLoginAndPassword";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Login", login);
                var returnValue = new SqlParameter()
                {
                    DbType = DbType.String,
                    ParameterName = "@Password",
                    Value = password,
                    Direction = ParameterDirection.Input,
                };
                command.Parameters.Add(returnValue);
                connection.Open();
                var reader = command.ExecuteReader();
                if (reader.HasRows)
                    {
                    reader.Read();
                }
                return reader.HasRows;
            }
        }
        public string GetRole(string login)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "GetRole";
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Login", login);
                connection.Open();

                var reader = command.ExecuteReader();
                string role = string.Empty;
                while (reader.Read())
                {
                    role = (string)reader["RoleName"];
                }

                return role;
            }
        }
        public IEnumerable<Account> GetAll()
        {
            var accounts = new List<Account>();
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandText = "GetAccounts";
                command.CommandType = CommandType.StoredProcedure;
                connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                {
                    accounts.Add(new Account((int)reader["accountId"], reader["login"] as string, reader["roleName"] as string));
                }

            }
            return accounts;
        }
        public bool UpdateRole(int idAccount, int idRole)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandText = "UpdateAccount";
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@idAccount", idAccount);
                command.Parameters.AddWithValue("@idRole", idRole);
                connection.Open();
                var reader = command.ExecuteReader();

            }
            return true;
        }
        public int GetId(string login)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "GetAccountId";
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Login", login);
                connection.Open();

                var reader = command.ExecuteReader();
                while (reader.Read())
                {
                    return (int)reader["id"];
                }
                return 0;
            }
        }
    }
}
