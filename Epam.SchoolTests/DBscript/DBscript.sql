USE [SchoolTests]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[id_Role] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[answer] [nvarchar](max) NOT NULL,
	[isCorrect] [bit] NULL,
	[id_Question] [int] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NULL,
	[id_Test] [int] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NULL,
	[time] [int] NULL,
	[id_Category] [int] NOT NULL,
	[id_Subject] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Testing]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Testing](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[id_Test] [int] NULL,
	[id_Account] [int] NULL,
 CONSTRAINT [PK_Testing] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestingResult]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestingResult](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Testing] [int] NOT NULL,
	[id_Answer] [int] NULL,
 CONSTRAINT [PK_TestResult] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [login], [password], [id_Role]) VALUES (4, N'admin                                             ', N'C7AD44CBAD762A5DA0A452F9E854FDC1E0E7A52A38015F23F3EAB1D80B931DD472634DFAC71CD34EBC35D16AB7FB8A90C81F975113D6C7538DC69DD8DE9077EC', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (1, N' 30°', 0, 3)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (2, N' 60°', 0, 3)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (3, N' 45°', 1, 3)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (4, N' Да', 0, 4)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (5, N' Нет', 1, 4)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (6, N' бактерии', 0, 5)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (7, N' растения', 0, 5)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (8, N' кристаллы', 1, 5)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (9, N' грибы', 0, 5)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (10, N'имеют клеточное строение', 1, 6)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (11, N' имеют одинаковые размеры тела', 0, 6)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (12, N' поглощают воду из почвы', 0, 6)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (13, N' 4', 1, 7)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (14, N' 5', 0, 7)
INSERT [dbo].[Answer] ([id], [answer], [isCorrect], [id_Question]) VALUES (15, N' 6', 1, 7)
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'5 класс')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'6 класс')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'7 класс')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [text], [image], [id_Test]) VALUES (3, N' Какова градусная мера каждого из острых углов равнобедренного прямоугольного треугольника?', NULL, 3)
INSERT [dbo].[Question] ([id], [text], [image], [id_Test]) VALUES (4, N' Может ли треугольник иметь два тупых угла?', NULL, 3)
INSERT [dbo].[Question] ([id], [text], [image], [id_Test]) VALUES (5, N' К объектам живой природы не относятся:', NULL, 4)
INSERT [dbo].[Question] ([id], [text], [image], [id_Test]) VALUES (6, N'  Сходство растений и животных заключается в том, что они:', N'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', 4)
INSERT [dbo].[Question] ([id], [text], [image], [id_Test]) VALUES (7, N'lllll', NULL, 5)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([id], [name]) VALUES (1, N'Английский язык')
INSERT [dbo].[Subject] ([id], [name]) VALUES (2, N'Биология')
INSERT [dbo].[Subject] ([id], [name]) VALUES (3, N'География')
INSERT [dbo].[Subject] ([id], [name]) VALUES (4, N'Русский язык')
INSERT [dbo].[Subject] ([id], [name]) VALUES (5, N'Информатика')
INSERT [dbo].[Subject] ([id], [name]) VALUES (6, N'Математика')
INSERT [dbo].[Subject] ([id], [name]) VALUES (7, N'Физика')
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([id], [description], [time], [id_Category], [id_Subject]) VALUES (3, N'Математика. Треугольник. 5 класс', 20, 1, 6)
INSERT [dbo].[Test] ([id], [description], [time], [id_Category], [id_Subject]) VALUES (4, N'Биология. Чем живое отличается от неживого. 6 класс', 15, 2, 2)
INSERT [dbo].[Test] ([id], [description], [time], [id_Category], [id_Subject]) VALUES (5, N'Test', 3, 1, 1)
SET IDENTITY_INSERT [dbo].[Test] OFF
SET IDENTITY_INSERT [dbo].[Testing] ON 

