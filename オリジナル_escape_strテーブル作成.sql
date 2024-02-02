--DDL：テーブル作成
CREATE TABLE escape_str
( esc_str VARCHAR(30) NOT NULL,
  PRIMARY KEY (esc_str));
 
drop table escape_str;

--DML：データ登録
BEGIN TRANSACTION;

INSERT INTO escape_str (esc_str) VALUES ('10%off');
INSERT INTO escape_str (esc_str) VALUES ('20%off');
INSERT INTO escape_str (esc_str) VALUES ('30%off');
INSERT INTO escape_str (esc_str) VALUES ('SALE_50%off');
INSERT INTO escape_str (esc_str) VALUES ('SALE_70%off');
INSERT INTO escape_str (esc_str) VALUES ('SALE_80%off');
INSERT INTO escape_str (esc_str) VALUES ('NOTSALE');

COMMIT;


roll