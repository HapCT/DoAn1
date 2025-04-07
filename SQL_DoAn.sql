CREATE DATABASE TruongMNBM_DoAn
USE TruongMNBM_DoAn
-- Bảng quản lý người dùng
CREATE TABLE NguoiDung (
    MaNguoiDung INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE,
    MatKhau NVARCHAR(255),
    VaiTro NVARCHAR(20) CHECK (VaiTro IN ('GiaoVien', 'BanGiamHieu', 'NhanVien', 'PhuHuynh')) NOT NULL
);

-- Bảng ban giám hiệu
CREATE TABLE BanGiamHieu (
    MaBanGiamHieu INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiDung INT UNIQUE,  -- Liên kết với bảng NguoiDung
    ChucVu NVARCHAR(100),  -- Chức vụ của thành viên trong ban giám hiệu (Hiệu trưởng, Phó hiệu trưởng, ...)
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung) ON DELETE CASCADE
);

-- Bảng giáo viên
CREATE TABLE GiaoVien (
    MaGiaoVien INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiDung INT UNIQUE,
    ChuyenMon NVARCHAR(100),
    Luong DECIMAL(10,2),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung) ON DELETE CASCADE
);

CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiDung INT UNIQUE,  -- Liên kết với bảng NguoiDung
    ChucVu NVARCHAR(100),    -- Chức vụ (Kế toán, Thủ quỹ, Văn thư, ...)
    Luong DECIMAL(10,2),     -- Lương cơ bản
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung) ON DELETE CASCADE
);

CREATE TABLE LuongNhanVien (
    MaLuong INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiDung INT NOT NULL, -- Liên kết với bảng NguoiDung
    ThangNam DATE NOT NULL,  -- Tháng lương
    LuongCoBan DECIMAL(10,2) NOT NULL, -- Lương cơ bản
    Thuong DECIMAL(10,2) DEFAULT 0,  -- Tiền thưởng (nếu có)
    PhuCap DECIMAL(10,2) DEFAULT 0,  -- Phụ cấp thêm (nếu có)
    KhauTru DECIMAL(10,2) DEFAULT 0,  -- Các khoản khấu trừ
    TongLuong AS (LuongCoBan + Thuong + PhuCap - KhauTru) PERSISTED, -- Cột tính toán
    TrangThai NVARCHAR(20) CHECK (TrangThai IN ('Đã thanh toán', 'Chưa thanh toán')) DEFAULT 'Chưa thanh toán',
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung) ON DELETE CASCADE
);


-- Bảng phụ huynh
CREATE TABLE PhuHuynh (
    MaPhuHuynh INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiDung INT UNIQUE,
    DienThoai NVARCHAR(15),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung) ON DELETE CASCADE
);

-- Bảng lớp học
CREATE TABLE LopHoc (
    MaLop INT PRIMARY KEY IDENTITY(1,1),
    TenLop NVARCHAR(50),
    MaGiaoVien INT,
    FOREIGN KEY (MaGiaoVien) REFERENCES GiaoVien(MaGiaoVien) ON DELETE SET NULL
);

-- Bảng học sinh
CREATE TABLE HocSinh (
    MaHocSinh INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    MaLop INT,
    MaPhuHuynh INT,
    FOREIGN KEY (MaLop) REFERENCES LopHoc(MaLop) ON DELETE SET NULL,
    FOREIGN KEY (MaPhuHuynh) REFERENCES PhuHuynh(MaPhuHuynh) ON DELETE SET NULL
);

-- Bảng điểm danh
CREATE TABLE DiemDanh (
    MaDiemDanh INT PRIMARY KEY IDENTITY(1,1),
    MaHocSinh INT,
    Ngay DATE,
    TrangThai NVARCHAR(20) CHECK (TrangThai IN (N'Có mặt', N'Vắng mặt', N'Nghỉ có phép', N'Nghỉ không phép')),
    FOREIGN KEY (MaHocSinh) REFERENCES HocSinh(MaHocSinh) ON DELETE CASCADE
);

