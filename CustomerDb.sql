USE `W08.NVHUNG.MF1772`;

CREATE TABLE Customer (
  CustomerId char(36) NOT NULL COMMENT 'Id khách hàng/Khóa chính',
  CustomerGroupId char(36) DEFAULT NULL COMMENT 'Id nhóm khách hàng',
  CustomerCode char(20) NOT NULL COMMENT 'Mã khách hàng',
  FullName varchar(100) NOT NULL COMMENT 'Họ và tên',
  PhoneNumber varchar(50) DEFAULT NULL COMMENT 'số điện thoại di động',
  Email varchar(100) DEFAULT NULL COMMENT 'Địa chỉ email',
  Gender int(11) DEFAULT NULL COMMENT 'giới tính: 0-nam; 1-nữ; 2-khác',
  CreatedBy varchar(100) DEFAULT NULL COMMENT 'Tên người tạo',
  CreatedDate datetime DEFAULT NULL COMMENT 'Thời điểm tạo',
  ModifiedBy varchar(100) DEFAULT NULL COMMENT 'Tên người chỉnh sửa cuối',
  ModifiedDate datetime DEFAULT NULL COMMENT 'Thời điểm chỉnh sửa cuối',
  Address varchar(255) DEFAULT NULL COMMENT 'Địa chỉ nơi ở',
  PRIMARY KEY (CustomerId)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1000,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Danh sách khách hàng';

Alter table Customer 
Add Constraint FK_Customer_CustomerGroup FOREIGN KEY (CustomerGroupId)
REFERENCES CustomerGroup (CustomerGroupId) On DELETE No Action


CREATE TABLE CustomerGroup (
  CustomerGroupId char(36) NOT NULL COMMENT 'Khóa chính/Id đơn nhmó',
  CustomerGroupName varchar(255) NOT NULL COMMENT 'Tên nhóm',
  CreatedBy varchar(100) DEFAULT NULL COMMENT 'Tên người tạo',
  CreatedDate datetime DEFAULT NULL COMMENT 'Thời điểm tạo',
  ModifiedBy varchar(100) DEFAULT NULL COMMENT 'Tên người chỉnh sửa cuối',
  ModifiedDate datetime DEFAULT NULL COMMENT 'Thời điểm chỉnh sửa cuối',
  PRIMARY KEY (CustomerGroupId)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1000,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Danh sách cách nhóm khách hàng';

INSERT INTO CustomerGroup (CustomerGroupId, CustomerGroupName, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate)
VALUES
  ('1', 'Nhóm A', 'Admin1', '2023-01-01 10:00:00', 'Admin1', '2023-01-01 12:30:00'),
  ('2', 'Nhóm B', 'Admin2', '2023-02-02 09:45:00', 'Admin2', '2023-02-02 15:20:00'),
  ('3', 'Nhóm C', 'Admin3', '2023-03-03 08:30:00', 'Admin3', '2023-03-03 11:10:00');

 
INSERT INTO Customer (CustomerId, CustomerGroupId, CustomerCode, FullName, PhoneNumber, Email, Gender, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, Address)
VALUES
  ('1', '1', 'C001', 'Nguyễn Văn A', '123456789', 'nguyenvana@email.com', 0, 'Admin1', '2023-01-01 10:00:00', 'Admin1', '2023-01-01 12:30:00', '123 Đường ABC, Quận XYZ'),
  ('2', '1', 'C002', 'Trần Thị B', '987654321', 'tranthib@email.com', 1, 'Admin2', '2023-02-02 09:45:00', 'Admin2', '2023-02-02 15:20:00', '456 Đường XYZ, Quận ABC'),
  ('3', '2', 'C003', 'Lê Văn C', '555123789', 'levanc@email.com', 0, 'Admin3', '2023-03-03 08:30:00', 'Admin3', '2023-03-03 11:10:00', '789 Đường LMN, Quận PQR');
