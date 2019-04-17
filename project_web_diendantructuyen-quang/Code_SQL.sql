
---------------------------------------------------------QUANG---------------------------------------------------------------------

--sp check dang nhap
create proc sp_loginAdmin
@hoten NVARCHAR(50),
@matkhau NVARCHAR(30)
as
select * FROM dbo.users WHERE hoten=@hoten AND matkhau=@matkhau


--sp load danh sach user
alter proc sp_LoadDanhSachUser
as
SELECT * FROM dbo.users Where trangthai = N'Hiện'




--sp lay danh sach bai dang tru noi dung
alter proc sp_getDSBaiDangKhongNoiDung
AS
begin
SELECT MaBaiDang,tieude,dbo.baidang.trangthai,ngaydang,dbo.users.hoten AS [hoten],dbo.chude.tenchude AS[tenchude]
FROM dbo.baidang,dbo.chude,dbo.users
WHERE dbo.chude.MaChuDe=dbo.baidang.MaChuDe AND dbo.users.MaUser = dbo.baidang.MaUser
end


--Sp lay danh sach chu de - 
create proc sp_layDSChuDe
as
SELECT * FROM dbo.chude

--sp dang bai viet
alter proc sp_TaoBaiDangMoi
@tieude nvarchar(50),
@noidung NTEXT,
@MaUser INT,
@MaChuDe INT
as
BEGIN
	DECLARE @MaBaiDang int 
	SELECT @MaBaiDang =( SELECT COUNT(MaBaiDang) FROM dbo.baidang)
	SELECT @MaBaiDang = @MaBaiDang + 1
	INSERT INTO dbo.baidang
	        ( MaBaiDang ,
	          tieude ,
	          noidung ,
	          ngaydang ,
	          trangthai ,
	          MaUser ,
	          MaChuDe
	        )
	VALUES  ( @MaBaiDang , -- MaBaiDang - int
	          @tieude , -- tieude - nvarchar(50)
	          @noidung , -- noidung - ntext
	          GETDATE() , -- ngaydang - datetime
	          N'Chờ duyệt' , -- trangthai - nvarchar(30)
	          @MaUser , -- MaUser - int
	          @MaChuDe  -- MaChuDe - int
	        )
END


SELECT * FROM dbo.baidang

--sp load noi dung Chi tiet bai dang theo ID
alter proc sp_chiTietBaiDangTheoID
@MaBaiDang int
as
SELECT noidung,MaBaiDang,tieude,dbo.baidang.trangthai,hoten,quyen,tenchude,ngaydang
FROM dbo.baidang,dbo.chude,dbo.users
WHERE MaBaiDang=@MaBaiDang AND dbo.baidang.MaUser=dbo.users.MaUser AND dbo.baidang.MaChuDe = dbo.chude.MaChuDe


----------------- Phần thống kê-----------------------------------
---Các view thống kê tổng số người dùng,bài đăng,bình luận,chủ đề
CREATE VIEW view_SoTV
AS
SELECT COUNT(MaUser) AS [Tổng số thành viên]
FROM dbo.users
SELECT * FROM view_SoTV

CREATE VIEW view_SoBaiDang
as
SELECT COUNT(MaBaiDang) AS [Tổng số bài đăng]
FROM dbo.baidang
SELECT * FROM view_SoBaiDang

CREATE VIEW view_SoBinhLuan
as
SELECT COUNT(MaBinhLuan) AS [Tổng số bình luận]
FROM dbo.binhluan
SELECT * FROM view_SoBinhLuan

CREATE VIEW view_SoChuDe
as
SELECT COUNT(MaChuDe) AS [Tổng số Chủ đề]
FROM dbo.chude
SELECT * FROM view_SoChuDe

--sp thống kê tổng số từng mục
CREATE PROC sp_ThongKeTungMuc
as
SELECT *FROM view_SoTV,view_SoBaiDang,view_SoBinhLuan,view_SoChuDe


----------------- Phần bài đăng -----------------------------------
CREATE VIEW v1
as
SELECT COUNT(MaBaiDang) AS[SL chờ duyệt] FROM dbo.baidang WHERE trangthai=N'Chờ Duyệt'

