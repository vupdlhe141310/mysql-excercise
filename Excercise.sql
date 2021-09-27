
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema QuanLySV
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema QuanLySV
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `QuanLySV` DEFAULT CHARACTER SET utf8 ;
USE `QuanLySV` ;

-- -----------------------------------------------------
-- Table `QuanLySV`.`KHOA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuanLySV`.`KHOA` (
  `MaKhoa` CHAR(8) NOT NULL,
  `TenKhoa` VARCHAR(50) NOT NULL,
  `DiaDiem` VARCHAR(100) NOT NULL,
  `SDT` VARCHAR(11) NULL,
  PRIMARY KEY (`MaKhoa`),
  UNIQUE INDEX `SDT_UNIQUE` (`SDT` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuanLySV`.`LOP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuanLySV`.`LOP` (
  `MaLop` CHAR(8) NOT NULL,
  `TenLop` VARCHAR(30) NOT NULL,
  `SiSo` SMALLINT(6) NULL,
  `MaKhoa` CHAR(8) NOT NULL,
  PRIMARY KEY (`MaLop`, `MaKhoa`),
  INDEX `fk_LOP_KHOA1_idx` (`MaKhoa` ASC) VISIBLE,
  CONSTRAINT `fk_LOP_KHOA1`
    FOREIGN KEY (`MaKhoa`)
    REFERENCES `QuanLySV`.`KHOA` (`MaKhoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuanLySV`.`SINHVIEN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuanLySV`.`SINHVIEN` (
  `MaSV` CHAR(8) NOT NULL,
  `HoDem` VARCHAR(30) NOT NULL,
  `Ten` VARCHAR(15) NOT NULL,
  `NgaySinh` DATETIME NOT NULL,
  `GioiTinh` VARCHAR(3) NULL,
  `Tinh` VARCHAR(30) NULL,
  `MaLop` CHAR(8) NOT NULL,
  PRIMARY KEY (`MaSV`, `MaLop`),
  INDEX `fk_SINHVIEN_LOP1_idx` (`MaLop` ASC) VISIBLE,
  CONSTRAINT `fk_SINHVIEN_LOP1`
    FOREIGN KEY (`MaLop`)
    REFERENCES `QuanLySV`.`LOP` (`MaLop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuanLySV`.`MONHOC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuanLySV`.`MONHOC` (
  `MaMH` CHAR(8) NOT NULL,
  `TenMH` VARCHAR(30) NOT NULL,
  `SoTC` TINYINT(4) NOT NULL,
  `DieuKien` VARCHAR(50) NULL,
  PRIMARY KEY (`MaMH`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuanLySV`.`KETQUA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuanLySV`.`KETQUA` (
  `MaSV` CHAR(8) NOT NULL,
  `MaMH` CHAR(8) NOT NULL,
  `KetQua` FLOAT(4,2) NULL,
  PRIMARY KEY (`MaSV`, `MaMH`),
  INDEX `fk_KETQUA_MONHOC1_idx` (`MaMH` ASC) VISIBLE,
  INDEX `fk_KETQUA_SINHVIEN1_idx` (`MaSV` ASC) VISIBLE,
  CONSTRAINT `fk_KETQUA_MONHOC1`
    FOREIGN KEY (`MaMH`)
    REFERENCES `QuanLySV`.`MONHOC` (`MaMH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_KETQUA_SINHVIEN1`
    FOREIGN KEY (`MaSV`)
    REFERENCES `QuanLySV`.`SINHVIEN` (`MaSV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Insert Data
-- -----------------------------------------------------
INSERT INTO `quanlysv`.`khoa` (`MaKhoa`, `TenKhoa`, `DiaDiem`, `SDT`) VALUES ('K01', 'CNTT', 'Hà Nội', '0123456789');
INSERT INTO `quanlysv`.`khoa` (`MaKhoa`, `TenKhoa`, `DiaDiem`, `SDT`) VALUES ('K02', 'ATTT', 'Hà Nội', '0123456788');
-- -----------------------------------------------------
INSERT INTO `quanlysv`.`lop` (`MaLop`, `TenLop`, `SiSo`, `MaKhoa`) VALUES ('L01', 'PC1401', '30', 'K01');
INSERT INTO `quanlysv`.`lop` (`MaLop`, `TenLop`, `SiSo`, `MaKhoa`) VALUES ('L02', 'PC1402', '30', 'K01');
INSERT INTO `quanlysv`.`lop` (`MaLop`, `TenLop`, `SiSo`, `MaKhoa`) VALUES ('L03', 'PC1403', '30', 'K02');
INSERT INTO `quanlysv`.`lop` (`MaLop`, `TenLop`, `SiSo`, `MaKhoa`) VALUES ('L04', 'PC1404', '30', 'K02');
INSERT INTO `quanlysv`.`lop` (`MaLop`, `TenLop`, `SiSo`, `MaKhoa`) VALUES ('L05', 'K10_KHMT1', '30', 'K01');
-- -----------------------------------------------------
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01001', 'Nguyễn Văn', 'A', '2000-01-01', 'Nam', 'Hà Nội', 'L01');
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01002', 'Nguyễn Thị', 'B', '2000-01-01', 'Nữ', 'Hà Nội', 'L05');
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01003', 'Nguyễn Văn', 'C', '2000-01-01', 'Nam', 'Hà Nội', 'L02');
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01004', 'Nguyễn Văn', 'D', '2000-01-01', 'Nam', 'Hà Nội', 'L03');
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01005', 'Nguyễn Thị', 'E', '2000-01-01', 'Nữ', 'Hà Nội', 'L04');
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01006', 'Nguyễn Văn', 'F', '2000-01-01', 'Nam', 'Hà Nội', 'L05');
-- -----------------------------------------------------
INSERT INTO `quanlysv`.`monhoc` (`MaMH`, `TenMH`, `SoTC`) VALUES ('PRO101', 'Lập trình hướng đối tượng', '03');
INSERT INTO `quanlysv`.`monhoc` (`MaMH`, `TenMH`, `SoTC`) VALUES ('PRF101', 'Lập trình căn bản', '3');
-- -----------------------------------------------------
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01001', 'PRO101', '8.0');
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01001', 'PRF101', '7');
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01002', 'PRO101', '8.5');
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01003', 'PRF101', '9.2');
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01004', 'PRO101', '7.8');
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01005', 'PRF101', '6.9');
-- -----------------------------------------------------
--	Viết câu truy vấn lấy ra mã sinh viên, họ đệm và tên của các sinh viên trong bảng SINHVIEN
SELECT MaSV, HoDem, Ten
FROM SINHVIEN;
--	Viết câu truy vấn lấy ra mã sinh viên, họ đệm và tên của các sinh viên nữ
SELECT MaSV, HoDem, Ten
FROM SINHVIEN
WHERE GioiTinh = "Nữ";
--	Viết câu truy vấn lấy ra mã sinh viên , họ đệm và tên của các sinh viên nữ học lớp K10_KHMT1
SELECT MaSV, HoDem, Ten
FROM SINHVIEN,LOP
WHERE SINHVIEN.MaLop = LOP.MaLop and GioiTinh = "Nữ" and TenLop = "K10_KHMT1";

--	Viết câu truy vấn lấy ra danh sách các môn học có từ 2 đến 5 tín chỉ
SELECT * 
FROM MONHOC 
WHERE SoTC BETWEEN 2 and 5;

--	Viết câu truy vấn lấy danh sách  sinh viên có họ đệm bắt đầu là “Bùi”
SELECT *
FROM SINHVIEN 
WHERE HoDem LIKE  "Bùi%";

--	Viết câu truy vấn Hiển thị thông tin về các sinh viên với các kết quả học tập của họ. Thông tin hiển thị cần (Mã sinh viên, Họ tên, Ngày sinh, Giới tính, Tên môn học, Kết quả)
SELECT SINHVIEN.MaSV, Hodem, Ten, NgaySinh, GioiTinh, TenMH, KetQua
FROM SINHVIEN, KETQUA, MONHOC
WHERE SINHVIEN.MaSV = KETQUA.MaSV AND KETQUA.MaMH = MONHOC.MaMH;

--	Viết câu truy vấn lấy ra các sinh viên nữ học lớp K10_KHMT1 được sắp xếp vần alphabet của họ và tên
SELECT MaSV, HoDem, Ten
FROM SINHVIEN,LOP
WHERE SINHVIEN.MaLop = LOP.MaLop and GioiTinh = "Nữ" and TenLop = "K10_KHMT1"
ORDER BY Ten, HoDem;

--	Viết câu truy vấn in ra danh sách các lớp và số sinh viên trong mỗi lớp từ bảng SINHVIEN
SELECT SINHVIEN.MaLop, LOP.TenLop, COUNT(SINHVIEN.MaSV) AS 'Số sinh viên'
FROM SINHVIEN, LOP
WHERE SINHVIEN.MaLop = LOP.MaLop
GROUP BY SINHVIEN.MaLop, LOP.TenLop;

--	Viết câu truy vấn in ra danh sách các lớp có số sinh viên > 2 từ bảng SINHVIEN
SELECT SINHVIEN.MaLop, LOP.TenLop, COUNT(SINHVIEN.MaSV) AS 'Số sinh viên'
FROM SINHVIEN, LOP
WHERE SINHVIEN.MaLop = LOP.MaLop
GROUP BY SINHVIEN.MaLop, LOP.TenLop
HAVING  COUNT(SINHVIEN.MaSV)>=2

--	Viết câu truy vấn hiển thị thông tin về các sinh viên với các kết quả học tập của họ. Khi hiển thị cột KetQua đổi tên thành cột DiemTB.
SELECT SINHVIEN.MaSV, HoDem, Ten, NgaySinh, GioiTinh, TenMH, KetQua AS DiemTB
FROM SINHVIEN, KETQUA, MONHOC 
WHERE  SINHVIEN.MaSV = KETQUA.MaSV AND KETQUA.MaMH = MONHOC.MaMH;

--	Viết câu truy vấn in ra danh sách các lớp trong bảng SINHVIEN
SELECT DISTINCT MaLop
FROM SINHVIEN;

--	Cập nhật lại họ đệm cho sinh viên thành “Nguyễn” với những sinh viên đang có họ đệm là “Bùi”
UPDATE sinhvien SET HoDem = 'Nguyễn'  WHERE HoDem =  'Bùi';
