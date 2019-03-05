SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaofeiniu;
CREATE DATABASE xiaofeiniu CHARSET=UTF8;
USE xiaofeiniu;

/*1.管理员*/
CREATE TABLE xfn_admin(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  aname VARCHAR(32) UNIQUE,
  apwd VARCHAR(64)
);
INSERT INTO xfn_admin VALUES
(NULL, 'admin', PASSWORD('123456')),
(NULL, 'boss', PASSWORD('999999'));

/*2.全局设置*/
CREATE TABLE xfn_settings(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  appName VARCHAR(32),
  apiUrl VARCHAR(64),
  adminUrl VARCHAR(64),
  appUrl VARCHAR(64),
  icp VARCHAR(64),
  copyright VARCHAR(128)
);
INSERT INTO xfn_settings VALUES
(NULL, '小肥牛', 'http://127.0.0.1:8090', 'http://127.0.0.1:8091', 'http://127.0.0.1:8092', '京ICP备12003709号-3', 'Copyright © 北京达内金桥科技有限公司版权所有');

/*3.桌台表*/
CREATE TABLE xfn_table(
  tid INT PRIMARY KEY AUTO_INCREMENT,
  tname VARCHAR(32),
  type VARCHAR(32),
  status INT
);
INSERT INTO xfn_table VALUES
(1, '金镶玉', '2人桌', 1),
(2, '玉如意', '2人桌', 1),
(3, '齐天寿', '6人桌', 3),
(5, '福临门', '4人桌', 2),
(6, '全家福', '6人桌', 3),
(7, '展宏图', '2人桌', 1),
(8, '万年长', '8人桌', 1),
(9, '百事通', '4人桌', 3),
(10, '满堂彩', '10人桌', 2),
(11, '鸿运头', '8人桌', 1),
(12, '福满堂', '12人桌', 1),
(13, '高升阁', '4人桌', 3),
(15, '乐逍遥', '2人桌',3);

/*4.桌台预定信息*/
CREATE TABLE xfn_reservation(
  rid INT PRIMARY KEY AUTO_INCREMENT,
  contactName VARCHAR(32),
  phone VARCHAR(16),
  contactTime BIGINT,
  dinnerTime BIGINT,
  tableId INT,
  FOREIGN KEY(tableId) REFERENCES xfn_table(tid)
);
INSERT INTO xfn_reservation VALUES
(NULL, '丁丁', '13501234561', '1548311700000', '1549011000000', '1'),
(NULL, '当当', '13501234562', '1548311710000', '1549011100000', '1'),
(NULL, '豆豆', '13501234563', '1548311720000', '1549011200000', '2'),
(NULL, '丫丫', '13501234564', '1548311730000', '1549011300000', '2'),
(NULL, '丁丁', '13501234565', '1548311740000', '1549011400000', '3'),
(NULL, '当当', '13501234566', '1548311750000', '1549011500000', '3'),
(NULL, '豆豆', '13501234561', '1548311760000', '1549011600000', '5'),
(NULL, '丫丫', '13501234562', '1548311770000', '1549011700000', '5'),
(NULL, '丁丁', '13501234563', '1548311780000', '1549011800000', '6'),
(NULL, '当当', '13501234564', '1548311790000', '1549011900000', '6'),
(NULL, '豆豆', '13501234565', '1548311800000', '1549011000000', '7'),
(NULL, '丫丫', '13501234566', '1548311810000', '1549011100000', '8'),
(NULL, '豆豆', '13501234567', '1548311820000', '1549011200000', '9'),
(NULL, '丫丫', '13501234561', '1548311840000', '1549011300000', '10'),
(NULL, '丁丁', '13501234562', '1548311850000', '1549011400000', '10'),
(NULL, '当当', '13501234563', '1548311860000', '1549011500000', '11'),
(NULL, '豆豆', '13501234564', '1548311870000', '1549011600000', '11'),
(NULL, '丫丫', '13501234565', '1548311880000', '1549011600000', '12'),
(NULL, '豆豆', '13501234566', '1548311890000', '1549011500000', '13'),
(NULL, '当当', '13501234567', '1548311900000', '1549011300000', '13'),
(NULL, '丫丫', '13501234568', '1548311910000', '1549011200000', '15');


/*5.菜品分类表：xfn_category*/
CREATE TABLE xfn_category(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    cname VARCHAR(32)
);
INSERT INTO xfn_category VALUE(1,'新品');
INSERT INTO xfn_category VALUE(2,'捞派特色菜');
INSERT INTO xfn_category VALUE(3,'蔬菜豆制品');
INSERT INTO xfn_category VALUE(4,'海鲜河鲜');
INSERT INTO xfn_category VALUE(5,'丸滑类');
INSERT INTO xfn_category VALUE(6,'肉类');
INSERT INTO xfn_category VALUE(7,'菌菇类');

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
INSERT INTO xfn_dish VALUE(NULL,'手切笋','c8.jpg',35,'来自福建、安徽、湖北等地大山深处的毛竹笋，具有质嫩、色白、清脆、味甜的特性，竹林都在海拔 300-500 米以上的高山上，没有工业化污染',1);

