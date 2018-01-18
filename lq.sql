SET NAMES UTF8;
DROP DATABASE if EXISTS lq;
CREATE DATABASE lq CHARSET=UTF8;
USE lq;
CREATE table user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32) NOT NULL DEFAULT '',
	upwd VARCHAR(32) NOT NULL DEFAULT '',
	sex BOOL NOT NULL DEFAULT '0',
	phone VARCHAR(32) UNIQUE,
	email VARCHAR(32) UNIQUE
);
CREATE table style(
	styleId TINYINT PRIMARY KEY,
	sname VARCHAR(16)
);
CREATE table searchedlist(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	uid INT,
	number VARCHAR(32) NOT NULL UNIQUE,
	FOREIGN KEY(uid) REFERENCES user(uid)
);
CREATE table product(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	styleId TINYINT NOT NULL,
	number VARCHAR(32) NOT NULL UNIQUE,
	price DECIMAL(9,2),
	count SMALLINT,
	title VARCHAR(256),
	FOREIGN KEY(styleId) REFERENCES style(styleId)
	
);
CREATE table topsale(
	pid INT,
	salecount INT,
	FOREIGN KEY(pid) REFERENCES product(pid)
);
CREATE table shoppingcart(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	uid INT,
	pid INT,
	count SMALLINT,
	is_checked BOOLEAN,
	FOREIGN KEY(pid) REFERENCES product(pid),
	FOREIGN KEY(uid) REFERENCES user(uid)
);
CREATE table product_details(
	pid INT,
	grass VARCHAR(32),
	size VARCHAR(16),
	water VARCHAR(16),
	quantityone VARCHAR(8),
	form VARCHAR(8),
	diamond VARCHAR(8),
	weight DOUBLE(5,3),
	finger VARCHAR(16),
	colorone VARCHAR(16),
	time VARCHAR(16),
	moduleone VARCHAR(16),
	moduletwo VARCHAR(16),
	modulethree VARCHAR(16),
	moduletype VARCHAR(16),
	function VARCHAR(16),
	quantitytwo VARCHAR(16),
	buckle VARCHAR(32),
	colortwo VARCHAR(8),
	FOREIGN KEY(pid) REFERENCES product(pid)
);
CREATE table productimg(
	pid INT,
	minimg VARCHAR(64),
	midimg VARCHAR(64),
	maximg VARCHAR(64),
	FOREIGN KEY(pid) REFERENCES product(pid)
);



INSERT INTO style VALUES(1,"浪琴表名匠系列");
INSERT INTO style VALUES(2,"康铂系列");
INSERT INTO style VALUES(3,"浪琴表博雅系列");
INSERT INTO style VALUES(4,"浪琴表嘉岚系列");
INSERT INTO style VALUES(5,"浪琴表律雅系列");
INSERT INTO style VALUES(6,"军旗系列");
INSERT INTO style VALUES(7,"浪琴表黛绰维纳系列");
INSERT INTO style VALUES(8,"浪琴表典藏系列");
INSERT INTO style VALUES(9,"经典复刻");

