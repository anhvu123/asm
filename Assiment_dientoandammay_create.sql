-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-07-26 15:41:39.321

-- tables
-- Table: HoaDon_CT
CREATE TABLE HoaDon_CT (
    SoLuong int  NOT NULL,
    MaHD varchar(10)  NOT NULL,
    MaSP int  NOT NULL,
    CONSTRAINT HoaDon_CT_pk PRIMARY KEY  (MaHD,MaSP)
);

-- Table: Hoa_Don
CREATE TABLE Hoa_Don (
    MaHD varchar(10)  NOT NULL,
    NgayLapHD Date  NOT NULL,
    TenCongTy varchar(50)  NOT NULL,
    MaKH varchar(10)  NOT NULL,
    CONSTRAINT Hoa_Don_pk PRIMARY KEY  (MaHD)
);

-- Table: Khach_Hang
CREATE TABLE Khach_Hang (
    Ma_KH varchar(10)  NOT NULL,
    HoTen varchar(50)  NOT NULL,
    DiaChi varchar(100)  NOT NULL,
    SoDienThoai int  NOT NULL,
    Email varchar(50)  NOT NULL,
    CONSTRAINT Khach_Hang_pk PRIMARY KEY  (Ma_KH)
);

-- Table: Loai_SP
CREATE TABLE Loai_SP (
    MaLoai_SP varchar(10)  NOT NULL,
    TenLoaiSP varchar(40)  NOT NULL,
    CONSTRAINT Loai_SP_pk PRIMARY KEY  (MaLoai_SP)
);

-- Table: San_Pham
CREATE TABLE San_Pham (
    MaSP varchar(10)  NOT NULL,
    MaLoai varchar(10)  NOT NULL,
    DonGia int  NOT NULL,
    DonViTinh varchar(10)  NOT NULL,
    TenSP varchar(30)  NOT NULL,
    CONSTRAINT San_Pham_pk PRIMARY KEY  (MaSP)
);

-- foreign keys
-- Reference: client_purchase (table: Hoa_Don)
ALTER TABLE Hoa_Don ADD CONSTRAINT client_purchase
    FOREIGN KEY (TenCongTy)
    REFERENCES Khach_Hang (Ma_KH);

-- Reference: product_category_product (table: San_Pham)
ALTER TABLE San_Pham ADD CONSTRAINT product_category_product
    FOREIGN KEY (MaLoai)
    REFERENCES Loai_SP (MaLoai_SP);

-- Reference: product_purchase_item (table: HoaDon_CT)
ALTER TABLE HoaDon_CT ADD CONSTRAINT product_purchase_item
    FOREIGN KEY (MaSP)
    REFERENCES San_Pham (MaSP);

-- Reference: purchase_purchase_item (table: HoaDon_CT)
ALTER TABLE HoaDon_CT ADD CONSTRAINT purchase_purchase_item
    FOREIGN KEY (MaHD)
    REFERENCES Hoa_Don (MaHD);

-- End of file.