CREATE VIEW v2
as
SELECT COUNT(MaBaiDang) AS[SL đã duyệt]FROM dbo.baidang WHERE trangthai=N'Đã Duyệt'

CREATE VIEW v3
as
SELECT COUNT(MaBaiDang) AS[SL không chấp nhận]FROM dbo.baidang WHERE trangthai=N'Không Chấp nhận'

CREATE PROC sp_DemSLTungLoaiBaiDang
AS
SELECT * FROM v1,v2,v3

--sp duyet bai dang
create proc sp_DuyetBaiDang
@MaBaiDang int
as
UPDATE dbo.baidang SET trangthai=N'Đã Duyệt' WHERE MaBaiDang=@MaBaiDang

--sp không duyệt bài đăng --> ẩn
create proc sp_KhongDuyetBaiDang
@MaBaiDang int
as
UPDATE dbo.baidang SET trangthai=N'Không Chấp nhận' WHERE MaBaiDang=@MaBaiDang




------------------------------------------------------------------------------CHUNG------------------------------------------------------------------
--sp check email
create PROC sp_checkemail
@email varchar(30)
AS
BEGIN
	SELECT count(*) from users where email = @email
END
EXECUTE sp_checkemail 'dangdinhchung98@gmail.com'

--sp edit user
create PROC sp_editUser
@id nvarchar(50)
AS
BEGIN
	SELECT id,hoten,email,diachi,quyen FROM users WHERE id=@id
END
EXECUTE sp_editUser 1


--sp lay ra 3 tin co so luot thich cao nhat
alter proc sp_getDSBaiDangTop3LuotThich
AS
begin
SELECT TOP 3 bd.*,u.*,cd.*
FROM dbo.baidang as bd,users as u,chude as cd where bd.MaChuDe=cd.MaChuDe and bd.MaUser = u.MaUser and bd.trangthai = N'Đã Duyệt' order by soluotthich desc
end

--sp lay ra 3 tin co so luot xem cao nhat
alter proc sp_getDSBaiDangTop3LuotXem
AS
begin
SELECT TOP 3 bd.*,u.*,cd.*
FROM dbo.baidang as bd,users as u,chude as cd where bd.MaChuDe=cd.MaChuDe and bd.MaUser = u.MaUser and bd.trangthai = N'Đã Duyệt' order by soluotxem desc
end

--sp lay ra 3 tin co so ngay dang gan nhat
alter proc sp_getDSBaiDangTop3NgayDangGanNhat
AS
begin
SELECT TOP 3 bd.*,u.*,cd.*
FROM dbo.baidang as bd,users as u,chude as cd where bd.MaChuDe=cd.MaChuDe and bd.MaUser = u.MaUser and bd.trangthai = N'Đã Duyệt' order by ngaydang desc
end

--sp lay ra 3 thanh vien moi nhat (ngaydangky)
create proc sp_getDSTop3ThanhVienMoiNhat
AS
begin
SELECT TOP 3 *
FROM users where trangthai = N'Hiện' order by ngaydangky desc 
end

--sp lay ra danh sach bai dang theo id
 alter proc sp_getDSBaiDangByID
 @MaBaiDang int
AS
begin
SELECT  bd.*,u.*,cd.*
FROM dbo.baidang as bd,users as u,chude as cd where bd.MaChuDe=cd.MaChuDe and bd.trangthai=N'Đã Duyệt' and bd.MaUser = u.MaUser and bd.MaBaiDang=@MaBaiDang
end
EXECUTE sp_getDSBaiDangByID 1

--sp lay danh sach binh luan bai dang
alter proc sp_getDSBinhLuanByBaiDang
 @MaBaiDang int
AS
begin
SELECT  bd.MaBaiDang,u.*,bl.*
FROM dbo.baidang as bd,users as u,binhluan as bl where bl.MaUser = u.MaUser 
and bl.MaBaiDang = bd.MaBaiDang 
and bl.trangthai = N'Hiện' 
and bd.MaBaiDang=@MaBaiDang
end


