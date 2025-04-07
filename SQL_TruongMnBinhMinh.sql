CREATE DATABASE TruongMamNonBinhMinh;
USE TruongMamNonBinhMinh;

-- Bảng Trường Học
CREATE TABLE TruongHoc (
    TruongID INT IDENTITY(1,1) PRIMARY KEY,
    TenTruong VARCHAR(255) NOT NULL
);


-- Bảng Người Dùng
CREATE TABLE NguoiDung (
    NguoiDungID INT IDENTITY(1,1) PRIMARY KEY,
    HoTen VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    MatKhau VARCHAR(255),
    TruongID INT,
    Vaitro NVARCHAR(5) CHECK(Vaitro IN ('Ban Giám Hiệu', 'Giáo viên', 'Phụ huynh', 'Nhân viên')),
    FOREIGN KEY (TruongID) REFERENCES TruongHoc(TruongID) ON DELETE CASCADE
);
--Bảng Ban Giám Hiệu
CREATE TABLE BanGiamHieu (
    BanGiamHieuID INT IDENTITY(1,1) PRIMARY KEY,
    NguoiDungID INT, -- Liên kết với bảng NguoiDung
    ChucVu VARCHAR(100) CHECK(ChucVu IN('Hiệu trưởng', 'Phó hiệu trưởng')), -- Ví dụ: Hiệu trưởng, Phó hiệu trưởng
    SoDienThoai VARCHAR(15),
    DiaChi VARCHAR(255),
    NgaySinh DATE,
    GioiTinh NVARCHAR(5) CHECK(GioiTinh IN ('Nam', 'Nữ', 'Khác')),
    FOREIGN KEY (NguoiDungID) REFERENCES NguoiDung(NguoiDungID) ON DELETE CASCADE
);


-- Bảng Giáo Viên
CREATE TABLE GiaoVien (
    GiaoVienID INT IDENTITY(1,1) PRIMARY KEY,
    NguoiDungID INT UNIQUE,
    TruongID INT,
    ChuyenMon VARCHAR(255),
    KinhNghiem INT,
    SoDienThoai VARCHAR(15),
    DiaChi VARCHAR(255),
    NgaySinh DATE,
    GioiTinh NVARCHAR(5) CHECK(GioiTinh IN ('Nam', 'Nữ', 'Khác')),
    FOREIGN KEY (NguoiDungID) REFERENCES NguoiDung(NguoiDungID) ON DELETE NO ACTION,
    FOREIGN KEY (TruongID) REFERENCES TruongHoc(TruongID) ON DELETE NO ACTION
);


-- Bảng Nhân Viên
CREATE TABLE NhanVien (
    NhanVienID INT IDENTITY(1,1) PRIMARY KEY,
    NguoiDungID INT UNIQUE,
    TruongID INT,
    ChucVu VARCHAR(255),
    Luong DECIMAL(10,2),
    SoDienThoai VARCHAR(15),
    DiaChi VARCHAR(255),
    NgaySinh DATE,
    GioiTinh NVARCHAR(5) CHECK(GioiTinh IN ('Nam', 'Nữ', 'Khác')),
    FOREIGN KEY (NguoiDungID) REFERENCES NguoiDung(NguoiDungID) ON DELETE NO ACTION,
    FOREIGN KEY (TruongID) REFERENCES TruongHoc(TruongID) ON DELETE NO ACTION
);

-- Bảng Lớp Học
CREATE TABLE LopHoc (
    LopHocID INT IDENTITY(1,1) PRIMARY KEY,
    TenLop VARCHAR(50) UNIQUE NOT NULL,
	SiSo INT,
    GiaoVienID INT,
    TruongID INT,
    FOREIGN KEY (GiaoVienID) REFERENCES GiaoVien(GiaoVienID) ON DELETE SET NULL,
    FOREIGN KEY (TruongID) REFERENCES TruongHoc(TruongID) ON DELETE CASCADE
);


-- Bảng Học Sinh

CREATE TABLE HocSinh (
    HocSinhID INT IDENTITY(1,1) PRIMARY KEY,
    HoTen VARCHAR(100),
    NgaySinh DATE,
    LopHocID INT,
    PhuHuynhID INT,
    TruongID INT,
    TrangThaiDiemDanh NVARCHAR(50) CHECK (TrangThaiDiemDanh IN ('Có mặt', 'Vắng mặt', 'Nghỉ có phép')) DEFAULT 'Có mặt',
    DangKyAnBanTru BIT DEFAULT 0, -- Sử dụng 0 thay vì FALSE
    -- Sửa các ràng buộc khóa ngoại
    FOREIGN KEY (LopHocID) REFERENCES LopHoc(LopHocID) ON DELETE CASCADE,  -- Xóa học sinh khi lớp học bị xóa
    FOREIGN KEY (PhuHuynhID) REFERENCES NguoiDung(NguoiDungID) ON DELETE NO ACTION,  -- Thay đổi thành NO ACTION thay vì SET NULL
    FOREIGN KEY (TruongID) REFERENCES TruongHoc(TruongID) ON DELETE NO ACTION -- Khi trường bị xóa, không làm gì với học sinh
);