INSERT INTO xfn_dish VALUE(NULL,'捞派豆花','f12.jpg',35,'采用优质大豆磨浆，经传统手工工艺压制而成。锅开后再煮5分钟左右即可食用。配上豆花蘸碟，口味更突出',1);

INSERT INTO xfn_dish VALUE(NULL,'招牌虾滑','f1.jpg',35,'精选湛江、北海区域出产的南美品种白虾虾仁，配以盐和淀粉等调料制作而成。虾肉含量越高，虾滑口感越纯正。相比纯虾肉，虾滑食用方便、入口爽滑鲜甜Q弹，海底捞独有的定制生产工艺，含肉量虾肉含量93%，出品装盘前手工摔打10次，是火锅中的经典食材。',2);

INSERT INTO xfn_dish VALUE(NULL,'捞派无刺巴沙鱼','f2.jpg',35,'巴沙鱼是东南亚淡水鱼品种。越南音译为"卡巴沙"(CABaSa)，意思是"三块脂肪鱼"，因为该鱼在生长过程中，腹腔积累有三块较大的油脂，约占体重的58%。 海底捞选用越南湄公河流域养殖的巴沙鱼。经工厂低温车间宰杀、快速去皮等工艺加工成鱼柳，包装速冻，再通过海底捞中央厨房加工腌制而成。巴沙鱼口味鲜嫩，且无刺无腥味，特别适合老人、小孩食用。',2);

INSERT INTO xfn_dish VALUE(NULL,'捞派黄喉','f3.jpg',35,'黄喉主要是猪和牛的大血管，以脆爽见长，是四川火锅中的经典菜式。捞派黄喉选用猪黄喉，相比牛黄喉，猪黄喉只有30cm可用，肉质比牛黄喉薄，口感更脆。 捞派黄喉，通过去筋膜、清水浸泡15小时以上，自然去除黄喉的血水和腥味。口感脆嫩弹牙，是川味火锅的经典菜式。',2);

