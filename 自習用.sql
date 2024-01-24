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
