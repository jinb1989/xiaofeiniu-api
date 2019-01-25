SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaofeiniu;
CREATE DATABASE xiaofeiniu  CHARSET=UTF8;
USE xiaofeiniu;

#1.管理员信息表：xfn_admin
CREATE TABLE xfn_admin (
  aid INT  PRIMARY KEY,
  aname VARCHAR(32),
  apwd VARCHAR(64),
  role 
)
INSERT INTO xfn_admin VALUES('1','张三','123456','null');
INSERT INTO xfn_admin VALUES('2','李四','123456','null');
INSERT INTO xfn_admin VALUES('3','王二','123456','null');

#2.全局设置:xfn_settings
CREATE TABLE xfn_settings (
  sid INT  PRIMARY KEY,
  appName VARCHAR(32),
  apiUrl VARCHAR(64),
  adminUrl VARCHAR(64),
  appUrl VARCHAR(64),
  icp VARCHAR(64),
  copyright VARCHAR(64)
)
INSERT INTO xfn_settings VALUES('1','小肥牛','','','','')

#3.桌台信息表： xfn_table
CREATE TABLE xfn_table(
    tid INT PRIMARY KEY,
    tname VARCHAR(64),
    type VARCHAR(16),
    status INT
)
INSERT INTO xfn_table VALUE('1','云浮','8',1)

#4.台的预定表：xfn_reservation
CREATE TABLE xfn_reservation(
    rid INT PRIMARY KEY,
    contactName VARCHAR(64),
    phone VARCHAR(16),
    contactTime BIGINT,
    dinnerTime BIGINT
)
INSERT INTO xfn_reservation VALUE()

#5.菜品分类表：xfn_category
CREATE TABLE xfn_category(
    cid INT PRIMARY KEY,
    cname VARCHAR(32)
)
INSERT INTO xfn_category VALUE()

#6.菜品信息表：xfn_dish
CREATE TABLE xfn_dish(
    did INT PRIMARY KEY,
    title VARCHAR(32),
    imgUrl VARCHAR(128),
    price DECIMAL(6,2),
    detail VARCHAR(128),
    categoryid INT  AUTO_INCREMENT
)
INSERT INTO xfn_dish VALUE('100001','招牌下滑','img/wanhua/wh6','58.00','精选湛江、北海区域出产的南美品种白虾虾仁，配以盐和淀粉等调料制作而成。虾肉含量越高，虾滑口感越纯正。相比纯虾肉，虾滑食用方便、入口爽滑鲜甜Q弹，海底捞独有的定制生产工艺，含肉量虾肉含量93%，出品装盘前手工摔打10次，是火锅中的经典食材','捞派特色菜');

#7.订单信息表：xfn_order
CREATE TABLE xfn_order(
    oid INT PRIMARY KEY,
    startTime BIGINT,
    endTime BIGINT,
    customerCount INT,
    tableid INT AUTO_INCREMENT
)
INSERT INTO xfn_order VALUE('1','2019-1-25 09:00','2019-1-25 10:00','6','086')

#8.订单详情表：xfn_order_detail
CREATE TABLE xfn_order_detail(
    did INT PRIMARY KEY,
    dishid INT AUTO_INCREMENT,
    dishCount INT,
    customerName VARCHAR,
    orderid INT AUTO_INCREMENT
)
INSERT INTO xfn_order_detail VALUE('1','100001','1','张三','065')

