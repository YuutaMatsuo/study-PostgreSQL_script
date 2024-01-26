-- ■グループ分け

--■「商品テーブル」のレコードを数える
SELECT
count(shohin_id)
FROM shohin
; --8件


--■商品分類が「キッチン用品」のレコードを数える
SELECT
count(shohin_id)
FROM shohin
WHERE 
shohin_bunrui = 'キッチン用品'
; --4件

--■商品分類ごとにレコードを数える
SELECT 
shohin_bunrui 
,count(*)
,sum(hanbai_tanka)
FROM shohin
-- 商品分類のグループごとに...
GROUP BY shohin_bunrui 
;


--■句を書く順序
--SELECT句
--FROM句
--WHERE句
--GROUP BY句

--■句を処理する順序
--FROM句
--WHERE句
--GROUP BY句
--SELECT句


--※GROUP BY句を使用した場合、SELECT句の列名に指定できる列名が制限される
-- 使用できるのは、GROUP BY句で指定した列名のみ
SELECT
--shohin_mei --エラー
shohin_bunrui --集約関数内（引数）は制限されない
,count(shohin_id)
FROM shohin
GROUP BY 
 shohin_bunrui  
;


--■NULL値は1つのグループ（NULLグループ）にまとめる
SELECT
torokubi 
,count(*) 
FROM shohin
GROUP BY torokubi 
;


--■ GROUP BY句は複数列を指定できる
-- 複数の列でグループ分けができる
SELECT 
shohin_bunrui 
,torokubi 
,count(*)
FROM shohin
GROUP BY
 shohin_bunrui
 ,torokubi
;
