-- Bảng học phí
CREATE TABLE HocPhi (
    MaHocPhi INT PRIMARY KEY IDENTITY(1,1),
    MaHocSinh INT,
    ThangNam DATE,
    SoTien DECIMAL(10,2),
    TrangThai NVARCHAR(20) CHECK (TrangThai IN (N'Đã đóng', N'Chưa đóng')),
    FOREIGN KEY (MaHocSinh) REFERENCES HocSinh(MaHocSinh) ON DELETE CASCADE
);

-- Bảng theo dõi sức khỏe học sinh
CREATE TABLE TheoDoiSucKhoe (
    MaTheoDoi INT PRIMARY KEY IDENTITY(1,1),
    MaHocSinh INT,
    NgayKham DATE,
    ChieuCao DECIMAL(5,2),
    CanNang DECIMAL(5,2),
    TinhTrangSucKhoe NVARCHAR(255),
    GhiChu NVARCHAR(500),
    FOREIGN KEY (MaHocSinh) REFERENCES HocSinh(MaHocSinh) ON DELETE CASCADE
);

-- Bảng đăng ký ăn bán trú
CREATE TABLE DangKyAnBanTru (
    MaDangKy INT PRIMARY KEY IDENTITY(1,1),
    MaHocSinh INT,
    NgayDangKy DATE,
    TrangThai NVARCHAR(20) CHECK (TrangThai IN (N'Đã đăng ký', N'Hủy đăng ký')),
    FOREIGN KEY (MaHocSinh) REFERENCES HocSinh(MaHocSinh) ON DELETE CASCADE
);

CREATE TABLE PhanCongGiaoVien (
    MaPhanCong INT PRIMARY KEY IDENTITY(1,1),
    MaGiaoVien INT NOT NULL,
    MaLop INT NOT NULL,
    NgayBatDau DATE NOT NULL,
    NgayKetThuc DATE NULL, -- Nếu giáo viên vẫn đang dạy thì NULL
    TrangThai NVARCHAR(20) CHECK (TrangThai IN (N'Đang dạy', N'Kết thúc')) DEFAULT N'Đang dạy',
    GhiChu NVARCHAR(255) NULL, -- Ghi lý do nếu có thay đổi
    FOREIGN KEY (MaGiaoVien) REFERENCES GiaoVien(MaGiaoVien) ON DELETE CASCADE,
    FOREIGN KEY (MaLop) REFERENCES LopHoc(MaLop) ON DELETE CASCADE
);


-- Bảng báo cáo thống kê
CREATE TABLE BaoCaoThongKe (
    MaBaoCao INT PRIMARY KEY IDENTITY(1,1),
    LoaiBaoCao NVARCHAR(20) CHECK (LoaiBaoCao IN ('HocPhi', 'DiemDanh', 'SucKhoe', 'AnBanTru')),
    NoiDung NVARCHAR(MAX),
    NgayTao DATETIME DEFAULT GETDATE(),
    MaHocSinh INT NULL,
    MaLop INT NULL,
    FOREIGN KEY (MaHocSinh) REFERENCES HocSinh(MaHocSinh) ON DELETE SET NULL,
    FOREIGN KEY (MaLop) REFERENCES LopHoc(MaLop) ON DELETE SET NULL
);

-- Bảng lịch sử xóa để tra cứu lại dữ liệu bị xóa
CREATE TABLE LichSuXoa (
    MaLichSu INT PRIMARY KEY IDENTITY(1,1),
    BangLienQuan NVARCHAR(50),
    KhoaChinh NVARCHAR(50),
    DuLieuTruocXoa NVARCHAR(MAX),
    NgayXoa DATETIME DEFAULT GETDATE()
);

INSERT INTO NguoiDung (HoTen, Email, MatKhau, VaiTro) VALUES  
-- Ban giám hiệu
(N'Nguyễn Văn A', 'hieutruong@example.com', '123456', 'BanGiamHieu'),  
(N'Trần Thị B', 'phohieutruong@example.com', '123456', 'BanGiamHieu'),  

-- Giáo viên
(N'Phạm Văn C', 'giaovien1@example.com', '123456', 'GiaoVien'),  
(N'Lê Thị D', 'giaovien2@example.com', '123456', 'GiaoVien'),  

