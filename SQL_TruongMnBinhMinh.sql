CREATE DATABASE TruongMnBinhMinh;
USE TruongMnBinhMinh;
GO

-- 1. Bảng Trường
CREATE TABLE Truong (
    MaTruong INT PRIMARY KEY IDENTITY(1,1),
    TenTruong NVARCHAR(255) NOT NULL,
    DiaChi NVARCHAR(255),
    SoDienThoai VARCHAR(10)
);

-- 2. Bảng Lớp (Thêm trạng thái để không cần xóa lớp)
CREATE TABLE Lop (
    MaLop INT IDENTITY(1,1) PRIMARY KEY,
    TenLop NVARCHAR(100) NOT NULL,
    DoTuoi INT CHECK (DoTuoi BETWEEN 3 AND 5),
    MaTruong INT NOT NULL,
    TrangThai NVARCHAR(50) DEFAULT N'Đang hoạt động' CHECK (TrangThai IN (N'Đang hoạt động', N'Đã hoàn thành')),
    FOREIGN KEY (MaTruong) REFERENCES Truong(MaTruong) ON DELETE CASCADE
);


-- 3. Bảng Giáo Viên
CREATE TABLE GiaoVien (
    MaGV INT IDENTITY(1,1) PRIMARY KEY,
    HoTen NVARCHAR(90) NOT NULL,
    NgaySinh DATE,
    GioiTinh NVARCHAR(10) CHECK (GioiTinh IN (N'Nam', N'Nữ')) NOT NULL,
    SDT VARCHAR(10),
    Email VARCHAR(100),
    MaTruong INT NOT NULL,
    FOREIGN KEY (MaTruong) REFERENCES Truong(MaTruong) ON DELETE CASCADE
);

-- 4. Bảng Giáo Viên - Lớp (Cho phép giáo viên dạy nhiều lớp)
CREATE TABLE GiaoVien_Lop (
    MaGV INT NOT NULL,
    MaLop INT NOT NULL,  
    PRIMARY KEY (MaGV, MaLop),
    FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV) ON DELETE CASCADE,
    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop) ON DELETE NO ACTION
);


-- 5. Bảng Học Sinh
CREATE TABLE HocSinh (
    MaHS INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(255) NOT NULL,
    NgaySinh DATE NOT NULL,
    GioiTinh NVARCHAR(10) CHECK (GioiTinh IN (N'Nam', N'Nữ')) NOT NULL,
    MaLop INT,
    MaTruong INT NOT NULL,  -- Giữ nguyên NOT NULL
    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop) ON DELETE SET NULL,
    FOREIGN KEY (MaTruong) REFERENCES Truong(MaTruong) ON DELETE NO ACTION
);

-- 6. Bảng Điểm Danh
CREATE TABLE DiemDanh (
    MaDiemDanh INT PRIMARY KEY IDENTITY(1,1),
    MaHS INT NOT NULL,
    NgayDiemDanh DATE NOT NULL,
    TrangThai NVARCHAR(50) CHECK (TrangThai IN (N'Có mặt', N'Vắng', N'Nghỉ có phép', N'Nghỉ không phép')) NOT NULL,
    DangKyAnBanTru BIT DEFAULT 0,
    FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS) ON DELETE CASCADE
);

-- 7. Bảng Học Phí
CREATE TABLE HocPhi (
    MaHocPhi INT PRIMARY KEY IDENTITY(1,1),
    MaHS INT NOT NULL,
    ThangNam DATE NOT NULL,
    TienHoc DECIMAL(10,2) NOT NULL,
    TienAn DECIMAL(10,2) NOT NULL,
    TienHoatDong DECIMAL(10,2) NOT NULL,
    TongTien AS (TienHoc + TienAn + TienHoatDong) PERSISTED,
    TrangThaiThanhToan NVARCHAR(20) CHECK (TrangThaiThanhToan IN (N'Chưa thanh toán', N'Đã thanh toán')) DEFAULT N'Chưa thanh toán',
    FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS) ON DELETE CASCADE
);

-- 8. Bảng Báo Cáo Tài Chính
CREATE TABLE BaoCaoTaiChinh (
    MaBaoCao INT PRIMARY KEY IDENTITY(1,1),
    ThangNam DATE NOT NULL,
    TongTienHoc DECIMAL(10,2) NOT NULL,
    TongTienAn DECIMAL(10,2) NOT NULL,
    TongTienHoatDong DECIMAL(10,2) NOT NULL,
    TongChiPhi DECIMAL(10,2) NOT NULL,
    LoiNhuan AS (TongTienHoc + TongTienAn + TongTienHoatDong - TongChiPhi) PERSISTED,
    MaTruong INT NOT NULL,
    FOREIGN KEY (MaTruong) REFERENCES Truong(MaTruong) ON DELETE CASCADE
);

-- 9. Bảng Lương Giáo Viên
CREATE TABLE LuongGiaoVien (
    MaLuong INT PRIMARY KEY IDENTITY(1,1),
    MaGV INT NOT NULL,
    ThangNam DATE NOT NULL,
    LuongCoBan DECIMAL(10,2) NOT NULL,
    PhuCap DECIMAL(10,2) NOT NULL,
    TongLuong AS (LuongCoBan + PhuCap) PERSISTED,
    FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV) ON DELETE CASCADE
);

-- 10. Bảng Phụ Huynh
CREATE TABLE PhuHuynh (
    MaPhuHuynh INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(100) NOT NULL,
    SDT VARCHAR(15) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DiaChi NVARCHAR(255),
    MatKhau VARCHAR(255) NOT NULL,
    MaHS INT UNIQUE,
    FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS) ON DELETE CASCADE
);

-- 11. Bảng Tài Khoản (Quản lý đăng nhập và phân quyền)
CREATE TABLE TaiKhoan (
    MaTK INT PRIMARY KEY IDENTITY(1,1),
    TenDangNhap NVARCHAR(90) UNIQUE NOT NULL,
    MatKhau VARCHAR(255) NOT NULL,
    LoaiTaiKhoan NVARCHAR(20) CHECK (LoaiTaiKhoan IN (N'Hiệu Trưởng', N'Giáo Viên', N'Phụ Huynh')) NOT NULL,
    GiaoVienID INT NULL,
    PhuHuynhID INT NULL,
    MaTruong INT NOT NULL,
    FOREIGN KEY (GiaoVienID) REFERENCES GiaoVien(MaGV) ON DELETE SET NULL,
    FOREIGN KEY (PhuHuynhID) REFERENCES PhuHuynh(MaPhuHuynh) ON DELETE SET NULL,
    FOREIGN KEY (MaTruong) REFERENCES Truong(MaTruong) ON DELETE NO ACTION -- Ngăn chặn xóa trường nếu còn tài khoản
);


-- 12. Bảng Lớp Lịch Sử (Lưu trữ lớp học đã xóa nếu cần)
CREATE TABLE Lop_LichSu (
    MaLop INT PRIMARY KEY,
    TenLop NVARCHAR(100) NOT NULL,
    DoTuoi INT,
    MaTruong INT,
    NgayKetThuc DATE DEFAULT GETDATE()
);
