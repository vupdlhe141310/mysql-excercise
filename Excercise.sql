
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
INSERT INTO `quanlysv`.`khoa` (`MaKhoa`, `TenKhoa`, `DiaDiem`, `SDT`) VALUES ('K01', 'CNTT', 'H?? N???i', '0123456789');
INSERT INTO `quanlysv`.`khoa` (`MaKhoa`, `TenKhoa`, `DiaDiem`, `SDT`) VALUES ('K02', 'ATTT', 'H?? N???i', '0123456788');
-- -----------------------------------------------------
INSERT INTO `quanlysv`.`lop` (`MaLop`, `TenLop`, `SiSo`, `MaKhoa`) VALUES ('L01', 'PC1401', '30', 'K01');
INSERT INTO `quanlysv`.`lop` (`MaLop`, `TenLop`, `SiSo`, `MaKhoa`) VALUES ('L02', 'PC1402', '30', 'K01');
INSERT INTO `quanlysv`.`lop` (`MaLop`, `TenLop`, `SiSo`, `MaKhoa`) VALUES ('L03', 'PC1403', '30', 'K02');
INSERT INTO `quanlysv`.`lop` (`MaLop`, `TenLop`, `SiSo`, `MaKhoa`) VALUES ('L04', 'PC1404', '30', 'K02');
INSERT INTO `quanlysv`.`lop` (`MaLop`, `TenLop`, `SiSo`, `MaKhoa`) VALUES ('L05', 'K10_KHMT1', '30', 'K01');
-- -----------------------------------------------------
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01001', 'Nguy???n V??n', 'A', '2000-01-01', 'Nam', 'H?? N???i', 'L01');
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01002', 'Nguy???n Th???', 'B', '2000-01-01', 'N???', 'H?? N???i', 'L05');
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01003', 'Nguy???n V??n', 'C', '2000-01-01', 'Nam', 'H?? N???i', 'L02');
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01004', 'Nguy???n V??n', 'D', '2000-01-01', 'Nam', 'H?? N???i', 'L03');
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01005', 'Nguy???n Th???', 'E', '2000-01-01', 'N???', 'H?? N???i', 'L04');
INSERT INTO `quanlysv`.`sinhvien` (`MaSV`, `HoDem`, `Ten`, `NgaySinh`, `GioiTinh`, `Tinh`, `MaLop`) VALUES ('HE01006', 'Nguy???n V??n', 'F', '2000-01-01', 'Nam', 'H?? N???i', 'L05');
-- -----------------------------------------------------
INSERT INTO `quanlysv`.`monhoc` (`MaMH`, `TenMH`, `SoTC`) VALUES ('PRO101', 'L???p tr??nh h?????ng ?????i t?????ng', '03');
INSERT INTO `quanlysv`.`monhoc` (`MaMH`, `TenMH`, `SoTC`) VALUES ('PRF101', 'L???p tr??nh c??n b???n', '3');
-- -----------------------------------------------------
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01001', 'PRO101', '8.0');
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01001', 'PRF101', '7');
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01002', 'PRO101', '8.5');
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01003', 'PRF101', '9.2');
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01004', 'PRO101', '7.8');
INSERT INTO `quanlysv`.`ketqua` (`MaSV`, `MaMH`, `KetQua`) VALUES ('HE01005', 'PRF101', '6.9');
-- -----------------------------------------------------
--	Vi???t c??u truy v???n l???y ra m?? sinh vi??n, h??? ?????m v?? t??n c???a c??c sinh vi??n trong b???ng SINHVIEN
SELECT MaSV, HoDem, Ten
FROM SINHVIEN;
--	Vi???t c??u truy v???n l???y ra m?? sinh vi??n, h??? ?????m v?? t??n c???a c??c sinh vi??n n???
SELECT MaSV, HoDem, Ten
FROM SINHVIEN
WHERE GioiTinh = "N???";
--	Vi???t c??u truy v???n l???y ra m?? sinh vi??n , h??? ?????m v?? t??n c???a c??c sinh vi??n n??? h???c l???p K10_KHMT1
SELECT MaSV, HoDem, Ten
FROM SINHVIEN,LOP
WHERE SINHVIEN.MaLop = LOP.MaLop and GioiTinh = "N???" and TenLop = "K10_KHMT1";

