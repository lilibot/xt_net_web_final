using DAL.Interfaces;
using Entities;
using log4net;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class CategoryDao : ICategoryDao
    {
        private readonly ILog _log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
        private string _connectionString = "Data Source=DESKTOP-DC73STR\\SQLEXPRESS;Initial Catalog=SchoolTests;Integrated Security=True";
        public bool Add(Category category)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.AddCategory";
                command.Parameters.AddWithValue("@name", category.Name);
                var idParameter = new SqlParameter()
                {
                    DbType = DbType.Int32,
                    ParameterName = "@id",
                    Value = category.ID,
                    Direction = ParameterDirection.Output,
                };
                command.Parameters.Add(idParameter);
                connection.Open();
                try
                {

                    command.ExecuteNonQuery();
                    category.ID = (int)idParameter.Value;
                    return true;
                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                    throw e;
                }
            }
        }

        public bool DeleteById(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.RemoveCategoryById";
                command.Parameters.AddWithValue("@id", id);
                var returnValue = new SqlParameter()
                {
                    DbType = DbType.Int32,
                    ParameterName = "@Return",
                    Direction = ParameterDirection.ReturnValue,
                };
                command.Parameters.Add(returnValue);
                connection.Open();
                try
                {
                    command.ExecuteNonQuery();

                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                }
                var sotredProcResult = (int)returnValue.Value;
                if (sotredProcResult == 1)
                {
                    throw new KeyNotFoundException("Category with this id does not exist");
                }
                else
                {
                    return sotredProcResult == 0;
                }
            }
        }

        public IEnumerable<Category> GetAll()
        {
            var categories = new List<Category>();
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.GetCategories";
                connection.Open();
                try
                {
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        categories.Add(new Category { ID = (int)reader["id"], Name = reader["name"] as string });
                    }
                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                }

            }
            return categories;
        }

        public Category GetById(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.GetCategoryById";
                command.Parameters.AddWithValue("@id", id);
                connection.Open();
                try
                {
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        return new Category
                        {
                            ID = (int)reader["id"],
                            Name = reader["name"] as string
                        };
                    }

                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                }
                return null;
            }
        }

        public bool Update(int id, Category newCategory)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "UpdateCategory";
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@Id", id);
                command.Parameters.AddWithValue("@name", newCategory.Name);

                connection.Open();
                try
                {
                    int result = command.ExecuteNonQuery();
                    return result == 0;
                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                }
                return false;

            }
        }
    }
}
