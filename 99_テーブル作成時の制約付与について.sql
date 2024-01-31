-- テーブル作成時の制約について補足
CREATE TABLE sampletable
( id char(4) NOT NULL 
,name varchar(20) DEFAULT 'sample' NOT NULL --複数制約（暗黙デフォルトが機能しなくなる）
,age INTEGER DEFAULT 20
,PRIMARY KEY (id));

-- データの登録
INSERT INTO sampletable VALUES ('0001', 20); --OK
INSERT INTO sampletable VALUES ('0002', NULL); --NG（NOT NULL制約がついているため）
INSERT INTO sampletable VALUES ('0003', 'みなと',NULL);
INSERT INTO sampletable VALUES ('0004',,); --NG
INSERT INTO sampletable VALUES ('0005', 'あさか');

--結果：name列にデータを挿入するときは、
--      明示的に「DEFAULT」キーワードを書かなければデフォルト初期値は入らない



