-- Nhân viên
(N'Hoàng Văn E', 'ketoan@example.com', '123456', 'NhanVien'),  
(N'Đinh Thị F', 'thuquy@example.com', '123456', 'NhanVien'),  

-- Phụ huynh
(N'Nguyễn Văn G', 'phuhuynh1@example.com', '123456', 'PhuHuynh'),  
(N'Trần Thị H', 'phuhuynh2@example.com', '123456', 'PhuHuynh');  

-- Ban Giám Hiệu  
INSERT INTO BanGiamHieu (MaNguoiDung, ChucVu) VALUES  
((SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'hieutruong@example.com'), N'Hiệu trưởng'),  
((SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'phohieutruong@example.com'), N'Phó hiệu trưởng');  

-- Giáo viên  
INSERT INTO GiaoVien (MaNguoiDung, ChuyenMon) VALUES  
((SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'giaovien1@example.com'), N'Toán'),  
((SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'giaovien2@example.com'), N'Văn');  

-- Nhân viên (Kế toán & Thủ quỹ)  
INSERT INTO NhanVien (MaNguoiDung, ChucVu) VALUES  
((SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'ketoan@example.com'), N'Kế toán'),  
((SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'thuquy@example.com'), N'Thủ quỹ');  

-- Phụ huynh  
INSERT INTO PhuHuynh (MaNguoiDung, DienThoai) VALUES  
((SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'phuhuynh1@example.com'), '0987654321'),  
((SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'phuhuynh2@example.com'), '0976543210');  

SELECT * FROM NguoiDung;  
SELECT * FROM BanGiamHieu;  
SELECT * FROM GiaoVien;  
SELECT * FROM NhanVien;  
SELECT * FROM PhuHuynh;

-- Bảng lớp học
INSERT INTO LopHoc (TenLop, MaGiaoVien) VALUES
(N'Lớp 1A', (SELECT MaGiaoVien FROM GiaoVien WHERE MaNguoiDung = (SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'giaovien1@example.com'))),
(N'Lớp 2B', (SELECT MaGiaoVien FROM GiaoVien WHERE MaNguoiDung = (SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'giaovien2@example.com')));




-- Bảng học sinh
INSERT INTO HocSinh (HoTen, NgaySinh, MaLop, MaPhuHuynh) VALUES
(N'Nguyễn Thị I', '2015-05-15', 
    (SELECT MaLop FROM LopHoc WHERE TenLop = N'Lớp 1A'), 
    (SELECT MaPhuHuynh FROM PhuHuynh WHERE MaNguoiDung = (SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'phuhuynh1@example.com'))),
(N'Phạm Quang J', '2015-06-20', 
    (SELECT MaLop FROM LopHoc WHERE TenLop = N'Lớp 1A'), 
    (SELECT MaPhuHuynh FROM PhuHuynh WHERE MaNguoiDung = (SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'phuhuynh2@example.com'))),
(N'Lê Thanh K', '2015-07-10', 
    (SELECT MaLop FROM LopHoc WHERE TenLop = N'Lớp 2B'), 
    (SELECT MaPhuHuynh FROM PhuHuynh WHERE MaNguoiDung = (SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'phuhuynh1@example.com'))),
(N'Trần Minh L', '2015-08-25', 
    (SELECT MaLop FROM LopHoc WHERE TenLop = N'Lớp 2B'), 
    (SELECT MaPhuHuynh FROM PhuHuynh WHERE MaNguoiDung = (SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'phuhuynh2@example.com')));


-- Bảng điểm danh
INSERT INTO DiemDanh (MaHocSinh, Ngay, TrangThai) VALUES
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Nguyễn Thị I'), '2025-04-01', N'Có mặt'),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Phạm Quang J'), '2025-04-01', N'Vắng mặt'),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Lê Thanh K'), '2025-04-01', N'Nghỉ có phép'),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Trần Minh L'), '2025-04-01', N'Có mặt');
DELETE FROM DiemDanh;

