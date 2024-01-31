-- SQL 小テスト例題

-- ■データベースの作成
CREATE DATABASE CoffeeShop;

-- ■テーブルの作成
-- ①
CREATE TABLE Menu( 
coffee_id char(4) NOT NULL
,coffee_name varchar(30) NOT NULL 
,coffee_model varchar(20) NOT NULL 
,sell_price INTEGER
,cost INTEGER
,sell_date DATE
,PRIMARY KEY (coffee_id));

-- ②
CREATE TABLE Menu2( 
coffee_id char(4) NOT NULL
,coffee_name varchar(30) NOT NULL 
,coffee_model varchar(20) NOT NULL 
,sell_price INTEGER
,cost INTEGER
,sell_date DATE
,PRIMARY KEY (coffee_id));

-- ③
CREATE TABLE Menu3( 
coffee_id char(4) NOT NULL
,coffee_name varchar(30) NOT NULL 
,coffee_model varchar(20) NOT NULL 
,sell_price INTEGER
,cost INTEGER
,sell_date DATE
,PRIMARY KEY (coffee_id));


-- ■データの登録
-- ①
INSERT INTO menu values( '0001', '抹茶フラペチーノ', 'frappuccino', 539, 200, '2015/10/05');
INSERT INTO menu values( '0002', 'キャラメルフラペチーノ', 'frappuccino', 539, 200, '2015/10/10');
INSERT INTO menu values( '0003', 'アフォガードフラペチーノ', 'frappuccino', 627, 250, '2015/10/10');
INSERT INTO menu values( '0004', 'コールドブリュー', 'ice', 407, 150, '2015/11/20');
INSERT INTO menu values( '0005', 'キャラメルマキアート', 'ice', 473, 170, '2015/12/10');
INSERT INTO menu values( '0006', 'チャイティーラテ', 'tealatte', 484, 180, '2015/10/10');

-- ②
INSERT INTO menu2 values( '0001', '抹茶フラペチーノ', 'frappuccino', 539, 200, '2015/10/05');
INSERT INTO menu2 values( '0002', 'キャラメルフラペチーノ', 'frappuccino', NULL, 200, '2015/10/10');
INSERT INTO menu2 values( '0003', 'アフォガードフラペチーノ', 'frappuccino', 627, 250, '2015/10/10');
INSERT INTO menu2 values( '0004', 'コールドブリュー', 'ice', 407, 150, '2015/11/20');
INSERT INTO menu2 values( '0005', 'キャラメルマキアート', 'ice', NULL, 170, '2015/12/10');
INSERT INTO menu2 values( '0006', 'チャイティーラテ', 'tealatte', 484, 180, '2015/10/10');

-- ③
INSERT INTO menu3 values( '0001', '抹茶フラペチーノ', 'frappuccino', 539, 200, '2015/10/05');
INSERT INTO menu3 values( '0002', 'キャラメルフラペチーノ', 'frappuccino', 539, 200, '2015/10/10');
INSERT INTO menu3 values( '0003', 'アフォガードフラペチーノ', 'frappuccino', 627, 250, '2015/10/10');
INSERT INTO menu3 values( '0004', 'コールドブリュー', 'ice', 407, 150, '2015/11/20');
INSERT INTO menu3 values( '0005', 'キャラメルマキアート', 'ice', 473, 170, '2015/12/10');
INSERT INTO menu3 values( '0006', 'チャイティーラテ', 'tealatte', 484, 180, '2015/10/10');





