INSERT INTO product VALUES(1,8,'L2.142.0.70.4','27500.00',100,'27500.00浪琴表 典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
 防水 深度3巴精钢酒桶形蓝钢指针银色flinqué饰纹漆绘阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.70.4');
INSERT INTO product VALUES(2,8,'L2.142.0.70.6','27900.00',100,'27900.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
,防水,深度3巴精钢酒桶形蓝钢指针银色flinqué饰纹漆绘阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.70.6');
INSERT INTO product VALUES(3,8,'L2.142.0.70.8','13300.00',100,'13300.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针银色flinqué饰纹漆绘阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.70.8');
INSERT INTO product VALUES(4,8,'L2.142.0.70.0','12600.00',100,'12600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.70.0');
INSERT INTO product VALUES(5,8,'L2.142.0.72.1','22600.00',100,'22600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.72.1');
INSERT INTO product VALUES(6,8,'L2.142.0.72.2','22600.00',100,'22600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.72.2');
INSERT INTO product VALUES(7,8,'L2.142.0.72.3','12600.00',100,'12600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.72.3');
INSERT INTO product VALUES(8,8,'L2.142.0.72.4','12600.00',100,'12600浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.72.4');
INSERT INTO product VALUES(9,8,'L2.142.0.72.5','9600.00',100,'9600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.72.5');
INSERT INTO product VALUES(10,8,'L2.142.0.72.6','12600.00',100,'12600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.72.6');
INSERT INTO product VALUES(11,8,'L2.142.0.72.7','19800.00',100,'19800.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.72.7');
INSERT INTO product VALUES(12,8,'L2.142.0.72.8','12600.00',100,'12600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.72.8');
INSERT INTO product VALUES(13,8,'L2.142.0.72.9','16600.00',100,'16600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.72.9');
INSERT INTO product VALUES(14,8,'L2.142.0.73.1','26600.00',100,'26600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.73.1');
INSERT INTO product VALUES(15,8,'L2.142.0.73.2','33600.00',100,'33600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.0.73.2');
INSERT INTO product VALUES(16,8,'L2.142.1.70.4','27900.00',100,'27900.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.70.4');
INSERT INTO product VALUES(17,8,'L2.142.1.70.6','27800.00',100,'27800.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.70.6');
INSERT INTO product VALUES(18,8,'L2.142.1.70.8','13900.00',100,'13900.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.70.8');
INSERT INTO product VALUES(19,8,'L2.142.1.70.0','12900.00',100,'12900.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.70.0');
INSERT INTO product VALUES(20,8,'L2.142.1.72.1','22900.00',100,'22900.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.72.1');
INSERT INTO product VALUES(21,8,'L2.142.1.72.2','22800.00',100,'22800.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.72.2');
INSERT INTO product VALUES(22,8,'L2.142.1.72.3','32900.00',100,'32900.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.72.3');
INSERT INTO product VALUES(23,8,'L2.142.1.72.4','23600.00',100,'23600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.72.4');
INSERT INTO product VALUES(24,8,'L2.142.1.72.5','9600.00',100,'9600.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.72.5');
INSERT INTO product VALUES(25,8,'L2.142.1.72.6','12700.00',100,'12700.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.72.6');
INSERT INTO product VALUES(26,8,'L2.142.1.72.7','19800.00',100,'19800.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.72.7');
INSERT INTO product VALUES(27,8,'L2.142.1.72.8','12900.00',100,'12900.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.72.8');
INSERT INTO product VALUES(28,8,'L2.142.1.72.9','16900.00',100,'16900.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.72.9');
INSERT INTO product VALUES(29,8,'L2.142.1.73.1','26900.00',100,'26900.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.73.1');
INSERT INTO product VALUES(30,8,'L2.142.1.73.2','33900.00',100,'33900.00浪琴表典藏系列,抗磨损合成蓝宝石内侧带多层防反光涂层
防水深度3巴精钢酒桶形蓝钢指针阿位伯数字自动上链机械机芯，每小时振动28,800次，提供40小时动力储存
L595/592自动上链机械机芯时、分、秒和日期显示鳄鱼皮表带三折式安全表扣和按压式开启装置棕色 L2.142.1.73.2');

INSERT INTO user VALUES(1,'a','123456',1,null,'1@qq.com');
INSERT INTO user VALUES(2,'mxb','123456',1,'15336507730','173581251@qq.com');
INSERT INTO shoppingcart VALUES(1,1,1,1,1);

INSERT INTO topsale VALUES(13,10);
INSERT INTO topsale VALUES(14,5);
INSERT INTO topsale VALUES(15,3);
INSERT INTO topsale VALUES(4,2);
INSERT INTO topsale VALUES(5,1);

INSERT INTO productimg VALUES(1,
	'img/product_img/min1.png',
	'img/product_img/mid1.jpg',
	'img/product_img/max1.jpg'
);
INSERT INTO productimg VALUES(2,
	'img/product_img/min2.png',
	'img/product_img/mid2.jpg',
	'img/product_img/max2.jpg'
);
INSERT INTO productimg VALUES(3,
	'img/product_img/min3.png',
	'img/product_img/mid3.jpg',
	'img/product_img/max3.jpg'
);
INSERT INTO productimg VALUES(4,
	'img/product_img/min4.png',
	'img/product_img/mid4.jpg',
	'img/product_img/max4.jpg'
);
INSERT INTO productimg VALUES(5,
	'img/product_img/min5.png',
	'img/product_img/mid5.jpg',
	'img/product_img/max5.jpg'
);
INSERT INTO productimg VALUES(6,
	'img/product_img/min6.png',
	'img/product_img/mid6.jpg',
	'img/product_img/max6.jpg'
);
INSERT INTO productimg VALUES(7,
	'img/product_img/min7.png',
	'img/product_img/mid7.jpg',
	'img/product_img/max7.jpg'
);
INSERT INTO productimg VALUES(8,
	'img/product_img/min8.png',
	'img/product_img/mid8.jpg',
	'img/product_img/max8.jpg'
);
INSERT INTO productimg VALUES(9,
	'img/product_img/min9.png',
	'img/product_img/mid9.jpg',
	'img/product_img/max9.jpg'
);
INSERT INTO productimg VALUES(10,
	'img/product_img/min10.png',
	'img/product_img/mid10.jpg',
	'img/product_img/max10.jpg'
);
INSERT INTO productimg VALUES(11,
	'img/product_img/min11.png',
	'img/product_img/mid11.jpg',
	'img/product_img/max11.jpg'
);
INSERT INTO productimg VALUES(12,
	'img/product_img/min12.png',
	'img/product_img/mid12.jpg',
	'img/product_img/max12.jpg'
);
INSERT INTO productimg VALUES(13,
	'img/product_img/min13.png',
	'img/product_img/mid13.jpg',
	'img/product_img/max13.jpg'
);
INSERT INTO productimg VALUES(14,
	'img/product_img/min14.png',
	'img/product_img/mid14.jpg',
	'img/product_img/max14.jpg'
);
INSERT INTO productimg VALUES(15,
	'img/product_img/min15.png',
	'img/product_img/mid15.jpg',
	'img/product_img/max15.jpg'
);
INSERT INTO productimg VALUES(16,
	'img/product_img/min1.png',
	'img/product_img/mid1.jpg',
	'img/product_img/max1.jpg'
);
INSERT INTO productimg VALUES(17,
	'img/product_img/min2.png',
	'img/product_img/mid2.jpg',
	'img/product_img/max2.jpg'
);
INSERT INTO productimg VALUES(18,
	'img/product_img/min3.png',
	'img/product_img/mid3.jpg',
	'img/product_img/max3.jpg'
);
INSERT INTO productimg VALUES(19,
	'img/product_img/min4.png',
	'img/product_img/mid4.jpg',
	'img/product_img/max4.jpg'
);
INSERT INTO productimg VALUES(20,
	'img/product_img/min5.png',
	'img/product_img/mid5.jpg',
	'img/product_img/max5.jpg'
);
INSERT INTO productimg VALUES(21,
	'img/product_img/min6.png',
	'img/product_img/mid6.jpg',
	'img/product_img/max6.jpg'
);
INSERT INTO productimg VALUES(22,
	'img/product_img/min7.png',
	'img/product_img/mid7.jpg',
	'img/product_img/max7.jpg'
);
INSERT INTO productimg VALUES(23,
	'img/product_img/min8.png',
	'img/product_img/mid8.jpg',
	'img/product_img/max8.jpg'
);
INSERT INTO productimg VALUES(24,
	'img/product_img/min9.png',
	'img/product_img/mid9.jpg',
	'img/product_img/max9.jpg'
);
INSERT INTO productimg VALUES(25,
	'img/product_img/min10.png',
	'img/product_img/mid10.jpg',
	'img/product_img/max10.jpg'
);
INSERT INTO productimg VALUES(26,
	'img/product_img/min11.png',
	'img/product_img/mid11.jpg',
	'img/product_img/max11.jpg'
);
INSERT INTO productimg VALUES(27,
	'img/product_img/min12.png',
	'img/product_img/mid12.jpg',
	'img/product_img/max12.jpg'
);
INSERT INTO productimg VALUES(28,
	'img/product_img/min13.png',
	'img/product_img/mid13.jpg',
	'img/product_img/max13.jpg'
);
INSERT INTO productimg VALUES(29,
	'img/product_img/min14.png',
	'img/product_img/mid14.jpg',
	'img/product_img/max14.jpg'
);
INSERT INTO productimg VALUES(30,
	'img/product_img/min15.png',
	'img/product_img/mid15.jpg',
	'img/product_img/max15.jpg'
);
INSERT INTO product_details VALUES(
	1,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	2,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	3,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	4,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	5,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	6,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	7,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	8,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	9,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	10,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	11,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	12,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	13,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	14,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	15,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	16,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	17,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	18,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	19,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	20,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	21,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	22,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);

INSERT INTO product_details VALUES(
	23,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	24,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	25,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	26,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	27,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	28,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	29,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
INSERT INTO product_details VALUES(
	30,
	"抗磨损合成蓝宝石，内侧带多层防反光涂层",
	'26.00 X 30.60 mm',
	'防水深度3巴',
	'精钢',
	'酒桶形',
	'44',
	'0.358',
	'蓝钢指针',
	'银色"flinqué"饰纹',
	'漆绘阿位伯数字',
	'自动上链机械机芯，每小时振动28,800次，提供40小时动力储存。',
	'L595/592',
	'不是',
	'自动上链机械机芯',
	'时、分、秒和日期显示。',
	'鳄鱼皮表带',
	'三折式安全表扣和按压式开启装置。',
	'棕色'
);