-- Bảng học phí
INSERT INTO HocPhi (MaHocSinh, ThangNam, SoTien, TrangThai) VALUES
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Nguyễn Thị I'), '2025-04-01', 500000, N'Chưa đóng'),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Phạm Quang J'), '2025-04-01', 500000, N'Đã đóng'),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Lê Thanh K'), '2025-04-01', 450000, N'Chưa đóng'),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Trần Minh L'), '2025-04-01', 450000, N'Đã đóng');
DELETE FROM HocPhi;


-- Bảng theo dõi sức khỏe học sinh
INSERT INTO TheoDoiSucKhoe (MaHocSinh, NgayKham, ChieuCao, CanNang, TinhTrangSucKhoe, GhiChu) VALUES
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = 'Nguyễn Thị I'), '2025-03-15', 120.5, 22.0, N'Khỏe mạnh', N''),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = 'Phạm Quang J'), '2025-03-20', 115.0, 20.5, N'Khỏe mạnh', N''),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = 'Lê Thanh K'), '2025-03-18', 125.0, 24.0, N'Khỏe mạnh', N''),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = 'Trần Minh L'), '2025-03-22', 122.0, 23.5, N'Khỏe mạnh', N'');
DELETE FROM TheoDoiSucKhoe;

-- Bảng đăng ký ăn bán trú
INSERT INTO DangKyAnBanTru (MaHocSinh, NgayDangKy, TrangThai) VALUES
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Nguyễn Thị I'), '2025-04-01', N'Đã đăng ký'),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Phạm Quang J'), '2025-04-01', N'Hủy đăng ký'),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Lê Thanh K'), '2025-04-01', N'Đã đăng ký'),
((SELECT MaHocSinh FROM HocSinh WHERE HoTen = N'Trần Minh L'), '2025-04-01', N'Hủy đăng ký');

DELETE FROM DangKyAnBanTru;

INSERT INTO PhanCongGiaoVien (MaGiaoVien, MaLop, NgayBatDau, NgayKetThuc, TrangThai) VALUES
((SELECT TOP 1 MaGiaoVien FROM GiaoVien WHERE MaNguoiDung = (SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'giaovien1@example.com')), 
 (SELECT TOP 1 MaLop FROM LopHoc WHERE TenLop = N'Lớp 1A'), '2025-04-01', NULL, N'Đang dạy'),
((SELECT TOP 1 MaGiaoVien FROM GiaoVien WHERE MaNguoiDung = (SELECT MaNguoiDung FROM NguoiDung WHERE Email = 'giaovien2@example.com')), 
 (SELECT TOP 1 MaLop FROM LopHoc WHERE TenLop = N'Lớp 2B'), '2025-04-01', NULL, N'Đang dạy');





-- Bảng báo cáo thống kê
INSERT INTO BaoCaoThongKe (LoaiBaoCao, NoiDung, NgayTao, MaHocSinh, MaLop) VALUES
('HocPhi', N'Thống kê học phí tháng 04/2025', '2025-04-01', NULL, (SELECT TOP 1 MaLop FROM LopHoc WHERE TenLop = N'Lớp 1A')),
('DiemDanh', N'Thống kê điểm danh tháng 04/2025', '2025-04-01', NULL, (SELECT TOP 1 MaLop FROM LopHoc WHERE TenLop = N'Lớp 2B')),
('SucKhoe', N'Thống kê sức khỏe tháng 03/2025', '2025-03-30', NULL, (SELECT TOP 1 MaLop FROM LopHoc WHERE TenLop = N'Lớp 1A')),
('AnBanTru', N'Thống kê ăn bán trú tháng 04/2025', '2025-04-01', NULL, (SELECT TOP 1 MaLop FROM LopHoc WHERE TenLop = N'Lớp 2B'));

SELECT * 
FROM ThongTinConCuaPhuHuynh
WHERE MaPhuHuynh IN (
    SELECT MaPhuHuynh 
    FROM PhuHuynh 
    WHERE MaNguoiDung = (
        SELECT MaNguoiDung 
        FROM NguoiDung 
        WHERE Email = 'phuhuynh1@example.com'
    )
);

