DROP DATABASE [csfg_db]

CREATE DATABASE [csfg_db]
	CONTAINMENT = NONE
	ON  PRIMARY 
	( NAME = N'csfg_db', FILENAME = N'D:\sql-freeasphost-user-dbs\csfg_db.mdf' , SIZE = 10240KB , MAXSIZE = 51200KB , FILEGROWTH = 5120KB )
	LOG ON 
	( NAME = N'csfg_db_log', FILENAME = N'D:\sql-freeasphost-user-dbs\csfg_db.ldf' , SIZE = 5120KB , MAXSIZE = 25600KB , FILEGROWTH = 5120KB )

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [csfg_db].[dbo].[sp_fulltext_database] @action = 'enable'
end

ALTER DATABASE [csfg_db] SET ANSI_NULL_DEFAULT OFF 
ALTER DATABASE [csfg_db] SET ANSI_NULLS OFF 
ALTER DATABASE [csfg_db] SET ANSI_PADDING OFF 
ALTER DATABASE [csfg_db] SET ANSI_WARNINGS OFF 
ALTER DATABASE [csfg_db] SET ARITHABORT OFF 
ALTER DATABASE [csfg_db] SET AUTO_CLOSE OFF 
ALTER DATABASE [csfg_db] SET AUTO_SHRINK OFF 
ALTER DATABASE [csfg_db] SET AUTO_UPDATE_STATISTICS ON 
ALTER DATABASE [csfg_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
ALTER DATABASE [csfg_db] SET CURSOR_DEFAULT  GLOBAL 
ALTER DATABASE [csfg_db] SET CONCAT_NULL_YIELDS_NULL OFF 
ALTER DATABASE [csfg_db] SET NUMERIC_ROUNDABORT OFF 
ALTER DATABASE [csfg_db] SET QUOTED_IDENTIFIER OFF 
ALTER DATABASE [csfg_db] SET RECURSIVE_TRIGGERS OFF 
ALTER DATABASE [csfg_db] SET ENABLE_BROKER 
ALTER DATABASE [csfg_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
ALTER DATABASE [csfg_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
ALTER DATABASE [csfg_db] SET TRUSTWORTHY OFF 
ALTER DATABASE [csfg_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
ALTER DATABASE [csfg_db] SET PARAMETERIZATION SIMPLE 
ALTER DATABASE [csfg_db] SET READ_COMMITTED_SNAPSHOT OFF 
ALTER DATABASE [csfg_db] SET HONOR_BROKER_PRIORITY OFF 
ALTER DATABASE [csfg_db] SET RECOVERY FULL 
ALTER DATABASE [csfg_db] SET MULTI_USER 
ALTER DATABASE [csfg_db] SET PAGE_VERIFY CHECKSUM  
ALTER DATABASE [csfg_db] SET DB_CHAINING OFF 
ALTER DATABASE [csfg_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
ALTER DATABASE [csfg_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
ALTER DATABASE [csfg_db] SET DELAYED_DURABILITY = DISABLED 
ALTER DATABASE [csfg_db] SET QUERY_STORE = OFF

USE [csfg_db]

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
ALTER DATABASE [csfg_db] SET  READ_WRITE 

--##############################################################################################################

--DROP CONSTRAIN LOG
ALTER TABLE [dbo].[tbl_log] DROP CONSTRAINT [FK_log_tbl_stu]

--DROP CONSTRAIN GAL
ALTER TABLE [dbo].[tbl_gal] DROP CONSTRAINT [FK_tbl_gal_tbl_img]
ALTER TABLE [dbo].[tbl_gal] DROP CONSTRAINT [FK_tbl_gal_tbl_eve]

--DROP CONSTRAIN EVE
ALTER TABLE [dbo].[tbl_eve] DROP CONSTRAINT [FK_eve_img]

--DROP CONSTRAIN NOTE
ALTER TABLE [dbo].[tbl_note] DROP CONSTRAINT [FK_note_sub]
ALTER TABLE [dbo].[tbl_note] DROP CONSTRAINT [FK_note_stu]
ALTER TABLE [dbo].[tbl_note] DROP CONSTRAINT [DF_tbl_note_isValid]

--DROP CONSTRAIN STUDENT
ALTER TABLE [dbo].[tbl_stu] DROP CONSTRAINT [FK_stu_img]
ALTER TABLE [dbo].[tbl_stu] DROP CONSTRAINT [DF_tbl_stu_isValid]

---##############################################################################################################
--DROP LOG IF EXIST
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_log]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_log]

--DROP GAL IF EXIST
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_gal]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_gal]

--DROP EVE IF EXIST
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_eve]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_eve]