INSERT INTO xfn_dish VALUE(NULL,'千层毛肚','f4.jpg',35,'
选自牛的草肚，加入葱、姜、五香料一起煮熟后切片而成。五香味浓、耙软化渣。锅开后再煮3分钟左右即可食用。',2);

INSERT INTO xfn_dish VALUE(NULL,'草原羔羊肉','f5.jpg',35,'选自内蒙锡林郭勒大草原10月龄以下羔羊，经过排酸、切割、冷冻而成。锅开后涮30秒左右即可食用。',2);

INSERT INTO xfn_dish VALUE(NULL,'捞派滑牛肉','f6.jpg',35,'捞派滑牛肉使用的牛肉是大小米龙和嫩肩肉，是牛的后腿和前腿部位，最嫩的部位，形状像黄瓜，俗称：黄瓜条。每份滑牛都要经过解冻、去筋膜、分割、切片、腌制等9道复杂工序，口感滑嫩，久煮不老，是海底捞必点菜品。',2);

INSERT INTO xfn_dish VALUE(NULL,'血旺','f7.jpg',35,'选用资质合格的厂家配送。锅开后再煮5分钟左右即可食用。',2);

INSERT INTO xfn_dish VALUE(NULL,'捞派肥牛','f8.jpg',35,'肥牛是经过排酸处理后切成薄片的牛肉。排酸是指通过一定的温度、湿度、风速的环境下使牛的肌肉纤维发生变化，其口感更细腻、化渣。海底捞的捞派肥牛，精选谷饲100天以上的牛，自然块分割，肉味十足，久涮不淡。',2);

INSERT INTO xfn_dish VALUE(NULL,'捞派鸭肠','f9.jpg',35,'火锅三宝之一。鸭肠，具有韧性。口感脆爽有嚼劲，是火锅中经常用到的食材。 捞派鸭肠，选用资质和证件齐全的屠宰场鸭肠。经过掏肠、去大油、结石、抛肠、清洗、刀工去小油、清洗等步骤，确保每根鸭肠无杂物。捞派鸭肠口感自然脆爽，下锅涮食20-25秒左右即可食用。',2);

INSERT INTO xfn_dish VALUE(NULL,'捞派毛肚','f10.jpg',35,'选自牛的草肚，采用流水清洗、撕片等工艺，加入葱姜、料酒、花椒浸泡而成。口感脆嫩，锅开后涮10-15秒即可食用。',2);

INSERT INTO xfn_dish VALUE(NULL,'捞派精品肥牛','f11.jpg',35,'肥牛是经过排酸处理后切成薄片的牛肉。排酸是指通过一定的温度、湿度、风速的环境下使牛的肌肉纤维发生变化，其口感更细腻、化渣。 海底捞的精品肥牛，精选进口、自然生长谷饲100天以上的牛。每头牛只选用牛背部第1-6根肋骨上脑部位，一头牛产20公斤左右。经过排酸处理后，自然块分割，涮食时不易散，肉味浓，保证牛肉原有的香味。',2);

INSERT INTO xfn_dish VALUE(NULL,'包心生菜','c1.jpg',35,'经过挑选、清洗、装盘而成。口感清香，锅开后再煮1分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'蒿子秆（皇帝菜）','c2.jpg',35,'经过挑选、清洗、切配、装盘而成，锅开后再煮1分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'竹笋','c3.jpg',35,'竹笋清洗后对剖切开，装盘，口感脆爽，锅开后再煮4分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'土豆','c4.jpg',35,'经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮4分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'山药','c5.jpg',35,'经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮3分钟左右即可食用。',3);

INSERT INTO xfn_dish VALUE(NULL,'冬瓜','c6.jpg',35,'经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮1分钟即可食用，不宜久煮，否则会煮溶',3);

INSERT INTO xfn_dish VALUE(NULL,'白萝卜','c7.jpg',35,'经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮3分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'红薯','c8.jpg',35,'经过去泥、挑选、去皮、清洗、切配、装盘而成。口感香甜，锅开后再煮4分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'海带','c9.jpg',35,'经过浸泡、挑选、清洗、切配、装盘而成。锅开后再煮3分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'白菜','c10.jpg',35,'经过挑选、清洗、切配、装盘而成，锅开后再煮2分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'大白菜','c11.jpg',35,'经过挑选、清洗、切配、装盘而成，锅开后再煮2分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'小白菜','c12.jpg',35,'经过挑选、清洗、切配、装盘而成。锅开后再煮2分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'香菜','c13.jpg',35,'是云南特色产品，装盘上桌即可。锅开后再煮2-3分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'茼蒿/蓬蒿菜','c14.jpg',35,'经过挑选、清洗、装盘而成。锅开后再煮1分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'薄荷','c15.jpg',35,'薄荷，土名叫“银丹草”，为唇形科植物，门店经过清洗后装盘上桌。锅开后再煮1-2分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'丝瓜','c16.jpg',35,'丝瓜清洗、去外皮后，切段摆盘而成。锅开后再煮3分钟左右即可使用',3);

INSERT INTO xfn_dish VALUE(NULL,'娃娃菜','c17.jpg',35,'通过挑选、清洗、切配、装盘而成，易吸收锅底汤汁，锅开后再煮2分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'菠菜','c18.jpg',35,'经过挑选、清洗、切配、装盘而成。锅开后再煮1分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'豆苗','c19.jpg',35,'经过挑选、清洗、装盘而成。口感较脆，锅开后再煮1分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'油麦菜','c20.jpg',35,'经过挑选、清洗、切配、装盘而成。叶嫩杆脆，锅开后再煮1分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'芦笋','c21.jpg',35,'芦笋清新爽口、味道独特，锅开后煮4分钟即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'豌豆尖','c22.jpg',35,'经过挑选、清洗、装盘而成。茎叶柔嫩，味美可口，锅开后再煮30秒左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'散叶生菜','c23.jpg',35,'经过挑选、清洗、装盘而成。口感鲜嫩，锅开后再煮1分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'莴笋尖/凤尾','c24.jpg',35,'经过挑选、清洗、切配、装盘而成。锅开后再煮2分钟即可食用。',3);

INSERT INTO xfn_dish VALUE(NULL,'油豆腐皮','c25.jpg',35,'切段、装盘，锅开后涮30秒左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'炸豆衣','c26.jpg',35,'鲜豆皮酿制，豆香味浓郁，锅开后涮30秒左右即可食用。',3);

INSERT INTO xfn_dish VALUE(NULL,'青笋','c27.jpg',35,'经过挑选、清洗、切配、装盘而成。锅开后涮30秒即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'手切笋','c28.jpg',35,'来自福建、安徽、湖北等地大山深处的毛竹笋，具有质嫩、色白、清脆、味甜的特性，竹林都在海拔 300-500 米以上的高山上，没有工业化污染。',3);

INSERT INTO xfn_dish VALUE(NULL,'捞派豆花','c29.jpg',35,'采用优质大豆磨浆，经传统手工工艺压制而成。锅开后再煮5分钟左右即可食用。配上豆花蘸碟，口味更突出',3);

INSERT INTO xfn_dish VALUE(NULL,'莲藕','c30.jpg',35,'经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮4分钟左右即可食用',3);

INSERT INTO xfn_dish VALUE(NULL,'冻虾','s1.jpg',35,'将活虾冷冻而成。肉质脆嫩，锅开后再煮4分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'鱼豆腐','s2.jpg',35,'选用优质鱼肉，配以佐料，搅打、蒸制而成。细嫩鲜滑，鱼香味浓。锅开后再煮2分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'活虾','s3.jpg',35,'选自广东湛江、北海区域南美白虾，清洗干净装盘，锅开后再煮2分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'青斑','s4.jpg',35,'经过宰杀、去内脏、清洗、装盘而成。锅开后鱼片煮1分钟左右，鱼头、鱼排煮4分钟即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'花鲢鱼头','s5.jpg',35,'选鲜活花鲢鱼，取头冷鲜保存。锅开后再煮5分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'鱿鱼须','s6.jpg',35,'选用鱿鱼触角，速冻保鲜。锅开后再煮5分钟左右即可食用',4);

INSERT INTO xfn_dish VALUE(NULL,'大闸蟹','s7.jpg',35,'大闸蟹是一种经济蟹类，又称河蟹、毛蟹、清水蟹、大闸蟹或螃蟹，顾客可根据情况选择生、熟两种大闸蟹，生的大闸蟹，锅开后再煮8分钟左右即可食用',4);

INSERT INTO xfn_dish VALUE(NULL,'蛎蝗','s8.jpg',35,'经过宰杀、去内脏、清洗、装盘后上桌。锅开后再煮4-5分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'大淡菜','s9.jpg',35,'经过宰杀、去内脏、清洗、装盘而成。锅开后再煮4分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'北极贝','s10.jpg',35,'北极贝是源自北大西洋冰冷深海的一种贝类，肉质肥美，锅开后再煮4分钟左右即可食用',4);

INSERT INTO xfn_dish VALUE(NULL,'带鱼','s11.jpg',35,'带鱼又叫刀鱼、牙带鱼，其肉厚刺少，锅开后再煮5分钟左右即可食用',4);

INSERT INTO xfn_dish VALUE(NULL,'油蛤','s12.jpg',35,'经过宰杀、去内脏、清洗、装盘而成。锅开后再煮4分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'黑头鱼','s13.jpg',35,'俗名猪嘴鱼，齿小而鳃耙多且长，门店经过宰杀、去内脏、清洗后装盘上桌，锅开后再煮6分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'油条虾','s14.jpg',35,'油条炸制后，裹入虾滑而成。将油条的香味和虾滑的脆嫩结合在一起，锅开后再煮3分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'深水虾','s15.jpg',35,'经过挑选、装盘而成。口感鲜嫩、食用方便，锅开后再煮2分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'蟹味棒','s16.jpg',35,'锅开后再煮2分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'美国红鱼(时价)','s17.jpg',35,'经过宰杀、去内脏、清洗、装盘后上桌。锅开后再煮4-5分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'鱿鱼','s18.jpg',35,'选自资质合格的厂家，经过速冻保鲜配送。锅开后再煮5分钟左右即可食用',4);

INSERT INTO xfn_dish VALUE(NULL,'生蚝','s19.jpg',35,'经过宰杀、去内脏、清洗、装盘而成。海鲜味浓郁，锅开后再煮1分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'扇贝','s20.jpg',35,'鲜活扇贝，餐前宰杀后上桌。锅开后再煮4分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'象拔蚌','s21.jpg',35,'产自广西北海的象拔蚌，宰杀后上桌。锅开后再煮4分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'捞派无刺巴沙鱼','s22.jpg',35,'巴沙鱼是东南亚淡水鱼品种。越南音译为"卡巴沙"(CABaSa)，意思是"三块脂肪鱼"，因为该鱼在生长过程中，腹腔积累有三块较大的油脂，约占体重的58%。 海底捞选用越南湄公河流域养殖的巴沙鱼。经工厂低温车间宰杀、快速去皮等工艺加工成鱼柳，包装速冻，再通过海底捞中央厨房加工腌制而成。巴沙鱼口味鲜嫩，且无刺无腥味，特别适合老人、小孩食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'罗非鱼','s23.jpg',35,'来自海拔1500米的云南高原深水罗非鱼，沐浴北回归线上的阳光，肉质鲜美嫩滑，余味悠长。',4);

INSERT INTO xfn_dish VALUE(NULL,'捞派鱼饼','s24.jpg',35,'采用鱼肉制作，适合老人、孩子、女士，配上海鲜汁，鲜味浓郁，煮4分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'草鱼头','s25.jpg',35,'精选鲜活草鱼，取头后冷鲜保存，锅开后再煮5分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'黑鱼片','s26.jpg',35,'鲜活黑鱼取鱼片，调味后摆盘上桌。锅开后再煮1分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'海鲜组合','s27.jpg',35,'由多种海鲜组合而成。下入锅中，开锅后再煮3分钟即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'明虾','s28.jpg',35,'经过清洗、装盘而成。锅开后再煮2分钟左右即可食用。',4);

INSERT INTO xfn_dish VALUE(NULL,'旭伟蟹肉墨鱼滑','wh1.jpg',35,'将冰鲜墨鱼筒，经破碎、搅拌等工艺，再配以秘制调料，嵌入鲜毛蟹中。锅开后再煮4分钟左右即可食用。配上丸滑蘸碟，风味更突出。',5);

INSERT INTO xfn_dish VALUE(NULL,'兆湛撒尿牛肉丸','wh2.jpg',35,'选用牛后腿部位牛霖，经过排酸、绞碎、搅打成的牛肉滑，捏成丸子后，里面裹入用老鸡、火腿等精心熬制的汤冻。锅开后浮起来再煮3分钟左右即可食用。配上丸滑蘸碟，风味更突出。撒尿牛丸中心汤汁温度较高，吃时小心被汤汁烫到。',5);

INSERT INTO xfn_dish VALUE(NULL,'西式牛肉滑','wh3.jpg',35,'选用牛后腿部位，经过排酸、绞碎、搅打而成的牛肉滑，放入香菇、芹菜粒等原料，配以蛋黄。开锅后由服务员搅拌均匀、做成小丸下入，浮起来再煮3分钟左右即可食用。配上丸滑蘸碟，风味更突出。',5);

INSERT INTO xfn_dish VALUE(NULL,'丸类组合','wh4.jpg',35,'由多种丸类组合而成。锅开后浮起来再煮3分钟左右即可食用。配上丸滑蘸碟，风味更突出。',5);

INSERT INTO xfn_dish VALUE(NULL,'贝柱滑','wh5.jpg',35,'选用海湾贝肉打成滑，加上各种调料手工搅打起胶后再拼回贝壳。锅开后再煮3分钟左右即可食用，配上丸滑蘸碟，风味更突出。',5);

INSERT INTO xfn_dish VALUE(NULL,'招牌虾滑','wh6.jpg',35,'精选湛江、北海区域出产的南美品种白虾虾仁，配以盐和淀粉等调料制作而成。虾肉含量越高，虾滑口感越纯正。相比纯虾肉，虾滑食用方便、入口爽滑鲜甜Q弹，海底捞独有的定制生产工艺，含肉量虾肉含量93%，出品装盘前手工摔打10次，是火锅中的经典食材。',5);

INSERT INTO xfn_dish VALUE(NULL,'精品肉丸','wh7.jpg',35,'选自资质合格的厂家。锅开后浮起来后再煮3分钟左右即可食用。',5);

INSERT INTO xfn_dish VALUE(NULL,'手工墨鱼丸','wh8.jpg',35,'墨鱼经破碎、搅拌等工。',5);

INSERT INTO xfn_dish VALUE(NULL,'草鱼片','m1.jpg',35,'选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'脆皮肠','m2.jpg',35,'锅开后再煮3分钟左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'酥肉','m3.jpg',35,'选用冷鲜五花肉，加上鸡蛋，淀粉等原料炸制，色泽黄亮，酥软醇香，肥而不腻。锅开后再煮3分钟左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'现炸酥肉(非清真)','m4.jpg',35,'选用冷鲜五花肉，加上鸡蛋，淀粉等原料炸制，色泽黄亮，酥软醇香，肥而不腻。锅开后再煮1分钟左右即可食用，也可直接食用',6);

INSERT INTO xfn_dish VALUE(NULL,'牛百叶','m5.jpg',35,'毛肚切丝后，配以调味料腌制而成。锅开后再煮2分钟左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'腰花','m6.jpg',35,'选用大型厂家冷鲜腰花，经过解冻、清洗、切片而成。锅开后涮30秒左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'猪脑花','m7.jpg',35,'选用大型厂家冷鲜猪脑经过清洗，过水、撕膜而成。肉质细腻，锅开后再煮8分钟左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'午餐肉','m8.jpg',35,'锅开后再煮2分钟左右即可食用。',6);
INSERT INTO xfn_dish VALUE(NULL,'牛仔骨','m9.jpg',35,'牛仔骨又称牛小排，选自资质合格的厂家生产配送。锅开后再煮5分钟左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'新西兰羊肉卷','m10.jpg',35,'选用新西兰羔羊肉的前胸和肩胛为原料，在国内经过分割、压制成型，肥瘦均匀。锅开后涮30秒左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'捞派黄喉','m11.jpg',35,'黄喉主要是猪和牛的大血管，以脆爽见长，是四川火锅中的经典菜式。捞派黄喉选用猪黄喉，相比牛黄喉，猪黄喉只有30cm可用，肉质比牛黄喉薄，口感更脆。 捞派黄喉，通过去筋膜、清水浸泡15小时以上，自然去除黄喉的血水和腥味。口感脆嫩弹牙，是川味火锅的经典菜式。',6);

INSERT INTO xfn_dish VALUE(NULL,'千层毛肚','m12.jpg',35,'选自牛的草肚，加入葱、姜、五香料一起煮熟后切片而成。五香味浓、耙软化渣。锅开后再煮3分钟左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'捞派脆脆毛肚','m13.jpg',35,'选自牛的草肚，采用流水清洗、撕片等工艺，加入各种调味料腌制而成。口感脆嫩，锅开后再采用“七上八下”的方法涮15秒即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'捞派嫩羊肉','m14.jpg',35,'羊后腿肉肉质紧实，肥肉少，以瘦肉为主；肉中夹筋，筋肉相连。肉质相比前腿肉更为细嫩，用途广，一般用于烧烤、酱制等用途。海底捞只选用生长周期达到6—8个月的草原羔羊，肉嫩筋少而膻味少。精选羔羊后腿肉，肉质紧实，瘦而不柴，再用红油腌制入味，肉香与油香充分融合，一口咬下去鲜嫩多汁、肉味十足。',6);

INSERT INTO xfn_dish VALUE(NULL,'草原羔羊肉','m15.jpg',35,'选自内蒙锡林郭勒大草原10月龄以下羔羊，经过排酸、切割、冷冻而成。锅开后涮30秒左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'澳洲肥牛(和牛)','m16.jpg',35,'百分百澳洲牛肉的前胸部位，口感香嫩，汁浓味厚。锅开后涮30秒即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'捞派滑牛肉','m17.jpg',35,'捞派滑牛肉使用的牛肉是大小米龙和嫩肩肉，是牛的后腿和前腿部位，最嫩的部位，形状像黄瓜，俗称：黄瓜条。每份滑牛都要经过解冻、去筋膜、分割、切片、腌制等9道复杂工序，口感滑嫩，久煮不老，是海底捞必点菜品。',6);

INSERT INTO xfn_dish VALUE(NULL,'血旺','m18.jpg',35,'选用资质合格的厂家配送。锅开后再煮5分钟左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'捞派肥牛','m19.jpg',35,'肥牛是经过排酸处理后切成薄片的牛肉。排酸是指通过一定的温度、湿度、风速的环境下使牛的肌肉纤维发生变化，其口感更细腻、化渣。海底捞的捞派肥牛，精选谷饲100天以上的牛，自然块分割，肉味十足，久涮不淡。',6);

INSERT INTO xfn_dish VALUE(NULL,'捞派鸭肠','m20.jpg',35,'火锅三宝之一。鸭肠，具有韧性。口感脆爽有嚼劲，是火锅中经常用到的食材。 捞派鸭肠，选用资质和证件齐全的屠宰场鸭肠。经过掏肠、去大油、结石、抛肠、清洗、刀工去小油、清洗等步骤，确保每根鸭肠无杂物。捞派鸭肠口感自然脆爽，下锅涮食20-25秒左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'捞派毛肚','m21.jpg',35,'选自牛的草肚，采用流水清洗、撕片等工艺，加入葱姜、料酒、花椒浸泡而成。口感脆嫩，锅开后涮10-15秒即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'羊排卷','m22.jpg',35,'甄选12月龄以下放牧羔羊，以肥瘦相间的腹肉部位加工而成。口感细嫩化渣，锅开后涮30秒左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'手切羊肉','m23.jpg',35,'甄选12月龄以下羔羊后腿以及羊霖，经过切配、装盘而成。锅开后再煮1分钟左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'火边子牛肉','m24.jpg',35,'沿用四川自贡盐井的名菜火边子牛肉工艺，主要采用黄瓜条、多种炒香辣椒面、香辛料配制而成。颜色红亮，口味香辣刺激。锅开后再煮4分钟左右即可食用',6);

INSERT INTO xfn_dish VALUE(NULL,'捞派精品肥牛','m25.jpg',35,'肥牛是经过排酸处理后切成薄片的牛肉。排酸是指通过一定的温度、湿度、风速的环境下使牛的肌肉纤维发生变化，其口感更细腻、化渣。 海底捞的精品肥牛，精选进口、自然生长谷饲100天以上的牛。每头牛只选用牛背部第1-6根肋骨上脑部位，一头牛产20公斤左右。经过排酸处理后，自然块分割，涮食时不易散，肉味浓，保证牛肉原有的香味。',6);

INSERT INTO xfn_dish VALUE(NULL,'羊眼','m26.jpg',35,'羊眼经过排酸、切割、冷冻而成。锅开后再煮5分钟左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'猪蹄','m27.jpg',35,'猪蹄斩成小块，经过清洗，过水，用十余种符合国家食品安全的食材一起炖煮而成。锅开后再煮5分钟即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'捞派小鲜肉(非清真)','m28.jpg',35,'将上好猪颈肉切片腌制，口感鲜香、脆嫩、爽滑，这就是您的小鲜肉。锅开后再煮3分钟左右即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'捞派九尺鸭肠','m29.jpg',35,'选自资质合格的供应商配送的鲜鸭肠。锅开后再“七上八下”涮食15秒即可食用。',6);

INSERT INTO xfn_dish VALUE(NULL,'青笋','t1.jpg',35,'经过去泥、挑选、去皮、清洗、切配、装盘而成。口感清脆，锅开后再煮4分钟左右即可食用',7);

INSERT INTO xfn_dish VALUE(NULL,'有机香菇','t2.jpg',35,'经过挑选、清洗、装盘而成。锅开后再煮2分钟左右即可食用',7);

INSERT INTO xfn_dish VALUE(NULL,'杏鲍菇','t3.jpg',35,'经过挑选、清洗、切配、装盘而成。锅开后再煮3分钟左右即可食用',7);

INSERT INTO xfn_dish VALUE(NULL,'椎茸','t4.jpg',35,'经过清洗、切配、装盘而成。锅开后再煮4分钟左右即可食用',7);

INSERT INTO xfn_dish VALUE(NULL,'木耳','t5.jpg',35,'经过浸泡、挑选、装盘而成。锅开后再煮3分钟左右即可食用',7);

INSERT INTO xfn_dish VALUE(NULL,'平菇','t6.jpg',35,'经过挑选、清洗、装盘而成。脆嫩而肥厚，锅开后再煮5分钟左右即可食用',7);

INSERT INTO xfn_dish VALUE(NULL,'竹荪','t7.jpg',35,'野生竹荪，口感爽滑、脆嫩，开锅后煮3分钟左右即可食用',7);

INSERT INTO xfn_dish VALUE(NULL,'香菇','t8.jpg',35,'经过挑选、清洗、切配、装盘而成。锅开后再煮5分钟左右即可食用',7);

INSERT INTO xfn_dish VALUE(NULL,'金针菇','t9.jpg',35,'
经过挑选、清洗、装盘而成。菌盖滑嫩、清脆，锅开后再煮2分钟左右即可食用。',7);

/*7.订单信息表：xfn_order*/
CREATE TABLE xfn_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  startTime BIGINT,
  endTime BIGINT,
  customerCount INT,
  tableId INT,
  FOREIGN KEY(tableId) REFERENCES xfn_table(tid)
);
INSERT INTO xfn_order VALUES
(100000, '1547800000000', '1547814918000', '2', '1'),
(NULL, '1547801000000', '1547824918000', '4', '2'),
(NULL, '1547802000000', '1547834918000', '3', '3'),
(NULL, '1547803000000', '1547844918000', '5', '5'),
(NULL, '1547804000000', '1547854918000', '8', '6'),
(NULL, '1547805000000', '1547864918000', '2', '7'),
(NULL, '1547806000000', '1547874918000', '1', '8'),
(NULL, '1547807000000', '1547884918000', '2', '9'),
(NULL, '1547808000000', '1547894918000', '6', '10'),
(NULL, '1547809000000', '1547804918000', '3', '11'),
(NULL, '1547800000000', '1547814918000', '10', '12'),
(NULL, '1547801000000', '1547824918000', '2', '13'),
(NULL, '1547802000000', '1547834918000', '4', '15'),
(NULL, '1547800000000', '1547814918000', '2', '1'),
(NULL, '1547801000000', '1547824918000', '4', '2'),
(NULL, '1547802000000', '1547834918000', '3', '3'),
(NULL, '1547803000000', '1547824918000', '5', '5'),
(NULL, '1547804000000', '1547854918000', '8', '6'),
(NULL, '1547805000000', '1547824918000', '2', '7'),
(NULL, '1547806000000', '1547874918000', '1', '8'),
(NULL, '1547807000000', '1547884918000', '2', '9'),
(NULL, '1547808000000', '1547824918000', '6', '10'),
(NULL, '1547809000000', '1547804918000', '3', '11'),
(NULL, '1547800000000', '1547824918000', '10', '12'),
(NULL, '1547801000000', '1547824918000', '2', '13'),
(NULL, '1547802000000', '1547824918000', '4', '15');

/*8.订单详情表：xfn_order_detail*/
CREATE TABLE xfn_order_detail(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  dishId INT,       /*菜品编号*/
  dishCount INT,    /*份数*/
  customerName VARCHAR(32),    /*顾客名称*/
  orderId INT,      /*订单编号*/
  FOREIGN KEY(dishId) REFERENCES xfn_dish(did),
  FOREIGN KEY(orderId) REFERENCES xfn_order(oid)
);
INSERT INTO xfn_order_detail VALUES
(NULL, '50', '2', '丁丁', '100000'),
(NULL, '24', '2', '丁丁', '100001'),
(NULL, '37', '1', '当当', '100002'),
(NULL, '18', '3', '豆豆', '100003'),
(NULL, '22', '1', '丫丫', '100004'),
(NULL, '21', '2', '丁丁', '100005'),
(NULL, '36', '1', '当当', '100006'),
(NULL, '1', '2', '豆豆', '100007'),
(NULL, '3', '2', '丫丫', '100008'),
(NULL, '11', '2', '丁丁', '100000'),
(NULL, '14', '2', '丁丁', '100001'),
(NULL, '27', '1', '当当', '100002'),
(NULL, '8', '3', '豆豆', '100003'),
(NULL, '42', '1', '丫丫', '100004'),
(NULL, '11', '2', '丁丁', '100005'),
(NULL, '16', '1', '当当', '100006'),
(NULL, '1', '2', '豆豆', '100007'),
(NULL, '3', '2', '丫丫', '100008'),
(NULL, '15', '2', '丁丁', '100009'),
(NULL, '4', '1', '当当', '100010'),
(NULL, '12', '3', '豆豆', '100011'),
(NULL, '9', '1', '丫丫', '100012'),
(NULL, '33', '2', '丁丁', '100013'),
(NULL, '24', '1', '当当', '100014'),
(NULL, '30', '3', '豆豆', '100015'),
(NULL, '20', '2', '丫丫', '100016'),
(NULL, '16', '4', '当当', '100017'),
(NULL, '8', '2', '丫丫', '100018'),
(NULL, '6', '2', '丁丁', '100019'),
(NULL, '5', '1', '当当', '100020'),
(NULL, '29', '1', '豆豆', '100021'),
(NULL, '27', '1', '丫丫', '100022'),
(NULL, '19', '5', '丁丁', '100023'),
(NULL, '16', '1', '当当', '100024'),
(NULL, '11', '1', '豆豆', '100025'),
(NULL, '8', '2', '丫丫', '100016'),
(NULL, '16', '1', '当当', '100017'),
(NULL, '2', '3', '丫丫', '100018'),
(NULL, '1', '2', '丁丁', '100019'),
(NULL, '3', '1', '当当', '100020'),
(NULL, '29', '2', '豆豆', '100021'),
(NULL, '8', '1', '丫丫', '100022'),
(NULL, '7', '4', '丁丁', '100023'),
(NULL, '16', '6', '当当', '100024'),
(NULL, '28', '3', '豆豆', '100025'),
(NULL, '2', '3', '丫丫', '100018'),
(NULL, '42', '2', '丁丁', '100019'),
(NULL, '11', '1', '当当', '100020'),
(NULL, '19', '2', '豆豆', '100021'),
(NULL, '17', '1', '丫丫', '100022'),
(NULL, '12', '4', '丁丁', '100023'),
(NULL, '35', '6', '当当', '100024'),
(NULL, '31', '3', '豆豆', '100025'),
(NULL, '1', '3', '丫丫', '100018'),
(NULL, '2', '1', '丁丁', '100019'),
(NULL, '3', '1', '当当', '100020'),
(NULL, '32', '4', '丁丁', '100023'),
(NULL, '47', '6', '当当', '100024'),
(NULL, '41', '3', '豆豆', '100025'),
(NULL, '2', '3', '丫丫', '100018'),
(NULL, '42', '2', '丁丁', '100019'),
(NULL, '43', '1', '当当', '100020'),
(NULL, '44', '2', '豆豆', '100021'),
(NULL, '48', '1', '丫丫', '100022'),
(NULL, '46', '4', '丁丁', '100023'),
(NULL, '49', '2', '当当', '100024'),
(NULL, '40', '3', '豆豆', '100025'),
(NULL, '31', '1', '丫丫', '100022'),
(NULL, '37', '2', '丁丁', '100023'),
(NULL, '7', '1', '当当', '100024'),
(NULL, '10', '3', '豆豆', '100025'),
(NULL, '39', '1', '丫丫', '100022'),
(NULL, '32', '2', '丁丁', '100023'),
(NULL, '35', '2', '丁丁', '100023'),
(NULL, '9', '1', '当当', '100024'),
(NULL, '50', '3', '豆豆', '100025'),
(NULL, '39', '1', '丫丫', '100022'),
(NULL, '4', '2', '丁丁', '100023'),
(NULL, '31', '2', '丁丁', '100023'),
(NULL, '7', '1', '当当', '100024'),
(NULL, '30', '3', '豆豆', '100025'),
(NULL, '32', '1', '丫丫', '100022'),
(NULL, '41', '2', '丁丁', '100023'),
(NULL, '17', '1', '当当', '100024'),
(NULL, '20', '3', '豆豆', '100025'),
(NULL, '3', '1', '丫丫', '100022'),
(NULL, '4', '2', '丁丁', '100023'),
(NULL, '8', '1', '当当', '100024'),
(NULL, '29', '3', '豆豆', '100025');


