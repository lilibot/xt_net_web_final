using DAL.Interfaces;
using Entities;
using log4net;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class TestDao : ITestDao
    {
        private readonly ILog _log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
        private string _connectionString = "Data Source=DESKTOP-DC73STR\\SQLEXPRESS;Initial Catalog=SchoolTests;Integrated Security=True";
        public bool AddTest(Test test)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.AddTest";
                command.Parameters.AddWithValue("@description", test.Description == null ? (object)DBNull.Value : test.Description);
                command.Parameters.AddWithValue("@time", test.Time);
                command.Parameters.AddWithValue("@idCategory", test.Category.ID);
                command.Parameters.AddWithValue("@idSubject", test.Subject.ID);
                var idParameter = new SqlParameter()
                {
                    DbType = DbType.Int32,
                    ParameterName = "@id",
                    Value = test.ID,
                    Direction = ParameterDirection.Output,
                };
                command.Parameters.Add(idParameter);
                connection.Open();
                try
                {

                    command.ExecuteNonQuery();
                    test.ID = (int)idParameter.Value;
                    foreach (var question in test.Questions)
                    {
                        AddQuestion(test.ID, question);
                    }
                    return true;
                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                    throw e;
                }
            }
        }
        public bool AddQuestion(int testId, Question question)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.AddQuestion";
                command.Parameters.AddWithValue("@text", question.Text);
                command.Parameters.AddWithValue("@image", question.Image == null ? (object)DBNull.Value : Convert.ToBase64String(question.Image));
                command.Parameters.AddWithValue("@idTest", testId);
                var idParameter = new SqlParameter()
                {
                    DbType = DbType.Int32,
                    ParameterName = "@id",
                    Value = question.ID,
                    Direction = ParameterDirection.Output,
                };
                command.Parameters.Add(idParameter);
                connection.Open();
                try
                {

                    command.ExecuteNonQuery();
                    question.ID = (int)idParameter.Value;
                    foreach (var answer in question.Answers)
                    {
                        AddAnswer(question.ID, answer);
                    }
                    return true;
                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                    throw e;
                }
            }
        }
        public bool AddAnswer(int questionId, Answer answer)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.AddAnswer";
                command.Parameters.AddWithValue("@answer", answer.AnswerText);
                command.Parameters.AddWithValue("@IsCorrect", answer.IsCorrect);
                command.Parameters.AddWithValue("@idQuestion", questionId);
                var idParameter = new SqlParameter()
                {
                    DbType = DbType.Int32,
                    ParameterName = "@id",
                    Value = answer.ID,
                    Direction = ParameterDirection.Output,
                };
                command.Parameters.Add(idParameter);
                connection.Open();
                try
                {

                    command.ExecuteNonQuery();
                    answer.ID = (int)idParameter.Value;
                    return true;
                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                    throw e;
                }
            }
        }

        public IEnumerable<Test> GetListOfTests()
        {
            var tests = new List<Test>();
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.GetListOfTests";
                connection.Open();
                try
                {
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        tests.Add(new Test
                        {
                            ID = (int)reader["TestId"],
                            Category = new Category { ID = (int)reader["CategoryId"], Name = reader["CategoryName"] as string },
                            Subject = new Subject { ID = (int)reader["SubjectId"], Name = reader["SubjectName"] as string },
                            Description = reader["Description"] as string,
                            Time = (int)reader["Time"]
                        });
                    }
                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                    throw e;
                }

            }
            return tests;
        }
        public Test GetAllTestById(int testId)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.GetAllTestById";
                command.Parameters.AddWithValue("@id", testId);
                connection.Open();
                try
                {
                    var reader = command.ExecuteReader();
                    Test test = null;
                    Dictionary<int, Question> questions = new Dictionary<int, Question>();
                    while (reader.Read())
                    {
                        if (test == null)
                        {
                            test = new Test()
                            {
                                ID = (int)reader["testId"],
                                Description = reader["description"] as string,
                                Time = (int)reader["time"],
                                Category = new Category() { ID = (int)reader["id_Category"] },
                                Subject = new Subject() { ID = (int)reader["id_Subject"] }
                            };
                        }
                        Question questionFromRequest = new Question()
                        {
                            ID = (int)reader["idQuestion"],
                            Text = reader["textQuestion"] as string,
                            Image = reader["imageQuestion"] == DBNull.Value ? null : Convert.FromBase64String((string)reader["imageQuestion"])
                        };
                        Answer answer = new Answer()
                        {
                            ID = (int)reader["idAnswer"],
                            AnswerText = reader["textAnswer"] as string,
                            IsCorrect = (bool)reader["IsCorrectAnswer"]
                        };
                        if (questions.TryGetValue((int)reader["idQuestion"], out Question question))
                        {
                            question.Answers.Add(answer);
                        }
                        else
                        {
                            questions.Add((int)reader["idQuestion"], questionFromRequest);
                            questionFromRequest.Answers.Add(answer);
                        }
                    }
                    test.Questions = questions.Select(kvp => kvp.Value).ToList(); ;
                    return test;
                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                    throw e;
                }
            }
        }

        public IEnumerable<Answer> GetCorrectAnswersByTestId(int testId)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.GetCorrectAnswersByTestId";
                command.Parameters.AddWithValue("@id", testId);
                connection.Open();
                List<Answer> correctAnswers = new List<Answer>();
                try
                {
                    var reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        Answer answer = new Answer()
                        {
                            ID = (int)reader["idAnswer"],
                            AnswerText = reader["textAnswer"] as string,
                            IsCorrect = (bool)reader["IsCorrectAnswer"]
                        };
                        correctAnswers.Add(answer);

                    }
                    return correctAnswers;
                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                    throw e;
                }
            }
        }

        public bool AddTestingResult(Testing testing)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.AddTesting";
                command.Parameters.AddWithValue("@date", testing.Date);
                command.Parameters.AddWithValue("@idTest", testing.Test);
                command.Parameters.AddWithValue("@idAccount", testing.Account); ;
                var idParameter = new SqlParameter()
                {
                    DbType = DbType.Int32,
                    ParameterName = "@id",
                    Value = testing.ID,
                    Direction = ParameterDirection.Output,
                };
                command.Parameters.Add(idParameter);
                connection.Open();
                try
                {
                    command.ExecuteNonQuery();
                    testing.ID = (int)idParameter.Value;
                    foreach (var testResult in testing.TestingResult)
                    {
                        AddUserAnswer(testing.ID, testResult);
                    }
                    return true;
                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                    throw e;
                }
            }
        }

        public bool AddUserAnswer(int testingId, TestingResult testResult)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "dbo.AddTestingResult";
                command.Parameters.AddWithValue("@idAnswer", testResult.IdAnswer);
                command.Parameters.AddWithValue("@idTesting", testingId);
                var idParameter = new SqlParameter()
                {
                    DbType = DbType.Int32,
                    ParameterName = "@id",
                    Value = testResult.ID,
                    Direction = ParameterDirection.Output,
                };
                command.Parameters.Add(idParameter);
                connection.Open();
                try
                {

                    command.ExecuteNonQuery();
                    testResult.ID = (int)idParameter.Value;
                    return true;
                }
                catch (SqlException e)
                {
                    _log.Error(e.Message);
                    throw e;
                }
            }
        }
    }

}