--Bảng phụ huynh
CREATE TABLE PhuHuynh (
    PhuHuynhID INT IDENTITY(1,1) PRIMARY KEY,
    NguoiDungID INT,
    SoDienThoai VARCHAR(15),
    DiaChi VARCHAR(255),
    FOREIGN KEY (NguoiDungID) REFERENCES NguoiDung(NguoiDungID) ON DELETE CASCADE
);







-- Bảng Lịch Sử Điểm Danh
CREATE TABLE LichSuDiemDanh (
    LichSuDiemDanhID INT IDENTITY(1,1) PRIMARY KEY,
    HocSinhID INT,
    Ngay DATE DEFAULT GETDATE(),  -- Thay CURRENT_DATE bằng GETDATE()
    TrangThaiDiemDanh NVARCHAR(50) CHECK (TrangThaiDiemDanh IN ('Có mặt', 'Vắng mặt', 'Nghỉ có phép')) DEFAULT 'Có mặt',
    FOREIGN KEY (HocSinhID) REFERENCES HocSinh(HocSinhID) ON DELETE CASCADE
);


-- Bảng Học Phí
CREATE TABLE HocPhi (
    HocPhiID INT IDENTITY(1,1) PRIMARY KEY,
    HocSinhID INT,
    SoTien DECIMAL(10,2),
    NoiDung VARCHAR(255),
    NgayDong DATE,
    AnBanTru BIT DEFAULT 0,
    FOREIGN KEY (HocSinhID) REFERENCES HocSinh(HocSinhID) ON DELETE CASCADE
);

-- Bảng Lương Giáo Viên
CREATE TABLE LuongGiaoVien (
    LuongGiaoVienID INT IDENTITY(1,1) PRIMARY KEY,
    GiaoVienID INT,
    ThangNam DATE,
    SoTien DECIMAL(10,2),
    FOREIGN KEY (GiaoVienID) REFERENCES GiaoVien(GiaoVienID) ON DELETE CASCADE
);

-- Bảng Chi Phí Trường
CREATE TABLE ChiPhiTruong (
    ChiPhiTruongID INT IDENTITY(1,1) PRIMARY KEY,
    TruongID INT,
    Ngay DATE,
    NoiDung VARCHAR(255),
    SoTien DECIMAL(10,2),
    FOREIGN KEY (TruongID) REFERENCES TruongHoc(TruongID) ON DELETE CASCADE
);

-- Bảng Thống Kê Tài Chính
CREATE TABLE ThongKeTaiChinh (
    ThongKeTaiChinhID INT IDENTITY(1,1) PRIMARY KEY,
    TruongID INT,
    Ngay DATE,
    ThuNhap DECIMAL(10,2),
    ChiPhi DECIMAL(10,2),
    LoiNhuan DECIMAL(10,2),
    FOREIGN KEY (TruongID) REFERENCES TruongHoc(TruongID) ON DELETE CASCADE
);

-- Bảng Lưu Thông Tin Đã Xóa
CREATE TABLE DuLieuDaXoa (
    DuLieuDaXoaID INT IDENTITY(1,1) PRIMARY KEY,
    TruongID INT,
    NguoiDungID INT,
    HoTen VARCHAR(100),
    NgaySinh DATE NULL,
    ChuyenMon VARCHAR(255) NULL,
    KinhNghiem INT NULL,
    SoDienThoai VARCHAR(15) NULL,
    DiaChi VARCHAR(255) NULL,
    GioiTinh NVARCHAR(5) CHECK(GioiTinh IN ('Nam', 'Nữ', 'Khác')),
    LopID INT NULL,
    NgayXoa DATETIME DEFAULT GETDATE(),  -- Thay đổi TIMESTAMP thành DATETIME và dùng GETDATE()
    FOREIGN KEY (NguoiDungID) REFERENCES NguoiDung(NguoiDungID),
    FOREIGN KEY (TruongID) REFERENCES TruongHoc(TruongID) ON DELETE CASCADE
);



