SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaofeiniu;
CREATE DATABASE xiaofeiniu  CHARSET=UTF8;
USE xiaofeiniu;

#1.管理员信息表：xfn_admin
CREATE TABLE xfn_admin (
  aid INT  PRIMARY KEY AUTO_INCREMENT,
  aname VARCHAR(32),
  apwd VARCHAR(64)
);
INSERT INTO xfn_admin VALUES(NULL,'admin',PASSWORD('123456'));
INSERT INTO xfn_admin VALUES(NULL,'boss',PASSWORD('999999'));
INSERT INTO xfn_admin VALUES(NULL,'张三',PASSWORD('123456'));


/*2.全局设置:xfn_settings*/
CREATE TABLE xfn_settings (
  sid INT  PRIMARY KEY AUTO_INCREMENT,
  appName VARCHAR(32),
  apiUrl VARCHAR(64),
  adminUrl VARCHAR(64),
  appUrl VARCHAR(64),
  icp VARCHAR(64),
  copyright VARCHAR(128)
);
INSERT INTO xfn_settings VALUES(NULL,'小肥牛','http://127.0.0.1:8090','http://127.0.0.1:8091','http://127.0.0.1:8092','京ICP备12003709号-3','Copyright © 北京达内金桥科技有限公司版权所有');

/*3.桌台信息表： xfn_table*/
CREATE TABLE xfn_table(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    tname VARCHAR(64),
    type VARCHAR(16),
    status INT
);
INSERT INTO xfn_table VALUE(NULL,'云浮','6-8人桌',1);
INSERT INTO xfn_table VALUE(NULL,'福满堂','6人桌',2);
INSERT INTO xfn_table VALUE(NULL,'金香玉','10人桌',3);
INSERT INTO xfn_table VALUE(NULL,'寿比天','2人桌',0);

/*4.台的预定信息表：xfn_reservation*/
CREATE TABLE xfn_reservation(
    rid INT PRIMARY KEY AUTO_INCREMENT,
    contactName VARCHAR(64),
    phone VARCHAR(16),
    contactTime BIGINT,
    dinnerTime BIGINT,
    tableid INT,
    FOREIGN KEY(tableid) REFERENCES xfn_table(tid)

);
INSERT INTO xfn_reservation VALUE(NULL,'丁丁','13910997460',1548404830420,1548410100000,1);
INSERT INTO xfn_reservation VALUE(NULL,'当当','13910997462',1548404830420,1548410100000,2);
INSERT INTO xfn_reservation VALUE(NULL,'豆豆','13910997463',1548404830420,1548410100000,3);
INSERT INTO xfn_reservation VALUE(NULL,'丫丫','13910997464',1548404830420,1548410100000,1);


/*5.菜品分类表：xfn_category*/
CREATE TABLE xfn_category(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    cname VARCHAR(32)
);
INSERT INTO xfn_category VALUE(NULL,'新品');
INSERT INTO xfn_category VALUE(NULL,'捞派特色菜');
INSERT INTO xfn_category VALUE(NULL,'蔬菜豆制品');
INSERT INTO xfn_category VALUE(NULL,'海鲜河鲜');
INSERT INTO xfn_category VALUE(NULL,'丸滑类');
INSERT INTO xfn_category VALUE(NULL,'肉类');
INSERT INTO xfn_category VALUE(NULL,'菌菇类');

/*6.菜品信息表：xfn_dish*/
CREATE TABLE xfn_dish(
    did INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32),
    imgUrl VARCHAR(128),
    price DECIMAL(6,2),
    detail VARCHAR(128),
    categoryId INT,
    FOREIGN KEY(categoryId) REFERENCES xfn_category(cid)
);
INSERT INTO xfn_dish VALUE(100000,'罗非鱼','img/lp/lp20.jpg',35,'来自海拔1500米的云南高原深水罗非鱼，沐浴北回归线上的阳光，肉质鲜美嫩滑，余味悠长。',1);
INSERT INTO xfn_dish VALUE(NULL,'手切笋','img/shucai/c8.jpg',35,'
来自福建、安徽、湖北等地大山深处的毛竹笋，具有质嫩、色白、清脆、味甜的特性，竹林都在海拔 300-500 米以上的高山上，没有工业化污染',1);
INSERT INTO xfn_dish VALUE(NULL,'招牌虾滑','img/lp/lp21.jpg',35,'精选湛江、北海区域出产的南美品种白虾虾仁，配以盐和淀粉等调料制作而成。虾肉含量越高，虾滑口感越纯正。相比纯虾肉，虾滑食用方便、入口爽滑鲜甜Q弹，海底捞独有的定制生产工艺，含肉量虾肉含量93%，出品装盘前手工摔打10次，是火锅中的经典食材',1);
INSERT INTO xfn_dish VALUE(NULL,'捞派无刺巴沙鱼','img/lp/lp1.jpg',35,'巴沙鱼是东南亚淡水鱼品种。越南音译为"卡巴沙"(CABaSa)，意思是"三块脂肪鱼"，因为该鱼在生长过程中，腹腔积累有三块较大的油脂，约占体重的58%。 海底捞选用越南湄公河流域养殖的巴沙鱼。经工厂低温车间宰杀、快速去皮等工艺加工成鱼柳，包装速冻，再通过海底捞中央厨房加工腌制而成。巴沙鱼口味鲜嫩，且无刺无腥味，特别适合老人、小孩食用。',1);
INSERT INTO xfn_dish VALUE(NULL,'捞派黄喉','img/lp/lp2.jpg',35,'
黄喉主要是猪和牛的大血管，以脆爽见长，是四川火锅中的经典菜式。捞派黄喉选用猪黄喉，相比牛黄喉，猪黄喉只有30cm可用，肉质比牛黄喉薄，口感更脆。 捞派黄喉，通过去筋膜、清水浸泡15小时以上，自然去除黄喉的血水和腥味。口感脆嫩弹牙，是川味火锅的经典菜式。',1);
INSERT INTO xfn_dish VALUE(NULL,'草鱼片','img/lp/lp18.jpg',35,'选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用。',1);
INSERT INTO xfn_dish VALUE(NULL,'脆皮肠','img/lp/lp16.jpg',15,'锅开后再煮3分钟左右即可食用。',1);
INSERT INTO xfn_dish VALUE(NULL,'酥肉','img/lp/lp15.jpg',25,'选用冷鲜五花肉，加上鸡蛋，淀粉等原料炸制，色泽黄亮，酥软醇香，肥而不腻。锅开后再煮3分钟左右即可食用。',1);

/*7.订单信息表：xfn_order*/
CREATE TABLE xfn_order(
    oid INT PRIMARY KEY AUTO_INCREMENT,
    startTime BIGINT,
    endTime BIGINT,
    customerCount INT,
    tableid INT,
    FOREIGN KEY(tableid) REFERENCES xfn_table(tid)
);
INSERT INTO xfn_order VALUE(1,1548404830420,1548410100000,3,1);

/*8.订单详情表：xfn_order_detail*/
CREATE TABLE xfn_order_detail(
    did INT PRIMARY KEY AUTO_INCREMENT,
    dishid INT,     /*菜品编号*/
    dishCount INT,   /*份数*/
    customerName VARCHAR(64),  /*顾客名称*/
    orderid INT,    /*订单编号*/
    FOREIGN KEY(dishid) REFERENCES xfn_dish(did),
    FOREIGN KEY(orderid) REFERENCES xfn_order(oid)
);
INSERT INTO xfn_order_detail VALUE(NULL,100001,1,'丁丁',1);