INSERT [dbo].[Testing] ([id], [date], [id_Test], [id_Account]) VALUES (2, CAST(N'2020-03-09T21:19:07.883' AS DateTime), 3, 4)
INSERT [dbo].[Testing] ([id], [date], [id_Test], [id_Account]) VALUES (3, CAST(N'2020-03-09T21:36:31.763' AS DateTime), 5, 4)
SET IDENTITY_INSERT [dbo].[Testing] OFF
SET IDENTITY_INSERT [dbo].[TestingResult] ON 

INSERT [dbo].[TestingResult] ([id], [id_Testing], [id_Answer]) VALUES (1, 2, 5)
INSERT [dbo].[TestingResult] ([id], [id_Testing], [id_Answer]) VALUES (2, 3, 15)
SET IDENTITY_INSERT [dbo].[TestingResult] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([id_Role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([id_Question])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Test] FOREIGN KEY([id_Test])
REFERENCES [dbo].[Test] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Test]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Category] FOREIGN KEY([id_Category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Category]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Subject] FOREIGN KEY([id_Subject])
REFERENCES [dbo].[Subject] ([id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Subject]
GO
ALTER TABLE [dbo].[Testing]  WITH CHECK ADD  CONSTRAINT [FK_Testing_Account] FOREIGN KEY([id_Account])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Testing] CHECK CONSTRAINT [FK_Testing_Account]
GO
ALTER TABLE [dbo].[Testing]  WITH CHECK ADD  CONSTRAINT [FK_Testing_Test] FOREIGN KEY([id_Test])
REFERENCES [dbo].[Test] ([id])
GO
ALTER TABLE [dbo].[Testing] CHECK CONSTRAINT [FK_Testing_Test]
GO
ALTER TABLE [dbo].[TestingResult]  WITH CHECK ADD  CONSTRAINT [FK_TestingResult_Answer] FOREIGN KEY([id_Answer])
REFERENCES [dbo].[Answer] ([id])
GO
ALTER TABLE [dbo].[TestingResult] CHECK CONSTRAINT [FK_TestingResult_Answer]
GO
ALTER TABLE [dbo].[TestingResult]  WITH CHECK ADD  CONSTRAINT [FK_TestingResult_Testing] FOREIGN KEY([id_Testing])
REFERENCES [dbo].[Testing] ([id])
GO
ALTER TABLE [dbo].[TestingResult] CHECK CONSTRAINT [FK_TestingResult_Testing]
GO
/****** Object:  StoredProcedure [dbo].[AddAccount]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddAccount]
	@login nvarchar(50),
	@password nvarchar(max),
	@roleId int  
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (SELECT 1 FROM [dbo].Account WHERE login = @login)
    BEGIN
        --PRINT 'Account with this login exists';
        RETURN (1); -- 1 <=> account with this login exists
    END;
    
    BEGIN 
       	Insert into [dbo].Account(login, password,id_Role)
	Values (@login,@password,@roleId)
        
        RETURN (0); -- 0 <=> add succeeded
END;
END;
GO
/****** Object:  StoredProcedure [dbo].[AddAnswer]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[AddAnswer] 
	@answer nvarchar(max),
	@IsCorrect bit,
	@idQuestion int,
	@id int output
AS
BEGIN
	Insert into [dbo].Answer(answer, isCorrect, id_Question)
	Values (@answer,@IsCorrect,@idQuestion)
	set @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[AddCategory] 
	@name nvarchar(50),
	@id int output
AS
BEGIN
	Insert into [dbo].Category(name)
	Values (@name)
	set @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddQuestion]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[AddQuestion] 
	@text nvarchar(max),
	@image nvarchar(max),
	@idTest int,
	@id int output
AS
BEGIN
	Insert into [dbo].Question(text, image, id_Test)
	Values (@text,@image,@idTest)
	set @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddSubject]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[AddSubject] 
	@name nvarchar(50),
	@id int output
AS
BEGIN
	Insert into [dbo].Subject(name)
	Values (@name)
	set @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddTest]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[AddTest] 
	@description nvarchar(max),
	@time int,
	@idCategory int,
	@idSubject int,
	@id int output
AS
BEGIN
	Insert into [dbo].Test(description, time, id_Category,id_Subject)
	Values (@description,@time,@idCategory,@idSubject)
	set @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddTesting]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[AddTesting] 
	@date datetime,
	@idTest int,
	@idAccount int,
	@id int output
AS
BEGIN
	Insert into [dbo].Testing(date, id_Test, id_Account)
	Values (@date,@idTest,@idAccount)
	set @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddTestingResult]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[AddTestingResult] 
	@idTesting int,
	@idAnswer int,
	@id int output
AS
BEGIN
	Insert into [dbo].TestingResult(id_Testing, id_Answer)
	Values (@idTesting,@idAnswer)
	set @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[GetAccountByLoginAndPassword]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAccountByLoginAndPassword] 

@login nvarchar(50),
@password nvarchar(max)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT id as [countItems] FROM [dbo].[Account] WHERE login = @login and password=@password

END;
GO
/****** Object:  StoredProcedure [dbo].[GetAccountId]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAccountId] 

@login nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT id FROM [dbo].[Account] WHERE login = @login

END;
GO
/****** Object:  StoredProcedure [dbo].[GetAccounts]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAccounts] 

AS
BEGIN

	SET NOCOUNT ON;

select Account.id as accountId,[login],Role.name as roleName from [SchoolTests].[dbo].[Account] Inner join Role on id_Role=Role.id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllTestById]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTestById]
@id int
AS    
 
   SET NOCOUNT ON;  
   SELECT Test.id as testId, description,time,id_Category,id_Subject,Category.name as categoryName, Subject.name as subjectName,
   Question.id as idQuestion,Question.image as imageQuestion,Question.text as textQuestion,
   Answer.id as idAnswer,Answer.answer as textAnswer,Answer.isCorrect as IsCorrectAnswer
   FROM [dbo].Test 
   inner join [dbo].Category on Test.id_Category=Category.id
  inner join [dbo].Subject on Test.id_Subject=Subject.id
  inner join [dbo].Question on Test.id=Question.id_Test
    inner join [dbo].Answer on Question.id=Answer.id_Question
   WHERE [dbo].Test.id=@id   
RETURN  
GO
/****** Object:  StoredProcedure [dbo].[GetAnswerById]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAnswerById]
@id int
AS    
 
   SET NOCOUNT ON;  
   SELECT id, answer,isCorrect,id_Question
   FROM [dbo].Answer   
   WHERE [dbo].Answer.id=@id   
RETURN  
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetCategories] 

AS
BEGIN

	SET NOCOUNT ON;

select id,name from [SchoolTests].[dbo].Category
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetCategoryById]
@id int
AS    
 
   SET NOCOUNT ON;  
   SELECT id, name 
   FROM [dbo].Category   
   WHERE [dbo].Category.id=@id   
RETURN  
GO
/****** Object:  StoredProcedure [dbo].[GetCorrectAnswersByTestId]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetCorrectAnswersByTestId]
@id int
AS    
 
   SET NOCOUNT ON;  
   SELECT Test.id as testId, description,time,id_Category,id_Subject,Category.name as categoryName, Subject.name as subjectName,
   Question.id as idQuestion,Question.image as imageQuestion,Question.text as textQuestion,
   Answer.id as idAnswer,Answer.answer as textAnswer,Answer.isCorrect as IsCorrectAnswer
   FROM [dbo].Test 
   inner join [dbo].Category on Test.id_Category=Category.id
  inner join [dbo].Subject on Test.id_Subject=Subject.id
  inner join [dbo].Question on Test.id=Question.id_Test
    inner join [dbo].Answer on Question.id=Answer.id_Question
   WHERE [dbo].Test.id=@id and [dbo].Answer.isCorrect=1  
RETURN  
GO
/****** Object:  StoredProcedure [dbo].[GetListOfTests]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetListOfTests]
AS
BEGIN

	SET NOCOUNT ON;
	select Test.id as TestId,Category.id as CategoryId,Subject.id as SubjectId,description,time,
	Category.name as CategoryName,Subject.name as SubjectName
	from Test 
	inner join Category on Test.id_Category=Category.id
	inner join Subject on Test.id_Subject=Subject.id
END
GO
/****** Object:  StoredProcedure [dbo].[GetQuestionById]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetQuestionById]
@id int
AS    
 
   SET NOCOUNT ON;  
   SELECT id, text,image,id_Test
   FROM [dbo].Question   
   WHERE [dbo].Question.id=@id   
RETURN  
GO
/****** Object:  StoredProcedure [dbo].[GetQuestionsByTestId]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetQuestionsByTestId]
@test_id int
AS    
 
   SET NOCOUNT ON;  
   SELECT id, text,image,id_Test
   FROM [dbo].Question   
   WHERE [dbo].Question.id_Test=@test_id   
RETURN  
GO
/****** Object:  StoredProcedure [dbo].[GetRole]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRole]
	@login nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;
	select Role.name as RoleName
	from Account inner join Role on Account.id_Role=Role.id
	where Account.login=@login
END
GO
/****** Object:  StoredProcedure [dbo].[GetSubjectById]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetSubjectById]
@id int
AS    
 
   SET NOCOUNT ON;  
   SELECT id, name 
   FROM [dbo].Subject   
   WHERE [dbo].Subject.id=@id   
RETURN  
GO
/****** Object:  StoredProcedure [dbo].[GetSubjects]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetSubjects] 

AS
BEGIN

	SET NOCOUNT ON;

select id,name from [SchoolTests].[dbo].Subject
END
GO
/****** Object:  StoredProcedure [dbo].[GetTestById]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetTestById]
@id int
AS    
 
   SET NOCOUNT ON;  
   SELECT id, description,time,id_Category,id_Subject
   FROM [dbo].Test   
   WHERE [dbo].Test.id=@id   
RETURN  
GO
/****** Object:  StoredProcedure [dbo].[RemoveCategoryById]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[RemoveCategoryById] 
	@id int 
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].Category WHERE id = @id)
    BEGIN
        --PRINT 'Category с таким ID нет в базе';
        RETURN (1); -- 1 <=> no Category with specified id
    END;
    
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM [dbo].Category WITH(ROWLOCK)
        WHERE id = @id
        
        COMMIT;
        RETURN (0); -- 0 <=> deletion succeeded
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN (-1); -- -1 <=> deletion failed
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[RemoveSubjectById]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveSubjectById] 
	@id int 
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Subject] WHERE id = @id)
    BEGIN
        --PRINT 'Subject с таким ID нет в базе';
        RETURN (1); -- 1 <=> no Subject with specified id
    END;
    
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM [dbo].[Subject] WITH(ROWLOCK)
        WHERE id = @id
        
        COMMIT;
        RETURN (0); -- 0 <=> deletion succeeded
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN (-1); -- -1 <=> deletion failed
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateAccount]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateAccount] 
@idAccount int,
@idRole int
AS
BEGIN
 SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM Account WHERE id = @idAccount)
    BEGIN
        RETURN (1); -- 1 <=> no account with specified id
    END;
    
    BEGIN 
        update Account 
		set id_Role=@idRole
        WHERE id = @idAccount
        RETURN (0); -- 0 <=> update succeeded
    END 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[UpdateCategory]
	@id int,
	@name nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].Category WHERE id = @id)
    BEGIN
        --PRINT 'Category с таким ID нет в базе';
        RETURN (1); -- 1 <=> no Category with specified id
    END;
    
    BEGIN TRY
        update [dbo].Category 
		set name=@name
        WHERE id = @id
        RETURN (0); -- 0 <=> update succeeded
    END TRY
    BEGIN CATCH
        RETURN (-1); -- -1 <=> update failed
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateSubject]    Script Date: 09.03.2020 21:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[UpdateSubject]
	@id int,
	@name nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Subject] WHERE id = @id)
    BEGIN
        --PRINT 'Category с таким ID нет в базе';
        RETURN (1); -- 1 <=> no Category with specified id
    END;
    
    BEGIN TRY
        update [dbo].[Subject] 
		set name=@name
        WHERE id = @id
        RETURN (0); -- 0 <=> update succeeded
    END TRY
    BEGIN CATCH
        RETURN (-1); -- -1 <=> update failed
    END CATCH
END;
GO
