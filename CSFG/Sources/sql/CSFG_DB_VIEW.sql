--VIEW VERIFIED NOTES
CREATE OR Alter VIEW view_verified_note as
	select tbl_sub.sub_name,tbl_sub.sub_code,tbl_stu.stu_name,tbl_note.note_link,tbl_note.note_date,tbl_img.img_name
	from tbl_note inner join tbl_stu on tbl_note.note_upl_by = tbl_stu.stu_id 
	inner join tbl_sub on tbl_note.note_sub = tbl_sub.sub_id
	inner join tbl_img on tbl_note.note_type = tbl_img.img_id
	where tbl_note.isValid = 1;	
go

--VIEW VERIFIED NOTES
CREATE OR Alter VIEW view_pending_note as
	select tbl_sub.sub_name,tbl_sub.sub_code,tbl_stu.stu_name,tbl_note.note_link,tbl_note.note_date,tbl_img.img_name
	from tbl_note inner join tbl_stu on tbl_note.note_upl_by = tbl_stu.stu_id 
	inner join tbl_sub on tbl_note.note_sub = tbl_sub.sub_id
	inner join tbl_img on tbl_note.note_type = tbl_img.img_id
	where tbl_note.isValid = 0;
go

--VIEW ALL NOTES
CREATE OR Alter VIEW view_all_note as
	select tbl_sub.sub_name,tbl_sub.sub_code,tbl_stu.stu_name,tbl_note.note_link,tbl_note.note_date,tbl_img.img_name
	from tbl_note inner join tbl_stu on tbl_note.note_upl_by = tbl_stu.stu_id 
	inner join tbl_sub on tbl_note.note_sub = tbl_sub.sub_id
	inner join tbl_img on tbl_note.note_type = tbl_img.img_id;
go

--VIEW EVENTS
CREATE OR Alter VIEW view_all_event as
	select tbl_eve.eve_name,tbl_eve.eve_date,tbl_eve.eve_link,tbl_img.img_name
	from tbl_eve inner join tbl_img on tbl_eve.eve_img = tbl_img.img_id
	where tbl_eve.eve_date < GETDATE();
go

--VIEW UPCOMMING EVENTS
CREATE OR Alter VIEW view_upcomming_event as
	select tbl_eve.eve_name,tbl_eve.eve_date,tbl_eve.eve_link,tbl_img.img_name
	from tbl_eve inner join tbl_img on tbl_eve.eve_img = tbl_img.img_id
	where tbl_eve.eve_date >= GETDATE();
go

--VIEW CSGF TEAM MEMBER
CREATE OR Alter VIEW view_csfg_member as
	select tbl_stu.stu_name,tbl_stu.stu_id,tbl_stu.stu_mail,tbl_stu.stu_mo,tbl_stu.stu_link,tbl_img.img_name
	from tbl_stu inner join tbl_img on tbl_stu.stu_img = tbl_img.img_id
	where tbl_stu.isAdmin = 1 and tbl_stu.isValid = 1;
go

--VERIFIED STUDENTD
CREATE OR Alter VIEW view_verified_students as
	select tbl_stu.stu_name,tbl_stu.stu_id,tbl_stu.stu_mail,tbl_stu.stu_mo,tbl_stu.stu_link,tbl_img.img_name
	from tbl_stu inner join tbl_img on tbl_stu.stu_img = tbl_img.img_id
	where tbl_stu.isValid = 1;
go

--ALL PENDING STUDENTD
CREATE OR Alter VIEW view_pending_students as
	select tbl_stu.stu_name,tbl_stu.stu_id,tbl_stu.stu_mail,tbl_stu.stu_mo,tbl_stu.stu_link,tbl_img.img_name
	from tbl_stu inner join tbl_img on tbl_stu.stu_img = tbl_img.img_id
	where tbl_stu.isValid = 0;
go

--ALL GALLERY 
CREATE OR Alter VIEW view_all_gallery as
	select tbl_eve.eve_date,tbl_eve.eve_link,tbl_img.img_name
	from tbl_gal inner join tbl_eve on tbl_eve.eve_id = tbl_gal.gal_eve
	inner join tbl_img on tbl_gal.gal_img = tbl_img.img_id
go

--VERIFIED GALLERY 
CREATE OR Alter VIEW view_verified_gallery as
	select tbl_eve.eve_date,tbl_eve.eve_link,tbl_img.img_name
	from tbl_gal inner join tbl_eve on tbl_eve.eve_id = tbl_gal.gal_eve
	inner join tbl_img on tbl_gal.gal_img = tbl_img.img_id
	where tbl_gal.isValid = 1;
go

--PENDING GALLERY 
CREATE OR Alter VIEW view_pending_gallery as
	select tbl_eve.eve_date,tbl_eve.eve_link,tbl_img.img_name
	from tbl_gal inner join tbl_eve on tbl_eve.eve_id = tbl_gal.gal_eve
	inner join tbl_img on tbl_gal.gal_img = tbl_img.img_id
	where tbl_gal.isValid = 0;
go



--use csfg_db
select * from tbl_eve where eve_date > GETDATE();

select * from view_upcomming_event order by view_upcomming_event.eve_date desc;

select * from view_all_gallery order by view_all_gallery.eve_date desc;
select * from view_verified_gallery order by view_verified_gallery.eve_date desc;
select * from view_pending_gallery order by view_pending_gallery.eve_date desc;


select * from view_verified_note order by view_verified_note.note_date desc;
select * from view_pending_note order by view_pending_note.note_date desc;
select * from view_all_note order by view_all_note.note_date desc;


select * from view_all_event order by view_all_event.eve_date desc
--select * from view_delete_event order by view_all_event.eve_date desc

select * from view_csfg_member order by view_csfg_member.stu_name desc
select * from view_verified_students order by view_verified_students.stu_name desc
select * from view_pending_students order by view_pending_students.stu_name desc
