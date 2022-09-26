/****** Object:  Database [sqldb-ykbb]    Script Date: 2022-03-16 08:30:38 ******/
CREATE DATABASE [sqldb-ykbb]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 250 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [sqldb-ykbb] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [sqldb-ykbb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET ARITHABORT OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sqldb-ykbb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sqldb-ykbb] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [sqldb-ykbb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sqldb-ykbb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [sqldb-ykbb] SET  MULTI_USER 
GO
ALTER DATABASE [sqldb-ykbb] SET ENCRYPTION ON
GO
ALTER DATABASE [sqldb-ykbb] SET QUERY_STORE = ON
GO
ALTER DATABASE [sqldb-ykbb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Schema [bb]    Script Date: 2022-03-16 08:30:38 ******/
CREATE SCHEMA [bb]
GO
/****** Object:  Schema [cfg]    Script Date: 2022-03-16 08:30:38 ******/
CREATE SCHEMA [cfg]
GO
/****** Object:  Table [bb].[QuestionType]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[QuestionType](
	[QuestionTypeID] [int] NOT NULL,
	[Description] [varchar](400) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_QuestionType] PRIMARY KEY CLUSTERED 
(
	[QuestionTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[QuestionLevel]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[QuestionLevel](
	[QuestionLevelID] [int] NOT NULL,
	[Description] [varchar](400) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_QuestionLevel] PRIMARY KEY CLUSTERED 
(
	[QuestionLevelID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [bb].[v_QuestionnaireDetail]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [bb].[v_QuestionnaireDetail] as
select t.QuestionsTypeID, t.Description typeDescription,l.QuestionsLevelID, l.Description LevelDescription,f.QuestionsID, f.[Question]
from bb.Questionnaires q
join bb.QuestionLevel l on l.QuestionsLevelID = q.QuestionsLevelID
join bb.Questions f on f.QuestionsID = q.QuestionsID
join bb.QuestionType t on t.QuestionsTypeID = q.QuestionsTypeID
GO
/****** Object:  Table [bb].[Action]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[Action](
	[ActionID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](500) NULL,
	[EventID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[Responsible] [varchar](50) NULL,
	[Profession] [varchar](50) NULL,
	[StatusID] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC,
	[EventID] ASC,
	[PersonID] ASC,
	[CreatedOn] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[Contact]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[ContactPersonNbr] [varchar](12) NOT NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[PhoneNbr] [varchar](50) NULL,
	[Employer] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[Event]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[Event](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](500) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ChangedBy] [varchar](500) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC,
	[CreatedOn] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[Person]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[PersonNbr] [varchar](12) NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[Unit] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Guardian1] [varchar](50) NULL,
	[GuardianPersonNbr1] [varchar](12) NOT NULL,
	[Guardian2] [varchar](50) NULL,
	[GuardianPersonNbr2] [varchar](12) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[PersonUser]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[PersonUser](
	[PersonID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[AccessDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_PersonUser] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[Question]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[Question](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](400) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[QuestionGuardian]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[QuestionGuardian](
	[QuestionID] [int] NOT NULL,
	[GuardianPersonNbr1] [varchar](12) NOT NULL,
	[Grade1] [int] NULL,
	[Comment1] [varchar](500) NULL,
	[GuardianPersonNbr2] [varchar](12) NOT NULL,
	[Grade2] [int] NULL,
	[Comment2] [varchar](500) NULL,
	[GradedOn] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_QuestionGuardian] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC,
	[GuardianPersonNbr1] ASC,
	[GuardianPersonNbr2] ASC,
	[GradedOn] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[Questionnaire]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[Questionnaire](
	[QuestionID] [int] NOT NULL,
	[QuestionTypeID] [int] NOT NULL,
	[QuestionLevelID] [int] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_Questionnaires] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC,
	[QuestionTypeID] ASC,
	[QuestionLevelID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[QuestionnaireGrade]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[QuestionnaireGrade](
	[QuestionID] [int] NOT NULL,
	[QuestionTypeID] [int] NOT NULL,
	[QuestionLevelID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Grade] [int] NULL,
	[GradedOn] [datetime] NOT NULL,
	[Comment] [varchar](1200) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
	[Situation] [varchar](1200) NULL,
 CONSTRAINT [PK_QuestionnaireGrade] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC,
	[QuestionTypeID] ASC,
	[QuestionLevelID] ASC,
	[PersonID] ASC,
	[UserID] ASC,
	[GradedOn] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[QuestionnaireStatus]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[QuestionnaireStatus](
	[PersonID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_QuestionnaireStatus] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[UserID] ASC,
	[StatusID] ASC,
	[CreatedOn] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[Role]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[Status]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NULL,
	[StatusType] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[Team]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[Team](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [varchar](500) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[TeamUnit]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[TeamUnit](
	[TeamID] [int] NOT NULL,
	[UnitID] [int] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_TeamUnit] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC,
	[UnitID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[Unit]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[Unit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[User]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Organisation] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[UserRight]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[UserRight](
	[CurrentUserID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[QuestionTypeID] [int] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_UserRight] PRIMARY KEY CLUSTERED 
(
	[CurrentUserID] ASC,
	[UserID] ASC,
	[PersonID] ASC,
	[QuestionTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[UserRole]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[UserRole](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bb].[UserUnit]    Script Date: 2022-03-16 08:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bb].[UserUnit](
	[UserID] [int] NOT NULL,
	[UnitID] [int] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedOn] [datetime] NULL,
 CONSTRAINT [PK_UserUnit] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[UnitID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [bb].[Action] ON 
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (1, N'gå till skolan', 1, 93, N'Sören las', N'Lärare', 7, N'sql-admin', CAST(N'2021-12-21T09:46:32.760' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:46:32.760' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (2, N'käka mer hemma', 2, 93, N'albin no', N'Kock', 7, N'sql-admin', CAST(N'2021-12-21T09:52:55.243' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:52:55.243' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (3, N'lära sig gitarr', 3, 93, N'Görgen And', N'musiker', 7, N'sql-admin', CAST(N'2021-12-21T09:55:38.507' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:55:38.507' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (4, N'äta ute mer', 2, 93, N'lena hej', N'lärare', 6, N'sql-admin', CAST(N'2021-12-21T09:56:12.243' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:56:12.243' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (5, N'test insats 1', 4, 95, N'aml abbas', N'cgi', 7, N'sql-admin', CAST(N'2021-12-22T08:14:54.723' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:14:54.723' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (6, N'test insats 2', 4, 95, N'aml abbas', N'cgi', 6, N'sql-admin', CAST(N'2021-12-22T08:15:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:15:14.630' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (7, N'ha en ledare med sig', 5, 94, N'Stina Andersson', N'Fritidspedagog', 7, N'sql-admin', CAST(N'2022-01-11T10:06:39.697' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:06:39.697' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (8, N'gå mer i skolan', 5, 94, N'Lena Lindgren', N'Fritidspedagog', 7, N'sql-admin', CAST(N'2022-01-11T10:07:36.993' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:07:36.993' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (9, N'Prata med föräldrar. Planera hämtning. Om inte föräldrar hämtar, vem hämtar?', 6, 104, N'Hans Andersson', N'Lärare', 6, N'sql-admin', CAST(N'2022-01-12T09:01:15.160' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:01:15.160' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (10, N'En insats för att hjälpa lösa händelsen.', 7, 92, N'Albin Ek', N'Polis', 6, N'sql-admin', CAST(N'2022-01-13T08:40:13.193' AS DateTime), N'sql-admin', CAST(N'2022-01-13T08:40:13.193' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (11, N'Ytterligare en insats skapas.', 7, 92, N'Albin Ek', N'Polis', 6, N'sql-admin', CAST(N'2022-01-13T08:44:30.790' AS DateTime), N'sql-admin', CAST(N'2022-01-13T08:44:30.790' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (12, N'se till att hen äter', 8, 110, N'Lina Sandberg', N'dietist', 6, N'sql-admin', CAST(N'2022-01-14T08:08:03.103' AS DateTime), N'sql-admin', CAST(N'2022-01-14T08:08:03.103' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (13, N'ha en ledare', 9, 110, N'Lo Bo', N'fritidspedagog', 7, N'sql-admin', CAST(N'2022-01-14T08:08:37.653' AS DateTime), N'sql-admin', CAST(N'2022-01-14T08:08:37.653' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (14, N'äta mer hela tiden', 8, 110, N'Anton Sager', N'expert', 6, N'sql-admin', CAST(N'2022-01-14T08:10:46.900' AS DateTime), N'sql-admin', CAST(N'2022-01-14T08:10:46.900' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (15, N'Cope - gruppverksamhet', 10, 114, N'Caroline Ekstrand', N'Proffs på det mesta', 6, N'sql-admin', CAST(N'2022-01-17T15:47:36.137' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:47:36.137' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (16, N'Råd och stöd samtal på soc', 10, 114, N'Jessica Olofsson', N'Familjebehandlare', 7, N'sql-admin', CAST(N'2022-01-17T15:48:26.840' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:48:26.840' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (17, N'Insats till händelse', 11, 100, N'Albin Ek', N'Socialen', 6, N'sql-admin', CAST(N'2022-01-17T15:49:52.107' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:52.107' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (18, N'Insats till händelse', 11, 100, N'Albin EK', N'Lärare', 6, N'sql-admin', CAST(N'2022-01-17T15:50:16.900' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:50:16.900' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (19, N'Cope - gruppverksamhet', 12, 114, N'Caroline Ekstrand', N'Duktig', 6, N'sql-admin', CAST(N'2022-01-17T15:50:28.510' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:50:28.510' AS DateTime))
GO
INSERT [bb].[Action] ([ActionID], [Description], [EventID], [PersonID], [Responsible], [Profession], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (20, N'råd och stöd', 12, 114, N'AA PP', N'kjdaljdla', 6, N'sql-admin', CAST(N'2022-01-17T15:51:12.603' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:51:12.603' AS DateTime))
GO
SET IDENTITY_INSERT [bb].[Action] OFF
GO
SET IDENTITY_INSERT [bb].[Event] ON 
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (1, N'skolan vill itne gå', N'sql-admin', CAST(N'2021-12-21T09:46:32.760' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:46:32.760' AS DateTime))
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (2, N'äter dåligt hemma', N'sql-admin', CAST(N'2021-12-21T09:52:55.243' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:52:55.243' AS DateTime))
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (3, N'vill spela musik mer', N'sql-admin', CAST(N'2021-12-21T09:55:38.507' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:55:38.507' AS DateTime))
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (4, N'test h1 ergrw', N'sql-admin', CAST(N'2021-12-22T08:14:54.723' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:14:54.723' AS DateTime))
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (5, N'vill ej gå i skola', N'sql-admin', CAST(N'2022-01-11T10:06:39.697' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:06:39.697' AS DateTime))
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (6, N'Blir inte hämtad', N'sql-admin', CAST(N'2022-01-12T09:01:15.160' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:01:15.160' AS DateTime))
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (7, N'Händelse skapas här', N'sql-admin', CAST(N'2022-01-13T08:40:13.193' AS DateTime), N'sql-admin', CAST(N'2022-01-13T08:40:13.193' AS DateTime))
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (8, N'Hungrig hela tiden', N'sql-admin', CAST(N'2022-01-14T08:08:03.103' AS DateTime), N'sql-admin', CAST(N'2022-01-14T08:08:03.103' AS DateTime))
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (9, N'ej i skolan', N'sql-admin', CAST(N'2022-01-14T08:08:37.653' AS DateTime), N'sql-admin', CAST(N'2022-01-14T08:08:37.653' AS DateTime))
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (10, N'Föräldrarna vill ha stöd i sitt föräldraskap', N'sql-admin', CAST(N'2022-01-17T15:47:36.137' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:47:36.137' AS DateTime))
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (11, N'Testar att göra en händelse', N'sql-admin', CAST(N'2022-01-17T15:49:52.107' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:52.107' AS DateTime))
GO
INSERT [bb].[Event] ([EventID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (12, N'Familjen utrycker ett behov av stöd i sitt föräldraskap', N'sql-admin', CAST(N'2022-01-17T15:50:28.510' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:50:28.510' AS DateTime))
GO
SET IDENTITY_INSERT [bb].[Event] OFF
GO
SET IDENTITY_INSERT [bb].[Person] ON 
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (92, N'199404110509', N'Grönball', N'Nils', N'Backaskolan', N'I barnteam', N'Johnas Grönball', N'199404110508', N'0', N'0', N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (93, N'199910034675', N'Wedberg', N'Louise', N'Barnavårdscentralen Ystad (Region Skåne)', N'I barnteam', N'Lena stefan', N'196578987654', N'0', N'0', N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2022-03-03T07:12:56.440' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (94, N'200008199876', N'Nilsson', N'Lama', N'Barnmorskemottagningen Ystad (Region Skåne)', N'I barnteam', N'Niha Nilsson', N'190008198765', N'0', N'0', N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, N'200003040201', N'kula', N'kalle', N'Backaskolan', N'I barnteam', N'ove ek', N'199912129090', N'0', N'0', N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:22:35.357' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (96, N'199512250444', N'Homaj', N'Henrik', N'Källan förskola', N'Upptäckt', N'Lorem lorem', N'199304000544', N'0', N'0', N'sql-admin', CAST(N'2022-01-04T11:47:48.280' AS DateTime), N'sql-admin', CAST(N'2022-01-04T11:47:48.280' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (97, N'199901015656', N'efternamn', N'förnamn', N'Källan förskola', N'I barnteam', N'vårdnadshavare 1', N'202201012525', N'vårdnadshavare 2', N'202201022424', N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (98, N'', N'', N'', N'Backaskolan', N'Anonymiserad', N'', N'', N'', N'', N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (99, N'', N'', N'', N'Källan förskola', N'Anonymiserad', N'', N'', N'', N'', N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (100, N'200345768900', N'Lada', N'Svea', N'Källan förskola', N'I barnteam', N'Sten Lada', N'196578987654', N'0', N'0', N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (101, N'199308198762', N'test firstName', N'test firstName', N'Norreportskolan', N'Upptäckt', N'aml abbas', N'199308198765', N'0', N'0', N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (102, N'199308198763', N'test 1 k', N'test 1 k', N'Backaskolan', N'Upptäckt', N'test 1 k', N'199308198761', N'0', N'0', N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (103, N'', N'', N'', N'Barnavårdscentralen Ystad (Region Skåne)', N'Anonymiserad', N'', N'', N'', N'', N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:42:10.497' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (104, N'200303034543', N'Svensson', N'Johan', N'Källan förskola', N'I barnteam', N'Anton Svensson', N'199303031233', N'Karin Svensson', N'198904041234', N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (105, N'200404010101', N'Johansson', N'Stefan', N'Norreportskolan', N'Upptäckt', N'Kakan Johansson', N'199101010202', N'0', N'0', N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (106, N'200345787654', N'Hans Lundell', N'Fredrik', N'Källan förskola', N'Upptäckt', N'Alva Hans Lundell', N'197865345678', N'0', N'0', N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:15.007' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (107, N'200134657865', N'Dahl', N'Alva', N'Barnavårdscentralen Ystad (Region Skåne)', N'Upptäckt', N'Annika Dahl', N'196578456789', N'0', N'0', N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (108, N'200567879876', N'Stolt', N'Annika', N'Backa förskola', N'Upptäckt', N'Rickard Stolt', N'196578987623', N'Tina Stolt', N'196545678922', N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (109, N'200476568812', N'Anden', N'Pål', N'Backa förskola', N'I barnteam', N'Ture Anden', N'197654567890', N'0', N'0', N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (110, N'200534546789', N'Larsson', N'Urban', N'Barnavårdscentralen Ystad (Region Skåne)', N'I barnteam', N'Lukas Larsson', N'194567890211', N'0', N'0', N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (111, N'200987654321', N'Linden', N'Kina', N'Källan förskola', N'Upptäckt', N'Sture Linden', N'196598765432', N'Ture Linden', N'129812345678', N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (112, N'200603021357', N'Nilsson', N'Oskar', N'Backaskolan', N'Upptäckt', N'Stina Nilsson', N'198902020123', N'Adam Nilsson', N'198704039876', N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (113, N'201211112345', N'Eriksson', N'Wilma', N'Norreportskolan', N'I barnteam', N'Malin Eriksson', N'199305169190', N'0', N'0', N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (114, N'009921212111', N'Hansson', N'Gösta', N'Källan förskola', N'I barnteam', N'Alexandra Hansson', N'000825687211', N'Goran Stojanovic', N'009992266151', N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (115, N'201001015588', N'Hysen', N'Glenn', N'Barnmorskemottagningen Ystad (Region Skåne)', N'I barnteam', N'Pappa Hysen', N'196001012255', N'Mamma Hysen', N'197501019987', N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (116, N'200601010000', N'Andersson', N'Arne', N'Norreportskolan', N'Upptäckt', N'Eva Andersson', N'195701010123', N'Jörgen Andersson ', N'195201010123', N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime))
GO
INSERT [bb].[Person] ([PersonID], [PersonNbr], [LastName], [FirstName], [Unit], [Status], [Guardian1], [GuardianPersonNbr1], [Guardian2], [GuardianPersonNbr2], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (117, N'', N'', N'', N'Källan förskola', N'Anonymiserad', N'', N'', N'', N'', N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime))
GO
SET IDENTITY_INSERT [bb].[Person] OFF
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (92, 33, NULL, N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (93, 26, NULL, N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (94, 26, NULL, N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, 26, NULL, N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (97, 33, NULL, N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (98, 26, NULL, N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (99, 55, NULL, N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (100, 55, NULL, N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (101, 26, NULL, N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (102, 26, NULL, N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (103, 26, NULL, N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (104, 58, NULL, N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (105, 58, NULL, N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (106, 72, NULL, N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (107, 72, NULL, N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (108, 72, NULL, N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (109, 72, NULL, N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (110, 72, NULL, N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (111, 72, NULL, N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (112, 99, NULL, N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (113, 104, NULL, N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (114, 101, NULL, N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (115, 100, NULL, N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (116, 110, NULL, N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), NULL, NULL)
GO
INSERT [bb].[PersonUser] ([PersonID], [UserID], [AccessDate], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (117, 102, NULL, N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [bb].[Question] ON 
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (1, N'Barnet bor i en miljö som är anpassad efter barnets behov samt främjar dess utveckling', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (2, N'Barnet får extra stöd och vård när det behövs', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (3, N'Barnet har någon att lita på och vända sig till när det behövs', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (4, N'Barnet har någon som ser till att hen är ren och lämpligt klädd efter årstid', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (5, N'Barnet har tillgängliga vuxna som uppmuntrar och uppmärksammar det', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (6, N'Barnet får kognitiv stimulans av vuxna i sin närhet', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (7, N'Barnet känner sig trygg hemma, i skolan, på nätet och i sin närmiljö', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (8, N'Barnet lever i en hemmiljö som är fri från missbruk, våld, försummelse och utnyttjande', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (9, N'Barnet skyddas från att bli utnyttjat av andra', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (10, N'Barnet skyddas från fysiska faror och hälsofaror i och utanför hemmet', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (11, N'Barnet skyddas från kränkningar', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (12, N'Barnet skyddas från kriminalitet och olaglig verksamhet', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (13, N'Barnet är frisk och upprätthåller god fysisk och psykisk hälsa', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (14, N'Barnet deltar vid kontroller/besök som ska ge barnet stöd/hjälp', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (15, N'Barnet har en hälsosam livsstil', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (16, N'Barnet kan hantera svårigheter och problem', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (17, N'Barnet mår bra och ser positivt på framtiden', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (18, N'Barnet uppvisar inte negativa eller destruktiva beteenden', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (19, N'Barnet och familjen är aktiva tillsammans och gör saker som barnet tycker är roligt', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (20, N'Barnet uppmuntras att vara aktiv utifrån sin förmåga, t ex deltar i lek, friluftsliv och idrottsaktiviteter', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (21, N'Barnet uppmuntras och ges förutsättningar för att utveckla egna intressen och att delta i aktiviteter som är stimulerande', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (22, N'Barnet känner sig viktig och uppskattad av barn och vuxna som finn i dess närhet', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (23, N'Barnet känner sig viktig och uppskattad av de som tar hand om hen', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (24, N'Familjen har ett socialt nätverk som deltar aktivt i barnets liv', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (25, N'Barnet deltar i undervisningen i skolan', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (26, N'Barnet förstår vad som förväntas av hen och tar ansvar hemma, i skolan och i närmiljön', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (27, N'Barnet har bra förebilder i sin närhet', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (28, N'Barnet kan förstå och följa regler', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (29, N'Barnet tar ansvar för sina handlingar', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (30, N'Barnet vet vad som är rätt och fel och agerar utifrån det', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (31, N'Barnet har en bra självkänsla och ser sig själv som värdefull', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (32, N'Barnet käner sig inte retad, utsatt/utstött eller kränktav andra', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (33, N'Barnet känner att vänner och andra tror på dess förmåga och stöttar hen', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (34, N'Barnet känner sig lyssnad till, tagen på allvar och är delaktig i viktiga vardagsbeslut', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (35, N'Barnet är nyfiket och motiverat till att lära sig nya saker', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (36, N'Barnet har engagerade vuxna i sin närhet som stöttar hen i sin utveckling och i sitt lärande', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (37, N'Barnet har utvecklat förmågor för att klara av och hantera sin vardag', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (38, N'Barnet uppnår kunskapskraven för sin åldern', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (39, N'Barnet utvecklas och lär sig nya saker i olika miljöer', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (40, N'Barnet har vuxna i sin närhet som hen kan lita på och vända sig till', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (41, N'Barnet skyddas från sådant som kan skada hen i och utanför hemmet', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (42, N'Barnet har hälsosamma matvanor, god hygien och ett liv fritt från tobak, alkohol och narkotika', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (43, N'Barnet har fritidsintresse med delaktighet från vårdnadshavare eller annan trygg person i dess närhet', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (44, N'Barnet känner tillhörighet och uppskattning av personer som barnet möter i sin vardag', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (45, N'Barnet förstår vad som förväntas av det i sin vardag, visar hänsyn och omtanke inför andra och följer givna regler', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (46, N'Barnet känner sig sedd, hörd och bekräftad av viktiga personer i sin vardag', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (47, N'Barnet utvecklas i fas med sin ålder och har förmågor att klara av det vardagliga livet', N'sql-admin', CAST(N'2021-10-20T00:14:26.140' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (48, N'Åtgärder har vidtagits inom egen organisation', N'sql-admin', CAST(N'2021-10-20T23:28:45.810' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'Vårdnadshavare är informerad om att upptäckarkort upprättats', N'sql-admin', CAST(N'2021-10-20T23:28:45.810' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'Vårdnadshavare har gett samtycke till att information gällande upptäckten delas mellan upptäckare och barnkontakt', N'sql-admin', CAST(N'2021-10-20T23:28:45.810' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'Jag har någon som bryr sig om mig', N'sql-admin', CAST(N'2021-11-16T16:21:37.110' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'Jag känner mig trygg', N'sql-admin', CAST(N'2021-11-16T16:21:37.110' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'Jag mår bra', N'sql-admin', CAST(N'2021-11-16T16:21:37.110' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'Jag trivs med min fritid', N'sql-admin', CAST(N'2021-11-16T16:21:37.110' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'Jag får vara med', N'sql-admin', CAST(N'2021-11-16T16:21:37.110' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'Jag tar ansvar för mig själv och andra', N'sql-admin', CAST(N'2021-11-16T16:21:37.110' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'Jag känner mig respekterad', N'sql-admin', CAST(N'2021-11-16T16:21:37.110' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'Jag gör mitt bästa', N'sql-admin', CAST(N'2021-11-16T16:21:37.110' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (59, N'Barnet visar förmåga att bedöma och hantera situationer som kan innebära en risk både för barnet själv och andra', N'sql-admin', CAST(N'2021-11-30T14:19:25.790' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (60, N'Barnet litar på de som finns i dess närhet, såväl barn som vuxna', N'sql-admin', CAST(N'2021-11-30T14:19:25.790' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Question] ([QuestionID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (61, N'Barnet visar hänsyn och omtanke om andra', N'sql-admin', CAST(N'2021-11-30T14:22:03.510' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [bb].[Question] OFF
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'000825687211', 1, NULL, N'009992266151', 1, NULL, CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'190008198765', 1, NULL, N'0', 0, NULL, CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'194567890211', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'195701010123', 1, NULL, N'195201010123', 1, NULL, CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'196001012255', 1, NULL, N'197501019987', 1, NULL, CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'196510304578', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'196578456789', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'196578987623', 1, NULL, N'196545678922', 1, NULL, CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'196578987654', 1, NULL, N'0', 0, NULL, CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'196578987654', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'196598765432', 1, NULL, N'129812345678', 1, NULL, CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'197654567890', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'197865345678', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'198902020123', 1, NULL, N'198704039876', 1, NULL, CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'199009099999', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'199101010202', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'199123458745', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'199303031233', 1, NULL, N'198904041234', 1, NULL, CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'199305169190', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'199308198761', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'199308198765', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'199404110508', 1, NULL, N'0', 0, NULL, CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'199912129090', 1, NULL, N'0', 0, NULL, CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'199912129090', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'200001019872', 0, NULL, N'0', 0, NULL, CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:42:10.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, N'202201012525', 1, NULL, N'202201022424', 1, NULL, CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'000825687211', 1, NULL, N'009992266151', 1, NULL, CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'190008198765', 1, NULL, N'0', 0, NULL, CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'194567890211', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'195701010123', 1, NULL, N'195201010123', 1, NULL, CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'196001012255', 1, NULL, N'197501019987', 1, NULL, CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'196510304578', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'196578456789', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'196578987623', 1, NULL, N'196545678922', 1, NULL, CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'196578987654', 1, NULL, N'0', 0, NULL, CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'196578987654', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'196598765432', 1, NULL, N'129812345678', 1, NULL, CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'197654567890', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'197865345678', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'198902020123', 1, NULL, N'198704039876', 1, NULL, CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'199009099999', 0, NULL, N'0', 0, NULL, CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'199101010202', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'199123458745', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'199303031233', 1, NULL, N'198904041234', 1, NULL, CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'199305169190', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'199308198761', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'199308198765', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'199404110508', 1, NULL, N'0', 0, NULL, CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'199912129090', 1, NULL, N'0', 0, NULL, CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'199912129090', 1, NULL, N'0', 0, NULL, CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'200001019872', 0, NULL, N'0', 0, NULL, CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:42:10.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, N'202201012525', 1, NULL, N'202201022424', 1, NULL, CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'000825687211', 5, N'', N'009992266151', 0, N'0', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'190008198765', 1, N'', N'0', 1, N'', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'190008198765', 0, N'', N'0', 0, N'0', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'194567890211', 1, N'', N'0', 0, N'0', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'196001012255', 0, N'', N'197501019987', 0, N'', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'196578987654', 1, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'196578987654', 1, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'196578987654', 3, N'', N'0', 3, N'', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'197654567890', 4, N'', N'0', 0, N'0', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'199303031233', 2, N'', N'198904041234', 0, N'0', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'199303031233', 4, N'', N'198904041234', 3, N'', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'199305169190', 5, N'', N'0', 0, N'0', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'199404110508', 1, N'', N'0', 0, N'0', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'199404110508', 2, N'', N'0', 1, N'', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'199912129090', 1, N'', N'0', 5, N'', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'199912129090', 2, N'', N'0', 0, N'0', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'202201012525', 2, N'', N'202201022424', 3, N'', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'000825687211', 3, N'', N'009992266151', 0, N'0', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'190008198765', 1, N'', N'0', 1, N'', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'190008198765', 0, N'', N'0', 0, N'0', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'194567890211', 1, N'', N'0', 0, N'0', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'196001012255', 1, N'', N'197501019987', 1, N'', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'196578987654', 1, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'196578987654', 1, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'196578987654', 3, N'', N'0', 3, N'', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'197654567890', 2, N'', N'0', 0, N'0', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'199303031233', 2, N'', N'198904041234', 0, N'0', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'199303031233', 4, N'', N'198904041234', 4, N'', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'199305169190', 4, N'', N'0', 0, N'0', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'199404110508', 3, N'', N'0', 0, N'0', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'199404110508', 3, N'', N'0', 2, N'', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'199912129090', 1, N'', N'0', 5, N'', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'199912129090', 2, N'', N'0', 0, N'0', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'202201012525', 2, N'', N'202201022424', 3, N'', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'000825687211', 4, N'', N'009992266151', 0, N'0', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'190008198765', 1, N'', N'0', 2, N'', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'190008198765', 0, N'', N'0', 0, N'0', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'194567890211', 2, N'', N'0', 0, N'0', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'196001012255', 3, N'', N'197501019987', 4, N'', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'196578987654', 5, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'196578987654', 2, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'196578987654', 3, N'', N'0', 2, N'', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'197654567890', 1, N'Mår inte bra alls.', N'0', 0, N'0', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'199303031233', 2, N'', N'198904041234', 0, N'0', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'199303031233', 3, N'', N'198904041234', 4, N'', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'199305169190', 4, N'', N'0', 0, N'0', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'199404110508', 3, N'', N'0', 0, N'0', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'199404110508', 3, N'', N'0', 2, N'', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'199912129090', 2, N'', N'0', 4, N'', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'199912129090', 1, N'', N'0', 0, N'0', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, N'202201012525', 2, N'', N'202201022424', 3, N'', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'000825687211', 1, N'', N'009992266151', 0, N'0', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'190008198765', 1, N'', N'0', 1, N'', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'190008198765', 0, N'', N'0', 0, N'0', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'194567890211', 1, N'', N'0', 0, N'0', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'196001012255', 5, N'', N'197501019987', 2, N'', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'196578987654', 5, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'196578987654', 1, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'196578987654', 3, N'', N'0', 2, N'', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'197654567890', 3, N'', N'0', 0, N'0', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'199303031233', 1, N'', N'198904041234', 0, N'0', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'199303031233', 2, N'', N'198904041234', 3, N'', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'199305169190', 3, N'', N'0', 0, N'0', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'199404110508', 4, N'', N'0', 0, N'0', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'199404110508', 2, N'', N'0', 2, N'', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'199912129090', 2, N'', N'0', 4, N'', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'199912129090', 3, N'', N'0', 0, N'0', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'202201012525', 2, N'', N'202201022424', 3, N'', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'000825687211', 1, N'', N'009992266151', 0, N'0', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'190008198765', 1, N'', N'0', 1, N'', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'190008198765', 0, N'', N'0', 0, N'0', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'194567890211', 3, N'', N'0', 0, N'0', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'196001012255', 1, N'', N'197501019987', 5, N'', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'196578987654', 5, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'196578987654', 0, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'196578987654', 4, N'', N'0', 3, N'', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'197654567890', 4, N'', N'0', 0, N'0', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'199303031233', 2, N'', N'198904041234', 0, N'0', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'199303031233', 0, N'', N'198904041234', 0, N'', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'199305169190', 3, N'', N'0', 0, N'0', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'199404110508', 2, N'', N'0', 0, N'0', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'199404110508', 1, N'', N'0', 2, N'', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'199912129090', 3, N'', N'0', 3, N'', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'199912129090', 3, N'', N'0', 0, N'0', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'202201012525', 2, N'', N'202201022424', 3, N'', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'000825687211', 2, N'', N'009992266151', 0, N'0', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'190008198765', 0, N'', N'0', 3, N'', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'190008198765', 5, N'', N'0', 0, N'0', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'194567890211', 2, N'', N'0', 0, N'0', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'196001012255', 2, N'', N'197501019987', 1, N'', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'196578987654', 1, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'196578987654', 4, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'196578987654', 3, N'', N'0', 3, N'', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'197654567890', 4, N'', N'0', 0, N'0', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'199303031233', 2, N'', N'198904041234', 0, N'0', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'199303031233', 0, N'', N'198904041234', 1, N'', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'199305169190', 4, N'', N'0', 0, N'0', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'199404110508', 3, N'', N'0', 0, N'0', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'199404110508', 2, N'', N'0', 1, N'', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'199912129090', 3, N'', N'0', 3, N'', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'199912129090', 2, N'', N'0', 0, N'0', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, N'202201012525', 2, N'', N'202201022424', 3, N'', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'000825687211', 4, N'', N'009992266151', 0, N'0', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'190008198765', 5, N'', N'0', 5, N'', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'190008198765', 5, N'', N'0', 0, N'0', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'194567890211', 1, N'', N'0', 0, N'0', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'196001012255', 5, N'', N'197501019987', 1, N'', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'196578987654', 5, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'196578987654', 4, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'196578987654', 4, N'', N'0', 4, N'', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'197654567890', 2, N'', N'0', 0, N'0', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'199303031233', 3, N'', N'198904041234', 0, N'0', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'199303031233', 3, N'', N'198904041234', 3, N'', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'199305169190', 3, N'', N'0', 0, N'0', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'199404110508', 3, N'', N'0', 0, N'0', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'199404110508', 4, N'', N'0', 4, N'', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'199912129090', 4, N'', N'0', 2, N'', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'199912129090', 5, N'', N'0', 0, N'0', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, N'202201012525', 2, N'', N'202201022424', 3, N'', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'000825687211', 3, N'', N'009992266151', 0, N'0', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'190008198765', 3, N'', N'0', 5, N'', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'190008198765', 5, N'', N'0', 0, N'0', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'194567890211', 5, N'mycket ', N'0', 0, N'0', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'196001012255', 1, N'', N'197501019987', 3, N'', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'196578987654', 5, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'196578987654', 5, N'', N'0', 0, N'0', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'196578987654', 3, N'', N'0', 3, N'', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'197654567890', 4, N'', N'0', 0, N'0', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'199303031233', 2, N'', N'198904041234', 0, N'0', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'199303031233', 5, N'', N'198904041234', 5, N'', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'199305169190', 2, N'', N'0', 0, N'0', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'199404110508', 2, N'', N'0', 0, N'0', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'199404110508', 3, N'', N'0', 3, N'', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'199912129090', 4, N'', N'0', 2, N'', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'199912129090', 2, N'', N'0', 0, N'0', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime))
GO
INSERT [bb].[QuestionGuardian] ([QuestionID], [GuardianPersonNbr1], [Grade1], [Comment1], [GuardianPersonNbr2], [Grade2], [Comment2], [GradedOn], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'202201012525', 2, N'', N'202201022424', 3, N'', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime))
GO
INSERT [bb].[QuestionLevel] ([QuestionLevelID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (1, N'OMSORG', N'sql-admin', CAST(N'2021-10-20T00:15:15.540' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionLevel] ([QuestionLevelID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (2, N'TRYGGHET', N'sql-admin', CAST(N'2021-10-20T00:15:15.540' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionLevel] ([QuestionLevelID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (3, N'MÅ BRA', N'sql-admin', CAST(N'2021-10-20T00:15:15.540' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionLevel] ([QuestionLevelID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (4, N'FRITID', N'sql-admin', CAST(N'2021-10-20T00:15:15.540' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionLevel] ([QuestionLevelID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (5, N'TILLHÖRIGHET', N'sql-admin', CAST(N'2021-10-20T00:15:15.540' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionLevel] ([QuestionLevelID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (6, N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2021-10-20T00:15:15.540' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionLevel] ([QuestionLevelID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (7, N'RESPEKTERAS', N'sql-admin', CAST(N'2021-10-20T00:15:15.540' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionLevel] ([QuestionLevelID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (8, N'UTVECKLAS', N'sql-admin', CAST(N'2021-10-20T00:15:15.540' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionLevel] ([QuestionLevelID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (9, N'UPPTÄCKARKORT', N'sql-admin', CAST(N'2021-10-20T23:42:10.517' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (1, 2, 1, N'sql-admin', CAST(N'2021-11-30T14:03:26.110' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (2, 2, 1, N'sql-admin', CAST(N'2021-11-30T14:03:26.190' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (3, 2, 1, N'sql-admin', CAST(N'2021-11-30T14:03:26.197' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (4, 2, 1, N'sql-admin', CAST(N'2021-11-30T14:03:26.203' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (5, 2, 1, N'sql-admin', CAST(N'2021-11-30T14:03:26.213' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (6, 2, 1, N'sql-admin', CAST(N'2021-11-30T14:05:54.990' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (7, 2, 2, N'sql-admin', CAST(N'2021-11-30T14:08:15.083' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (8, 2, 2, N'sql-admin', CAST(N'2021-11-30T14:08:15.090' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (9, 2, 2, N'sql-admin', CAST(N'2021-11-30T14:08:15.100' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (10, 2, 2, N'sql-admin', CAST(N'2021-11-30T14:08:15.103' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (11, 2, 2, N'sql-admin', CAST(N'2021-11-30T14:08:15.113' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (12, 2, 2, N'sql-admin', CAST(N'2021-11-30T14:08:15.117' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (13, 2, 3, N'sql-admin', CAST(N'2021-11-30T14:09:11.423' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (14, 2, 3, N'sql-admin', CAST(N'2021-11-30T14:09:11.433' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (15, 2, 3, N'sql-admin', CAST(N'2021-11-30T14:09:11.437' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (16, 2, 3, N'sql-admin', CAST(N'2021-11-30T14:09:11.443' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (17, 2, 3, N'sql-admin', CAST(N'2021-11-30T14:09:11.447' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (18, 2, 3, N'sql-admin', CAST(N'2021-11-30T14:09:11.453' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (19, 2, 4, N'sql-admin', CAST(N'2021-11-30T14:09:56.853' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (20, 2, 4, N'sql-admin', CAST(N'2021-11-30T14:09:56.860' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (21, 2, 4, N'sql-admin', CAST(N'2021-11-30T14:09:56.867' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (22, 2, 5, N'sql-admin', CAST(N'2021-11-30T14:10:43.813' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (23, 2, 5, N'sql-admin', CAST(N'2021-11-30T14:10:43.820' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (24, 2, 5, N'sql-admin', CAST(N'2021-11-30T14:10:43.830' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (25, 2, 6, N'sql-admin', CAST(N'2021-11-30T14:12:38.507' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (26, 2, 6, N'sql-admin', CAST(N'2021-11-30T14:12:38.527' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (27, 2, 6, N'sql-admin', CAST(N'2021-11-30T14:12:38.530' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (28, 2, 6, N'sql-admin', CAST(N'2021-11-30T14:12:38.537' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (29, 2, 6, N'sql-admin', CAST(N'2021-11-30T14:12:38.543' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (30, 2, 6, N'sql-admin', CAST(N'2021-11-30T14:12:38.550' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (31, 2, 7, N'sql-admin', CAST(N'2021-11-30T14:13:25.990' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (32, 2, 7, N'sql-admin', CAST(N'2021-11-30T14:13:25.997' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (33, 2, 7, N'sql-admin', CAST(N'2021-11-30T14:13:26.003' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (34, 2, 7, N'sql-admin', CAST(N'2021-11-30T14:13:26.007' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (35, 2, 8, N'sql-admin', CAST(N'2021-11-30T14:14:21.623' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (36, 2, 8, N'sql-admin', CAST(N'2021-11-30T14:14:21.630' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (37, 2, 8, N'sql-admin', CAST(N'2021-11-30T14:14:21.637' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (38, 2, 8, N'sql-admin', CAST(N'2021-11-30T14:14:21.640' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (39, 2, 8, N'sql-admin', CAST(N'2021-11-30T14:14:21.660' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (40, 4, 1, N'sql-admin', CAST(N'2021-10-20T23:38:45.347' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (41, 4, 2, N'sql-admin', CAST(N'2021-10-20T23:38:45.347' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (42, 4, 3, N'sql-admin', CAST(N'2021-10-20T23:38:45.347' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (43, 4, 4, N'sql-admin', CAST(N'2021-10-20T23:38:45.347' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (44, 4, 5, N'sql-admin', CAST(N'2021-10-20T23:38:45.347' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (45, 4, 6, N'sql-admin', CAST(N'2021-10-20T23:38:45.347' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (46, 4, 7, N'sql-admin', CAST(N'2021-10-20T23:38:45.347' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (47, 4, 8, N'sql-admin', CAST(N'2021-10-20T23:38:45.347' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (48, 4, 9, N'sql-admin', CAST(N'2021-10-20T23:42:30.167' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, 4, 9, N'sql-admin', CAST(N'2021-10-20T23:42:30.167' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, 4, 9, N'sql-admin', CAST(N'2021-10-20T23:42:30.167' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, 1, 1, N'sql-admin', CAST(N'2021-11-30T13:56:22.230' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, 1, 2, N'sql-admin', CAST(N'2021-11-30T13:56:22.230' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, 1, 3, N'sql-admin', CAST(N'2021-11-30T13:56:22.230' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, 1, 4, N'sql-admin', CAST(N'2021-11-30T13:56:22.230' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, 1, 5, N'sql-admin', CAST(N'2021-11-30T13:56:22.230' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, 1, 6, N'sql-admin', CAST(N'2021-11-30T13:56:22.230' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, 1, 7, N'sql-admin', CAST(N'2021-11-30T13:56:22.230' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, 1, 8, N'sql-admin', CAST(N'2021-11-30T13:56:22.230' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (59, 2, 2, N'sql-admin', CAST(N'2021-11-30T14:20:35.963' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (60, 2, 2, N'sql-admin', CAST(N'2021-11-30T14:20:35.963' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Questionnaire] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (61, 2, 6, N'sql-admin', CAST(N'2021-11-30T14:22:21.290' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 92, 33, 0, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 95, 26, 1, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'1', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 95, 26, 1, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 95, 26, 1, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'asdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 100, 55, 0, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 104, 26, 3, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 110, 72, 0, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (1, 2, 1, 114, 101, 0, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 92, 33, 0, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 95, 26, 1, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'1', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 95, 26, 1, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 95, 26, 1, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'asdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 100, 55, 0, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (2, 2, 1, 114, 101, 0, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 92, 33, 4, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 95, 26, 1, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'1', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 95, 26, 1, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 95, 26, 1, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'asdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 100, 55, 5, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 104, 26, 1, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 104, 58, 1, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 110, 72, 5, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (3, 2, 1, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 92, 33, 2, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 92, 110, 4, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 93, 72, 5, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 95, 26, 0, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'1', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 95, 26, 1, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 95, 26, 1, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'asdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 100, 55, 5, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 104, 26, 1, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 104, 26, 1, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 110, 72, 5, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (4, 2, 1, 114, 101, 0, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 93, 72, 5, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 95, 26, 0, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'1', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 95, 26, 1, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 95, 26, 1, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 95, 27, 2, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'asdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 100, 55, 5, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 104, 26, 3, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 104, 26, 5, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 110, 72, 5, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (5, 2, 1, 114, 101, 0, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 92, 33, 1, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 94, 26, 5, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 95, 26, 1, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'1', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 95, 26, 1, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 95, 26, 1, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 95, 27, 3, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'OMSORG', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'asdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 110, 72, 5, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (6, 2, 1, 114, 101, 4, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 92, 33, 2, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 95, 26, 1, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'2', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 95, 26, 2, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 95, 26, 1, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'adasdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 104, 26, 4, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'mycket bra ', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 110, 72, 5, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (7, 2, 2, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 92, 33, 1, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 92, 110, 4, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'2', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 95, 26, 2, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 95, 27, 1, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'adasdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 100, 55, 0, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'mycket bra ', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 110, 72, 5, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (8, 2, 2, 114, 101, 2, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 93, 72, 5, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 95, 26, 3, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'2', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 95, 26, 2, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 95, 27, 3, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 97, 33, 3, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'adasdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 104, 26, 1, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 104, 26, 5, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 104, 58, 4, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'mycket bra ', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (9, 2, 2, 114, 101, 0, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 92, 33, 1, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 95, 26, 0, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'2', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 95, 27, 2, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'adasdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 100, 55, 4, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'mycket bra ', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (10, 2, 2, 114, 101, 5, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 95, 26, 1, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'2', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 95, 27, 2, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 95, 27, 1, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'adasdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 100, 55, 5, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 104, 26, 3, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 104, 26, 1, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'mycket bra ', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (11, 2, 2, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 94, 26, 5, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 95, 26, 4, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'2', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 95, 27, 3, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 95, 27, 4, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 97, 33, 4, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'adasdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 100, 55, 0, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 104, 26, 3, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 104, 26, 1, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'mycket bra ', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (12, 2, 2, 114, 101, 2, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 93, 72, 5, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 95, 26, 1, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'3', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 95, 26, 3, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 95, 27, 1, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'fdsgsgdg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 104, 26, 3, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 104, 26, 3, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 104, 58, 4, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 110, 72, 1, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (13, 2, 3, 114, 101, 2, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 93, 72, 2, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 95, 26, 1, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'3', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 95, 26, 3, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 95, 27, 2, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 95, 27, 1, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 95, 27, 1, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'fdsgsgdg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 110, 72, 3, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (14, 2, 3, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 92, 33, 2, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 93, 72, 1, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 94, 26, 2, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'3', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 95, 27, 2, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'fdsgsgdg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 100, 55, 2, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 110, 72, 1, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (15, 2, 3, 114, 101, 3, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 93, 72, 1, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 94, 26, 5, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 95, 26, 1, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'3', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 95, 27, 3, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 95, 27, 3, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 95, 27, 3, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 97, 33, 4, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'fdsgsgdg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 104, 26, 0, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 110, 72, 4, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (16, 2, 3, 114, 101, 3, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 93, 72, 2, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 94, 26, 5, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 95, 26, 1, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'3', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 95, 27, 4, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'fdsgsgdg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (17, 2, 3, 114, 101, 2, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 93, 72, 5, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 94, 26, 5, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'3', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'MÅ BRA', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 95, 27, 5, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'fdsgsgdg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 100, 55, 5, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 104, 26, 1, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 104, 26, 3, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 104, 58, 4, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 110, 72, 1, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (18, 2, 3, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 94, 26, 1, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'4', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 95, 26, 5, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'FRITID', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'FRITID', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 95, 27, 1, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'dsfgfdgdfg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 104, 26, 3, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 104, 58, 4, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 110, 72, 4, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (19, 2, 4, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 93, 72, 2, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 94, 26, 5, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 95, 26, 3, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'4', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 95, 26, 5, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'FRITID', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'FRITID', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 95, 27, 2, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'dsfgfdgdfg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 100, 55, 0, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 104, 26, 1, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 104, 26, 3, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 104, 58, 4, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 110, 72, 3, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (20, 2, 4, 114, 101, 3, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 95, 26, 3, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'4', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 95, 26, 5, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'FRITID', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'FRITID', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 95, 27, 3, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 97, 33, 3, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'dsfgfdgdfg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 100, 55, 0, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 104, 26, 5, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 110, 72, 1, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (21, 2, 4, 114, 101, 3, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 92, 33, 0, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 92, 110, 0, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 93, 72, 1, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 95, 26, 4, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'5', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 95, 26, 4, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'TILLHÖRIGHET', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'TILLHÖRIGHET', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 95, 27, 1, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'safasfas', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 100, 55, 2, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 104, 58, 4, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (22, 2, 5, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 92, 110, 0, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 93, 72, 5, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 94, 26, 1, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 95, 26, 4, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'5', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 95, 26, 4, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'TILLHÖRIGHET', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 95, 26, 1, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'TILLHÖRIGHET', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 95, 27, 1, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'safasfas', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 104, 26, 1, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 104, 26, 3, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (23, 2, 5, 114, 101, 2, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 93, 72, 2, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 94, 26, 1, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 95, 26, 4, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'5', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 95, 26, 4, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'TILLHÖRIGHET', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 95, 26, 2, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 95, 27, 2, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'TILLHÖRIGHET', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 95, 27, 1, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 97, 33, 3, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'safasfas', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 100, 55, 5, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 104, 26, 3, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 104, 58, 1, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (24, 2, 5, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 93, 72, 2, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 94, 26, 5, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'6', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 95, 26, 1, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 95, 27, 1, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'afdssdgsdgs', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 100, 55, 2, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 104, 26, 3, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (25, 2, 6, 114, 101, 2, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 93, 72, 1, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 94, 26, 2, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'6', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 95, 26, 1, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 95, 27, 1, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'afdssdgsdgs', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 104, 26, 3, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 104, 26, 1, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 110, 72, 0, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 110, 72, 5, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (26, 2, 6, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 92, 33, 4, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 94, 26, 1, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'6', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 95, 27, 2, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'afdssdgsdgs', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (27, 2, 6, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 92, 33, 4, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 93, 72, 3, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 94, 26, 1, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'6', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 95, 26, 1, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 95, 27, 2, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 97, 33, 4, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'afdssdgsdgs', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 100, 55, 0, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 104, 26, 1, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (28, 2, 6, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 92, 33, 4, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 93, 72, 1, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 94, 26, 2, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'6', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 95, 26, 2, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 95, 27, 3, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'afdssdgsdgs', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 100, 55, 2, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 104, 26, 4, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 104, 26, 1, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 104, 58, 4, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (29, 2, 6, 114, 101, 0, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 92, 33, 2, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 94, 26, 1, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'6', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 95, 26, 3, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 95, 27, 3, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 97, 33, 5, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'afdssdgsdgs', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 100, 55, 5, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 104, 26, 3, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (30, 2, 6, 114, 101, 0, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 92, 110, 0, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 93, 72, 3, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 94, 26, 2, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'8', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 95, 26, 1, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'RESPEKTERAS', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 95, 26, 1, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'RESPEKTERAS', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 95, 27, 1, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'asdasasff', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 104, 26, 3, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 104, 26, 3, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 104, 58, 4, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (31, 2, 7, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 92, 33, 2, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 92, 110, 0, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 93, 72, 1, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 94, 26, 2, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'8', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 95, 26, 2, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'RESPEKTERAS', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 95, 26, 2, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'RESPEKTERAS', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 95, 27, 1, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'asdasasff', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 100, 55, 5, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 104, 26, 3, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 104, 26, 3, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (32, 2, 7, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 92, 33, 2, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 92, 110, 4, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 93, 72, 2, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 94, 26, 1, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 95, 26, 3, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'8', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 95, 26, 3, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'RESPEKTERAS', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 95, 26, 3, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'RESPEKTERAS', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 95, 27, 1, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 97, 33, 3, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'asdasasff', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 104, 26, 1, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 104, 58, 5, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 110, 72, 0, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (33, 2, 7, 114, 101, 3, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 92, 110, 0, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 93, 72, 2, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 94, 26, 2, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'8', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 95, 26, 4, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'RESPEKTERAS', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 95, 26, 4, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 95, 27, 5, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'RESPEKTERAS', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 97, 33, 4, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'asdasasff', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 100, 55, 0, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 104, 26, 1, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 110, 72, 5, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (34, 2, 7, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 92, 33, 5, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 93, 72, 2, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 94, 26, 2, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 95, 26, 4, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'9', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'UTVECKLAS', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 95, 26, 1, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'UTVECKLAS', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 95, 27, 3, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sdfsddsfgdfsgfdg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 100, 55, 2, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (35, 2, 8, 114, 101, 3, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 94, 26, 2, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 95, 26, 4, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'9', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'UTVECKLAS', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 95, 26, 2, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 95, 27, 0, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'UTVECKLAS', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 95, 27, 3, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sdfsddsfgdfsgfdg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 100, 55, 2, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 104, 26, 3, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 104, 26, 3, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 110, 72, 5, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (36, 2, 8, 114, 101, 2, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 93, 72, 0, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 94, 26, 1, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 95, 26, 4, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'9', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'UTVECKLAS', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 95, 26, 3, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'UTVECKLAS', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 95, 27, 3, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 97, 33, 3, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sdfsddsfgdfsgfdg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 104, 26, 1, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (37, 2, 8, 114, 101, 3, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 93, 72, 2, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 94, 26, 1, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 95, 26, 4, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'9', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'UTVECKLAS', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 95, 26, 4, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 95, 27, 2, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'UTVECKLAS', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 95, 27, 1, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 97, 33, 5, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sdfsddsfgdfsgfdg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 100, 55, 2, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 104, 26, 1, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (38, 2, 8, 114, 101, 3, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 93, 72, 1, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 94, 26, 1, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 95, 26, 4, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'9', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'UTVECKLAS', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 95, 26, 5, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 95, 27, 1, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'UTVECKLAS', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 95, 27, 3, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 95, 27, 0, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 97, 33, 4, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sdfsddsfgdfsgfdg', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 104, 26, 1, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 104, 26, 2, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 104, 58, 1, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (39, 2, 8, 114, 101, 2, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 92, 33, 2, CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 93, 26, 1, CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 94, 26, 2, CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 95, 26, 2, CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 95, 26, 2, CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'waf')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 97, 33, 1, CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'omsorg', N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 98, 26, 1, CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 99, 55, 0, CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 100, 55, 1, CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 101, 26, 0, CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime), N'new new ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 102, 26, 2, CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'test 1 komments finns nu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 103, 26, 0, CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'Situation nunu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 104, 58, 2, CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'Gick hem sent från fritids, ingen förälder hämtade Johan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 105, 58, 2, CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime), N'Ledsen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 106, 72, 0, CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'utanför hemmet')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 107, 72, 1, CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime), N'Utanför stugan')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 108, 72, 1, CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'På förskolan av lärare')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 109, 72, 1, CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'ute på rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 110, 72, 1, CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'på sjukhus')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 111, 72, 0, CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'På rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 112, 99, 1, CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'I skolan. Barnet verkar vara utanför och får inte vara med och leka.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 113, 104, 1, CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Barnet utvecklas inte tillräckligt mycket i skolan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 114, 101, 1, CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Vi hämtning och lämning är föräldrarna är närvarande och engagerade i att hitta lösningar för att barnet ska sluta slås och bitas.', N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet uppmärksammats på förskolan vi flera tillfällen att slå och bita andra barn. Detta händer främst i leksituationer och när Gösta inte får som han vill. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 115, 100, 2, CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'Lekandes med trasig boll på Heden')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 116, 110, 1, CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Mamma och Pappa är skilda, Arne bor mest hos mamma. Arne saknar sin pappa. ', N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Polispatrull anträffar Arne på stan tillsammans med flertalet andra ungdomar. Arne uppvisar en dålig attityd mot patrullen och vägrar till en början uppge personnummer. En i patrullen tar Arne åt sidan varpå Arne blir lite lugnare. Efter ett långt samtal kontaktar patrullen Arnes mamma och bestämmer att mamma skall hämta Arne. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (40, 4, 1, 117, 102, 0, CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'qweqwe', N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime), N'Väldigt trött och ouppmärksam. Somnar vid lunchen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 92, 33, 1, CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 93, 26, 1, CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 94, 26, 2, CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 95, 26, 2, CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 95, 26, 2, CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'waf')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 97, 33, 1, CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'trygghet', N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 98, 26, 1, CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 99, 55, 1, CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 100, 55, 1, CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 101, 26, 0, CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime), N'new new ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 102, 26, 2, CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'test 1 komments finns nu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 103, 26, 0, CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'Situation nunu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 104, 58, 2, CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'Gick hem sent från fritids, ingen förälder hämtade Johan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 105, 58, 0, CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime), N'Ledsen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 106, 72, 0, CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'utanför hemmet')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 107, 72, 1, CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime), N'Utanför stugan')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 108, 72, 1, CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'På förskolan av lärare')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 109, 72, 1, CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'ute på rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 110, 72, 1, CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'på sjukhus')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 111, 72, 1, CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'På rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 112, 99, 0, CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'I skolan. Barnet verkar vara utanför och får inte vara med och leka.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 113, 104, 1, CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Barnet utvecklas inte tillräckligt mycket i skolan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 114, 101, 0, CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet upplever sig inte trygg i barngruppen på förskolan, detta gör att han utsätter andra barn för att få vara en del av gruppen. ', N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet uppmärksammats på förskolan vi flera tillfällen att slå och bita andra barn. Detta händer främst i leksituationer och när Gösta inte får som han vill. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 115, 100, 0, CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'Lekandes med trasig boll på Heden')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 116, 110, 2, CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Polispatrull anträffar Arne på stan tillsammans med flertalet andra ungdomar. Arne uppvisar en dålig attityd mot patrullen och vägrar till en början uppge personnummer. En i patrullen tar Arne åt sidan varpå Arne blir lite lugnare. Efter ett långt samtal kontaktar patrullen Arnes mamma och bestämmer att mamma skall hämta Arne. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (41, 4, 2, 117, 102, 0, CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sqwe', N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime), N'Väldigt trött och ouppmärksam. Somnar vid lunchen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 92, 33, 0, CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 93, 26, 1, CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 94, 26, 2, CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 95, 26, 2, CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 95, 26, 2, CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'waf')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 97, 33, 1, CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'mår bra', N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 98, 26, 1, CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'mår ganska bra ', N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 99, 55, 1, CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 100, 55, 0, CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 101, 26, 0, CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime), N'new new ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 102, 26, 2, CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'test 1 komments finns nu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 103, 26, 0, CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'Situation nunu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 104, 58, 1, CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'Gick hem sent från fritids, ingen förälder hämtade Johan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 105, 58, 0, CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime), N'Ledsen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 106, 72, 1, CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'utanför hemmet')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 107, 72, 0, CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime), N'Utanför stugan')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 108, 72, 0, CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'På förskolan av lärare')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 109, 72, 0, CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'ute på rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 110, 72, 1, CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'på sjukhus')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 111, 72, 0, CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'På rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 112, 99, 1, CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'I skolan. Barnet verkar vara utanför och får inte vara med och leka.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 113, 104, 1, CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Barnet utvecklas inte tillräckligt mycket i skolan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 114, 101, 1, CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Vad jag kan se', N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet uppmärksammats på förskolan vi flera tillfällen att slå och bita andra barn. Detta händer främst i leksituationer och när Gösta inte får som han vill. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 115, 100, 0, CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'Lekandes med trasig boll på Heden')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 116, 110, 2, CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Polispatrull anträffar Arne på stan tillsammans med flertalet andra ungdomar. Arne uppvisar en dålig attityd mot patrullen och vägrar till en början uppge personnummer. En i patrullen tar Arne åt sidan varpå Arne blir lite lugnare. Efter ett långt samtal kontaktar patrullen Arnes mamma och bestämmer att mamma skall hämta Arne. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (42, 4, 3, 117, 102, 0, CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'qweqweqweqwe', N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime), N'Väldigt trött och ouppmärksam. Somnar vid lunchen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 92, 33, 1, CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 93, 26, 0, CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 94, 26, 2, CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 95, 26, 2, CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 95, 26, 2, CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'waf')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 97, 33, 1, CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'fritid', N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 98, 26, 1, CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 99, 55, 1, CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 100, 55, 1, CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 101, 26, 0, CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime), N'new new ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 102, 26, 2, CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'test 1 komments finns nu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 103, 26, 0, CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'Situation nunu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 104, 58, 2, CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'Gick hem sent från fritids, ingen förälder hämtade Johan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 105, 58, 2, CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime), N'Ledsen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 106, 72, 1, CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'utanför hemmet')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 107, 72, 0, CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime), N'Utanför stugan')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 108, 72, 0, CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'På förskolan av lärare')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 109, 72, 1, CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'ute på rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 110, 72, 1, CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'på sjukhus')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 111, 72, 1, CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'På rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 112, 99, 2, CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'I skolan. Barnet verkar vara utanför och får inte vara med och leka.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 113, 104, 1, CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Barnet utvecklas inte tillräckligt mycket i skolan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 114, 101, 1, CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet uppmärksammats på förskolan vi flera tillfällen att slå och bita andra barn. Detta händer främst i leksituationer och när Gösta inte får som han vill. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 115, 100, 1, CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'Lekandes med trasig boll på Heden')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 116, 110, 0, CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Arne har inga fritidsintressen , hänger mest med kompisar på stan. ', N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Polispatrull anträffar Arne på stan tillsammans med flertalet andra ungdomar. Arne uppvisar en dålig attityd mot patrullen och vägrar till en början uppge personnummer. En i patrullen tar Arne åt sidan varpå Arne blir lite lugnare. Efter ett långt samtal kontaktar patrullen Arnes mamma och bestämmer att mamma skall hämta Arne. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (43, 4, 4, 117, 102, 0, CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'qwqweq', N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime), N'Väldigt trött och ouppmärksam. Somnar vid lunchen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 92, 33, 2, CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 93, 26, 0, CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 94, 26, 2, CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 95, 26, 2, CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 95, 26, 2, CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'waf')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 97, 33, 1, CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'tillhörighet', N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 98, 26, 0, CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 99, 55, 1, CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 100, 55, 0, CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 101, 26, 0, CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime), N'new new ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 102, 26, 2, CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'test 1 komments finns nu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 103, 26, 0, CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'Situation nunu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 104, 58, 0, CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'Gick hem sent från fritids, ingen förälder hämtade Johan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 105, 58, 1, CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime), N'Ledsen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 106, 72, 1, CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'utanför hemmet')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 107, 72, 0, CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime), N'Utanför stugan')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 108, 72, 0, CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'På förskolan av lärare')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 109, 72, 1, CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'ute på rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 110, 72, 0, CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'på sjukhus')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 111, 72, 0, CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'På rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 112, 99, 0, CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'I skolan. Barnet verkar vara utanför och får inte vara med och leka.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 113, 104, 1, CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Barnet utvecklas inte tillräckligt mycket i skolan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 114, 101, 0, CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet har ingen naturlig grupptillhörighet och svårt att skaffa kamrater ', N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet uppmärksammats på förskolan vi flera tillfällen att slå och bita andra barn. Detta händer främst i leksituationer och när Gösta inte får som han vill. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 115, 100, 0, CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'Lekandes med trasig boll på Heden')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 116, 110, 1, CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Arne har många kompisar och vuxna som bryr sig om honom. ', N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Polispatrull anträffar Arne på stan tillsammans med flertalet andra ungdomar. Arne uppvisar en dålig attityd mot patrullen och vägrar till en början uppge personnummer. En i patrullen tar Arne åt sidan varpå Arne blir lite lugnare. Efter ett långt samtal kontaktar patrullen Arnes mamma och bestämmer att mamma skall hämta Arne. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (44, 4, 5, 117, 102, 1, CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'qweqwe', N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime), N'Väldigt trött och ouppmärksam. Somnar vid lunchen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 92, 33, 0, CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 93, 26, 1, CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 94, 26, 2, CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 95, 26, 2, CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 95, 26, 2, CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'waf')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 97, 33, 1, CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'asnvarstagande', N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 98, 26, 1, CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 99, 55, 0, CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 100, 55, 1, CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 101, 26, 0, CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime), N'new new ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 102, 26, 2, CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'test 1 komments finns nu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 103, 26, 0, CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'Situation nunu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 104, 58, 2, CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'Gick hem sent från fritids, ingen förälder hämtade Johan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 105, 58, 1, CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime), N'Ledsen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 106, 72, 1, CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'utanför hemmet')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 107, 72, 1, CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime), N'Utanför stugan')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 108, 72, 4, CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'Sommarlovet', N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'På förskolan av lärare')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 109, 72, 1, CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'hela tiden ', N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'ute på rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 110, 72, 1, CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'på sjukhus')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 111, 72, 1, CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'På rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 112, 99, 1, CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'I skolan. Barnet verkar vara utanför och får inte vara med och leka.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 113, 104, 2, CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Barnet utvecklas inte tillräckligt mycket i skolan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 114, 101, 1, CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet uppmärksammats på förskolan vi flera tillfällen att slå och bita andra barn. Detta händer främst i leksituationer och när Gösta inte får som han vill. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 115, 100, 2, CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'Lekandes med trasig boll på Heden')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 116, 110, 0, CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Arne uppvisar mycket dålig attityd till patrullen och även stundtals till mamma. ', N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Polispatrull anträffar Arne på stan tillsammans med flertalet andra ungdomar. Arne uppvisar en dålig attityd mot patrullen och vägrar till en början uppge personnummer. En i patrullen tar Arne åt sidan varpå Arne blir lite lugnare. Efter ett långt samtal kontaktar patrullen Arnes mamma och bestämmer att mamma skall hämta Arne. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (45, 4, 6, 117, 102, 0, CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'qwqwe', N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime), N'Väldigt trött och ouppmärksam. Somnar vid lunchen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 92, 33, 1, CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 93, 26, 1, CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 94, 26, 2, CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 95, 26, 2, CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 95, 26, 2, CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'waf')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 97, 33, 1, CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'respekteras', N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 98, 26, 2, CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 99, 55, 0, CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 100, 55, 1, CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 101, 26, 0, CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime), N'new new ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 102, 26, 2, CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'test 1 komments finns nu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 103, 26, 0, CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'Situation nunu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 104, 58, 0, CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'Gick hem sent från fritids, ingen förälder hämtade Johan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 105, 58, 1, CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime), N'Ledsen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 106, 72, 1, CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'utanför hemmet')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 107, 72, 1, CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime), N'Utanför stugan')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 108, 72, 0, CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'På förskolan av lärare')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 109, 72, 1, CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'ute på rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 110, 72, 0, CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'kanske', N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'på sjukhus')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 111, 72, 0, CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'På rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 112, 99, 0, CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'I skolan. Barnet verkar vara utanför och får inte vara med och leka.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 113, 104, 1, CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Barnet utvecklas inte tillräckligt mycket i skolan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 114, 101, 0, CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet känner inte att de andra förstår honom och att de inte lyssnar på hans vilja. ', N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet uppmärksammats på förskolan vi flera tillfällen att slå och bita andra barn. Detta händer främst i leksituationer och när Gösta inte får som han vill. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 115, 100, 0, CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'Lekandes med trasig boll på Heden')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 116, 110, 2, CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Polispatrull anträffar Arne på stan tillsammans med flertalet andra ungdomar. Arne uppvisar en dålig attityd mot patrullen och vägrar till en början uppge personnummer. En i patrullen tar Arne åt sidan varpå Arne blir lite lugnare. Efter ett långt samtal kontaktar patrullen Arnes mamma och bestämmer att mamma skall hämta Arne. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (46, 4, 7, 117, 102, 0, CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'qwdqwe', N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime), N'Väldigt trött och ouppmärksam. Somnar vid lunchen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 92, 33, 1, CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 93, 26, 0, CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 94, 26, 2, CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 95, 26, 2, CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 95, 26, 2, CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'waf')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 97, 33, 1, CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'utvecklas', N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 98, 26, 1, CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 99, 55, 0, CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 100, 55, 1, CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 101, 26, 0, CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime), N'new new ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 102, 26, 2, CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'test 1 komments finns nu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 103, 26, 0, CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'Situation nunu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 104, 58, 1, CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'Gick hem sent från fritids, ingen förälder hämtade Johan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 105, 58, 0, CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime), N'Ledsen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 106, 72, 1, CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'mycket bra ', N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'utanför hemmet')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 107, 72, 1, CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime), N'Utanför stugan')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 108, 72, 0, CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'På förskolan av lärare')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 109, 72, 1, CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'ute på rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 110, 72, 1, CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'på sjukhus')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 111, 72, 1, CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'På rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 112, 99, 1, CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'I skolan. Barnet verkar vara utanför och får inte vara med och leka.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 113, 104, 0, CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Utvecklas inte i den takt som förväntas.', N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Barnet utvecklas inte tillräckligt mycket i skolan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 114, 101, 0, CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'vi denna ålder brukar barnet slutats slås och bitas', N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet uppmärksammats på förskolan vi flera tillfällen att slå och bita andra barn. Detta händer främst i leksituationer och när Gösta inte får som han vill. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 115, 100, 2, CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'Lekandes med trasig boll på Heden')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 116, 110, 2, CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Polispatrull anträffar Arne på stan tillsammans med flertalet andra ungdomar. Arne uppvisar en dålig attityd mot patrullen och vägrar till en början uppge personnummer. En i patrullen tar Arne åt sidan varpå Arne blir lite lugnare. Efter ett långt samtal kontaktar patrullen Arnes mamma och bestämmer att mamma skall hämta Arne. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (47, 4, 8, 117, 102, 0, CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'weqwe', N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime), N'Väldigt trött och ouppmärksam. Somnar vid lunchen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 92, 33, 1, CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'Lorem', N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 93, 26, 0, CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 94, 26, 1, CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'0', N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 95, 26, 1, CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'inga', N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 95, 26, 1, CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'FWq', N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'waf')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 97, 33, 1, CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'kommentar', N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 98, 26, 0, CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 99, 55, 0, CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 100, 55, 0, CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 101, 26, 1, CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'new ', N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime), N'new new ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 102, 26, 0, CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'fanns innan', N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'test 1 komments finns nu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 103, 26, 0, CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'komment', N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'Situation nunu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 104, 58, 0, CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'Gick hem sent från fritids, ingen förälder hämtade Johan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 105, 58, 0, CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime), N'Ledsen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 106, 72, 0, CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'utanför hemmet')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 107, 72, 0, CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'inte hunnit ', N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime), N'Utanför stugan')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 108, 72, 1, CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'Påbörjat', N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'På förskolan av lärare')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 109, 72, 1, CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'vi har startat', N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'ute på rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 110, 72, 1, CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'startat', N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'på sjukhus')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 111, 72, 1, CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'På rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 112, 99, 0, CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'I skolan. Barnet verkar vara utanför och får inte vara med och leka.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 113, 104, 0, CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Barnet utvecklas inte tillräckligt mycket i skolan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 114, 101, 1, CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Handlingsplan för att minska bitande har upprättats. Den innehåller att bryta lek snabbare, mer vuxennärvaro samt att det är mindre barn vida varje tillfälle i hallen.', N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet uppmärksammats på förskolan vi flera tillfällen att slå och bita andra barn. Detta händer främst i leksituationer och när Gösta inte får som han vill. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 115, 100, 1, CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'Lekandes med trasig boll på Heden')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 116, 110, 0, CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'0', N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Polispatrull anträffar Arne på stan tillsammans med flertalet andra ungdomar. Arne uppvisar en dålig attityd mot patrullen och vägrar till en början uppge personnummer. En i patrullen tar Arne åt sidan varpå Arne blir lite lugnare. Efter ett långt samtal kontaktar patrullen Arnes mamma och bestämmer att mamma skall hämta Arne. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (48, 4, 9, 117, 102, 1, CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'Träffat vårdnadshavare men situationen för barnet samma', N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime), N'Väldigt trött och ouppmärksam. Somnar vid lunchen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 92, 33, 1, CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL, N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 93, 26, 1, CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL, N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 94, 26, 1, CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL, N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 95, 26, 1, CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL, N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 95, 26, 1, CAST(N'2022-01-14T11:30:19.200' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'waf')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 97, 33, 2, CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 98, 26, 1, CAST(N'2022-01-11T09:28:28.137' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 99, 55, 1, CAST(N'2022-01-11T10:30:47.707' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 100, 55, 1, CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 101, 26, 1, CAST(N'2022-01-11T11:21:58.757' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime), N'new new ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 102, 26, 1, CAST(N'2022-01-11T13:09:29.577' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'test 1 komments finns nu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 103, 26, 1, CAST(N'2022-01-11T13:55:12.043' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'Situation nunu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 104, 58, 2, CAST(N'2022-01-12T08:54:21.940' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'Gick hem sent från fritids, ingen förälder hämtade Johan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 105, 58, 1, CAST(N'2022-01-12T09:29:19.630' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime), N'Ledsen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 106, 72, 1, CAST(N'2022-01-13T14:20:34.137' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'utanför hemmet')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 107, 72, 1, CAST(N'2022-01-13T14:24:05.353' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime), N'Utanför stugan')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 108, 72, 2, CAST(N'2022-01-14T07:33:58.403' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'På förskolan av lärare')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 109, 72, 1, CAST(N'2022-01-14T07:36:19.850' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'ute på rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 110, 72, 1, CAST(N'2022-01-14T07:38:08.683' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'på sjukhus')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 111, 72, 2, CAST(N'2022-01-14T07:40:04.450' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'På rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 112, 99, 2, CAST(N'2022-01-17T08:29:22.700' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'I skolan. Barnet verkar vara utanför och får inte vara med och leka.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 113, 104, 1, CAST(N'2022-01-17T09:08:20.960' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Barnet utvecklas inte tillräckligt mycket i skolan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 114, 101, 2, CAST(N'2022-01-17T15:31:31.037' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet uppmärksammats på förskolan vi flera tillfällen att slå och bita andra barn. Detta händer främst i leksituationer och när Gösta inte får som han vill. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 115, 100, 2, CAST(N'2022-01-17T15:33:58.443' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'Lekandes med trasig boll på Heden')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 116, 110, 2, CAST(N'2022-01-17T15:34:54.817' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Polispatrull anträffar Arne på stan tillsammans med flertalet andra ungdomar. Arne uppvisar en dålig attityd mot patrullen och vägrar till en början uppge personnummer. En i patrullen tar Arne åt sidan varpå Arne blir lite lugnare. Efter ett långt samtal kontaktar patrullen Arnes mamma och bestämmer att mamma skall hämta Arne. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (49, 4, 9, 117, 102, 1, CAST(N'2022-01-17T15:44:53.513' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime), N'Väldigt trött och ouppmärksam. Somnar vid lunchen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 92, 33, 1, CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL, N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 93, 26, 1, CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL, N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 94, 26, 1, CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL, N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 95, 26, 1, CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL, N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 95, 26, 1, CAST(N'2022-01-14T11:30:19.200' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'waf')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 97, 33, 2, CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 98, 26, 1, CAST(N'2022-01-11T09:28:28.137' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 99, 55, 1, CAST(N'2022-01-11T10:30:47.707' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 100, 55, 1, CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 101, 26, 1, CAST(N'2022-01-11T11:21:58.757' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime), N'new new ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 102, 26, 1, CAST(N'2022-01-11T13:09:29.577' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'test 1 komments finns nu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 103, 26, 1, CAST(N'2022-01-11T13:55:12.043' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'Situation nunu')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 104, 58, 2, CAST(N'2022-01-12T08:54:21.940' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'Gick hem sent från fritids, ingen förälder hämtade Johan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 105, 58, 1, CAST(N'2022-01-12T09:29:19.630' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime), N'Ledsen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 106, 72, 1, CAST(N'2022-01-13T14:20:34.137' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'utanför hemmet')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 107, 72, 1, CAST(N'2022-01-13T14:24:05.353' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime), N'Utanför stugan')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 108, 72, 2, CAST(N'2022-01-14T07:33:58.403' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'På förskolan av lärare')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 109, 72, 1, CAST(N'2022-01-14T07:36:19.850' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'ute på rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 110, 72, 1, CAST(N'2022-01-14T07:38:08.683' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'på sjukhus')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 111, 72, 2, CAST(N'2022-01-14T07:40:04.450' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'På rasten')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 112, 99, 2, CAST(N'2022-01-17T08:29:22.700' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'I skolan. Barnet verkar vara utanför och får inte vara med och leka.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 113, 104, 1, CAST(N'2022-01-17T09:08:20.960' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'Barnet utvecklas inte tillräckligt mycket i skolan.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 114, 101, 2, CAST(N'2022-01-17T15:31:31.037' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'Barnet uppmärksammats på förskolan vi flera tillfällen att slå och bita andra barn. Detta händer främst i leksituationer och när Gösta inte får som han vill. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 115, 100, 2, CAST(N'2022-01-17T15:33:58.443' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'Lekandes med trasig boll på Heden')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 116, 110, 2, CAST(N'2022-01-17T15:34:54.817' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'Polispatrull anträffar Arne på stan tillsammans med flertalet andra ungdomar. Arne uppvisar en dålig attityd mot patrullen och vägrar till en början uppge personnummer. En i patrullen tar Arne åt sidan varpå Arne blir lite lugnare. Efter ett långt samtal kontaktar patrullen Arnes mamma och bestämmer att mamma skall hämta Arne. ')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (50, 4, 9, 117, 102, 0, CAST(N'2022-01-17T15:44:53.513' AS DateTime), NULL, N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime), N'Väldigt trött och ouppmärksam. Somnar vid lunchen.')
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 92, 33, 2, CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 92, 103, 2, CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 93, 26, 0, CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 94, 26, 1, CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 94, 26, 0, CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 95, 26, 0, CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 95, 26, 1, CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 97, 33, 1, CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 100, 55, 1, CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 100, 110, 3, CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'mamma, mormor och kompisar', N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 104, 58, 3, CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 104, 58, 1, CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 109, 102, 3, CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 110, 72, 0, CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 113, 104, 4, CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 114, 101, 4, CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (51, 1, 1, 115, 100, 1, CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 92, 33, 3, CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 92, 103, 2, CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 93, 26, 2, CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 94, 26, 0, CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 94, 26, 0, CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 95, 26, 0, CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 95, 26, 1, CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 97, 33, 1, CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 100, 55, 3, CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 100, 110, 3, CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 104, 58, 3, CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 104, 58, 3, CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 109, 102, 4, CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 110, 72, 2, CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 113, 104, 4, CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 114, 101, 3, CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (52, 1, 2, 115, 100, 2, CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 92, 33, 2, CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 92, 103, 3, CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 93, 26, 5, CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 94, 26, 0, CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 94, 26, 0, CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 95, 26, 1, CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 95, 26, 2, CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 97, 33, 1, CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 100, 55, 0, CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 100, 110, 4, CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 104, 58, 3, CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 104, 58, 1, CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 109, 102, 2, CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 110, 72, 2, CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 113, 104, 5, CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 114, 101, 5, CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (53, 1, 3, 115, 100, 5, CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 92, 33, 3, CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 92, 103, 3, CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 93, 26, 5, CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 94, 26, 0, CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 94, 26, 0, CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'trivs bra tror jag ', N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 95, 26, 1, CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 95, 26, 2, CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 97, 33, 1, CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 100, 55, 0, CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 100, 110, 4, CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'Hänger mycket med kompisar', N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 104, 58, 1, CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 104, 58, 1, CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 109, 102, 4, CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 110, 72, 1, CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 113, 104, 3, CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 114, 101, 4, CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (54, 1, 4, 115, 100, 3, CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 92, 33, 2, CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 92, 103, 3, CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 93, 26, 5, CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 94, 26, 0, CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 94, 26, 5, CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 95, 26, 2, CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 95, 26, 2, CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 97, 33, 1, CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 100, 55, 1, CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 100, 110, 5, CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 104, 58, 2, CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 104, 58, 2, CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 109, 102, 5, CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 110, 72, 2, CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 113, 104, 3, CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 114, 101, 2, CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (55, 1, 5, 115, 100, 1, CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 92, 33, 4, CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 92, 103, 4, CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 93, 26, 1, CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 94, 26, 0, CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 94, 26, 5, CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 95, 26, 2, CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 95, 26, 3, CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 97, 33, 1, CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 100, 55, 5, CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 100, 110, 4, CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 104, 58, 2, CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 104, 58, 2, CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 109, 102, 0, CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 110, 72, 5, CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 113, 104, 4, CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 114, 101, 4, CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (56, 1, 6, 115, 100, 1, CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 92, 33, 1, CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 92, 103, 3, CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 93, 26, 4, CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 94, 26, 0, CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 94, 26, 5, CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 95, 26, 3, CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 95, 26, 5, CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 97, 33, 1, CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 100, 55, 4, CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 100, 110, 4, CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 104, 58, 4, CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 104, 58, 5, CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 109, 102, 3, CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 110, 72, 4, CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 113, 104, 4, CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 114, 101, 2, CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (57, 1, 7, 115, 100, 3, CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 92, 33, 3, CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 92, 103, 2, CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 93, 26, 5, CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 94, 26, 0, CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 94, 26, 5, CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 95, 26, 3, CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'', N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 95, 26, 3, CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 97, 33, 1, CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 100, 55, 4, CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 100, 110, 5, CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 104, 58, 3, CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 104, 58, 5, CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 109, 102, 5, CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 110, 72, 5, CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 113, 104, 5, CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 114, 101, 2, CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (58, 1, 8, 115, 100, 5, CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 92, 33, 4, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 92, 110, 2, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 93, 72, 1, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'2', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 95, 27, 4, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 95, 27, 5, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'adasdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 104, 26, 0, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 104, 58, 4, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 110, 72, 3, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'mycket bra ', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 110, 72, 1, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (59, 2, 2, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 92, 33, 3, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 93, 72, 5, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 94, 26, 0, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'2', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 95, 26, 0, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 95, 27, 5, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'TRYGGHET', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 95, 27, 4, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 95, 27, 4, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 97, 33, 1, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'adasdasd', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 100, 55, 1, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 104, 26, 4, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 104, 26, 3, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 104, 58, 2, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 110, 72, 2, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'mycket bra ', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 110, 72, 2, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (60, 2, 2, 114, 101, 1, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 92, 33, 4, CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'asd', N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 92, 110, 3, CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 93, 72, 2, CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 94, 26, 1, CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 95, 26, 2, CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'6', N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 95, 26, 0, CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 95, 26, 4, CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 95, 27, 2, CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'ANSVARSTAGANDE', N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 95, 27, 2, CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 95, 27, 4, CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 97, 33, 2, CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'afdssdgsdgs', N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 100, 55, 4, CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 104, 26, 2, CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 104, 26, 3, CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 104, 58, 3, CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 110, 72, 1, CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 110, 72, 0, CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireGrade] ([QuestionID], [QuestionTypeID], [QuestionLevelID], [PersonID], [UserID], [Grade], [GradedOn], [Comment], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn], [Situation]) VALUES (61, 2, 6, 114, 101, 0, CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'', N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-24T13:20:46.317' AS DateTime), NULL)
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (92, 33, 2, N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:08:46.813' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (92, 33, 2, N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:10:52.100' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (92, 33, 4, N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:13:42.590' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (92, 103, 2, N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:00:57.497' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (92, 110, 4, N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:49:54.040' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (93, 26, 2, N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:44:38.147' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (93, 26, 2, N'sql-admin', CAST(N'2022-01-11T10:24:02.997' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:24:12.987' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (93, 72, 5, N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:28:55.040' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (94, 26, 2, N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:54:00.390' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (94, 26, 2, N'sql-admin', CAST(N'2021-12-21T14:44:02.693' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:44:24.140' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (94, 26, 2, N'sql-admin', CAST(N'2022-01-11T09:38:17.270' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:41:31.647' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (94, 26, 5, N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:43:15.677' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, 26, 1, N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime), N'sql-admin', CAST(N'2022-01-11T11:58:27.390' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, 26, 1, N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime), N'sql-admin', CAST(N'2022-01-14T11:30:19.200' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, 26, 2, N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:51:48.537' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, 26, 2, N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:58:14.630' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, 26, 5, N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime), N'sql-admin', CAST(N'2021-12-22T08:11:47.093' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, 26, 5, N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime), N'sql-admin', CAST(N'2022-01-17T12:58:28.400' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, 26, 5, N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:24:17.453' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, 27, 5, N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime), N'sql-admin', CAST(N'2022-01-17T13:02:18.180' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, 27, 5, N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:27:43.170' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (95, 27, 5, N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime), N'sql-admin', CAST(N'2022-01-18T08:45:00.067' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (97, 33, 2, N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:09:06.737' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (97, 33, 2, N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime), N'sql-admin', CAST(N'2022-01-10T10:10:15.563' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (97, 33, 5, N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime), N'sql-admin', CAST(N'2022-01-10T11:06:24.993' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (98, 26, 3, N'sql-admin', CAST(N'2022-01-11T09:28:28.137' AS DateTime), N'sql-admin', CAST(N'2022-01-11T09:34:41.790' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (99, 55, 3, N'sql-admin', CAST(N'2022-01-11T10:30:47.707' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:31:01.150' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (100, 55, 2, N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:32:02.060' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (100, 55, 2, N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:34:28.497' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (100, 55, 5, N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime), N'sql-admin', CAST(N'2022-01-11T10:35:45.907' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (100, 110, 2, N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:42:51.040' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (101, 26, 1, N'sql-admin', CAST(N'2022-01-11T11:21:58.757' AS DateTime), N'sql-admin', CAST(N'2022-01-11T14:13:01.830' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (102, 26, 1, N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:09:29.577' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (103, 26, 1, N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime), N'sql-admin', CAST(N'2022-01-11T13:55:12.043' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (104, 26, 5, N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime), N'sql-admin', CAST(N'2022-01-13T15:28:27.257' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (104, 26, 5, N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:37:32.897' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (104, 58, 2, N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:54:21.940' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (104, 58, 2, N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:56:36.133' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (104, 58, 2, N'sql-admin', CAST(N'2022-01-12T09:34:22.960' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:34:27.690' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (104, 58, 5, N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime), N'sql-admin', CAST(N'2022-01-12T08:58:12.387' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (105, 58, 2, N'sql-admin', CAST(N'2022-01-12T09:29:19.630' AS DateTime), N'sql-admin', CAST(N'2022-01-12T09:29:25.020' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (106, 72, 1, N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:20:34.137' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (107, 72, 2, N'sql-admin', CAST(N'2022-01-13T14:24:05.353' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:24:58.790' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (108, 72, 1, N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:33:58.403' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (109, 72, 2, N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:36:19.850' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (109, 102, 2, N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:37:10.817' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (110, 72, 2, N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:38:08.683' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (110, 72, 2, N'sql-admin', CAST(N'2022-01-14T07:43:45.847' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:46:57.587' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (110, 72, 5, N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:49:06.763' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (110, 72, 5, N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:53:20.800' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (111, 72, 1, N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime), N'sql-admin', CAST(N'2022-01-14T07:40:04.450' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (112, 99, 2, N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime), N'sql-admin', CAST(N'2022-01-17T08:29:22.700' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (113, 104, 2, N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:08:20.960' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (113, 104, 2, N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T09:09:51.620' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (114, 101, 2, N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:31:31.037' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (114, 101, 2, N'sql-admin', CAST(N'2022-01-17T15:35:37.620' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:36:15.370' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (114, 101, 5, N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:44:45.560' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (115, 100, 2, N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:33:58.443' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (115, 100, 2, N'sql-admin', CAST(N'2022-01-17T15:39:47.477' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:43:13.857' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (116, 110, 2, N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:34:54.817' AS DateTime))
GO
INSERT [bb].[QuestionnaireStatus] ([PersonID], [UserID], [StatusID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (117, 102, 3, N'sql-admin', CAST(N'2022-01-17T15:44:53.513' AS DateTime), N'sql-admin', CAST(N'2022-01-17T15:46:12.263' AS DateTime))
GO
INSERT [bb].[QuestionType] ([QuestionTypeID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (1, N'Samtalsunderlag', N'sql-admin', CAST(N'2021-10-20T00:15:51.313' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionType] ([QuestionTypeID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (2, N'Skattning', N'sql-admin', CAST(N'2021-10-20T00:15:51.313' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionType] ([QuestionTypeID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (3, N'Skattning - fördjupad', N'sql-admin', CAST(N'2021-10-20T00:15:51.313' AS DateTime), NULL, NULL)
GO
INSERT [bb].[QuestionType] ([QuestionTypeID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (4, N'Upptäckarkort', N'sql-admin', CAST(N'2021-10-20T13:11:08.500' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [bb].[Role] ON 
GO
INSERT [bb].[Role] ([RoleID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (1, N'Upptäckare', N'sql-admin', CAST(N'2021-10-20T00:19:41.797' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Role] ([RoleID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (2, N'Barnkontakt', N'sql-admin', CAST(N'2021-10-20T00:19:41.800' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Role] ([RoleID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (3, N'Barnteam', N'sql-admin', CAST(N'2021-10-20T00:19:41.803' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Role] ([RoleID], [Description], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (4, N'Admin', N'sql-admin', CAST(N'2021-10-20T00:20:47.167' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [bb].[Role] OFF
GO
SET IDENTITY_INSERT [bb].[Status] ON 
GO
INSERT [bb].[Status] ([StatusID], [StatusName], [StatusType], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (1, N'Sparat', N'Upptäckarkort', N'sql-admin', CAST(N'2021-11-11T11:35:15.150' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Status] ([StatusID], [StatusName], [StatusType], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (2, N'Inskickat', N'Upptäckarkort', N'sql-admin', CAST(N'2021-11-11T11:35:15.150' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Status] ([StatusID], [StatusName], [StatusType], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (3, N'Anonymiserat', N'Upptäckarkort', N'sql-admin', CAST(N'2021-11-11T11:35:15.150' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Status] ([StatusID], [StatusName], [StatusType], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (4, N'Sparat', N'Skattning', N'sql-admin', CAST(N'2021-11-11T11:35:15.150' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Status] ([StatusID], [StatusName], [StatusType], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (5, N'Sammanställt', N'Skattning', N'sql-admin', CAST(N'2021-11-11T11:35:15.150' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Status] ([StatusID], [StatusName], [StatusType], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (6, N'Pågående', N'Insats', N'sql-admin', CAST(N'2021-11-11T11:35:15.150' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Status] ([StatusID], [StatusName], [StatusType], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (7, N'Avslutad', N'Insats', N'sql-admin', CAST(N'2021-11-11T11:35:15.150' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Status] ([StatusID], [StatusName], [StatusType], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (8, N'Upptäckt', N'Barn', N'sql-admin', CAST(N'2021-11-11T11:35:15.150' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Status] ([StatusID], [StatusName], [StatusType], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (9, N'I barnteam', N'Barn', N'sql-admin', CAST(N'2021-11-11T11:35:15.150' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Status] ([StatusID], [StatusName], [StatusType], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (10, N'Behov uppfyllt', N'Barn', N'sql-admin', CAST(N'2021-11-11T11:35:15.150' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Status] ([StatusID], [StatusName], [StatusType], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (11, N'Individuellt barnteam', N'Barn', N'sql-admin', CAST(N'2021-11-23T13:29:04.420' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [bb].[Status] OFF
GO
SET IDENTITY_INSERT [bb].[Team] ON 
GO
INSERT [bb].[Team] ([TeamID], [TeamName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (15, N'Backa-teamet', N'sql-admin', CAST(N'2021-12-20T15:14:20.703' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:14:20.703' AS DateTime))
GO
INSERT [bb].[Team] ([TeamID], [TeamName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (29, N'Lotus', N'sql-admin', CAST(N'2021-12-21T09:23:43.073' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:23:43.073' AS DateTime))
GO
INSERT [bb].[Team] ([TeamID], [TeamName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (30, N'Lotus', N'sql-admin', CAST(N'2021-12-21T09:23:43.073' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:23:43.073' AS DateTime))
GO
INSERT [bb].[Team] ([TeamID], [TeamName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (32, N'Grupp 1', N'sql-admin', CAST(N'2021-12-21T09:28:25.160' AS DateTime), N'sql-admin', CAST(N'2021-12-21T09:28:25.160' AS DateTime))
GO
INSERT [bb].[Team] ([TeamID], [TeamName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (35, N'Sjuk', N'sql-admin', CAST(N'2021-12-21T10:31:21.333' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:31:21.333' AS DateTime))
GO
INSERT [bb].[Team] ([TeamID], [TeamName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (39, N'teamet norreportskolan', N'sql-admin', CAST(N'2022-01-11T12:16:19.830' AS DateTime), N'sql-admin', CAST(N'2022-01-11T12:16:19.830' AS DateTime))
GO
INSERT [bb].[Team] ([TeamID], [TeamName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (40, N'Skåne', N'sql-admin', CAST(N'2022-01-13T14:03:37.277' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:03:37.277' AS DateTime))
GO
SET IDENTITY_INSERT [bb].[Team] OFF
GO
INSERT [bb].[TeamUnit] ([TeamID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (15, 5, N'sql-admin', CAST(N'2021-12-20T15:14:20.703' AS DateTime), N'sql-admin', CAST(N'2021-12-20T15:14:20.703' AS DateTime))
GO
INSERT [bb].[TeamUnit] ([TeamID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (35, 1, N'sql-admin', CAST(N'2021-12-21T10:31:21.457' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:31:21.457' AS DateTime))
GO
INSERT [bb].[TeamUnit] ([TeamID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (35, 2, N'sql-admin', CAST(N'2021-12-21T10:31:21.333' AS DateTime), N'sql-admin', CAST(N'2021-12-21T10:31:21.333' AS DateTime))
GO
INSERT [bb].[TeamUnit] ([TeamID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (39, 6, N'sql-admin', CAST(N'2022-01-11T12:16:19.830' AS DateTime), N'sql-admin', CAST(N'2022-01-11T12:16:19.830' AS DateTime))
GO
INSERT [bb].[TeamUnit] ([TeamID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (40, 3, N'sql-admin', CAST(N'2022-01-13T14:03:37.277' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:03:37.277' AS DateTime))
GO
SET IDENTITY_INSERT [bb].[Unit] ON 
GO
INSERT [bb].[Unit] ([UnitID], [UnitName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (1, N'Barnmorskemottagningen Ystad (Region Skåne)', N'sql-admin', CAST(N'2021-10-31T22:52:13.207' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Unit] ([UnitID], [UnitName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (2, N'Barnavårdscentralen Ystad (Region Skåne)', N'sql-admin', CAST(N'2021-10-31T22:52:23.640' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Unit] ([UnitID], [UnitName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (3, N'Källan förskola', N'sql-admin', CAST(N'2021-10-31T22:52:34.560' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Unit] ([UnitID], [UnitName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (4, N'Backa förskola', N'sql-admin', CAST(N'2021-10-31T22:52:42.967' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Unit] ([UnitID], [UnitName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (5, N'Backaskolan', N'sql-admin', CAST(N'2021-10-31T22:52:51.310' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Unit] ([UnitID], [UnitName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (6, N'Norreportskolan', N'sql-admin', CAST(N'2021-10-31T22:52:57.687' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Unit] ([UnitID], [UnitName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (7, N'Annan', N'sql-admin', CAST(N'2021-11-01T10:26:39.310' AS DateTime), NULL, NULL)
GO
INSERT [bb].[Unit] ([UnitID], [UnitName], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (8, N'Ingen enhet', N'sql-admin', CAST(N'2021-12-10T14:38:56.143' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [bb].[Unit] OFF
GO
SET IDENTITY_INSERT [bb].[User] ON 
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (26, N'Administrator', N'Database', N'admin@cgi.com', N'pw123', N'CGI', N'sql-admin', CAST(N'2021-12-20T13:41:32.763' AS DateTime), N'sql-admin', CAST(N'2021-12-20T13:41:32.763' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (27, N'Abbas', N'Aml', N'aml.abbas@cgi.com', N'pw123', N'CGI', N'sql-admin', CAST(N'2021-12-20T13:50:22.133' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:43:03.860' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (28, N'Karahmetovic', N'Adnan', N'adnan.karahmetovic@cgi.com', N'pw123', N'CGI', N'sql-admin', CAST(N'2021-12-20T14:08:14.500' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (33, N'Grönvall', N'Nils', N'nils.gronvall@cgi.com', N'pw123', N'CGI', N'sql-admin', CAST(N'2021-12-20T15:01:29.567' AS DateTime), N'sql-admin', CAST(N'2022-01-13T14:08:37.363' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, N'afwgwfaqg', N'wafdasw', N'aml.abbas@hotmail.com', N'pw123', N'cgi', N'sql-admin', CAST(N'2021-12-21T08:29:54.240' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, N'afwgwfaqg', N'wafdasw', N'aml.abbas@hotmail.com', N'pw123', N'cgi', N'sql-admin', CAST(N'2021-12-21T08:29:54.250' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, N'Jönsson', N'Tony', N'tony.jonsson@cgi.com', N'pw123', N'CGI', N'sql-admin', CAST(N'2021-12-21T08:38:07.860' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:10:10.857' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, N'Wedberg', N'Louise', N'louise.wedberg@cgi.com', N'pw123', N'CGi', N'sql-admin', CAST(N'2021-12-21T09:08:44.657' AS DateTime), N'sql-admin', CAST(N'2022-01-14T14:12:28.083' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, N'Ekwall', N'Albin', N'albin.ekwall@cgi.com', N'pw123', N'CGI', N'sql-admin', CAST(N'2021-12-21T09:14:22.533' AS DateTime), N'sql-admin', CAST(N'2022-01-14T08:27:48.910' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (61, N'Gren', N'Lena', N'l.gren@stil.se', N'pw123', N'STIL', N'sql-admin', CAST(N'2021-12-21T09:27:54.270' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (62, N'Gren', N'Lena', N'l.gren@stil.se', N'pw123', N'STIL', N'sql-admin', CAST(N'2021-12-21T09:27:54.270' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (67, N'Betner', N'Lars', N'l.b@skane.se', N'pw123', N'skåne', N'sql-admin', CAST(N'2022-01-11T10:38:11.077' AS DateTime), N'sql-admin', CAST(N'2022-01-14T14:12:41.583' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (68, N'Nilsson', N'Luna', N'luna@cgi.com', N'pw123', N'cgi', N'sql-admin', CAST(N'2022-01-11T12:14:37.160' AS DateTime), N'sql-admin', CAST(N'2022-01-14T08:13:00.243' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (72, N'Larsson', N'Allan', N'a.l@cgi.com', N'pw123', N'CGI', N'sql-admin', CAST(N'2022-01-13T14:11:39.690' AS DateTime), N'sql-admin', CAST(N'2022-01-14T14:13:18.230' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (73, N'Ekwall', N'Albin', N'albin2@cgi.com', N'pw123', N'CGI', N'sql-admin', CAST(N'2022-01-13T14:46:31.457' AS DateTime), N'sql-admin', CAST(N'2022-01-14T14:13:30.077' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (80, N'abbas', N'aml', N'aml@hotmail.com', N'pw123', N'private', N'sql-admin', CAST(N'2022-01-14T12:52:43.263' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (81, N'barnteam', N'aml', N'barn@cgi.com', N'pw123', N'cgi', N'sql-admin', CAST(N'2022-01-14T12:53:29.687' AS DateTime), N'sql-admin', CAST(N'2022-01-14T14:14:29.580' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (99, N'Bäckwall', N'Jarkko', N'jarkko.backwall@skane.se', N'pw123', N'Skåne', N'sql-admin', CAST(N'2022-01-14T14:16:37.890' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (100, N'Gunnarsson', N'Mattias', N'mattias.gunnarsson@ystad.se', N'pw123', N'Ystad', N'sql-admin', CAST(N'2022-01-14T14:17:55.187' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (101, N'Hansson', N'Alexandra', N'alexandra.hansson@ystad.se', N'pw123', N'Ystad', N'sql-admin', CAST(N'2022-01-14T14:18:37.373' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (102, N'Nilsson', N'Roger', N'roger.nilsson@ystad.se', N'pw123', N'Ystad', N'sql-admin', CAST(N'2022-01-14T14:19:17.250' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (103, N'Olofsson', N'Jessica', N'jessica.olofsson@ystad.se', N'pw123', N'Ystad', N'sql-admin', CAST(N'2022-01-14T14:19:52.763' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (104, N'Persson', N'Carita', N'carita.persson@ystad.se', N'pw123', N'Ystad', N'sql-admin', CAST(N'2022-01-14T14:20:23.560' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (105, N'Kvarnström', N'Ulrika', N'ulrika.kvarnstrom@polisen.se', N'pw123', N'Polisen', N'sql-admin', CAST(N'2022-01-14T14:33:30.430' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (108, N'Kitterndorff Månsson', N'Nicolas', N'nicolas.kittendorffmansson@ystad.se', N'pw123', N'Ystad', N'sql-admin', CAST(N'2022-01-14T14:34:35.130' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (109, N'Ekstrand', N'Caroline', N'caroline.ekstrand@ystad.se', N'pw123', N'Ystad', N'sql-admin', CAST(N'2022-01-14T14:35:08.397' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (110, N'Andersson', N'Caroline', N'caroline.andersson@polisen.se', N'pw123', N'Polisen', N'sql-admin', CAST(N'2022-01-14T14:35:48.863' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (116, N'Ekwall', N'Albin', N'albin3@cgi.com', N'pw123', N'CGI', N'sql-admin', CAST(N'2022-01-17T09:10:59.150' AS DateTime), N'sql-admin', CAST(N'2022-03-03T14:23:47.917' AS DateTime))
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (117, N'end', N'testare', N'testare@cgi.com', N'pw123', N'cgi', N'sql-admin', CAST(N'2022-01-17T09:28:42.480' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (118, N'Right', N'Aml', N'aml.abbas@gmail.com', N'pw123', N'private', N'sql-admin', CAST(N'2022-03-04T09:43:20.793' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (119, N'Test', N'Aml', N'aml.test@gmail.com', N'pw123', N'Private', N'sql-admin', CAST(N'2022-03-04T09:45:33.330' AS DateTime), NULL, NULL)
GO
INSERT [bb].[User] ([UserID], [LastName], [FirstName], [Email], [Password], [Organisation], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (120, N'Test', N'Aml', N'aml.test@gmail.com', N'pw123', N'Private', N'sql-admin', CAST(N'2022-03-04T09:45:33.330' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [bb].[User] OFF
GO
INSERT [bb].[UserRight] ([CurrentUserID], [UserID], [PersonID], [QuestionTypeID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (109, 55, 94, 1, N'sql-admin', CAST(N'2022-03-03T14:17:06.187' AS DateTime), N'sql-admin', CAST(N'2022-03-03T14:17:06.187' AS DateTime))
GO
INSERT [bb].[UserRight] ([CurrentUserID], [UserID], [PersonID], [QuestionTypeID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (109, 110, 95, 1, N'sql-admin', CAST(N'2022-03-03T15:44:11.723' AS DateTime), N'sql-admin', CAST(N'2022-03-03T15:44:11.723' AS DateTime))
GO
INSERT [bb].[UserRight] ([CurrentUserID], [UserID], [PersonID], [QuestionTypeID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (109, 116, 112, 2, N'sql-admin', CAST(N'2022-03-03T15:43:42.140' AS DateTime), N'sql-admin', CAST(N'2022-03-03T15:43:42.140' AS DateTime))
GO
INSERT [bb].[UserRight] ([CurrentUserID], [UserID], [PersonID], [QuestionTypeID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (109, 118, 93, 1, N'sql-admin', CAST(N'2022-03-04T09:44:42.250' AS DateTime), N'sql-admin', CAST(N'2022-03-04T09:44:42.250' AS DateTime))
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (26, 4, N'sql-admin', CAST(N'2021-12-20T13:43:13.370' AS DateTime), N'sql-admin', CAST(N'2021-12-20T13:43:13.370' AS DateTime))
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (27, 3, N'sql-admin', CAST(N'2021-12-20T13:50:22.133' AS DateTime), N'sql-admin', CAST(N'2022-01-14T12:43:03.860' AS DateTime))
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (28, 1, N'sql-admin', CAST(N'2021-12-20T14:08:14.500' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, 2, N'sql-admin', CAST(N'2021-12-21T08:29:54.240' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, 3, N'sql-admin', CAST(N'2021-12-21T08:38:07.860' AS DateTime), N'sql-admin', CAST(N'2021-12-21T14:10:10.857' AS DateTime))
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, 1, N'sql-admin', CAST(N'2021-12-21T09:08:44.657' AS DateTime), N'sql-admin', CAST(N'2022-01-14T14:12:28.083' AS DateTime))
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (61, 2, N'sql-admin', CAST(N'2021-12-21T09:27:54.270' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (67, 1, N'sql-admin', CAST(N'2022-01-11T10:38:11.077' AS DateTime), N'sql-admin', CAST(N'2022-01-14T14:12:41.583' AS DateTime))
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (68, 2, N'sql-admin', CAST(N'2022-01-11T12:14:37.160' AS DateTime), N'sql-admin', CAST(N'2022-01-14T08:13:00.243' AS DateTime))
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (72, 1, N'sql-admin', CAST(N'2022-01-13T14:11:39.690' AS DateTime), N'sql-admin', CAST(N'2022-01-14T14:13:18.230' AS DateTime))
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (73, 1, N'sql-admin', CAST(N'2022-01-13T14:46:31.457' AS DateTime), N'sql-admin', CAST(N'2022-01-14T14:13:30.077' AS DateTime))
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (80, 1, N'sql-admin', CAST(N'2022-01-14T12:52:43.263' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (81, 1, N'sql-admin', CAST(N'2022-01-14T12:53:29.687' AS DateTime), N'sql-admin', CAST(N'2022-01-14T14:14:29.580' AS DateTime))
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (99, 2, N'sql-admin', CAST(N'2022-01-14T14:16:37.890' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (100, 2, N'sql-admin', CAST(N'2022-01-14T14:17:55.187' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (101, 2, N'sql-admin', CAST(N'2022-01-14T14:18:37.373' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (102, 2, N'sql-admin', CAST(N'2022-01-14T14:19:17.250' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (103, 2, N'sql-admin', CAST(N'2022-01-14T14:19:52.763' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (104, 2, N'sql-admin', CAST(N'2022-01-14T14:20:23.560' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (105, 4, N'sql-admin', CAST(N'2022-01-14T14:33:30.430' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (108, 4, N'sql-admin', CAST(N'2022-01-14T14:34:35.130' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (109, 4, N'sql-admin', CAST(N'2022-01-14T14:35:08.397' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (110, 4, N'sql-admin', CAST(N'2022-01-14T14:35:48.863' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (116, 4, N'sql-admin', CAST(N'2022-01-17T09:10:59.150' AS DateTime), N'sql-admin', CAST(N'2022-03-03T14:23:47.917' AS DateTime))
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (117, 3, N'sql-admin', CAST(N'2022-01-17T09:28:42.480' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (118, 1, N'sql-admin', CAST(N'2022-03-04T09:43:20.793' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserRole] ([UserID], [RoleID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (119, 3, N'sql-admin', CAST(N'2022-03-04T09:45:33.330' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (27, 3, N'sql-admin', CAST(N'2022-01-14T12:43:03.770' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (27, 4, N'sql-admin', CAST(N'2022-01-14T12:43:03.837' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (27, 5, N'sql-admin', CAST(N'2022-01-14T12:43:03.860' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (28, 8, N'sql-admin', CAST(N'2021-12-20T14:08:14.500' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, 8, N'sql-admin', CAST(N'2022-01-14T14:12:28.083' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (67, 8, N'sql-admin', CAST(N'2022-01-14T14:12:41.583' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (72, 8, N'sql-admin', CAST(N'2022-01-14T14:13:18.230' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (73, 8, N'sql-admin', CAST(N'2022-01-14T14:13:30.077' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (99, 1, N'sql-admin', CAST(N'2022-01-14T14:16:37.890' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (100, 3, N'sql-admin', CAST(N'2022-01-14T14:17:55.187' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (101, 2, N'sql-admin', CAST(N'2022-01-14T14:18:37.373' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (102, 4, N'sql-admin', CAST(N'2022-01-14T14:19:17.250' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (103, 5, N'sql-admin', CAST(N'2022-01-14T14:19:52.763' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (104, 6, N'sql-admin', CAST(N'2022-01-14T14:20:23.560' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (105, 8, N'sql-admin', CAST(N'2022-01-14T14:33:30.430' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (108, 8, N'sql-admin', CAST(N'2022-01-14T14:34:35.130' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (109, 8, N'sql-admin', CAST(N'2022-01-14T14:35:08.397' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (110, 8, N'sql-admin', CAST(N'2022-01-14T14:35:48.863' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (116, 8, N'sql-admin', CAST(N'2022-03-03T14:23:47.917' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (117, 3, N'sql-admin', CAST(N'2022-01-17T09:28:42.540' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (117, 4, N'sql-admin', CAST(N'2022-01-17T09:28:49.857' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (117, 5, N'sql-admin', CAST(N'2022-01-17T09:28:42.480' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (117, 6, N'sql-admin', CAST(N'2022-01-17T09:28:42.597' AS DateTime), NULL, NULL)
GO
INSERT [bb].[UserUnit] ([UserID], [UnitID], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (118, 8, N'sql-admin', CAST(N'2022-03-04T09:43:20.793' AS DateTime), NULL, NULL)
GO
ALTER TABLE [bb].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Person] FOREIGN KEY([PersonID])
REFERENCES [bb].[Person] ([PersonID])
GO
ALTER TABLE [bb].[Contact] CHECK CONSTRAINT [FK_Contact_Person]
GO
ALTER TABLE [bb].[PersonUser]  WITH CHECK ADD  CONSTRAINT [FK_PersonUser_Person] FOREIGN KEY([PersonID])
REFERENCES [bb].[Person] ([PersonID])
GO
ALTER TABLE [bb].[PersonUser] CHECK CONSTRAINT [FK_PersonUser_Person]
GO
ALTER TABLE [bb].[PersonUser]  WITH CHECK ADD  CONSTRAINT [FK_PersonUser_User] FOREIGN KEY([UserID])
REFERENCES [bb].[User] ([UserID])
GO
ALTER TABLE [bb].[PersonUser] CHECK CONSTRAINT [FK_PersonUser_User]
GO
ALTER TABLE [bb].[QuestionGuardian]  WITH CHECK ADD  CONSTRAINT [FK_QuestionGuardian_Question] FOREIGN KEY([QuestionID])
REFERENCES [bb].[Question] ([QuestionID])
GO
ALTER TABLE [bb].[QuestionGuardian] CHECK CONSTRAINT [FK_QuestionGuardian_Question]
GO
ALTER TABLE [bb].[Questionnaire]  WITH CHECK ADD  CONSTRAINT [FK_Questionnaire_Question] FOREIGN KEY([QuestionID])
REFERENCES [bb].[Question] ([QuestionID])
GO
ALTER TABLE [bb].[Questionnaire] CHECK CONSTRAINT [FK_Questionnaire_Question]
GO
ALTER TABLE [bb].[Questionnaire]  WITH CHECK ADD  CONSTRAINT [FK_Questionnaire_QuestionLevel] FOREIGN KEY([QuestionLevelID])
REFERENCES [bb].[QuestionLevel] ([QuestionLevelID])
GO
ALTER TABLE [bb].[Questionnaire] CHECK CONSTRAINT [FK_Questionnaire_QuestionLevel]
GO
ALTER TABLE [bb].[Questionnaire]  WITH CHECK ADD  CONSTRAINT [FK_Questionnaire_QuestionType] FOREIGN KEY([QuestionTypeID])
REFERENCES [bb].[QuestionType] ([QuestionTypeID])
GO
ALTER TABLE [bb].[Questionnaire] CHECK CONSTRAINT [FK_Questionnaire_QuestionType]
GO
ALTER TABLE [bb].[QuestionnaireGrade]  WITH CHECK ADD  CONSTRAINT [FK_QuestionnaireGrade_Person] FOREIGN KEY([PersonID])
REFERENCES [bb].[Person] ([PersonID])
GO
ALTER TABLE [bb].[QuestionnaireGrade] CHECK CONSTRAINT [FK_QuestionnaireGrade_Person]
GO
ALTER TABLE [bb].[QuestionnaireGrade]  WITH CHECK ADD  CONSTRAINT [FK_QuestionnaireGrade_Question] FOREIGN KEY([QuestionID])
REFERENCES [bb].[Question] ([QuestionID])
GO
ALTER TABLE [bb].[QuestionnaireGrade] CHECK CONSTRAINT [FK_QuestionnaireGrade_Question]
GO
ALTER TABLE [bb].[QuestionnaireGrade]  WITH CHECK ADD  CONSTRAINT [FK_QuestionnaireGrade_QuestionLevel] FOREIGN KEY([QuestionLevelID])
REFERENCES [bb].[QuestionLevel] ([QuestionLevelID])
GO
ALTER TABLE [bb].[QuestionnaireGrade] CHECK CONSTRAINT [FK_QuestionnaireGrade_QuestionLevel]
GO
ALTER TABLE [bb].[QuestionnaireGrade]  WITH CHECK ADD  CONSTRAINT [FK_QuestionnaireGrade_QuestionType] FOREIGN KEY([QuestionTypeID])
REFERENCES [bb].[QuestionType] ([QuestionTypeID])
GO
ALTER TABLE [bb].[QuestionnaireGrade] CHECK CONSTRAINT [FK_QuestionnaireGrade_QuestionType]
GO
ALTER TABLE [bb].[QuestionnaireGrade]  WITH CHECK ADD  CONSTRAINT [FK_QuestionnaireGrade_User] FOREIGN KEY([UserID])
REFERENCES [bb].[User] ([UserID])
GO
ALTER TABLE [bb].[QuestionnaireGrade] CHECK CONSTRAINT [FK_QuestionnaireGrade_User]
GO
ALTER TABLE [bb].[QuestionnaireStatus]  WITH CHECK ADD  CONSTRAINT [FK_QuestionnaireStatus_Person] FOREIGN KEY([PersonID])
REFERENCES [bb].[Person] ([PersonID])
GO
ALTER TABLE [bb].[QuestionnaireStatus] CHECK CONSTRAINT [FK_QuestionnaireStatus_Person]
GO
ALTER TABLE [bb].[QuestionnaireStatus]  WITH CHECK ADD  CONSTRAINT [FK_QuestionnaireStatus_Status] FOREIGN KEY([StatusID])
REFERENCES [bb].[Status] ([StatusID])
GO
ALTER TABLE [bb].[QuestionnaireStatus] CHECK CONSTRAINT [FK_QuestionnaireStatus_Status]
GO
ALTER TABLE [bb].[QuestionnaireStatus]  WITH CHECK ADD  CONSTRAINT [FK_QuestionnaireStatus_User] FOREIGN KEY([UserID])
REFERENCES [bb].[User] ([UserID])
GO
ALTER TABLE [bb].[QuestionnaireStatus] CHECK CONSTRAINT [FK_QuestionnaireStatus_User]
GO
ALTER TABLE [bb].[TeamUnit]  WITH CHECK ADD  CONSTRAINT [FK_TeamUnit_Team] FOREIGN KEY([TeamID])
REFERENCES [bb].[Team] ([TeamID])
GO
ALTER TABLE [bb].[TeamUnit] CHECK CONSTRAINT [FK_TeamUnit_Team]
GO
ALTER TABLE [bb].[TeamUnit]  WITH CHECK ADD  CONSTRAINT [FK_TeamUnit_Unit] FOREIGN KEY([UnitID])
REFERENCES [bb].[Unit] ([UnitID])
GO
ALTER TABLE [bb].[TeamUnit] CHECK CONSTRAINT [FK_TeamUnit_Unit]
GO
ALTER TABLE [bb].[UserRight]  WITH CHECK ADD  CONSTRAINT [FK_UserRight_User] FOREIGN KEY([UserID])
REFERENCES [bb].[User] ([UserID])
GO
ALTER TABLE [bb].[UserRight] CHECK CONSTRAINT [FK_UserRight_User]
GO
ALTER TABLE [bb].[UserRight]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Person] FOREIGN KEY([PersonID])
REFERENCES [bb].[Person] ([PersonID])
GO
ALTER TABLE [bb].[UserRight] CHECK CONSTRAINT [FK_UserRole_Person]
GO
ALTER TABLE [bb].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleID])
REFERENCES [bb].[Role] ([RoleID])
GO
ALTER TABLE [bb].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [bb].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserID])
REFERENCES [bb].[User] ([UserID])
GO
ALTER TABLE [bb].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
ALTER TABLE [bb].[UserUnit]  WITH CHECK ADD  CONSTRAINT [FK_UserUnit_Unit] FOREIGN KEY([UnitID])
REFERENCES [bb].[Unit] ([UnitID])
GO
ALTER TABLE [bb].[UserUnit] CHECK CONSTRAINT [FK_UserUnit_Unit]
GO
ALTER TABLE [bb].[UserUnit]  WITH CHECK ADD  CONSTRAINT [FK_UserUnit_User] FOREIGN KEY([UserID])
REFERENCES [bb].[User] ([UserID])
GO
ALTER TABLE [bb].[UserUnit] CHECK CONSTRAINT [FK_UserUnit_User]
GO
/****** Object:  StoredProcedure [bb].[usp_CreateAction]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [bb].[usp_CreateAction] @PersonID int, @Action varchar(500), @EventID int, @Responsible varchar(50), @Profession varchar(50)
as

declare @date datetime
set @date = getdate()
begin try

	insert into bb.Action (Description, EventID, PersonID, StatusID, CreatedBy, CreatedOn, ChangedBy, ChangedOn, Responsible, Profession) values (@Action, @EventID, @PersonID, 6, 'sql-admin', @date, 'sql-admin', @date, @Responsible, @Profession)
	
	
	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch
GO
/****** Object:  StoredProcedure [bb].[usp_CreateCard]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_CreateCard] @UserID int, @PersonFirstName varchar(50), @PersonLastName varchar(50), @PersonNbr varchar(12), @GuardianName1 varchar(50), @GuardianNbr1 varchar(12), @GuardianName2 varchar(50), @GuardianNbr2 varchar(12), @Unit varchar(50), @Situation varchar(500), 
								   @gradeActions int, @commentActions varchar(500), @gradeOmsorg int, @commentOmsorg varchar(500), @gradeTrygghet int, @commentTrygghet varchar(500), @gradeMarBra int, @commentMarBra varchar(500), @gradeFritid int, @commentFritid varchar(500), @gradeTillhorighet int, @commentTillhorighet varchar(500), @gradeAnsvarstagande int, @commentAnsvarstagande varchar(500),
								   @gradeRespekteras int, @commentRespekteras varchar(500), @gradeUtvecklas int, @commentUtvecklas varchar(500), @gradeUpprattats1 int, @gradeUpprattats2 int, @gradeSamtycke1 int, @gradeSamtycke2 int, @Status int
as

declare @personExists int, @personUserExists int, @grade49 int, @grade50 int, @Date datetime
--set @PersonNbr = '201001019999'
--set @Status = 1
--set @UserID = 1
set @Date = getdate()

begin try


	--kolla om barnet finns
	if exists (select top 1 1 from bb.Person where PersonNbr = @PersonNbr)
	begin
		set @personExists = 1
	end
	else
	begin
		set @personExists = 0
	end

	--kolla om användarens koppling till barnet finns
	if exists (select top 1 1 from bb.PersonUser where UserID = @UserID and PersonID = (select PersonID from bb.Person where PersonNbr = @PersonNbr))
	begin
		set @personUserExists = 1
	end
	else
	begin
		set @personUserExists = 0
	end

	--status 0 = anonymisera
	--status 1 = skicka in
	--status 2 = spara

	if(@Status = 1)
	begin

		--skapa barn om det inte redan finns
		if(@personExists <> 1)
		begin
			insert into bb.Person (PersonNbr, LastName, FirstName, Unit, Status, Guardian1, GuardianPersonNbr1, Guardian2, GuardianPersonNbr2, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (@PersonNbr, @PersonLastName, @PersonFirstName, @Unit, (select StatusName from bb.Status where StatusID = 8), @GuardianName1, @GuardianNbr1, @GuardianName2, @GuardianNbr2, 'sql-admin', @Date, 'sql-admin', @Date) 
		end

		--skapa koppling om det inte redan finns
		if(@personUserExists <> 1)
		begin
			insert into bb.PersonUser (PersonID, UserID, CreatedBy, CreatedOn) values ((select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, 'sql-admin', @Date)
		end


		--vårdnadshavares svar
		insert into bb.QuestionGuardian (QuestionID, GuardianPersonNbr1, Grade1, GuardianPersonNbr2, Grade2, GradedOn, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (49, @GuardianNbr1, @gradeUpprattats1, @GuardianNbr2, @gradeUpprattats2, @Date, 'sql-admin', @Date, 'sql-admin', @Date),
																																					(50, @GuardianNbr1, @gradeSamtycke1, @GuardianNbr2, @gradeSamtycke2, @Date, 'sql-admin', @Date, 'sql-admin', @Date)
		
		--2021-10-21 00:03:42.797 test
		set @grade49 = (select Grade1 + Grade2 from bb.QuestionGuardian where QuestionID = 49 and GradedOn = @Date)
		set @grade50 = (select Grade1 + Grade2 from bb.QuestionGuardian where QuestionID = 50 and GradedOn = @Date)

		--upptäckarkortets betyg
		insert into bb.QuestionnaireGrade (QuestionID, QuestionTypeID, QuestionLevelID, PersonID, UserID, Grade, GradedOn, Comment, CreatedBy, CreatedOn, ChangedBy, ChangedOn, Situation) values (40, 4, 1, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeOmsorg, @Date, @commentOmsorg, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(41, 4, 2, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeTrygghet, @Date, @commentTrygghet, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(42, 4, 3, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeMarBra, @Date, @commentMarBra, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(43, 4, 4, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeFritid, @Date, @commentFritid, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(44, 4, 5, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeTillhorighet, @Date, @commentTillhorighet, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(45, 4, 6, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeAnsvarstagande, @Date, @commentAnsvarstagande, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(46, 4, 7, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeRespekteras, @Date, @commentRespekteras, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(47, 4, 8, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeUtvecklas, @Date, @commentUtvecklas, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(48, 4, 9, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeActions, @Date, @commentActions, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(49, 4, 9, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @grade49, @Date, null, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(50, 4, 9, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @grade50, @Date, null, 'sql-admin', @Date, 'sql-admin', @Date, @Situation)
		--upptäckarkortets status
		insert into bb.QuestionnaireStatus (PersonID, UserID, StatusID, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values ((select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, 2, 'sql-admin', @Date, 'sql-admin', @Date)
	end
	else if(@Status = 2)
	begin
	
		--skapa barn om det inte redan finns
		if(@personExists <> 1)
		begin
			insert into bb.Person (PersonNbr, LastName, FirstName, Unit, Status, Guardian1, GuardianPersonNbr1, Guardian2, GuardianPersonNbr2, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (@PersonNbr, @PersonLastName, @PersonFirstName, @Unit, (select StatusName from bb.Status where StatusID = 8), @GuardianName1, @GuardianNbr1, @GuardianName2, @GuardianNbr2, 'sql-admin', @Date, 'sql-admin', @Date) 
		end

		--skapa koppling om det inte redan finns
		if(@personUserExists <> 1)
		begin
			insert into bb.PersonUser (PersonID, UserID, CreatedBy, CreatedOn) values ((select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, 'sql-admin', @Date)
		end

		--vårdnadshavares svar
		insert into bb.QuestionGuardian (QuestionID, GuardianPersonNbr1, Grade1, GuardianPersonNbr2, Grade2, GradedOn, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (49, @GuardianNbr1, @gradeUpprattats1, @GuardianNbr2, @gradeUpprattats2, @Date, 'sql-admin', @Date, 'sql-admin', @Date),
																																					(50, @GuardianNbr1, @gradeSamtycke1, @GuardianNbr2, @gradeSamtycke2, @Date, 'sql-admin', @Date, 'sql-admin', @Date)

		--2021-10-21 00:03:42.797 test
		set @grade49 = (select Grade1 + Grade2 from bb.QuestionGuardian where QuestionID = 49 and GradedOn = @Date)
		set @grade50 = (select Grade1 + Grade2 from bb.QuestionGuardian where QuestionID = 50 and GradedOn = @Date)

		--upptäckarkortets betyg
		insert into bb.QuestionnaireGrade (QuestionID, QuestionTypeID, QuestionLevelID, PersonID, UserID, Grade, GradedOn, Comment, CreatedBy, CreatedOn, ChangedBy, ChangedOn, Situation) values (40, 4, 1, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeOmsorg, @Date, @commentOmsorg, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(41, 4, 2, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeTrygghet, @Date, @commentTrygghet, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(42, 4, 3, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeMarBra, @Date, @commentMarBra, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(43, 4, 4, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeFritid, @Date, @commentFritid, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(44, 4, 5, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeTillhorighet, @Date, @commentTillhorighet, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(45, 4, 6, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeAnsvarstagande, @Date, @commentAnsvarstagande, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(46, 4, 7, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeRespekteras, @Date, @commentRespekteras, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(47, 4, 8, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeUtvecklas, @Date, @commentUtvecklas, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(48, 4, 9, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeActions, @Date, @commentActions, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(49, 4, 9, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @grade49, @Date, null, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(50, 4, 9, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @grade50, @Date, null, 'sql-admin', @Date, 'sql-admin', @Date, @Situation)
		--upptäckarkortets status
		insert into bb.QuestionnaireStatus (PersonID, UserID, StatusID, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values ((select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, 1, 'sql-admin', @Date, 'sql-admin', @Date)
	end
	else
	begin

		--skapa barn om det inte redan finns
		if(@personExists <> 1)
		begin
			insert into bb.Person (PersonNbr, LastName, FirstName, Unit, Status, Guardian1, GuardianPersonNbr1, Guardian2, GuardianPersonNbr2, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (@PersonNbr, @PersonLastName, @PersonFirstName, @Unit, 'Anonymiserad', @GuardianName1, @GuardianNbr1, @GuardianName2, @GuardianNbr2, 'sql-admin', @Date, 'sql-admin', @Date) 
		end

		--skapa koppling om det inte redan finns
		if(@personUserExists <> 1)
		begin
			insert into bb.PersonUser (PersonID, UserID, CreatedBy, CreatedOn) values ((select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, 'sql-admin', @Date)
		end

		--vårdnadshavares svar
		insert into bb.QuestionGuardian (QuestionID, GuardianPersonNbr1, Grade1, GuardianPersonNbr2, Grade2, GradedOn, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (49, @GuardianNbr1, @gradeUpprattats1, @GuardianNbr2, @gradeUpprattats2, @Date, 'sql-admin', @Date, 'sql-admin', @Date),
																																					(50, @GuardianNbr1, @gradeSamtycke1, @GuardianNbr2, @gradeSamtycke2, @Date, 'sql-admin', @Date, 'sql-admin', @Date)

		--2021-10-21 00:03:42.797 test
		set @grade49 = (select Grade1 + Grade2 from bb.QuestionGuardian where QuestionID = 49 and GradedOn = @Date)
		set @grade50 = (select Grade1 + Grade2 from bb.QuestionGuardian where QuestionID = 50 and GradedOn = @Date)

		--upptäckarkortets betyg
		insert into bb.QuestionnaireGrade (QuestionID, QuestionTypeID, QuestionLevelID, PersonID, UserID, Grade, GradedOn, Comment, CreatedBy, CreatedOn, ChangedBy, ChangedOn, Situation) values (40, 4, 1, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeOmsorg, @Date, @commentOmsorg, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(41, 4, 2, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeTrygghet, @Date, @commentTrygghet, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(42, 4, 3, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeMarBra, @Date, @commentMarBra, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(43, 4, 4, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeFritid, @Date, @commentFritid, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(44, 4, 5, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeTillhorighet, @Date, @commentTillhorighet, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(45, 4, 6, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeAnsvarstagande, @Date, @commentAnsvarstagande, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(46, 4, 7, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeRespekteras, @Date, @commentRespekteras, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(47, 4, 8, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeUtvecklas, @Date, @commentUtvecklas, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(48, 4, 9, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @gradeActions, @Date, @commentActions, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(49, 4, 9, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @grade49, @Date, null, 'sql-admin', @Date, 'sql-admin', @Date, @Situation),
																																									(50, 4, 9, (select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, @grade50, @Date, null, 'sql-admin', @Date, 'sql-admin', @Date, @Situation)
		--upptäckarkortets status
		insert into bb.QuestionnaireStatus (PersonID, UserID, StatusID, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values ((select PersonID from bb.Person where PersonNbr = @PersonNbr), @UserID, 3, 'sql-admin', @Date, 'sql-admin', @Date)

	end

	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch
GO
/****** Object:  StoredProcedure [bb].[usp_CreateEstimate]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_CreateEstimate] @PersonID int, @UserID int, 
									   @GradeOmsorg1 int, @GradeOmsorg2 int, @GradeOmsorg3 int, @GradeOmsorg4 int, @GradeOmsorg5 int, @GradeOmsorg6 int, @CommentOmsorg varchar(500),
									   @GradeTrygghet1 int, @GradeTrygghet2 int, @GradeTrygghet3 int, @GradeTrygghet4 int, @GradeTrygghet5 int, @GradeTrygghet6 int, @GradeTrygghet7 int, @GradeTrygghet8 int, @CommentTrygghet varchar(500),
									   @GradeMaBra1 int, @GradeMaBra2 int, @GradeMaBra3 int, @GradeMaBra4 int, @GradeMaBra5 int, @GradeMaBra6 int, @CommentMaBra varchar(500),
									   @GradeFritid1 int, @GradeFritid2 int, @GradeFritid3 int, @CommentFritid varchar(500),
									   @GradeTillhorighet1 int, @GradeTillhorighet2 int, @GradeTillhorighet3 int, @CommentTillhorighet varchar(500),
									   @GradeAnsvarstagande1 int, @GradeAnsvarstagande2 int, @GradeAnsvarstagande3 int, @GradeAnsvarstagande4 int, @GradeAnsvarstagande5 int, @GradeAnsvarstagande6 int, @GradeAnsvarstagande7 int, @CommentAnsvarstagande varchar(500),
									   @GradeRespekteras1 int, @GradeRespekteras2 int, @GradeRespekteras3 int, @GradeRespekteras4 int, @CommentRespekteras varchar(500),
									   @GradeUtvecklas1 int, @GradeUtvecklas2 int, @GradeUtvecklas3 int, @GradeUtvecklas4 int, @GradeUtvecklas5 int, @CommentUtvecklas varchar(500)

as

declare @date datetime, @exists int, @createdate datetime
set @date = getdate()

begin try

	--status 4 = sparat
	--status 5 = sammanställt
	set @exists = (select top 1 1 from bb.QuestionnaireGrade qg inner join bb.QuestionnaireStatus qs on qs.PersonID = qg.PersonID and qs.UserID = qg.UserID and qs.CreatedOn = qg.CreatedOn where QuestionTypeID = 2 and qg.UserID = @UserID and qg.PersonID = @PersonID and StatusID = 4)

	
	if(@exists = 1)
	begin
		set @createdate = (select top 1 qs.CreatedOn from bb.QuestionnaireGrade qg inner join bb.QuestionnaireStatus qs on qs.PersonID = qg.PersonID and qs.UserID = qg.UserID and qs.CreatedOn = qg.CreatedOn where QuestionTypeID = 2 and qg.UserID = @UserID and qg.PersonID = @PersonID and StatusID = 4)

		update bb.QuestionnaireGrade
		set Grade = @GradeOmsorg1, Comment = @CommentOmsorg, ChangedOn = @date
		where QuestionID = 1 and QuestionTypeID = 2 and QuestionLevelID = 1 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeOmsorg2, Comment = @CommentOmsorg, ChangedOn = @date
		where QuestionID = 2 and QuestionTypeID = 2 and QuestionLevelID = 1 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeOmsorg3, Comment = @CommentOmsorg, ChangedOn = @date
		where QuestionID = 3 and QuestionTypeID = 2 and QuestionLevelID = 1 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeOmsorg4, Comment = @CommentOmsorg, ChangedOn = @date
		where QuestionID = 4 and QuestionTypeID = 2 and QuestionLevelID = 1 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeOmsorg5, Comment = @CommentOmsorg, ChangedOn = @date
		where QuestionID = 5 and QuestionTypeID = 2 and QuestionLevelID = 1 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeOmsorg6, Comment = @CommentOmsorg, ChangedOn = @date
		where QuestionID = 6 and QuestionTypeID = 2 and QuestionLevelID = 1 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeTrygghet1, Comment = @CommentTrygghet, ChangedOn = @date
		where QuestionID = 7 and QuestionTypeID = 2 and QuestionLevelID = 2 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeTrygghet2, Comment = @CommentTrygghet, ChangedOn = @date
		where QuestionID = 8 and QuestionTypeID = 2 and QuestionLevelID = 2 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeTrygghet3, Comment = @CommentTrygghet, ChangedOn = @date
		where QuestionID = 9 and QuestionTypeID = 2 and QuestionLevelID = 2 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeTrygghet4, Comment = @CommentTrygghet, ChangedOn = @date
		where QuestionID = 10 and QuestionTypeID = 2 and QuestionLevelID = 2 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeTrygghet5, Comment = @CommentTrygghet, ChangedOn = @date
		where QuestionID = 11 and QuestionTypeID = 2 and QuestionLevelID = 2 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeTrygghet6, Comment = @CommentTrygghet, ChangedOn = @date
		where QuestionID = 12 and QuestionTypeID = 2 and QuestionLevelID = 2 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeTrygghet7, Comment = @CommentTrygghet, ChangedOn = @date
		where QuestionID = 59 and QuestionTypeID = 2 and QuestionLevelID = 2 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeTrygghet8, Comment = @CommentTrygghet, ChangedOn = @date
		where QuestionID = 60 and QuestionTypeID = 2 and QuestionLevelID = 2 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeMaBra1, Comment = @CommentMaBra, ChangedOn = @date
		where QuestionID = 13 and QuestionTypeID = 2 and QuestionLevelID = 3 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeMaBra2, Comment = @CommentMaBra, ChangedOn = @date
		where QuestionID = 14 and QuestionTypeID = 2 and QuestionLevelID = 3 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeMaBra3, Comment = @CommentMaBra, ChangedOn = @date
		where QuestionID = 15 and QuestionTypeID = 2 and QuestionLevelID = 3 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeMaBra4, Comment = @CommentMaBra, ChangedOn = @date
		where QuestionID = 16 and QuestionTypeID = 2 and QuestionLevelID = 3 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeMaBra5, Comment = @CommentMaBra, ChangedOn = @date
		where QuestionID = 17 and QuestionTypeID = 2 and QuestionLevelID = 3 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeMaBra6, Comment = @CommentMaBra, ChangedOn = @date
		where QuestionID = 18 and QuestionTypeID = 2 and QuestionLevelID = 3 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeFritid1, Comment = @CommentFritid, ChangedOn = @date
		where QuestionID = 19 and QuestionTypeID = 2 and QuestionLevelID = 4 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeFritid2, Comment = @CommentFritid, ChangedOn = @date
		where QuestionID = 20 and QuestionTypeID = 2 and QuestionLevelID = 4 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeFritid3, Comment = @CommentFritid, ChangedOn = @date
		where QuestionID = 21 and QuestionTypeID = 2 and QuestionLevelID = 4 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeTillhorighet1, Comment = @CommentTillhorighet, ChangedOn = @date
		where QuestionID = 22 and QuestionTypeID = 2 and QuestionLevelID = 5 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeTillhorighet2, Comment = @CommentTillhorighet, ChangedOn = @date
		where QuestionID = 23 and QuestionTypeID = 2 and QuestionLevelID = 5 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeTillhorighet3, Comment = @CommentTillhorighet, ChangedOn = @date
		where QuestionID = 24 and QuestionTypeID = 2 and QuestionLevelID = 5 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeAnsvarstagande1, Comment = @CommentAnsvarstagande, ChangedOn = @date
		where QuestionID = 25 and QuestionTypeID = 2 and QuestionLevelID = 6 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeAnsvarstagande2, Comment = @CommentAnsvarstagande, ChangedOn = @date
		where QuestionID = 26 and QuestionTypeID = 2 and QuestionLevelID = 6 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeAnsvarstagande3, Comment = @CommentAnsvarstagande, ChangedOn = @date
		where QuestionID = 27 and QuestionTypeID = 2 and QuestionLevelID = 6 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeAnsvarstagande4, Comment = @CommentAnsvarstagande, ChangedOn = @date
		where QuestionID = 28 and QuestionTypeID = 2 and QuestionLevelID = 6 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeAnsvarstagande5, Comment = @CommentAnsvarstagande, ChangedOn = @date
		where QuestionID = 29 and QuestionTypeID = 2 and QuestionLevelID = 6 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeAnsvarstagande6, Comment = @CommentAnsvarstagande, ChangedOn = @date
		where QuestionID = 30 and QuestionTypeID = 2 and QuestionLevelID = 6 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeAnsvarstagande7, Comment = @CommentAnsvarstagande, ChangedOn = @date
		where QuestionID = 61 and QuestionTypeID = 2 and QuestionLevelID = 6 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeRespekteras1, Comment = @CommentRespekteras, ChangedOn = @date
		where QuestionID = 31 and QuestionTypeID = 2 and QuestionLevelID = 7 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeRespekteras2, Comment = @CommentRespekteras, ChangedOn = @date
		where QuestionID = 32 and QuestionTypeID = 2 and QuestionLevelID = 7 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeRespekteras3, Comment = @CommentRespekteras, ChangedOn = @date
		where QuestionID = 33 and QuestionTypeID = 2 and QuestionLevelID = 7 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeRespekteras4, Comment = @CommentRespekteras, ChangedOn = @date
		where QuestionID = 34 and QuestionTypeID = 2 and QuestionLevelID = 7 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeUtvecklas1, Comment = @CommentUtvecklas, ChangedOn = @date
		where QuestionID = 35 and QuestionTypeID = 2 and QuestionLevelID = 8 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeUtvecklas2, Comment = @CommentUtvecklas, ChangedOn = @date
		where QuestionID = 36 and QuestionTypeID = 2 and QuestionLevelID = 8 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeUtvecklas3, Comment = @CommentUtvecklas, ChangedOn = @date
		where QuestionID = 37 and QuestionTypeID = 2 and QuestionLevelID = 8 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeUtvecklas4, Comment = @CommentUtvecklas, ChangedOn = @date
		where QuestionID = 38 and QuestionTypeID = 2 and QuestionLevelID = 8 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

		update bb.QuestionnaireGrade
		set Grade = @GradeUtvecklas5, Comment = @CommentUtvecklas, ChangedOn = @date
		where QuestionID = 39 and QuestionTypeID = 2 and QuestionLevelID = 8 and UserID = @UserID and PersonID = @PersonID and GradedOn = @createdate

	end
	else
	begin

		insert into bb.QuestionnaireGrade (QuestionID, QuestionTypeID, QuestionLevelID, PersonID, UserID, Grade, GradedOn, Comment, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values 
			(1, 2, 1, @PersonID, @UserID, @GradeOmsorg1, @date, @CommentOmsorg, 'sql-admin', @date, 'sql-admin', @date), (2, 2, 1, @PersonID, @UserID, @GradeOmsorg2, @date, @CommentOmsorg, 'sql-admin', @date, 'sql-admin', @date), (3, 2, 1, @PersonID, @UserID, @GradeOmsorg3, @date, @CommentOmsorg, 'sql-admin', @date, 'sql-admin', @date), 
			(4, 2, 1, @PersonID, @UserID, @GradeOmsorg4, @date, @CommentOmsorg, 'sql-admin', @date, 'sql-admin', @date), (5, 2, 1, @PersonID, @UserID, @GradeOmsorg5, @date, @CommentOmsorg, 'sql-admin', @date, 'sql-admin', @date), (6, 2, 1, @PersonID, @UserID, @GradeOmsorg6, @date, @CommentOmsorg, 'sql-admin', @date, 'sql-admin', @date),
	
			(7, 2, 2, @PersonID, @UserID, @GradeTrygghet1, @date, @CommentTrygghet, 'sql-admin', @date, 'sql-admin', @date), (8, 2, 2, @PersonID, @UserID, @GradeTrygghet2, @date, @CommentTrygghet, 'sql-admin', @date, 'sql-admin', @date), (9, 2, 2, @PersonID, @UserID, @GradeTrygghet3, @date, @CommentTrygghet, 'sql-admin', @date, 'sql-admin', @date),
			(10, 2, 2, @PersonID, @UserID, @GradeTrygghet4, @date, @CommentTrygghet, 'sql-admin', @date, 'sql-admin', @date), (11, 2, 2, @PersonID, @UserID, @GradeTrygghet5, @date, @CommentTrygghet, 'sql-admin', @date, 'sql-admin', @date), (12, 2, 2, @PersonID, @UserID, @GradeTrygghet6, @date, @CommentTrygghet, 'sql-admin', @date, 'sql-admin', @date),
			(59, 2, 2, @PersonID, @UserID, @GradeTrygghet7, @date, @CommentTrygghet, 'sql-admin', @date, 'sql-admin', @date), (60, 2, 2, @PersonID, @UserID, @GradeTrygghet8, @date, @CommentTrygghet, 'sql-admin', @date, 'sql-admin', @date),

			(13, 2, 3, @PersonID, @UserID, @GradeMaBra1, @date, @CommentMaBra, 'sql-admin', @date, 'sql-admin', @date), (14, 2, 3, @PersonID, @UserID, @GradeMaBra2, @date, @CommentMaBra, 'sql-admin', @date, 'sql-admin', @date), (15, 2, 3, @PersonID, @UserID, @GradeMaBra3, @date, @CommentMaBra, 'sql-admin', @date, 'sql-admin', @date),
			(16, 2, 3, @PersonID, @UserID, @GradeMaBra4, @date, @CommentMaBra, 'sql-admin', @date, 'sql-admin', @date), (17, 2, 3, @PersonID, @UserID, @GradeMaBra5, @date, @CommentMaBra, 'sql-admin', @date, 'sql-admin', @date), (18, 2, 3, @PersonID, @UserID, @GradeMaBra6, @date, @CommentMaBra, 'sql-admin', @date, 'sql-admin', @date),

			(19, 2, 4, @PersonID, @UserID, @GradeFritid1, @date, @CommentFritid, 'sql-admin', @date, 'sql-admin', @date), (20, 2, 4, @PersonID, @UserID, @GradeFritid2, @date, @CommentFritid, 'sql-admin', @date, 'sql-admin', @date), (21, 2, 4, @PersonID, @UserID, @GradeFritid3, @date, @CommentFritid, 'sql-admin', @date, 'sql-admin', @date),

			(22, 2, 5, @PersonID, @UserID, @GradeTillhorighet1, @date, @CommentTillhorighet, 'sql-admin', @date, 'sql-admin', @date), (23, 2, 5, @PersonID, @UserID, @GradeTillhorighet2, @date, @CommentTillhorighet, 'sql-admin', @date, 'sql-admin', @date), (24, 2, 5, @PersonID, @UserID, @GradeTillhorighet3, @date, @CommentTillhorighet, 'sql-admin', @date, 'sql-admin', @date), 

			(25, 2, 6, @PersonID, @UserID, @GradeAnsvarstagande1, @date, @CommentAnsvarstagande, 'sql-admin', @date, 'sql-admin', @date), (26, 2, 6, @PersonID, @UserID, @GradeAnsvarstagande2, @date, @CommentAnsvarstagande, 'sql-admin', @date, 'sql-admin', @date), (27, 2, 6, @PersonID, @UserID, @GradeAnsvarstagande3, @date, @CommentAnsvarstagande, 'sql-admin', @date, 'sql-admin', @date),
			(28, 2, 6, @PersonID, @UserID, @GradeAnsvarstagande4, @date, @CommentAnsvarstagande, 'sql-admin', @date, 'sql-admin', @date), (29, 2, 6, @PersonID, @UserID, @GradeAnsvarstagande5, @date, @CommentAnsvarstagande, 'sql-admin', @date, 'sql-admin', @date), (30, 2, 6, @PersonID, @UserID, @GradeAnsvarstagande6, @date, @CommentAnsvarstagande, 'sql-admin', @date, 'sql-admin', @date),
			(61, 2, 6, @PersonID, @UserID, @GradeAnsvarstagande7, @date, @CommentAnsvarstagande, 'sql-admin', @date, 'sql-admin', @date),

			(31, 2, 7, @PersonID, @UserID, @GradeRespekteras1, @date, @CommentRespekteras, 'sql-admin', @date, 'sql-admin', @date), (32, 2, 7, @PersonID, @UserID, @GradeRespekteras2, @date, @CommentRespekteras, 'sql-admin', @date, 'sql-admin', @date), (33, 2, 7, @PersonID, @UserID, @GradeRespekteras3, @date, @CommentRespekteras, 'sql-admin', @date, 'sql-admin', @date),
			(34, 2, 7, @PersonID, @UserID, @GradeRespekteras4, @date, @CommentRespekteras, 'sql-admin', @date, 'sql-admin', @date),

			(35, 2, 8, @PersonID, @UserID, @GradeUtvecklas1, @date, @CommentUtvecklas, 'sql-admin', @date, 'sql-admin', @date), (36, 2, 8, @PersonID, @UserID, @GradeUtvecklas2, @date, @CommentUtvecklas, 'sql-admin', @date, 'sql-admin', @date), (37, 2, 8, @PersonID, @UserID, @GradeUtvecklas3, @date, @CommentUtvecklas, 'sql-admin', @date, 'sql-admin', @date),
			(38, 2, 8, @PersonID, @UserID, @GradeUtvecklas4, @date, @CommentUtvecklas, 'sql-admin', @date, 'sql-admin', @date), (39, 2, 8, @PersonID, @UserID, @GradeUtvecklas5, @date, @CommentUtvecklas, 'sql-admin', @date, 'sql-admin', @date)

		insert into bb.QuestionnaireStatus (PersonID, UserID, StatusID, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (@PersonID, @UserID, 4, 'sql-admin', @date, 'sql-admin', @date)
	end


	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch
	


GO
/****** Object:  StoredProcedure [bb].[usp_CreateEvent]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [bb].[usp_CreateEvent] @PersonID int, @Action varchar(500), @Event varchar(500), @Responsible varchar(50), @Profession varchar(50)
as

declare @date datetime
set @date = getdate()
begin try

	insert into bb.Event (Description, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (@Event, 'sql-admin', @date, 'sql-admin', @date)

	insert into bb.Action (Description, EventID, PersonID, StatusID, CreatedBy, CreatedOn, ChangedBy, ChangedOn, Responsible, Profession) values (@Action, (select EventID from bb.Event where CreatedOn = @date), @PersonID, 6, 'sql-admin', @date, 'sql-admin', @date, @Responsible, @Profession)
	
	
	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch
GO
/****** Object:  StoredProcedure [bb].[usp_CreateSubstrate]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [bb].[usp_CreateSubstrate] @UserID int, @PersonID int, @GuardianPersonNbr1 varchar(12), @GuardianPersonNbr2 varchar(12), 
										@GradeOmsorg int, @CommentOmsorg varchar(500), @GradeOmsorg1 int, @CommentOmsorg1 varchar(500), @GradeOmsorg2 int, @CommentOmsorg2 varchar(500), 
										@GradeTrygghet int, @CommentTrygghet varchar(500), @GradeTrygghet1 int, @CommentTrygghet1 varchar(500), @GradeTrygghet2 int, @CommentTrygghet2 varchar(500), 
										@GradeMaBra int, @CommentMaBra varchar(500), @GradeMaBra1 int, @CommentMaBra1 varchar(500), @GradeMaBra2 int, @CommentMaBra2 varchar(500), 
										@GradeFritid int, @CommentFritid varchar(500), @GradeFritid1 int, @CommentFritid1 varchar(500), @GradeFritid2 int, @CommentFritid2 varchar(500), 
										@GradeTillhorighet int, @CommentTillhorighet varchar(500), @GradeTillhorighet1 int, @CommentTillhorighet1 varchar(500), @GradeTillhorighet2 int, @CommentTillhorighet2 varchar(500), 
										@GradeAnsvarstagande int, @CommentAnsvarstagande varchar(500), @GradeAnsvarstagande1 int, @CommentAnsvarstagande1 varchar(500), @GradeAnsvarstagande2 int, @CommentAnsvarstagande2 varchar(500), 
										@GradeRespekteras int, @CommentRespekteras varchar(500), @GradeRespekteras1 int, @CommentRespekteras1 varchar(500), @GradeRespekteras2 int, @CommentRespekteras2 varchar(500), 
										@GradeUtvecklas int, @CommentUtvecklas varchar(500), @GradeUtvecklas1 int, @CommentUtvecklas1 varchar(500), @GradeUtvecklas2 int, @CommentUtvecklas2 varchar(500),
										@Status int
as


declare @Date datetime
set @Date = getdate()

begin try
	
	insert into bb.QuestionGuardian (QuestionID, GuardianPersonNbr1, Grade1, Comment1, GuardianPersonNbr2, Grade2, Comment2, GradedOn, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (51, @GuardianPersonNbr1, @GradeOmsorg1, @CommentOmsorg1, @GuardianPersonNbr2, @GradeOmsorg2, @CommentOmsorg2, @Date, 'sql-admin', @Date, 'sql-admin', @Date), (52, @GuardianPersonNbr1, @GradeTrygghet1, @CommentTrygghet1, @GuardianPersonNbr2, @GradeTrygghet2, @CommentTrygghet2, @Date, 'sql-admin', @Date, 'sql-admin', @Date), 
																																									  (53, @GuardianPersonNbr1, @GradeMaBra1, @CommentMaBra1, @GuardianPersonNbr2, @GradeMaBra2, @CommentMaBra2, @Date, 'sql-admin', @Date, 'sql-admin', @Date),  (54, @GuardianPersonNbr1, @GradeFritid1, @CommentFritid1, @GuardianPersonNbr2, @GradeFritid2, @CommentFritid2, @Date, 'sql-admin', @Date, 'sql-admin', @Date), 
																																									  (55, @GuardianPersonNbr1, @GradeTillhorighet1, @CommentTillhorighet1, @GuardianPersonNbr2, @GradeTillhorighet2, @CommentTillhorighet2, @Date, 'sql-admin', @Date, 'sql-admin', @Date), (56, @GuardianPersonNbr1, @GradeAnsvarstagande1, @CommentAnsvarstagande1, @GuardianPersonNbr2, @GradeAnsvarstagande2, @CommentAnsvarstagande2, @Date, 'sql-admin', @Date, 'sql-admin', @Date),
																																									  (57, @GuardianPersonNbr1, @GradeRespekteras1, @CommentRespekteras1, @GuardianPersonNbr2, @GradeRespekteras2, @CommentRespekteras2, @Date, 'sql-admin', @Date, 'sql-admin', @Date), (58, @GuardianPersonNbr1, @GradeUtvecklas1, @CommentUtvecklas1, @GuardianPersonNbr2, @GradeUtvecklas2, @CommentUtvecklas2, @Date, 'sql-admin', @Date, 'sql-admin', @Date)




	insert into bb.QuestionnaireGrade (QuestionID, QuestionTypeID, QuestionLevelID, PersonID, UserID, Grade, GradedOn, Comment, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (51, 1, 1, @PersonID, @UserID, @GradeOmsorg, @Date, @CommentOmsorg, 'sql-admin', @Date, 'sql-admin', @Date), (52, 1, 2, @PersonID, @UserID, @GradeTrygghet, @Date, @CommentTrygghet, 'sql-admin', @Date, 'sql-admin', @Date), 
																																												   (53, 1, 3, @PersonID, @UserID, @GradeMaBra, @Date, @CommentMaBra, 'sql-admin', @Date, 'sql-admin', @Date), (54, 1, 4, @PersonID, @UserID, @GradeFritid, @Date, @CommentFritid, 'sql-admin', @Date, 'sql-admin', @Date), 
																																												   (55, 1, 5, @PersonID, @UserID, @GradeTillhorighet, @Date, @CommentTillhorighet, 'sql-admin', @Date, 'sql-admin', @Date), (56, 1, 6, @PersonID, @UserID, @GradeAnsvarstagande, @Date, @CommentAnsvarstagande, 'sql-admin', @Date, 'sql-admin', @Date), 
																																												   (57, 1, 7, @PersonID, @UserID, @GradeRespekteras, @Date, @CommentRespekteras, 'sql-admin', @Date, 'sql-admin', @Date), (58, 1, 8, @PersonID, @UserID, @GradeUtvecklas, @Date, @CommentUtvecklas, 'sql-admin', @Date, 'sql-admin', @Date)

	--spara = 1
	--behovet uppfyllt = 2
	--skicka till barnteam = 3
	if(@Status = 1)
	begin
		insert into bb.QuestionnaireStatus (PersonID, UserID, StatusID, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (@PersonID, @UserID, 1, 'sql-admin', @Date, 'sql-admin', @Date)
	end
	if(@Status = 2)
	begin
		insert into bb.QuestionnaireStatus (PersonID, UserID, StatusID, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (@PersonID, @UserID, 2, 'sql-admin', @Date, 'sql-admin', @Date)
		
		update bb.Person
		set Status = (select StatusName from bb.Status where StatusID = 10), ChangedBy = 'sql-admin', ChangedOn = @Date
		where PersonID = @PersonID
	end
	if(@Status = 3)
	begin
		insert into bb.QuestionnaireStatus (PersonID, UserID, StatusID, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (@PersonID, @UserID, 2, 'sql-admin', @Date, 'sql-admin', @Date)

		update bb.Person
		set Status = (select StatusName from bb.Status where StatusID = 9), ChangedBy = 'sql-admin', ChangedOn = @Date
		where PersonID = @PersonID
	end



	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage

end catch
GO
/****** Object:  StoredProcedure [bb].[usp_CreateTeam]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [bb].[usp_CreateTeam] @TeamName varchar(50), @UnitID int
as

declare @date datetime, @exists int, @exists2 int--, @teamname varchar(50), @unitid int
set @date = getdate()
--set @TeamName = 'Haha'
--set @UnitID = 3
set @exists = (select top 1 1 from bb.Team where TeamName = @TeamName)
--select @exists

begin try
	if(@exists is null)
	begin
		insert into bb.Team (TeamName, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (@TeamName, 'sql-admin', @date, 'sql-admin', @date)

		insert into bb.TeamUnit (TeamID, UnitID, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values ((select TeamID from bb.Team where TeamName = @TeamName), @UnitID, 'sql-admin', @date, 'sql-admin', @date)
	end

	if(@exists = 1)
	begin
		set @exists2 = (select top 1 1 from bb.TeamUnit where TeamID = (select TeamID from bb.Team where TeamName = @TeamName) and UnitID = @UnitID)
		if(@exists2 is null)
		begin
			insert into bb.TeamUnit (TeamID, UnitID, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values ((select TeamID from bb.Team where TeamName = @TeamName), @UnitID, 'sql-admin', @date, 'sql-admin', @date)
		end
	end




select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch
GO
/****** Object:  StoredProcedure [bb].[usp_CreateUser]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_CreateUser] @LastName varchar(50), @FirstName varchar(50), @Email varchar(500), @Organisation varchar(50), @RoleID int, @UnitID int
as

declare @date datetime, @exists int
set @date = getdate()
set @exists = (select top 1 1 from bb.[User] where Email = @Email)

begin try
	
	if(@exists is null)
	begin
		insert into bb.[User] (LastName, FirstName, Email, Password, Organisation, CreatedBy, CreatedOn) values (@LastName, @FirstName, @Email, 'pw123', @Organisation, 'sql-admin', @date)

		insert into bb.UserRole (UserID, RoleID, CreatedBy, CreatedOn) values ((select UserID from bb.[User] where Email = @Email), @RoleID, 'sql-admin', @date)
	end

	if(@UnitID > 0)
	begin
		insert into bb.UserUnit (UserID, UnitID, CreatedBy, CreatedOn) values ((select UserID from bb.[User] where Email = @Email), @UnitID, 'sql-admin', @date)
	end

	--unitid 8 = ingen enhet
	if(@UnitID = 0)
	begin
		insert into bb.UserUnit (UserID, UnitID, CreatedBy, CreatedOn) values ((select UserID from bb.[User] where Email = @Email), 8, 'sql-admin', @date)
	end


	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch
GO
/****** Object:  StoredProcedure [bb].[usp_CreateUserRight]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [bb].[usp_CreateUserRight]  @CurrentUserID int, @UserID int, @PersonID int, @Type int
as

declare @date datetime, @UserExists int, @PersonExists int, @exists int
set @date = getdate()
set @UserExists = (select top 1 1 from bb.[User] where UserID = @UserID)
set @PersonExists = (select top 1 1 from bb.[Person] where PersonID = @PersonID)

begin try
	
	if(@UserExists is null)
		select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,'No such UserID' as ErrorMessage

	else if(@PersonExists is null)
		select  
			 ERROR_NUMBER() as ErrorNumber  
			,ERROR_SEVERITY() as ErrorSeverity  
			,ERROR_STATE() as ErrorState  
			,'No such PersonID' as ErrorMessage

	else
	begin
		set @exists = (select top 1 1 from bb.[UserRight] where UserID = @UserID and PersonID= @PersonID and QuestionTypeID= @Type)
		if(@exists is null)
			insert into bb.UserRight (CurrentUserID, UserID, PersonID, QuestionTypeID, CreatedBy, CreatedOn, ChangedBy, ChangedOn) values (@CurrentUserID, @UserID, @PersonID, @Type, 'sql-admin', @date, 'sql-admin', @date)

	select  
			 0 as ErrorNumber  
			,0 as ErrorSeverity  
			,0 as ErrorState  
			,'Success' as ErrorMessage
	end
		

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch
GO
/****** Object:  StoredProcedure [bb].[usp_EditAction]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [bb].[usp_EditAction] @ActionID int
as

declare @date datetime
set @date = getdate()
begin try

	update bb.Action
	set StatusId = 7
	where ActionID = @ActionID
	--insert into bb.Action (Description, EventID, PersonID, StatusID, CreatedBy, CreatedOn, ChangedBy, ChangedOn, Responsible, Profession) values (@Action, @EventID, @PersonID, 6, 'sql-admin', @date, 'sql-admin', @date, @Responsible, @Profession)
	
	
	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch
GO
/****** Object:  StoredProcedure [bb].[usp_EditCard]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [bb].[usp_EditCard] @UserID int, @PersonNbr varchar(12), @Unit varchar(50), @Situation varchar(500), @GradedOn datetime, 
								   @gradeActions int, @commentActions varchar(500), @gradeOmsorg int, @commentOmsorg varchar(500), @gradeTrygghet int, @commentTrygghet varchar(500), @gradeMarBra int, @commentMarBra varchar(500), @gradeFritid int, @commentFritid varchar(500), @gradeTillhorighet int, @commentTillhorighet varchar(500), @gradeAnsvarstagande int, @commentAnsvarstagande varchar(500),
								   @gradeRespekteras int, @commentRespekteras varchar(500), @gradeUtvecklas int, @commentUtvecklas varchar(500), @gradeUpprattats1 int, @gradeUpprattats2 int, @gradeSamtycke1 int, @gradeSamtycke2 int, @status int, @PersonID int
as

declare @grade49 int, @grade50 int, @Date datetime, @PersonUnit varchar(50)
--set @PersonNbr = '201001019999'
--set @Status = 1
--set @UserID = 1
set @Date = getdate()

begin try


	set @PersonUnit = (select Unit from bb.Person where PersonID = @PersonID)
	if(@PersonUnit <> @Unit)
	begin
		update bb.Person
		set Unit = @Unit, ChangedOn = @Date where PersonID = @PersonID
	end


	--vårdnadshavares svar
	update bb.QuestionGuardian
	set Grade1 = @gradeUpprattats1, Grade2 = @gradeUpprattats2, ChangedOn = @Date where QuestionID = 49 and GradedOn = @GradedOn

	update bb.QuestionGuardian
	set Grade1 = @gradeSamtycke1, Grade2 = @gradeSamtycke2, ChangedOn = @Date where QuestionID = 50 and GradedOn = @GradedOn
		
	--2021-10-21 00:03:42.797 test
	set @grade49 = (select Grade1 + Grade2 from bb.QuestionGuardian where QuestionID = 49 and GradedOn = @GradedOn)
	set @grade50 = (select Grade1 + Grade2 from bb.QuestionGuardian where QuestionID = 50 and GradedOn = @GradedOn)


	--upptäckarkortets betyg

	update bb.QuestionnaireGrade 
	set Grade = @gradeOmsorg, Comment = @commentOmsorg, ChangedOn = @Date, Situation= @Situation where QuestionTypeID = 4 and QuestionID = 40 and QuestionLevelID = 1 and PersonID = @PersonID and UserID = @UserID and GradedOn = @GradedOn

	update bb.QuestionnaireGrade 
	set Grade = @gradeTrygghet, Comment = @commentTrygghet, ChangedOn = @Date, Situation= @Situation where QuestionTypeID = 4 and QuestionID = 41 and QuestionLevelID = 2 and PersonID = @PersonID and UserID = @UserID and GradedOn = @GradedOn

	update bb.QuestionnaireGrade 
	set Grade = @gradeMarBra, Comment = @commentMarBra, ChangedOn = @Date , Situation= @Situation where QuestionTypeID = 4 and QuestionID = 42 and QuestionLevelID = 3 and PersonID = @PersonID and UserID = @UserID and GradedOn = @GradedOn

	update bb.QuestionnaireGrade 
	set Grade = @gradeFritid, Comment = @commentFritid, ChangedOn = @Date , Situation= @Situation where QuestionTypeID = 4 and QuestionID = 43 and QuestionLevelID = 4 and PersonID = @PersonID and UserID = @UserID and GradedOn = @GradedOn

	update bb.QuestionnaireGrade 
	set Grade = @gradeTillhorighet, Comment = @commentTillhorighet, ChangedOn = @Date , Situation= @Situation where QuestionTypeID = 4 and QuestionID = 44 and QuestionLevelID = 5 and PersonID = @PersonID and UserID = @UserID and GradedOn = @GradedOn

	update bb.QuestionnaireGrade 
	set Grade = @gradeAnsvarstagande, Comment = @commentAnsvarstagande, ChangedOn = @Date , Situation= @Situation where QuestionTypeID = 4 and QuestionID = 45 and QuestionLevelID = 6 and PersonID = @PersonID and UserID = @UserID and GradedOn = @GradedOn

	update bb.QuestionnaireGrade 
	set Grade = @gradeRespekteras, Comment = @commentRespekteras, ChangedOn = @Date , Situation= @Situation where QuestionTypeID = 4 and QuestionID = 46 and QuestionLevelID = 7 and PersonID = @PersonID and UserID = @UserID and GradedOn = @GradedOn

	update bb.QuestionnaireGrade 
	set Grade = @gradeUtvecklas, Comment = @commentUtvecklas, ChangedOn = @Date , Situation= @Situation where QuestionTypeID = 4 and QuestionID = 47 and QuestionLevelID = 8 and PersonID = @PersonID and UserID = @UserID and GradedOn = @GradedOn

	update bb.QuestionnaireGrade 
	set Grade = @gradeActions, Comment = @commentActions, ChangedOn = @Date , Situation= @Situation where QuestionTypeID = 4 and QuestionID = 48 and QuestionLevelID = 9 and PersonID = @PersonID and UserID = @UserID and GradedOn = @GradedOn

	update bb.QuestionnaireGrade 
	set Grade = @grade49, ChangedOn = @Date , Situation= @Situation  where QuestionTypeID = 4 and QuestionID = 49 and QuestionLevelID = 9 and PersonID = @PersonID and UserID = @UserID and GradedOn = @GradedOn

	update bb.QuestionnaireGrade 
	set Grade = @grade50, ChangedOn = @Date , Situation= @Situation  where QuestionTypeID = 4 and QuestionID = 50 and QuestionLevelID = 9 and PersonID = @PersonID and UserID = @UserID and GradedOn = @GradedOn


	--upptäckarkortets status

	if(@status = 0)
	begin
		update bb.QuestionnaireStatus
		set StatusID = 3, ChangedOn = @Date where PersonID = @PersonID and UserID = @UserID and CreatedOn = @GradedOn

		update bb.Person
		set Status = 'Anonymiserad', LastName = '', FirstName = '', Guardian1 = '', Guardian2 = '', GuardianPersonNbr1 = '', GuardianPersonNbr2 = '', PersonNbr = '', Unit = @Unit, ChangedBy = 'sql-admin', ChangedOn = @Date
		where PersonID = @PersonID
	end

	if(@status = 1)
	begin
		update bb.QuestionnaireStatus
		set StatusID = 2, ChangedOn = @Date where PersonID = @PersonID and UserID = @UserID and CreatedOn = @GradedOn
	end
	
	if (@status = 2)
	begin
		update bb.QuestionnaireStatus
		set StatusID = 1, ChangedOn = @Date where PersonID = @PersonID and UserID = @UserID and CreatedOn = @GradedOn
	end


	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch



GO
/****** Object:  StoredProcedure [bb].[usp_EditStatus]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [bb].[usp_EditStatus] @PersonID int, @StatusID int
as

update bb.Person
set Status = (select StatusName from bb.Status where StatusID = @StatusID), ChangedBy = 'sql-admin', ChangedOn = getdate()
where PersonID = @PersonID
GO
/****** Object:  StoredProcedure [bb].[usp_EditSubstrate]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [bb].[usp_EditSubstrate] @UserID int, @PersonID int, @GuardianPersonNbr1 varchar(12), @GuardianPersonNbr2 varchar(12), 
										@GradeOmsorg int, @CommentOmsorg varchar(500), @GradeOmsorg1 int, @CommentOmsorg1 varchar(500), @GradeOmsorg2 int, @CommentOmsorg2 varchar(500), 
										@GradeTrygghet int, @CommentTrygghet varchar(500), @GradeTrygghet1 int, @CommentTrygghet1 varchar(500), @GradeTrygghet2 int, @CommentTrygghet2 varchar(500), 
										@GradeMaBra int, @CommentMaBra varchar(500), @GradeMaBra1 int, @CommentMaBra1 varchar(500), @GradeMaBra2 int, @CommentMaBra2 varchar(500), 
										@GradeFritid int, @CommentFritid varchar(500), @GradeFritid1 int, @CommentFritid1 varchar(500), @GradeFritid2 int, @CommentFritid2 varchar(500), 
										@GradeTillhorighet int, @CommentTillhorighet varchar(500), @GradeTillhorighet1 int, @CommentTillhorighet1 varchar(500), @GradeTillhorighet2 int, @CommentTillhorighet2 varchar(500), 
										@GradeAnsvarstagande int, @CommentAnsvarstagande varchar(500), @GradeAnsvarstagande1 int, @CommentAnsvarstagande1 varchar(500), @GradeAnsvarstagande2 int, @CommentAnsvarstagande2 varchar(500), 
										@GradeRespekteras int, @CommentRespekteras varchar(500), @GradeRespekteras1 int, @CommentRespekteras1 varchar(500), @GradeRespekteras2 int, @CommentRespekteras2 varchar(500), 
										@GradeUtvecklas int, @CommentUtvecklas varchar(500), @GradeUtvecklas1 int, @CommentUtvecklas1 varchar(500), @GradeUtvecklas2 int, @CommentUtvecklas2 varchar(500),
										@Status int, @GradedOn datetime
as


declare @Date datetime
set @Date = getdate()

begin try

	update bb.QuestionGuardian
	set GuardianPersonNbr1 = @GuardianPersonNbr1, Grade1 = @GradeOmsorg1, GuardianPersonNbr2 = @GuardianPersonNbr2, Grade2 = @GradeOmsorg2, ChangedBy = 'sql-admin', ChangedOn = @Date, Comment1 = @CommentOmsorg1, Comment2 = @CommentOmsorg2
	where QuestionID = 51 and GradedOn = @GradedOn

	update bb.QuestionGuardian
	set GuardianPersonNbr1 = @GuardianPersonNbr1, Grade1 = @GradeTrygghet1, GuardianPersonNbr2 = @GuardianPersonNbr2, Grade2 = @GradeTrygghet2, ChangedBy = 'sql-admin', ChangedOn = @Date, Comment1 = @CommentTrygghet1, Comment2 = @CommentTrygghet2
	where QuestionID = 52 and GradedOn = @GradedOn

	update bb.QuestionGuardian
	set GuardianPersonNbr1 = @GuardianPersonNbr1, Grade1 = @GradeMaBra1, GuardianPersonNbr2 = @GuardianPersonNbr2, Grade2 = @GradeMaBra2, ChangedBy = 'sql-admin', ChangedOn = @Date, Comment1 = @CommentMaBra1, Comment2 = @CommentMaBra2
	where QuestionID = 53 and GradedOn = @GradedOn

	update bb.QuestionGuardian
	set GuardianPersonNbr1 = @GuardianPersonNbr1, Grade1 = @GradeFritid1, GuardianPersonNbr2 = @GuardianPersonNbr2, Grade2 = @GradeFritid2, ChangedBy = 'sql-admin', ChangedOn = @Date, Comment1 = @CommentFritid1, Comment2 = @CommentFritid2
	where QuestionID = 54 and GradedOn = @GradedOn

	update bb.QuestionGuardian
	set GuardianPersonNbr1 = @GuardianPersonNbr1, Grade1 = @GradeTillhorighet1, GuardianPersonNbr2 = @GuardianPersonNbr2, Grade2 = @GradeTillhorighet2, ChangedBy = 'sql-admin', ChangedOn = @Date, Comment1 = @CommentTillhorighet1, Comment2 = @CommentTillhorighet2
	where QuestionID = 55 and GradedOn = @GradedOn

	update bb.QuestionGuardian
	set GuardianPersonNbr1 = @GuardianPersonNbr1, Grade1 = @GradeAnsvarstagande1, GuardianPersonNbr2 = @GuardianPersonNbr2, Grade2 = @GradeAnsvarstagande2, ChangedBy = 'sql-admin', ChangedOn = @Date, Comment1 = @CommentAnsvarstagande1, Comment2 = @CommentAnsvarstagande2
	where QuestionID = 56 and GradedOn = @GradedOn

	update bb.QuestionGuardian
	set GuardianPersonNbr1 = @GuardianPersonNbr1, Grade1 = @GradeRespekteras1, GuardianPersonNbr2 = @GuardianPersonNbr2, Grade2 = @GradeRespekteras2, ChangedBy = 'sql-admin', ChangedOn = @Date, Comment1 = @CommentRespekteras1, Comment2 = @CommentRespekteras2
	where QuestionID = 57 and GradedOn = @GradedOn

	update bb.QuestionGuardian
	set GuardianPersonNbr1 = @GuardianPersonNbr1, Grade1 = @GradeUtvecklas1, GuardianPersonNbr2 = @GuardianPersonNbr2, Grade2 = @GradeUtvecklas2, ChangedBy = 'sql-admin', ChangedOn = @Date, Comment1 = @CommentUtvecklas1, Comment2 = @CommentUtvecklas2
	where QuestionID = 58 and GradedOn = @GradedOn


	update bb.QuestionnaireGrade
	set	Grade = @GradeOmsorg, Comment = @CommentOmsorg, ChangedBy = 'sql-admin', ChangedOn = @Date
	where QuestionID = 51 and QuestionTypeID = 1 and GradedOn = @GradedOn

	update bb.QuestionnaireGrade
	set	Grade = @GradeTrygghet, Comment = @CommentTrygghet, ChangedBy = 'sql-admin', ChangedOn = @Date
	where QuestionID = 52 and QuestionTypeID = 1 and GradedOn = @GradedOn

	update bb.QuestionnaireGrade
	set	Grade = @GradeMaBra, Comment = @CommentMaBra, ChangedBy = 'sql-admin', ChangedOn = @Date
	where QuestionID = 53 and QuestionTypeID = 1 and GradedOn = @GradedOn

	update bb.QuestionnaireGrade
	set	Grade = @GradeFritid, Comment = @CommentFritid, ChangedBy = 'sql-admin', ChangedOn = @Date
	where QuestionID = 54 and QuestionTypeID = 1 and GradedOn = @GradedOn

	update bb.QuestionnaireGrade
	set	Grade = @GradeTillhorighet, Comment = @CommentTillhorighet, ChangedBy = 'sql-admin', ChangedOn = @Date
	where QuestionID = 55 and QuestionTypeID = 1 and GradedOn = @GradedOn

	update bb.QuestionnaireGrade
	set	Grade = @GradeAnsvarstagande, Comment = @CommentAnsvarstagande, ChangedBy = 'sql-admin', ChangedOn = @Date
	where QuestionID = 56 and QuestionTypeID = 1 and GradedOn = @GradedOn

	update bb.QuestionnaireGrade
	set	Grade = @GradeRespekteras, Comment = @CommentRespekteras, ChangedBy = 'sql-admin', ChangedOn = @Date
	where QuestionID = 57 and QuestionTypeID = 1 and GradedOn = @GradedOn

	update bb.QuestionnaireGrade
	set	Grade = @GradeUtvecklas, Comment = @CommentUtvecklas, ChangedBy = 'sql-admin', ChangedOn = @Date
	where QuestionID = 58 and QuestionTypeID = 1 and GradedOn = @GradedOn


	--spara = 1
	--behovet uppfyllt = 2
	--skicka till barnteam = 3
	if(@Status = 1)
	begin
		update bb.QuestionnaireStatus
		set StatusID = 1, ChangedBy = 'sql-admin', ChangedOn = @Date
		where UserID = @UserID and PersonID = @PersonID and CreatedOn = @GradedOn

	end
	if(@Status = 2)
	begin	
		update bb.QuestionnaireStatus
		set StatusID = 2, ChangedBy = 'sql-admin', ChangedOn = @Date
		where UserID = @UserID and PersonID = @PersonID and CreatedOn = @GradedOn

		update bb.Person
		set Status = (select StatusName from bb.Status where StatusID = 10), ChangedBy = 'sql-admin', ChangedOn = @Date
		where PersonID = @PersonID
	end
	if(@Status = 3)
	begin
		update bb.QuestionnaireStatus
		set StatusID = 2, ChangedBy = 'sql-admin', ChangedOn = @Date
		where UserID = @UserID and PersonID = @PersonID and CreatedOn = @GradedOn

		update bb.Person
		set Status = (select StatusName from bb.Status where StatusID = 9), ChangedBy = 'sql-admin', ChangedOn = @Date
		where PersonID = @PersonID
	end



	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage

end catch

GO
/****** Object:  StoredProcedure [bb].[usp_EditUser]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [bb].[usp_EditUser] @LastName varchar(50), @FirstName varchar(50), @Organisation varchar(50), @RoleID int, @UnitID int, @UserID int
as

declare @date datetime, @exists int
set @date = getdate()

begin try
	
	update bb.[User]
	set LastName = @LastName, FirstName = @FirstName, Organisation = @Organisation, ChangedBy = 'sql-admin', ChangedOn = @date
	where UserID = @UserID

	update bb.UserRole
	set RoleID = @RoleID, ChangedBy = 'sql-admin', ChangedOn = @date
	where UserID = @UserID


	set @exists = (select top 1 1 from bb.UserUnit where UserID = @UserID and UnitID = @UnitID)

	--unitid 8 = ingen enhet
	if(@exists = 1)
	begin
		if(@UnitID < 1)
		begin
			delete from bb.UserUnit where UserID = @UserID

			insert into bb.UserUnit (UserID, UnitID, CreatedBy, CreatedOn) values (@UserID, 8, 'sql-admin', @date)
		end
	end

	if(@exists is null)
	begin
		if(@UnitID > 0)
		begin
			insert into bb.UserUnit (UserID, UnitID, CreatedBy, CreatedOn) values (@UserID, @UnitID, 'sql-admin', @date)
		end
		if(@UnitID < 1)
		begin
			delete from bb.UserUnit where UserID = @UserID

			insert into bb.UserUnit (UserID, UnitID, CreatedBy, CreatedOn) values (@UserID, 8, 'sql-admin', @date)
		end
	end


	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch

GO
/****** Object:  StoredProcedure [bb].[usp_EditUser_Prescript]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [bb].[usp_EditUser_Prescript] @UserID int
as

begin try

	delete from bb.UserUnit where UserID = @UserID



	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch

GO
/****** Object:  StoredProcedure [bb].[usp_GetBarnKontakt]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_GetBarnKontakt] @PersonID int as
select	concat(u.FirstName, ' ', u.LastName) as [Name],
		u.Email,
		u.Organisation
from	bb.[Person] p inner join bb.Unit unit on p.Unit = unit.UnitName
					inner join bb.UserUnit uu on uu.UnitID = unit.UnitID
					inner join bb.UserRole ur on ur.UserID= uu.UserID
					inner join bb.[User] u on u.UserID = ur.UserID

where	ur.RoleID = 2 and p.PersonID = @PersonID

 
GO
/****** Object:  StoredProcedure [bb].[usp_GetCard]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_GetCard] @UserID int as

declare @roleID varchar(50)

select top 1 @roleID= ur.RoleID from bb.[UserRole] ur where ur.UserID = @UserID

--admin, get all card
if (@roleID = 4)

	select qg.GradedOn,
			concat(u.FirstName, ' ', u.LastName) as UserName,
			u.Organisation as UserOrg,
			r.Description as UserTitle,
			concat(p.FirstName, ' ', p.LastName) as PersonName,
			p.PersonNbr,
			isnull(p.Guardian1, 0) as Guardian1,
			isnull(p.GuardianPersonNbr1, 0) as GuardianPersonNbr1,
			isnull(p.Guardian2, 0) as Guardian2,
			isnull(p.GuardianPersonNbr2,0) as GuardianPersonNbr2,
			isnull(p.Unit, 0) as Unit,
			isnull(qg.Situation, 0) as Situation,
			qg.QuestionID,
			qg.Grade,
			isnull(qg.Comment, 0) as Comment,
			isnull(s.StatusName, 'Ingen status') as Status,
			qg.PersonID
	from	bb.QuestionnaireGrade qg inner join bb.Person p on qg.PersonID = p.PersonID
									 inner join bb.[User] u on qg.UserID = u.UserID
									 inner join bb.[UserRole] ur on ur.UserID = qg.UserID
									 inner join bb.Role r on r.RoleID = ur.RoleID
									 left join bb.QuestionnaireStatus qs on qs.CreatedOn = qg.GradedOn and qs.PersonID = qg.PersonID and qs.UserID = qg.UserID
									 left join bb.Status s on s.StatusID = qs.StatusID
	where	qg.QuestionTypeID = 4

--barnkontakt
else if(@roleID = 2)

	select qg.GradedOn,
			concat(uName.FirstName, ' ', uName.LastName) as UserName,
			u.Organisation as UserOrg,
			r.Description as UserTitle,
			concat(p.FirstName, ' ', p.LastName) as PersonName,
			p.PersonNbr,
			isnull(p.Guardian1, 0) as Guardian1,
			isnull(p.GuardianPersonNbr1, 0) as GuardianPersonNbr1,
			isnull(p.Guardian2, 0) as Guardian2,
			isnull(p.GuardianPersonNbr2,0) as GuardianPersonNbr2,
			isnull(p.Unit, 0) as Unit,
			isnull(qg.Situation, 0) as Situation,
			qg.QuestionID,
			qg.Grade,
			isnull(qg.Comment, 0) as Comment,
			isnull(s.StatusName, 'Ingen status') as Status,
			qg.PersonID
	from	bb.QuestionnaireGrade qg inner join bb.Person p on qg.PersonID = p.PersonID
									 inner join bb.Unit unit on unit.UnitName= p.Unit 
									 inner join bb.[UserUnit] uu on uu.UnitID = unit.UnitID
									 inner join bb.[UserRole] ur on ur.UserID = uu.UserID
									 inner join bb.[User] u on ur.UserID = u.UserID
									 inner join bb.Role r on r.RoleID = ur.RoleID

									 join bb.[User] uName on qg.UserID= uName.UserID

									 left join bb.QuestionnaireStatus qs on qs.CreatedOn = qg.GradedOn and qs.PersonID = qg.PersonID and qs.UserID = qg.UserID
									 left join bb.Status s on s.StatusID = qs.StatusID

	where	qg.QuestionTypeID = 4 and ( (u.UserID=  @UserID and p.FirstName <> '' ) or qg.UserID = @UserID)

else

	select qg.GradedOn,
			concat(u.FirstName, ' ', u.LastName) as UserName,
			u.Organisation as UserOrg,
			r.Description as UserTitle,
			concat(p.FirstName, ' ', p.LastName) as PersonName,
			p.PersonNbr,
			isnull(p.Guardian1, 0) as Guardian1,
			isnull(p.GuardianPersonNbr1, 0) as GuardianPersonNbr1,
			isnull(p.Guardian2, 0) as Guardian2,
			isnull(p.GuardianPersonNbr2,0) as GuardianPersonNbr2,
			isnull(p.Unit, 0) as Unit,
			isnull(qg.Situation, 0) as Situation,
			qg.QuestionID,
			qg.Grade,
			isnull(qg.Comment, 0) as Comment,
			isnull(s.StatusName, 'Ingen status') as Status,
			qg.PersonID
	from	bb.QuestionnaireGrade qg inner join bb.Person p on qg.PersonID = p.PersonID
									 inner join bb.[User] u on qg.UserID = u.UserID
									 inner join bb.[UserRole] ur on ur.UserID = qg.UserID
									 inner join bb.Role r on r.RoleID = ur.RoleID
									 left join bb.QuestionnaireStatus qs on qs.CreatedOn = qg.GradedOn and qs.PersonID = qg.PersonID and qs.UserID = qg.UserID
									 left join bb.Status s on s.StatusID = qs.StatusID
	where	qg.QuestionTypeID = 4 and qg.UserID = @UserID
GO
/****** Object:  StoredProcedure [bb].[usp_GetCompass]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [bb].[usp_GetCompass] @PersonID int
 as
 
 select	qg.QuestionID, 
		qg.QuestionTypeID, 
		qg.QuestionLevelID, 
		qg.PersonID, 
		qg.UserID, 
		qg.Grade, 
		qg.Comment, 
		qg.GradedOn,
		(select concat(FirstName, ' ', LastName) from bb.[User] where UserID = qg.UserID) as UserName
 from	bb.QuestionnaireGrade qg inner join bb.QuestionnaireStatus qs on qs.PersonID = qg.PersonID and qs.UserID = qg.UserID and qs.CreatedOn = qg.CreatedOn 
 where	(qg.QuestionTypeID = 2 or qg.QuestionTypeID = 1) and qg.PersonID = @PersonID
 order by qg.GradedOn desc, qg.QuestionTypeID asc, qg.QuestionID asc
GO
/****** Object:  StoredProcedure [bb].[usp_GetContact]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_GetContact] @PersonNbr varchar(12)
	as

	select	c.ContactPersonNbr,
			c.LastName,
			c.FirstName,
			isnull(c.PhoneNbr, 0) as PhoneNbr,
			isnull(c.Employer, 0) as Employer
	from	bb.contact c inner join bb.person p on c.personid = p.personid
	where	p.personnbr = @PersonNbr
GO
/****** Object:  StoredProcedure [bb].[usp_GetContacts]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [bb].[usp_GetContacts] @PersonNbr varchar(12)
	as

	select	c.ContactPersonNbr,
			c.LastName,
			c.FirstName,
			isnull(c.PhoneNbr, 0) as PhoneNbr,
			isnull(c.Employer, 0) as Employer
	from	bb.contact c inner join bb.person p on c.personid = p.personid
GO
/****** Object:  StoredProcedure [bb].[usp_GetEstimate]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_GetEstimate] @PersonID int
as
--declare @UserID int
--set @UserID = 2


select	qg.QuestionID, 
		qg.PersonID, 
		qg.UserID, 
		qg.Grade, 
		qg.Comment, 
		qg.GradedOn,
		qg.ChangedOn,
		--p.Unit,
		(select StatusName from bb.Status where StatusID = qs.StatusID) as Status,
		q.Description,
		qg.QuestionLevelID,
		concat(u.FirstName, ' ', u.LastName) as UserName,
		(select Description from bb.Role where RoleID = ur.RoleID) as UserRole
from	bb.QuestionnaireGrade qg inner join bb.QuestionnaireStatus qs on qs.UserID = qg.UserID and qs.PersonID = qg.PersonID and qs.CreatedOn = qg.CreatedOn inner join bb.Question q on q.QuestionID = qg.QuestionID inner join bb.[User] u on u.UserID = qg.UserID inner join bb.UserRole ur on ur.UserID = qg.UserID
where	QuestionTypeID = 2 and qg.PersonID = @PersonID

	
GO
/****** Object:  StoredProcedure [bb].[usp_GetEvent]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_GetEvent] @PersonID int
as

select	a.ActionID,
		a.Description as ActionDescription,
		e.EventID,
		e.Description as EventDescription,
		a.PersonID,
		a.Responsible,
		a.Profession,
		(select StatusName from bb.Status where StatusID = a.StatusID) as Status,
		e.CreatedOn
from	bb.action a inner join bb.event e on e.eventid = a.eventid
where	a.personid = @PersonID
GO
/****** Object:  StoredProcedure [bb].[usp_GetPerson]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_GetPerson] @UserID int as

declare @roleID varchar(50)

select top 1 @roleID= ur.RoleID from bb.[UserRole] ur where ur.UserID = @UserID

--admin, get all children
if (@roleID = 4)

	select	
			p.personnbr as PersonNbr, 
			p.lastname as LastName, 
			p.firstname as FirstName,
			isnull(p.guardian1, 0) as Guardian1,
			isnull(p.guardianpersonnbr1, 0) as GuardianPersonNbr1,
			isnull(p.guardian2, 0) as Guardian2,
			isnull(p.guardianpersonnbr2, 0) as GuardianPersonNbr2,
			isnull(p.changedby, 0) as ChangedBy,
			convert(datetime, isnull(p.ChangedOn, 0)) as ChangedOn,
			isnull(p.status, 0) as Status, 
			p.PersonID
	from	bb.person p

--barnkontakt
else if(@roleID = 2)

	select	DISTINCT
				p.personnbr as PersonNbr, 
				p.lastname as LastName, 
				p.firstname as FirstName,
				isnull(p.guardian1, 0) as Guardian1,
				isnull(p.guardianpersonnbr1, 0) as GuardianPersonNbr1,
				isnull(p.guardian2, 0) as Guardian2,
				isnull(p.guardianpersonnbr2, 0) as GuardianPersonNbr2,
				isnull(p.changedby, 0) as ChangedBy,
				convert(datetime, isnull(p.ChangedOn, 0)) as ChangedOn,
				isnull(p.status, 0) as Status, 
				p.PersonID
	from	bb.person p inner join bb.PersonUser pu on p.PersonID= pu.PersonID
						inner join bb.Unit unit on unit.UnitName= p.Unit 
						inner join bb.[UserUnit] uu on uu.UnitID = unit.UnitID
						inner join bb.[UserRole] ur on ur.UserID = uu.UserID
						inner join bb.[User] u on ur.UserID = u.UserID

	where	u.UserID = @UserID or pu.userid = @UserID
	UNION
	select	
				p.personnbr as PersonNbr, 
				p.lastname as LastName, 
				p.firstname as FirstName,
				isnull(p.guardian1, 0) as Guardian1,
				isnull(p.guardianpersonnbr1, 0) as GuardianPersonNbr1,
				isnull(p.guardian2, 0) as Guardian2,
				isnull(p.guardianpersonnbr2, 0) as GuardianPersonNbr2,
				isnull(p.changedby, 0) as ChangedBy,
				convert(datetime, isnull(p.ChangedOn, 0)) as ChangedOn,
				isnull(p.status, 0) as Status, 
				p.PersonID
	from	bb.person p inner join bb.UserRight ur on ur.personid = p.personid 
	where	ur.userid = @UserID

--barnteam
else if(@roleID = 3)

	select	DISTINCT
				p.personnbr as PersonNbr, 
				p.lastname as LastName, 
				p.firstname as FirstName,
				isnull(p.guardian1, 0) as Guardian1,
				isnull(p.guardianpersonnbr1, 0) as GuardianPersonNbr1,
				isnull(p.guardian2, 0) as Guardian2,
				isnull(p.guardianpersonnbr2, 0) as GuardianPersonNbr2,
				isnull(p.changedby, 0) as ChangedBy,
				convert(datetime, isnull(p.ChangedOn, 0)) as ChangedOn,
				isnull(p.status, 0) as Status, 
				p.PersonID
	from	bb.person p inner join bb.PersonUser pu on p.PersonID= pu.PersonID
						inner join bb.Unit unit on unit.UnitName= p.Unit 
						inner join bb.[UserUnit] uu on uu.UnitID = unit.UnitID
						inner join bb.[UserRole] ur on ur.UserID = uu.UserID
						inner join bb.[User] u on ur.UserID = u.UserID

	where	(u.UserID = @UserID and p.status = 'I barnteam') or pu.userid = @UserID
	UNION
	select	
				p.personnbr as PersonNbr, 
				p.lastname as LastName, 
				p.firstname as FirstName,
				isnull(p.guardian1, 0) as Guardian1,
				isnull(p.guardianpersonnbr1, 0) as GuardianPersonNbr1,
				isnull(p.guardian2, 0) as Guardian2,
				isnull(p.guardianpersonnbr2, 0) as GuardianPersonNbr2,
				isnull(p.changedby, 0) as ChangedBy,
				convert(datetime, isnull(p.ChangedOn, 0)) as ChangedOn,
				isnull(p.status, 0) as Status, 
				p.PersonID
	from	bb.person p inner join bb.UserRight ur on ur.personid = p.personid 
	where	ur.userid = @UserID

else

	select	
				p.personnbr as PersonNbr, 
				p.lastname as LastName, 
				p.firstname as FirstName,
				isnull(p.guardian1, 0) as Guardian1,
				isnull(p.guardianpersonnbr1, 0) as GuardianPersonNbr1,
				isnull(p.guardian2, 0) as Guardian2,
				isnull(p.guardianpersonnbr2, 0) as GuardianPersonNbr2,
				isnull(p.changedby, 0) as ChangedBy,
				convert(datetime, isnull(p.ChangedOn, 0)) as ChangedOn,
				isnull(p.status, 0) as Status, 
				p.PersonID
	from	bb.person p inner join bb.personuser pu on p.personid = pu.personid 
						inner join bb.[user] u on pu.UserID = u.UserID
	where	pu.userid = @UserID

	UNION
	select	
				p.personnbr as PersonNbr, 
				p.lastname as LastName, 
				p.firstname as FirstName,
				isnull(p.guardian1, 0) as Guardian1,
				isnull(p.guardianpersonnbr1, 0) as GuardianPersonNbr1,
				isnull(p.guardian2, 0) as Guardian2,
				isnull(p.guardianpersonnbr2, 0) as GuardianPersonNbr2,
				isnull(p.changedby, 0) as ChangedBy,
				convert(datetime, isnull(p.ChangedOn, 0)) as ChangedOn,
				isnull(p.status, 0) as Status, 
				p.PersonID
	from	bb.person p inner join bb.UserRight ur on ur.personid = p.personid 
	where	ur.userid = @UserID
GO
/****** Object:  StoredProcedure [bb].[usp_GetStatus]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_GetStatus] @PersonID int
as

drop table if exists #temp

create table #temp(QuestionID int, PersonID int, Grade int, Comment varchar(500), GradeType varchar(50), GradedOn datetime, Status varchar(50), UserName varchar(50), UserRole varchar(50))

insert into #temp
exec bb.usp_GetSubstrate @PersonID


if((select count(distinct GradedOn) from #temp) > 0)
begin
	select StatusID, StatusName from bb.Status where StatusType = 'Barn'
end
else
begin
	select StatusID, StatusName from bb.Status where StatusType = 'Barn' and StatusID <> 9 and StatusID <> 11
end

drop table #temp


GO
/****** Object:  StoredProcedure [bb].[usp_GetSubstrate]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_GetSubstrate] @PersonID int
as


--declare @PersonID int
--set @PersonID = 53


select g.QuestionID, s.PersonID, g.Grade1 as Grade, g.Comment1 as Comment, 'Guardian1' as GradeType, g.GradedOn, (select StatusName from bb.Status where StatusID = s.StatusID) as Status, (select concat(FirstName, ' ', LastName) from bb.[User] where UserID = (select UserID from bb.UserRole where CreatedOn = s.CreatedOn)) as UserName, (select Description from bb.Role where RoleID = (select RoleID from bb.UserRole where CreatedOn = s.CreatedOn)) as UserRole from bb.QuestionGuardian g inner join bb.QuestionnaireStatus s on s.CreatedOn = g.CreatedOn where s.PersonID = @PersonID and QuestionID > 50 --and GradedOn = '2021-11-22 12:50:59.393'
union
select g.QuestionID, s.PersonID, g.Grade2 as Grade, g.Comment2 as Comment, 'Guardian2' as GradeType, g.GradedOn, (select StatusName from bb.Status where StatusID = s.StatusID) as Status, (select concat(FirstName, ' ', LastName) from bb.[User] where UserID = (select UserID from bb.UserRole where CreatedOn = s.CreatedOn)) as UserName, (select Description from bb.Role where RoleID = (select RoleID from bb.UserRole where CreatedOn = s.CreatedOn)) as UserRole from bb.QuestionGuardian g inner join bb.QuestionnaireStatus s on s.CreatedOn = g.CreatedOn where s.PersonID = @PersonID and QuestionID > 50 --and GradedOn = '2021-11-22 12:50:59.393'
union
select g.QuestionID, g.PersonID, g.Grade, g.Comment, 'Person' as GradeType, g.GradedOn, (select StatusName from bb.Status where StatusID = s.StatusID) as Status, (select concat(FirstName, ' ', LastName) from bb.[User] where UserID = g.UserID) as UserName, (select Description from bb.Role where RoleID = ur.RoleID) as UserRole from bb.QuestionnaireGrade g inner join bb.QuestionnaireStatus s on s.CreatedOn = g.CreatedOn inner join bb.UserRole ur on ur.UserID = g.UserID where QuestionTypeID = 1 and g.PersonID = @PersonID and QuestionID > 50 --and GradedOn = '2021-11-22 12:50:59.393'
order by GradedOn, QuestionID


/*
select distinct q.QuestionID, q.PersonID, q.Grade, q.Comment, qg.Grade1, qg.Comment1, qg.Grade2, qg.Comment2, q.GradedOn, (select StatusName from bb.Status where StatusID = qs.StatusID) as Status
from bb.QuestionnaireGrade q inner join bb.QuestionGuardian qg on qg.GradedOn = q.GradedOn
							 inner join bb.QuestionnaireStatus qs on qs.CreatedOn = q.GradedOn
where q.QuestionTypeID = 1 and q.PersonID = @PersonID
*/







GO
/****** Object:  StoredProcedure [bb].[usp_GetTeams]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [bb].[usp_GetTeams]
as

select	tu.TeamID,
		t.TeamName,
		tu.UnitID,
		u.UnitName,
		tu.CreatedBy,
		tu.CreatedOn,
		tu.ChangedBy,
		tu.ChangedOn
from	bb.Team t inner join bb.TeamUnit tu on tu.TeamID = t.TeamID
				  inner join bb.Unit u on u.UnitID = tu.UnitID

	
GO
/****** Object:  StoredProcedure [bb].[usp_GetUnit]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [bb].[usp_GetUnit] as
select UnitId, UnitName from bb.unit
GO
/****** Object:  StoredProcedure [bb].[usp_GetUnits]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_GetUnits]
as

select	u.UnitID,
		u.UnitName
from	bb.Unit u left outer join bb.TeamUnit tu on u.UnitID = tu.UnitID
where	tu.UnitID is null and u.UnitID <> 7 and u.UnitID <> 8
GO
/****** Object:  StoredProcedure [bb].[usp_GetUnitsBarnkontakt]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [bb].[usp_GetUnitsBarnkontakt]

AS
BEGIN

	select	u.UnitID,
			u.UnitName
	from	bb.Unit u 
	
	/* left outer join bb.UserUnit uu on u.UnitID = uu.UnitID
			inner join bb.UserRole ur on ur.UserID= uu.UserID */

	where	u.UnitID <> 7 and u.UnitID <> 8 and u.UnitID NOT IN (select u.UnitID
																from [bb].[Unit] u inner join [bb].[UserUnit] uu on uu.UnitID= u.UnitID 
																inner join [bb].[UserRole] ur on ur.UserID=  uu.UserID where ur.RoleID=2)
	
END
GO
/****** Object:  StoredProcedure [bb].[usp_GetUnitUsers]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [bb].[usp_GetUnitUsers] @TeamID int
as


select	u.LastName,
		u.FirstName
from	bb.[User] u inner join bb.UserUnit uu on uu.UserID = u.UserID
					inner join bb.TeamUnit tu on tu.UnitID = uu.UnitID
where	tu.TeamID = @TeamID




GO
/****** Object:  StoredProcedure [bb].[usp_GetUser]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [bb].[usp_GetUser] @Email varchar(50) as
select	u.UserID,
		u.LastName,
		u.FirstName,
		u.Email,
		r.RoleID,
		r.Description
from	bb.[User] u inner join bb.UserRole ur on ur.UserID = u.UserID
					inner join bb.Role r on r.RoleID = ur.RoleID
where	Email = @Email
GO
/****** Object:  StoredProcedure [bb].[usp_GetUsers]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_GetUsers] as
select	u.UserID,
		u.LastName,
		u.FirstName,
		u.Email,
		r.RoleID,
		r.Description,
		u.Organisation,
		uu.UnitID,
		(select UnitName from bb.Unit where UnitID = uu.UnitID) as UnitName
from	bb.[User] u inner join bb.UserRole ur on ur.UserID = u.UserID
					inner join bb.Role r on r.RoleID = ur.RoleID
					inner join bb.UserUnit uu on uu.UserID = u.UserID
GO
/****** Object:  StoredProcedure [bb].[usp_GetUsersRight]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [bb].[usp_GetUsersRight]  @CurrentUserID int as

declare @roleID varchar(50)

select top 1 @roleID= ur.RoleID from bb.[UserRole] ur where ur.UserID = @CurrentUserID

--admin, get all rights
if (@roleID = 4)
	select	ur.CurrentUserID,
			u.UserID,
			u.LastName as UserLastName,
			u.FirstName as UserFirstName,
			ur.QuestionTypeID,
			p.PersonID,
			p.LastName,
			p.FirstName
		
	from	bb.[User] u inner join bb.UserRight ur on ur.UserID = u.UserID
						inner join bb.Person p on p.PersonID = ur.PersonID

else
	select	ur.CurrentUserID,
			u.UserID,
			u.LastName as UserLastName,
			u.FirstName as UserFirstName,
			ur.QuestionTypeID,
			p.PersonID,
			p.LastName,
			p.FirstName
		
	from	bb.[User] u inner join bb.UserRight ur on ur.UserID = u.UserID
						inner join bb.Person p on p.PersonID = ur.PersonID

	where ur.CurrentUserID= @CurrentUserID
GO
/****** Object:  StoredProcedure [bb].[usp_LockEstimate]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [bb].[usp_LockEstimate] @PersonID int, @UserID int, @CreatedOn datetime
as
--select * from bb.QuestionnaireStatus where PersonID = @PersonID and UserID = @UserID and CreatedOn = @CreatedOn
update bb.QuestionnaireStatus
set StatusID = 5
where PersonID = @PersonID and UserID = @UserID and CreatedOn = @CreatedOn and StatusID = 4
GO
/****** Object:  StoredProcedure [bb].[usp_Login]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [bb].[usp_Login] @email varchar(50), @password varchar(50) 
as

declare @stage1 int, @stage2 int, @em varchar(50), @pw int, @userid int

select top 1 @em = 1 from bb.[user] where email = @email

if (@em = 1)
  begin
  set @stage1 = 1
  end
else
  begin
  set @stage1 = 0
  end

select top 1 @pw = 1 from bb.[user] where email = @email and [password] = @password

if (@pw = 1)
  begin
  set @stage2 = 1
  end
else
  begin
  set @stage2 = 0
  end


if (@stage1 = 0)
	begin
	select	'Användaren hittades ej'
	end
else if(@stage1 = 1 and @stage2 = 0)
	begin
	select	'Felaktigt lösenord'
	end
else
	begin
	select @userid = u.userid from bb.[user] u inner join bb.[userrole] ur on u.userid = ur.userid where u.email = @email
	exec bb.usp_GetUser @email
	end
GO
/****** Object:  StoredProcedure [bb].[usp_RemoveTeam]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [bb].[usp_RemoveTeam] @TeamID int
as

begin try

	delete from bb.TeamUnit where TeamID = @TeamID
	delete from bb.Team where TeamID = @TeamID

select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch


GO
/****** Object:  StoredProcedure [bb].[usp_RemoveUser]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [bb].[usp_RemoveUser] @UserID int
as

begin try

	delete from bb.UserUnit where UserID = @UserID

	delete from bb.UserRole where UserID = @UserID

	delete from bb.[User] where UserID = @UserID


	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch

GO
/****** Object:  StoredProcedure [bb].[usp_RemoveUserRight]    Script Date: 2022-03-16 08:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [bb].[usp_RemoveUserRight] @CurrentUserID int, @UserID int, @PersonID int, @Type int
as

begin try

	delete from bb.[UserRight] where CurrentUserID = @CurrentUserID and UserID = @UserID and PersonID=@PersonID and QuestionTypeID= @Type


	select  
         0 as ErrorNumber  
        ,0 as ErrorSeverity  
        ,0 as ErrorState  
        ,'Success' as ErrorMessage

end try
begin catch
	select  
         ERROR_NUMBER() as ErrorNumber  
        ,ERROR_SEVERITY() as ErrorSeverity  
        ,ERROR_STATE() as ErrorState  
        ,ERROR_MESSAGE() as ErrorMessage
end catch

GO
ALTER DATABASE [sqldb-ykbb] SET  READ_WRITE 
GO
