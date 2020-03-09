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
    public class SubjectDao : ISubjectDao
    {
        private string _connectionString = "Data Source=DESKTOP-DC73STR\\SQLEXPRESS;Initial Catalog=SchoolTests;Integrated Security=True";
        public bool Add(Subject subject)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.AddSubject";
                command.Parameters.AddWithValue("@name", subject.Name);
                var idParameter = new SqlParameter()
                {
                    DbType = DbType.Int32,
                    ParameterName = "@id",
                    Value = subject.ID,
                    Direction = ParameterDirection.Output,
                };
                command.Parameters.Add(idParameter);
                connection.Open();
                command.ExecuteNonQuery();
                subject.ID = (int)idParameter.Value;
                return true;
            }
        }

        public bool DeleteById(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.RemoveSubjectById";
                command.Parameters.AddWithValue("@id", id);
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
                    throw new Exception("Subject with this id does not exist");
                }
                else
                {
                    return sotredProcResult == 0;
                }
            }
        }

        public IEnumerable<Subject> GetAll()
        {
            var subjects = new List<Subject>();
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.GetSubjects";
                connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                {
                    subjects.Add(new Subject { ID = (int)reader["id"], Name = reader["name"] as string });
                }

            }
            return subjects;
        }


        public Subject GetById(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.GetSubjectById";
                command.Parameters.AddWithValue("@id", id);
                connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                {
                    return new Subject
                    {
                        ID = (int)reader["id"],
                        Name = reader["name"] as string
                    };
                }
                return null;
            }
        }

        public bool Update(int id, Subject newSubject)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "UpdateSubject";
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@Id", id);
                command.Parameters.AddWithValue("@name", newSubject.Name);

                connection.Open();

                int result = command.ExecuteNonQuery();
                return result == 0;
            }
        }
    }
}
