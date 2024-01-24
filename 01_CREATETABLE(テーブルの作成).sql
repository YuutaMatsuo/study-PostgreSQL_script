--■データベース作成
--CREATE 作るものの種類 作るものの名前;
-- create database shop;
-- キーワードの大文字/小文字は区別しない

--■データベース削除
-- DROP 削除するものの種類 削除するものの名前;
-- DROP DATABASE shop;

--■テーブル作成
-- CREATE TABLE テーブル名();
-- CREATE TABLE shohin();
-- テーブルを作成するときは（）をつける

--■テーブル削除
-- DROP TABLE テーブル名;

--■列の定義
-- 列名(必須) データ型(必須) 制約(任意)
-- shohin_id CHAR(4) NOT NULL

--■名前の付け方
-- データベース名,テーブル名,カラム名
-- スネークケース(例) seito_2nd
-- アルファベットと数字のみ

--■データ型について
-- char(文字数の最大長)
-- ●文字列（固定長文字列）
-- データの桁数が足りない場合、自動で半角スペースを追加する。=パディングを行う
-- char(4)に対して「１」を追加すると「1   」と挿入される
-- =パティング：桁合わせ、桁埋め

-- varchar(文字数の最大長)
-- ●文字列（可変長文字列）
-- 自動パディングしない

-- text
-- 文字列（可変長文字列）
-- 最大文字数を指定しない
-- 最大約１GBまで保存できる
-- ※データ型は青文字で表示

--■テーブル定義の変更
-- テーブルに列を追加したい
-- ALTER TABLE 変更したいテーブル名 ADD COLUMN 列の定義;
--ALTER TABLE shohin ADD COLUMN shohin_mei_kana VARCHAR(100);

-- リネームについて
-- ◎テーブル名のリネーム
-- ALTER TABLE 旧テーブル名 RENAME TO 新テーブル名;++

-- ◎カラム名のリネーム
-- ALTER TABLE テーブル名 RENAME 旧カラム名 TO 新カラム名;

CREATE TABLE shohin(
--列定義
shohin_id char(4) NOT NULL
, shohin_mei varchar(100) NOT NULL
, shohin_bunrui varchar(32) NOT NULL
, hanbai_tanka INTEGER
, shiire_tanka INTEGER
, torokubi date
, PRIMARY KEY (shohin_id));
-- 主キーについては、複数記入することで複合キーとして指定できる

DROP TABLE shohin;