--DROP NOTE IF EXIST
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_note]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_note]

--DROP SUB IF EXIST
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_sub]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_sub]

--DROP STU IF EXIST
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_stu]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_stu]

--DROP IMG IF EXIST
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_img]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_img]
--##############################################################################################################

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

--##############################################################################################################
--CREATE IMG
CREATE TABLE [dbo].[tbl_img](
	[img_id] [int] IDENTITY(1,1) NOT NULL,
	[img_name] [nvarchar](50) NOT NULL,
	CONSTRAINT [PK_tbl_img] PRIMARY KEY CLUSTERED ([img_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--CREATE STU
CREATE TABLE [dbo].[tbl_stu](
	[stu_id] [int] NOT NULL,
	[stu_name] [nvarchar](50) NOT NULL,
	[stu_pass] [nvarchar](100) NOT NULL,
	[stu_img] [int] NOT NULL,
	[stu_mo] [numeric](12, 0) NOT NULL,
	[stu_mail] [nvarchar](50) NOT NULL,
	[stu_gen] [nchar](10) NULL,
	[isAdmin] [bit] NOT NULL,
	[isValid] [bit] NOT NULL,
	CONSTRAINT [PK_tbl_std] PRIMARY KEY CLUSTERED ([stu_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--CREATE SUB
CREATE TABLE [dbo].[tbl_sub](
	[sub_id] [int] IDENTITY(1,1) NOT NULL,
	[sub_code] [nvarchar](10) NOT NULL,
	[sub_name] [nvarchar](50) NOT NULL,
	[sub_teacher] [nvarchar](30) NOT NULL,
	[sub_year] [int] NOT NULL,
	[sub_sem] [int] NOT NULL,
	CONSTRAINT [PK_tbl_sub] PRIMARY KEY CLUSTERED ([sub_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--CRAETE NOTE
CREATE TABLE [dbo].[tbl_note](
	[note_id] [int] IDENTITY(1,1) NOT NULL,
	[note_sub] [int] NOT NULL,
	[note_upl_by] [int] NOT NULL,
	[note_link] [int] NOT NULL,
	[note_date] [date] NOT NULL,
	[note_type] [nchar](10) NOT NULL,
	[isValid] [bit] NOT NULL,
	CONSTRAINT [PK_tbl_note] PRIMARY KEY CLUSTERED ([note_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--CREATE EVE
CREATE TABLE [dbo].[tbl_eve](
	[eve_id] [int] IDENTITY(1,1) NOT NULL,
	[eve_img] [int] NOT NULL,
	[eve_name] [nvarchar](50) NOT NULL,
	[eve_date] [date] NOT NULL,
	[eve_disc] [nvarchar](300) NULL,
	CONSTRAINT [PK_tbl_eve] PRIMARY KEY CLUSTERED ([eve_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--CREATE GAL
CREATE TABLE [dbo].[tbl_gal](
	[gal_id] [int] IDENTITY(1,1) NOT NULL,
	[gal_img] [int] NOT NULL,
	[gal_eve] [int] NOT NULL
) ON [PRIMARY]

--CREATE LOG
CREATE TABLE [dbo].[tbl_log](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[log_date] [datetime] NOT NULL,
	[log_stu] [int] NOT NULL,
	[log_text] [nvarchar](250) NULL,
	[log_error] [nvarchar](250) NULL,
	CONSTRAINT [PK_log] PRIMARY KEY CLUSTERED ([log_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--##############################################################################################################

--ADD CONSTRAINT STU
ALTER TABLE [dbo].[tbl_stu] ADD  CONSTRAINT [DF_tbl_stu_isValid]  DEFAULT ((0)) FOR [isValid]
ALTER TABLE [dbo].[tbl_stu]  WITH CHECK ADD  CONSTRAINT [FK_stu_img] FOREIGN KEY([stu_img]) REFERENCES [dbo].[tbl_img] ([img_id])
ALTER TABLE [dbo].[tbl_stu] CHECK CONSTRAINT [FK_stu_img]

--ADD CONSTRAINT NOTE
ALTER TABLE [dbo].[tbl_note] ADD  CONSTRAINT [DF_tbl_note_isValid]  DEFAULT ((0)) FOR [isValid]
ALTER TABLE [dbo].[tbl_note]  WITH CHECK ADD  CONSTRAINT [FK_note_stu] FOREIGN KEY([note_upl_by]) REFERENCES [dbo].[tbl_stu] ([stu_id])
ALTER TABLE [dbo].[tbl_note] CHECK CONSTRAINT [FK_note_stu]
ALTER TABLE [dbo].[tbl_note]  WITH NOCHECK ADD  CONSTRAINT [FK_note_sub] FOREIGN KEY([note_sub]) REFERENCES [dbo].[tbl_sub] ([sub_id])
ALTER TABLE [dbo].[tbl_note] CHECK CONSTRAINT [FK_note_sub]

--ADD CONSTRAINT EVE
ALTER TABLE [dbo].[tbl_eve]  WITH CHECK ADD  CONSTRAINT [FK_eve_img] FOREIGN KEY([eve_img]) REFERENCES [dbo].[tbl_img] ([img_id])
ALTER TABLE [dbo].[tbl_eve] CHECK CONSTRAINT [FK_eve_img]

--ADD CONSTRAINT GAL
ALTER TABLE [dbo].[tbl_gal]  WITH CHECK ADD  CONSTRAINT [FK_tbl_gal_tbl_eve] FOREIGN KEY([gal_eve]) REFERENCES [dbo].[tbl_eve] ([eve_id])
ALTER TABLE [dbo].[tbl_gal] CHECK CONSTRAINT [FK_tbl_gal_tbl_eve]
ALTER TABLE [dbo].[tbl_gal]  WITH CHECK ADD  CONSTRAINT [FK_tbl_gal_tbl_img] FOREIGN KEY([gal_img]) REFERENCES [dbo].[tbl_img] ([img_id])
ALTER TABLE [dbo].[tbl_gal] CHECK CONSTRAINT [FK_tbl_gal_tbl_img]

--ADD CONSTRAINT LOG
ALTER TABLE [dbo].[tbl_log]  WITH CHECK ADD  CONSTRAINT [FK_log_tbl_stu] FOREIGN KEY([log_stu]) REFERENCES [dbo].[tbl_stu] ([stu_id])
ALTER TABLE [dbo].[tbl_log] CHECK CONSTRAINT [FK_log_tbl_stu]

--##############################################################################################################

--INSERT IMAGE
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('DEFAULT.JPG');
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('DEPARTMENT.JPG');
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('NIU-AHIRE-PATIL.JPG');
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('FILE.PNG');
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('LINK.PNG');
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('VIDEO.PNG');

--INSERT STU
INSERT INTO [dbo].[tbl_stu]([stu_id],[stu_name],[stu_pass],[stu_img],[stu_mo],[stu_mail],[stu_gen],[isAdmin],[isValid])
     VALUES(22111065,'NILU-AHIRE-PATIL','22111065',3,9096977063,'niluahirepatil@gmail.com','M',1,1);
INSERT INTO [dbo].[tbl_stu]([stu_id],[stu_name],[stu_pass],[stu_img],[stu_mo],[stu_mail],[stu_gen],[isAdmin],[isValid])
     VALUES(22111027,'Kartik Gajdale','22111065',3,9511751764,'kj123@gmail.com','M',1,0);

--INSERT INTO SUB
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('CS-101','FUNCTIONAL PROGRAMMING','AKR',2023,1);
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('LLAP','LLAP','NPP',2023,1);
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('ADC','ADVANCE DATABAES CONCEPT','NPP',2023,1);
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('QC','QUANTUM COMPUTING','RK',2023,1);

--##############################################################################################################*/