--sp update binh luan theo bai dang
alter proc sp_UpdateLikeBinhLuan
@MaBinhLuan int
AS
begin
update binhluan set soluotthich = soluotthich + 1 where binhluan.MaBinhLuan = @MaBinhLuan
end

--sp tim kiem tiêu đề bài đăng
alter proc sp_TimKiemTieuDe
 @keyword NVARCHAR(50)
AS
begin
SELECT bd.*,u.*,cd.* from baidang as bd,chude as cd,users as u
where bd.tieude LIKE  '%' + @keyword + '%' and bd.trangthai = N'Đã Duyệt' and bd.MaChuDe=cd.MaChuDe and bd.MaUser = u.MaUser
end
execute sp_TimKiemTieuDe 'html'

--sp lay ra danh sach chủ đề
create proc sp_getDSChuDe
AS
begin
SELECT * from chude where chude.trangthai = N'Hiện'
end

--sp lay ra danh sach bai dang theo chu de
alter proc sp_getDsBaiDangByChuDe
 @MaChuDe int
as
begin
	Select bd.*,u.*,cd.* from baidang as bd,chude as cd,users as u 
	where bd.MaChuDe = cd.MaChuDe 
	and bd.MaUser = u.MaUser 
	and bd.trangthai = N'Đã Duyệt'
	and cd.MaChuDe = @MaChuDe
end




--create proc sp_LikeBinhLuan
-- @MaBaiDang int
--AS
--begin
--SELECT bl.MaBinhLuan,bl.soluotthich
--FROM dbo.baidang as bd,users as u,binhluan as bl 
--where bl.MaUser = u.MaUser 
--and bl.MaBaiDang = bd.MaBaiDang 
--and bl.trangthai = N'Hiện'
--and bd.MaBaiDang = bl.MaBaiDang
--and bd.MaBaiDang=@MaBaiDang
--end







--sp update so luot xem + 1
create PROC sp_UpdateSoLuotXem
@MaBaiDang int
as
begin
	Update baidang set soluotxem = soluotxem + 1 Where MaBaiDang=@MaBaiDang
end
EXECUTE sp_UpdateSoLuotXem 1

--sp update so luot thich bai viet + 1
create PROC sp_UpdateSoLuotThichBaiDang
@MaBaiDang int
as
begin
	Update baidang set soluotthich = soluotthich + 1 Where MaBaiDang=@MaBaiDang
end

--sp update so luot thich binh luan
create PROC sp_UpdateSoLuotThichBinhLuan
@MaBaiDang int
as
begin
	Update baidang set soluotthich = soluotthich + 1 Where MaBaiDang=@MaBaiDang
end


--sp them user -> nguoidung
Create PROC UserCreateFront
@hoten NVARCHAR(50),@email VARCHAR(30),@matkhau VARCHAR(30),@anhdaidien VARCHAR(50)
as
Begin
			DECLARE @MaUser int 
			SELECT @MaUser =( SELECT COUNT(MaUser) FROM dbo.users)
			SELECT @MaUser = @MaUser + 1
			INSERT INTO dbo.users
			(MaUser,hoten, email , matkhau, anhdaidien, ngaydangky)
				VALUES  ( 
			  @MaUser, -- MaUser - int
			  @hoten, -- hoten - varchar(50)
			  @email, -- email - varchar(30)
			  @matkhau, -- matkhau - varchar(30)
			  @anhdaidien, -- anhdaidien - varchar(50)
			  GETDATE()  -- ngaydangky - datetime
			  )
end

--sp them user -> admin
Create PROC UserCreate
@hoten NVARCHAR(50),@email VARCHAR(30),@matkhau VARCHAR(30),@quyen NVARCHAR(20),@anhdaidien VARCHAR(50)
as
Begin
			DECLARE @MaUser int 
			SELECT @MaUser =( SELECT COUNT(MaUser) FROM dbo.users)
			SELECT @MaUser = @MaUser + 1
			INSERT INTO dbo.users
			(MaUser,hoten, email , matkhau, quyen, anhdaidien, ngaydangky)
				VALUES  ( 
			  @MaUser, -- MaUser - int
			  @hoten, -- hoten - varchar(50)
			  @email, -- email - varchar(30)
			  @matkhau, -- matkhau - varchar(30)
			  @quyen,  -- quyen - nvarchar(20)
			  @anhdaidien, -- anhdaidien - varchar(50)
			  GETDATE()  -- ngaydangky - datetime
			  )