--	Vi???t c??u truy v???n l???y ra danh s??ch c??c m??n h???c c?? t??? 2 ?????n 5 t??n ch???
SELECT * 
FROM MONHOC 
WHERE SoTC BETWEEN 2 and 5;

--	Vi???t c??u truy v???n l???y danh s??ch  sinh vi??n c?? h??? ?????m b???t ?????u l?? ???B??i???
SELECT *
FROM SINHVIEN 
WHERE HoDem LIKE  "B??i%";

--	Vi???t c??u truy v???n Hi???n th??? th??ng tin v??? c??c sinh vi??n v???i c??c k???t qu??? h???c t???p c???a h???. Th??ng tin hi???n th??? c???n (M?? sinh vi??n, H??? t??n, Ng??y sinh, Gi???i t??nh, T??n m??n h???c, K???t qu???)
SELECT SINHVIEN.MaSV, Hodem, Ten, NgaySinh, GioiTinh, TenMH, KetQua
FROM SINHVIEN, KETQUA, MONHOC
WHERE SINHVIEN.MaSV = KETQUA.MaSV AND KETQUA.MaMH = MONHOC.MaMH;

--	Vi???t c??u truy v???n l???y ra c??c sinh vi??n n??? h???c l???p K10_KHMT1 ???????c s???p x???p v???n alphabet c???a h??? v?? t??n
SELECT MaSV, HoDem, Ten
FROM SINHVIEN,LOP
WHERE SINHVIEN.MaLop = LOP.MaLop and GioiTinh = "N???" and TenLop = "K10_KHMT1"
ORDER BY Ten, HoDem;

--	Vi???t c??u truy v???n in ra danh s??ch c??c l???p v?? s??? sinh vi??n trong m???i l???p t??? b???ng SINHVIEN
SELECT SINHVIEN.MaLop, LOP.TenLop, COUNT(SINHVIEN.MaSV) AS 'S??? sinh vi??n'
FROM SINHVIEN, LOP
WHERE SINHVIEN.MaLop = LOP.MaLop
GROUP BY SINHVIEN.MaLop, LOP.TenLop;

--	Vi???t c??u truy v???n in ra danh s??ch c??c l???p c?? s??? sinh vi??n > 2 t??? b???ng SINHVIEN
SELECT SINHVIEN.MaLop, LOP.TenLop, COUNT(SINHVIEN.MaSV) AS 'S??? sinh vi??n'
FROM SINHVIEN, LOP
WHERE SINHVIEN.MaLop = LOP.MaLop
GROUP BY SINHVIEN.MaLop, LOP.TenLop
HAVING  COUNT(SINHVIEN.MaSV)>=2

--	Vi???t c??u truy v???n hi???n th??? th??ng tin v??? c??c sinh vi??n v???i c??c k???t qu??? h???c t???p c???a h???. Khi hi???n th??? c???t KetQua ?????i t??n th??nh c???t DiemTB.
SELECT SINHVIEN.MaSV, HoDem, Ten, NgaySinh, GioiTinh, TenMH, KetQua AS DiemTB
FROM SINHVIEN, KETQUA, MONHOC 
WHERE  SINHVIEN.MaSV = KETQUA.MaSV AND KETQUA.MaMH = MONHOC.MaMH;

--	Vi???t c??u truy v???n in ra danh s??ch c??c l???p trong b???ng SINHVIEN
SELECT DISTINCT MaLop
FROM SINHVIEN;

--	C???p nh???t l???i h??? ?????m cho sinh vi??n th??nh ???Nguy???n??? v???i nh???ng sinh vi??n ??ang c?? h??? ?????m l?? ???B??i???
UPDATE sinhvien SET HoDem = 'Nguy???n'  WHERE HoDem =  'B??i';
