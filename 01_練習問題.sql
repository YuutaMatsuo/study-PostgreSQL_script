-- 練習問題１

-- データベースの作成
CREATE DATABASE example;

-- テーブルの作成
CREATE TABLE Jyushoroku(
toroku_bango INTEGER NOT NULL
,namae varchar(128) NOT NULL
,jyusho varchar(256) NOT NULL
,tel_no char(10)
,mail_address char(20)
,PRIMARY KEY (toroku_bango));

-- 列の追加
ALTER TABLE Jyushoroku ADD COLUMN yubin_bango char(8) NOT NULL;

-- テーブルの削除
DROP TABLE Jyushoroku;

-- テーブルを復活

-- 自習

CREATE TABLE Users(
user_id INTEGER NOT NULL
,user_name varchar(20) NOT NULL
,user_email varchar(30) NOT NULL
,PRIMARY KEY (user_id));

ALTER TABLE Users ADD COLUMN user_pass varchar(32) NOT NULL;

ALTER TABLE Users RENAME user_email TO email;
ALTER TABLE Users RENAME user_pass TO pass;


CREATE DATABASE test;