end

--sp update user admin
alter PROC UserUpdate
@hoten NVARCHAR(50),@email VARCHAR(30),@matkhau VARCHAR(30),@quyen NVARCHAR(20),@anhdaidien VARCHAR(50),@MaUser INT
as
Begin
	UPDATE users
			set
				hoten = @hoten,
				email = @email,
				quyen = @quyen,
				matkhau = @matkhau,
				anhdaidien = @anhdaidien,
				ngaydangky = GETDATE()
				Where MaUser = @MaUser
end

--sp update user client : Client khong cho nguoi dung update quyen
create PROC UserUpdateClient
@hoten NVARCHAR(50),@email VARCHAR(30),@matkhau VARCHAR(30),@anhdaidien VARCHAR(50),@MaUser INT
as
Begin
	UPDATE users
			set
				hoten = @hoten,
				email = @email,
				matkhau = @matkhau,
				anhdaidien = @anhdaidien,
				ngaydangky = GETDATE()
				Where MaUser = @MaUser
end


--sp delete user
alter PROC UserDelete
@MaUser int
as
begin
	Update users set trangthai = N'Ẩn' Where MaUser=@MaUser
end

--xem user theo id
alter PROC UserViewByID
@MaUser int
as
begin
	SELECT MaUser,hoten,email,anhdaidien,quyen,ngaydangky,matkhau FROM users Where MaUser = @MaUser
end

EXECUTE UserViewByID 6


--sp them chu de
Create PROC sp_themchude
@tenchude NTEXT
as
Begin
			DECLARE @MaChuDe int 
			SELECT @MaChuDe =( SELECT COUNT(MaChuDe) FROM dbo.chude)
			SELECT @MaChuDe = @MaChuDe + 1
			INSERT INTO dbo.chude
			(MaChuDe,tenchude)
				VALUES  ( 
			  @MaChuDe, -- MaUser - int
			  @tenchude -- tenchude - ntext
			  )
end

--xem chu de theo id
create PROC ChuDeViewByID
@MaChuDe int
as
begin
	SELECT * FROM chude Where MaChuDe = @MaChuDe
end

--sp delete chu de
create PROC ChuDeDelete
@MaChuDe int
as
begin
	Update chude set trangthai = N'Ẩn' Where MaChuDe=@MaChuDe
end

--sp check xem chu de co chua bai dang khong
alter PROC sp_checkchude
@MaChuDe int
AS
BEGIN
	SELECT count(*) from chude,baidang 
	where chude.MaChuDe = baidang.MaChuDe 
	and chude.MaChuDe = @MaChuDe
END
--update chu de
create PROC ChuDeUpdate
@tenchude NTEXT,@MaChuDe INT
as
Begin
	UPDATE chude
		set
			tenchude = @tenchude
			Where MaChuDe = @MaChuDe
end

--sp them binh luan
alter proc sp_ThemBinhLuan
@MaBaiDang INT,	
@MaUser INT,
@noidung NTEXT
as
BEGIN
	DECLARE @MaBinhLuan int 
	SELECT @MaBinhLuan =( SELECT COUNT(MaBinhLuan) FROM dbo.binhluan)
	SELECT @MaBinhLuan = @MaBinhLuan + 1
	INSERT INTO dbo.binhluan
	        ( MaBinhLuan,
			  MaBaiDang ,
	          MaUser ,
			  soluotthich,
			  ngaybinhluan ,
	          trangthai ,
	          noidung
	        )
	VALUES  ( @MaBinhLuan , -- MaBinhLuan - int
	          @MaBaiDang , -- MaBaiDang - int
	          @MaUser , -- MaUser - int
	          1 , -- soluotthich - int
	          GETDATE() , -- ngaybinhluan - datetime
	          N'Hiện' , -- MaUser - int
	          @noidung  -- noidung - ntext
	        )
END

