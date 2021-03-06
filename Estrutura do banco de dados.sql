USE [master]
GO
/****** Object:  Database [sql_server_escola2]    Script Date: 01/01/2021 12:39:40 ******/
CREATE DATABASE [sql_server_escola2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'estudo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\estudo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'estudo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\estudo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sql_server_escola2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sql_server_escola2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sql_server_escola2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sql_server_escola2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sql_server_escola2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sql_server_escola2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sql_server_escola2] SET ARITHABORT OFF 
GO
ALTER DATABASE [sql_server_escola2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [sql_server_escola2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sql_server_escola2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sql_server_escola2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sql_server_escola2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sql_server_escola2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sql_server_escola2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sql_server_escola2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sql_server_escola2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sql_server_escola2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sql_server_escola2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sql_server_escola2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sql_server_escola2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sql_server_escola2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sql_server_escola2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sql_server_escola2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sql_server_escola2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sql_server_escola2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sql_server_escola2] SET  MULTI_USER 
GO
ALTER DATABASE [sql_server_escola2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sql_server_escola2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sql_server_escola2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sql_server_escola2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sql_server_escola2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sql_server_escola2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [sql_server_escola2] SET QUERY_STORE = OFF
GO
USE [sql_server_escola2]
GO
/****** Object:  Table [dbo].[disciplinas]    Script Date: 01/01/2021 12:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[disciplinas](
	[id_disciplinas] [int] NOT NULL,
	[carga_horaria] [int] NULL,
	[nome] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_disciplinas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[professor]    Script Date: 01/01/2021 12:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[professor](
	[id_professor] [int] NOT NULL,
	[nome] [varchar](100) NULL,
	[data_nascimento] [date] NULL,
	[cpf] [char](14) NULL,
	[rg] [varchar](20) NULL,
	[telefone] [varchar](14) NULL,
	[formacao] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_professor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[relacao_professor_materia]    Script Date: 01/01/2021 12:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relacao_professor_materia](
	[id_professor] [int] NULL,
	[id_disciplinas] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turma]    Script Date: 01/01/2021 12:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turma](
	[id_turma] [int] NOT NULL,
	[capacidade] [int] NULL,
	[curso] [varchar](70) NULL,
	[horario] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_turma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turma_professor]    Script Date: 01/01/2021 12:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turma_professor](
	[id_turma] [int] NULL,
	[id_professor] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[relacao_professor_materia]  WITH CHECK ADD FOREIGN KEY([id_disciplinas])
REFERENCES [dbo].[disciplinas] ([id_disciplinas])
GO
ALTER TABLE [dbo].[relacao_professor_materia]  WITH CHECK ADD FOREIGN KEY([id_professor])
REFERENCES [dbo].[professor] ([id_professor])
GO
ALTER TABLE [dbo].[turma_professor]  WITH CHECK ADD FOREIGN KEY([id_professor])
REFERENCES [dbo].[professor] ([id_professor])
GO
ALTER TABLE [dbo].[turma_professor]  WITH CHECK ADD FOREIGN KEY([id_turma])
REFERENCES [dbo].[turma] ([id_turma])
GO
USE [master]
GO
ALTER DATABASE [sql_server_escola2] SET  READ_WRITE 
GO
