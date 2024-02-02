-- 自習
CREATE TABLE test(
retu1 char(10) NOT NULL
,retu2 varchar(10)
,retu3 INTEGER NOT NULL
,retu4 date NOT NULL
,PRIMARY KEY (retu1));

DROP TABLE test;

DROP DATABASE test;


-- 復習

-- select文で取り出す
select
shohin_id as "商品ID"
,shohin_mei as "商品名"
from
shohin;

select 
shohin_mei as "商品名"
,hanbai_tanka as "価格"
from
shohin;

-- 重複を除いて取り出す
select distinct 
shohin_bunrui as "分類"
from 
shohin;

-- 登録日を出力
select distinct 
torokubi as "登録日"
from
shohin;

--練習問題
練習問題:
問題 1: 文字列関数の使用
employees テーブルの各従業員について、名前の最初の文字を大文字にし、残りの文字を小文字にするSQLクエリを書いてください。

SELECT 
name
FROM 
 employees ;

問題 2: 日付関数の使用
employees テーブルから、各従業員が会社に入社してから現在までの全日数を計算するSQLクエリを書いてください。

SELECT 
 joining_date
 ,current_date - joining_date AS "入社してからの経過日数"
FROM 
 employees ;


問題 3: 数値集計関数の使用
sales テーブルを使用して、各 customer_id ごとの総売上（amountの合計）を計算するSQLクエリを書いてください。

問題 4: 条件付き集計
employees テーブルを使用して、department ごとに salary の平均値を計算し、その平均給与が60000よりも高い部門だけを表示するSQLクエリを書いてください。

問題 5: ウィンドウ関数の使用
sales テーブルにおいて、各注文の売上がその日の平均売上額よりも高かったかどうかを示す新しいカラム（above_average）を表示するSQLクエリを書いてください。このクエリではウィンドウ関数を使用してください。

CREATE TABLE employees(
id INTEGER
,name varchar
,department varchar
,salary  INTEGER
,joining_date date
);

INSERT INTO employees (id, name, department, salary, joining_date) VALUES
(1, 'Alice Johnson', 'Sales', 50000, '2020-01-15'),
(2, 'Bob Smith', 'IT', 60000, '2019-08-01'),
(3, 'Charlie Davis', 'HR', 55000, '2021-05-23'),
(4, 'Diana Evans', 'Marketing', 65000, '2018-12-10'),
(5, 'Ethan Brown', 'IT', 70000, '2020-03-17'),
(6, 'Fiona Clark', 'Sales', 48000, '2019-07-21'),
(7, 'George Wilson', 'HR', 53000, '2020-11-05'),
(8, 'Hannah Martin', 'Marketing', 68000, '2017-03-30'),
(9, 'Ian Thompson', 'Sales', 46000, '2021-06-11'),
(10, 'Julia Scott', 'IT', 72000, '2018-09-29');












