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
INSERT INTO xfn_dish VALUE(100000,'罗非鱼','img/laopai/lp20.jpg',35,'来自海拔1500米的云南高原深水罗非鱼，沐浴北回归线上的阳光，肉质鲜美嫩滑，余味悠长。',1);
INSERT INTO xfn_dish VALUE(NULL,'手切笋','img/shucai/c8.jpg',35,'
来自福建、安徽、湖北等地大山深处的毛竹笋，具有质嫩、色白、清脆、味甜的特性，竹林都在海拔 300-500 米以上的高山上，没有工业化污染',1);
INSERT INTO xfn_dish VALUE(NULL,'招牌虾滑','img/laopai/lp21.jpg',35,'精选湛江、北海区域出产的南美品种白虾虾仁，配以盐和淀粉等调料制作而成。虾肉含量越高，虾滑口感越纯正。相比纯虾肉，虾滑食用方便、入口爽滑鲜甜Q弹，海底捞独有的定制生产工艺，含肉量虾肉含量93%，出品装盘前手工摔打10次，是火锅中的经典食材',2);
INSERT INTO xfn_dish VALUE(NULL,'捞派无刺巴沙鱼','img/laopai/lp1.jpg',35,'巴沙鱼是东南亚淡水鱼品种。越南音译为"卡巴沙"(CABaSa)，意思是"三块脂肪鱼"，因为该鱼在生长过程中，腹腔积累有三块较大的油脂，约占体重的58%。 海底捞选用越南湄公河流域养殖的巴沙鱼。经工厂低温车间宰杀、快速去皮等工艺加工成鱼柳，包装速冻，再通过海底捞中央厨房加工腌制而成。巴沙鱼口味鲜嫩，且无刺无腥味，特别适合老人、小孩食用。',2);
INSERT INTO xfn_dish VALUE(NULL,'捞派黄喉','img/laopai/lp2.jpg',35,'
黄喉主要是猪和牛的大血管，以脆爽见长，是四川火锅中的经典菜式。捞派黄喉选用猪黄喉，相比牛黄喉，猪黄喉只有30cm可用，肉质比牛黄喉薄，口感更脆。 捞派黄喉，通过去筋膜、清水浸泡15小时以上，自然去除黄喉的血水和腥味。口感脆嫩弹牙，是川味火锅的经典菜式。',2);
INSERT INTO xfn_dish VALUE(NULL,'包心生菜','img/shucai/c1.jpg',35,'经过挑选、清洗、装盘而成。口感清香，锅开后再煮1分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'蒿子秆（皇帝菜）','img/shucai/c2.jpg',35,'经过挑选、清洗、切配、装盘而成，锅开后再煮1分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'竹笋','img/shucai/c3.jpg',35,'
竹笋清洗后对剖切开，装盘，口感脆爽，锅开后再煮4分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'土豆','img/shucai/c4.jpg',35,'经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮4分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'山药','img/shucai/c5.jpg',35,'
经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮3分钟左右即可食用。',3);
INSERT INTO xfn_dish VALUE(NULL,'冬瓜','img/shucai/c6.jpg',35,'经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮1分钟即可食用，不宜久煮，否则会煮溶',3);
INSERT INTO xfn_dish VALUE(NULL,'白萝卜','img/shucai/c7.jpg',35,'
经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮3分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'红薯','img/shucai/c8.jpg',35,'经过去泥、挑选、去皮、清洗、切配、装盘而成。口感香甜，锅开后再煮4分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'海带','img/shucai/c9.jpg',35,'经过浸泡、挑选、清洗、切配、装盘而成。锅开后再煮3分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'白菜','img/shucai/c10.jpg',35,'经过挑选、清洗、切配、装盘而成，锅开后再煮2分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'大白菜','img/shucai/c11.jpg',35,'经过挑选、清洗、切配、装盘而成，锅开后再煮2分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'小白菜','img/shucai/c12.jpg',35,'经过挑选、清洗、切配、装盘而成。锅开后再煮2分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'香菜','img/shucai/c13.jpg',35,'
是云南特色产品，装盘上桌即可。锅开后再煮2-3分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'茼蒿/蓬蒿菜','img/shucai/c14.jpg',35,'经过挑选、清洗、装盘而成。锅开后再煮1分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'薄荷','img/shucai/c15.jpg',35,'薄荷，土名叫“银丹草”，为唇形科植物，门店经过清洗后装盘上桌。锅开后再煮1-2分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'丝瓜','img/shucai/c16.jpg',35,'丝瓜清洗、去外皮后，切段摆盘而成。锅开后再煮3分钟左右即可使用',3);
INSERT INTO xfn_dish VALUE(NULL,'娃娃菜','img/shucai/c17.jpg',35,'通过挑选、清洗、切配、装盘而成，易吸收锅底汤汁，锅开后再煮2分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'菠菜','img/shucai/c18.jpg',35,'经过挑选、清洗、切配、装盘而成。锅开后再煮1分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'豆苗','img/shucai/c19.jpg',35,'经过挑选、清洗、装盘而成。口感较脆，锅开后再煮1分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'油麦菜','img/shucai/c20.jpg',35,'经过挑选、清洗、切配、装盘而成。叶嫩杆脆，锅开后再煮1分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'芦笋','img/shucai/c21.jpg',35,'芦笋清新爽口、味道独特，锅开后煮4分钟即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'豌豆尖','img/shucai/c22.jpg',35,'经过挑选、清洗、装盘而成。茎叶柔嫩，味美可口，锅开后再煮30秒左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'散叶生菜','img/shucai/c23.jpg',35,'经过挑选、清洗、装盘而成。口感鲜嫩，锅开后再煮1分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'莴笋尖/凤尾','img/shucai/c24.jpg',35,'经过挑选、清洗、切配、装盘而成。锅开后再煮2分钟即可食用。',3);
INSERT INTO xfn_dish VALUE(NULL,'油豆腐皮','img/shucai/c25.jpg',35,'切段、装盘，锅开后涮30秒左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'炸豆衣','img/shucai/c26.jpg',35,'鲜豆皮酿制，豆香味浓郁，锅开后涮30秒左右即可食用。',3);
INSERT INTO xfn_dish VALUE(NULL,'青笋','img/shucai/c27.jpg',35,'经过挑选、清洗、切配、装盘而成。锅开后涮30秒即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'手切笋','img/shucai/c28.jpg',35,'来自福建、安徽、湖北等地大山深处的毛竹笋，具有质嫩、色白、清脆、味甜的特性，竹林都在海拔 300-500 米以上的高山上，没有工业化污染。',3);
INSERT INTO xfn_dish VALUE(NULL,'捞派豆花','img/shucai/c29.jpg',35,'采用优质大豆磨浆，经传统手工工艺压制而成。锅开后再煮5分钟左右即可食用。配上豆花蘸碟，口味更突出',3);
INSERT INTO xfn_dish VALUE(NULL,'莲藕','img/shucai/c30.jpg',35,'经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮4分钟左右即可食用',3);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/seafood/s.jpg',35,'',4);
INSERT INTO xfn_dish VALUE(NULL,'','img/wanhua/wh.jpg',35,'',5);
INSERT INTO xfn_dish VALUE(NULL,'','img/wanhua/wh.jpg',35,'',5);
INSERT INTO xfn_dish VALUE(NULL,'','img/wanhua/wh.jpg',35,'',5);
INSERT INTO xfn_dish VALUE(NULL,'','img/wanhua/wh.jpg',35,'',5);
INSERT INTO xfn_dish VALUE(NULL,'','img/wanhua/wh.jpg',35,'',5);
INSERT INTO xfn_dish VALUE(NULL,'','img/wanhua/wh.jpg',35,'',5);
INSERT INTO xfn_dish VALUE(NULL,'','img/wanhua/wh.jpg',35,'',5);
INSERT INTO xfn_dish VALUE(NULL,'','img/wanhua/wh.jpg',35,'',5);
INSERT INTO xfn_dish VALUE(NULL,'','img//.jpg',35,'',6);
INSERT INTO xfn_dish VALUE(NULL,'','img//.jpg',35,'',7);
INSERT INTO xfn_dish VALUE(NULL,'千层毛肚','img/laopai/lp3.jpg',35,'选自牛的草肚，加入葱、姜、五香料一起煮熟后切片而成。五香味浓、耙软化渣。锅开后再煮3分钟左右即可食用。',2);
INSERT INTO xfn_dish VALUE(NULL,'草原羔羊肉','img/laopai/lp4.jpg',35,'选自内蒙锡林郭勒大草原10月龄以下羔羊，经过排酸、切割、冷冻而成。锅开后涮30秒左右即可食用。',2);
INSERT INTO xfn_dish VALUE(NULL,'捞派滑牛肉','img/laopai/lp5.jpg',35,'捞派滑牛肉使用的牛肉是大小米龙和嫩肩肉，是牛的后腿和前腿部位，最嫩的部位，形状像黄瓜，俗称：黄瓜条。每份滑牛都要经过解冻、去筋膜、分割、切片、腌制等9道复杂工序，口感滑嫩，久煮不老，是海底捞必点菜品。',2);
INSERT INTO xfn_dish VALUE(NULL,'血旺','img/laopai/lp6.jpg',35,'选用资质合格的厂家配送。锅开后再煮5分钟左右即可食用。',2);
INSERT INTO xfn_dish VALUE(NULL,'捞派肥牛','img/laopai/lp10.jpg',35,'肥牛是经过排酸处理后切成薄片的牛肉。排酸是指通过一定的温度、湿度、风速的环境下使牛的肌肉纤维发生变化，其口感更细腻、化渣。海底捞的捞派肥牛，精选谷饲100天以上的牛，自然块分割，肉味十足，久涮不淡。',2);
INSERT INTO xfn_dish VALUE(NULL,'捞派鸭肠','img/laopai/lp8.jpg',35,'火锅三宝之一。鸭肠，具有韧性。口感脆爽有嚼劲，是火锅中经常用到的食材。 捞派鸭肠，选用资质和证件齐全的屠宰场鸭肠。经过掏肠、去大油、结石、抛肠、清洗、刀工去小油、清洗等步骤，确保每根鸭肠无杂物。捞派鸭肠口感自然脆爽，下锅涮食20-25秒左右即可食用。',2);
INSERT INTO xfn_dish VALUE(NULL,'捞派毛肚','img/laopai/lp9.jpg',35,'选自牛的草肚，采用流水清洗、撕片等工艺，加入葱姜、料酒、花椒浸泡而成。口感脆嫩，锅开后涮10-15秒即可食用。',2);
INSERT INTO xfn_dish VALUE(NULL,'捞派精品肥牛','img/laopai/lp17.jpg',35,'肥牛是经过排酸处理后切成薄片的牛肉。排酸是指通过一定的温度、湿度、风速的环境下使牛的肌肉纤维发生变化，其口感更细腻、化渣。 海底捞的精品肥牛，精选进口、自然生长谷饲100天以上的牛。每头牛只选用牛背部第1-6根肋骨上脑部位，一头牛产20公斤左右。经过排酸处理后，自然块分割，涮食时不易散，肉味浓，保证牛肉原有的香味。',2);
INSERT INTO xfn_dish VALUE(NULL,'捞派豆花','img/laopai/lp22.jpg',35,'采用优质大豆磨浆，经传统手工工艺压制而成。锅开后再煮5分钟左右即可食用。配上豆花蘸碟，口味更突出。',2);

INSERT INTO xfn_dish VALUE(NULL,'草鱼片','img/laopai/lp18.jpg',35,'选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用。',1);
INSERT INTO xfn_dish VALUE(NULL,'脆皮肠','img/laopai/lp16.jpg',15,'锅开后再煮3分钟左右即可食用。',1);
INSERT INTO xfn_dish VALUE(NULL,'酥肉','img/laopai/lp15.jpg',25,'选用冷鲜五花肉，加上鸡蛋，淀粉等原料炸制，色泽黄亮，酥软醇香，肥而不腻。锅开后再煮3分钟左右即可食用。',1);

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

