use csfg_db
--##############################################################################################################

--DROP CONSTRAIN LOG
--ALTER TABLE [dbo].[tbl_log] DROP CONSTRAINT [FK_log_tbl_stu]

----DROP CONSTRAIN GAL
--ALTER TABLE [dbo].[tbl_gal] DROP CONSTRAINT [FK_tbl_gal_tbl_img]
--ALTER TABLE [dbo].[tbl_gal] DROP CONSTRAINT [FK_tbl_gal_tbl_eve]

----DROP CONSTRAIN EVE
--ALTER TABLE [dbo].[tbl_eve] DROP CONSTRAINT [FK_eve_img]

----DROP CONSTRAIN NOTE
--ALTER TABLE [dbo].[tbl_note] DROP CONSTRAINT [FK_note_sub]
--ALTER TABLE [dbo].[tbl_note] DROP CONSTRAINT [FK_note_stu]
--ALTER TABLE [dbo].[tbl_note] DROP CONSTRAINT [DF_tbl_note_isValid]

----DROP CONSTRAIN STUDENT
--ALTER TABLE [dbo].[tbl_stu] DROP CONSTRAINT [FK_stu_img]
--ALTER TABLE [dbo].[tbl_stu] DROP CONSTRAINT [DF_tbl_stu_isValid]

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
	[note_link] nvarchar(250) NOT NULL,
	[note_date] DateTime NOT NULL,
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
	[eve_link] nvarchar(250) NOT NULL,
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
	[log_action] [nvarchar](250) NOT NULL,
	[log_status][int] NOT NULL,
	[log_report] [nvarchar](250) NOT NULL,
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
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('GIT.PNG');
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('EVENT.JPG');
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('EVENT1.JPG');
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('EVENT2.JPG');
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('EVENT3.JPG');
INSERT INTO [dbo].[tbl_img]([img_name])VALUES('EVENT4.JPG');


--INSERT STU
INSERT INTO [dbo].[tbl_stu]([stu_id],[stu_name],[stu_pass],[stu_img],[stu_mo],[stu_mail],[stu_gen],[isAdmin],[isValid])
     VALUES(22111065,'NILU-AHIRE-PATIL','22111065',3,9096977063,'niluahirepatil@gmail.com','M',1,1);
INSERT INTO [dbo].[tbl_stu]([stu_id],[stu_name],[stu_pass],[stu_img],[stu_mo],[stu_mail],[stu_gen],[isAdmin],[isValid])
     VALUES(22111027,'Kartik Gajdale','22111065',3,9511751764,'kj123@gmail.com','M',1,1);
INSERT INTO [dbo].[tbl_stu]([stu_id],[stu_name],[stu_pass],[stu_img],[stu_mo],[stu_mail],[stu_gen],[isAdmin],[isValid])
     VALUES(22111066,'NILU-AHIRE-PATIL','22111065',3,9096977063,'niluahirepatil@gmail.com','M',1,0);
INSERT INTO [dbo].[tbl_stu]([stu_id],[stu_name],[stu_pass],[stu_img],[stu_mo],[stu_mail],[stu_gen],[isAdmin],[isValid])
     VALUES(22111028,'Kartik Gajdale','22111065',3,9511751764,'kj123@gmail.com','M',1,0);

--INSERT INTO SUB
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('CS-101','FUNCTIONAL PROGRAMMING','AKR',2023,1);
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('LLAP','LLAP','NPP',2023,1);
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('ADC','ADVANCE DATABAES CONCEPT','NPP',2023,1);
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('QC','QUANTUM COMPUTING','RK',2023,1);
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('CS-301','Formal Methods I','PM',2023,1);
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('BCT','Block chain technalogies','JY',2023,1);
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('DA','Data Algorithms','HP',2023,1);
INSERT INTO [dbo].[tbl_sub]([sub_code],[sub_name],[sub_teacher],[sub_year],[sub_sem])
     VALUES('PS','Problem Solving','LA',2023,1);

--INSERT INTO NOTE
INSERT INTO [dbo].[tbl_note]([note_sub],[note_upl_by],[note_link],[note_date],[note_type],[isValid])
     VALUES(1,22111065,'temp_kink',CONVERT(datetime,'2023-12-31 00:00:00.000'),'FILE.PNG',1)
INSERT INTO [dbo].[tbl_note]([note_sub],[note_upl_by],[note_link],[note_date],[note_type],[isValid])
     VALUES(2,22111027,'temp_link2',CONVERT(datetime,'2023-12-31 00:00:00.000'),'LINK.PNG',1)
INSERT INTO [dbo].[tbl_note]([note_sub],[note_upl_by],[note_link],[note_date],[note_type],[isValid])
     VALUES(3,22111065,'temp_kink',CONVERT(datetime,'2023-12-31 00:00:00.000'),'FILE.PNG',0)
INSERT INTO [dbo].[tbl_note]([note_sub],[note_upl_by],[note_link],[note_date],[note_type],[isValid])
     VALUES(4,22111027,'temp_link2',CONVERT(datetime,'2023-12-31 00:00:00.000'),'LINK.PNG',0)

--INSERT INTO eve
INSERT INTO [dbo].[tbl_eve]([eve_img],[eve_name],[eve_link],[eve_date],[eve_disc])
     VALUES(8,'Treck','terck_link',CONVERT(date,'2023-10-21'),'this is treck discripction')
INSERT INTO [dbo].[tbl_eve]([eve_img],[eve_name],[eve_link],[eve_date],[eve_disc])
     VALUES(8,'fairwell','fairwell link',CONVERT(date,'2023-03-13'),'this is fairwell discripction')
INSERT INTO [dbo].[tbl_eve]([eve_img],[eve_name],[eve_link],[eve_date],[eve_disc])
     VALUES(8,'Freshers','freshers link',CONVERT(date,'2023-11-16'),'this is freshers discripction')

--INSERT INTO gal
INSERT INTO [dbo].[tbl_gal]([gal_img],[gal_eve])
     VALUES(11,1)
INSERT INTO [dbo].[tbl_gal]([gal_img],[gal_eve])
     VALUES(9,2)
INSERT INTO [dbo].[tbl_gal]([gal_img],[gal_eve])
     VALUES(10,3)

--INSERT INTO log
INSERT INTO [dbo].[tbl_log]([log_date],[log_stu],[log_action],[log_status],[log_report])
     VALUES(CONVERT(datetime,'2023-12-31 00:00:00.000'),22111027,'Login',1,'login by user successfully')

--##############################################################################################################

--select * from tbl_log
--select * from tbl_eve
--select * from tbl_img
--select * from tbl_sub
--select * from tbl_stu
--select * from tbl_img
--select * from tbl_note