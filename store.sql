USE TruongMamNonBinhMinh;

-- Cập nhật quyền hạn của giáo viên chỉ thao tác trên lớp của mình
DELIMITER //
CREATE TRIGGER trg_giaovien_phanquyen
BEFORE UPDATE ON HocSinh
FOR EACH ROW
BEGIN
    IF (SELECT LopID FROM GiaoVien WHERE ID = NEW.GiaoVienID) <> NEW.LopID THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Giáo viên chỉ có thể thao tác trên lớp học của mình';
    END IF;
END;
//
DELIMITER ;

-- Trigger tự động thêm tài khoản từ bảng đăng ký vào bảng người dùng

CREATE TRIGGER trg_duyet_taikhoan
AFTER INSERT ON DangKyTaiKhoan
FOR EACH ROW
BEGIN
    INSERT INTO NguoiDung (HoTen, Email, MatKhau, VaiTro, TruongID)
    VALUES (NEW.HoTen, NEW.Email, NEW.MatKhau, NEW.VaiTro, NEW.TruongID);
END;