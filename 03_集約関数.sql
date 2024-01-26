--集約関数
--（集計処理）

-- ■COUNT関数
-- データ数を数える
-- NULL値は数えない NULL値は無視

SELECT 
-- すべての列の行数を数える
count(*)
FROM shohin
; -- 結果：8件

-- ■商品ID列のデータ数
SELECT 
count(shohin_ID)
FROM shohin
; -- 結果8件

-- ■仕入単価列のデータ数
-- NULL値は数えない
SELECT 
count(shiire_tanka)
FROM shohin 
count(shohin_id)
; -- 結果：6件

--■商品分類「事務用品」のレコードを数える
SELECT 
count(shohin_id) 
FROM shohin
WHERE 
shohin_bunrui = '事務用品'
; --結果：2件


--句の処理順序
-- FROM句 8件
-- WHERE句 2件
-- SELECT句 2件

--■関数の仕様
--■COUNT（引数）
-- 引数の数：１個
-- 引数のデータ型：すべて
-- 戻り値の型：bigint → Javaのlong型

-- 実行エラー！
SELECT 
--count(shohin_id,shohin_mei)　引数に渡せるのは１つだけ
FROM shohin
;

--■SUM関数
-- 合計を求める
--■AVG関数
-- 平均を求める

--販売単価の合計を求める、仕入単価の平均値を求める

SELECT 
sum(hanbai_tanka) --結果: 16,780
,avg(shiire_tanka) --結果： 2,035（6件の平均値）※NULLが含まれているため
,sum(shiire_tanka) / count(shohin_id) --結果： 1,526（8件の平均）
FROM shohin
;

--前回の授業の復習
--■関数の仕様

--■SUM(合計)
--引数の数 → １個
--引数のデータ型 → 数値型(INTEGER)
--戻り値の型 → 整数型、小数型

SELECT
    sum(hanbai_tanka)
--    ,sum(shohin_id) --エラー 数値しか攻撃することが出来ないため
    ,sum(hanbai_tanka * 0.1) AS "消費税額" ---算術演算子を使うことが出来る！
    ,sum(hanbai_tanka * 0.3) AS "粗利益"
FROM shohin
;


--■AVG(引数)
-- 引数の数 → 1個
-- 引数のデータ型 → 数値型（INTEGER） 
-- 戻り値の型 → 整数型、小数型
-- データの中にnullがあった場合、無視される

-----------------------------------------------

--■MAX(引数)
-- 最大値を求める
--■MIN(引数)
-- 最小値を求める


SELECT
 max(hanbai_tanka) AS "販売単価の最大値" --\6,800(圧力鍋の最大値)
 ,max(hanbai_tanka - shiire_tanka) AS "純利益の最大値"
 ,max(torokubi) --日付型もOK
FROM shohin
;

SELECT
 min(shiire_tanka) AS "仕入単価の最小値" --\320(穴あけパンチの仕入単価)
 ,min(hanbai_tanka - shiire_tanka) AS "純利益の最小値"
 ,min(shohin_id) --文字列型もOK！ 
FROM shohin
;


---------------------------------------------------------------------------------
--■COUNT関数
-- データ数を数える

--■重複行を数える
SELECT  
 count(shohin_bunrui) 
FROM shohin
;

--■重複行を数えない
SELECT   
 count(DISTINCT shohin_bunrui) --商品分類のなかで、重複なしで数える
-- count(DISTINCT) shohin_bunrui
-- DISTINCT torokubi
 sum(DISTINCT hanbai_tanka) --126行目と共存することはできない テーブルの形が崩れてしまうため
FROM shohin
;

SELECT 
--count(shohin_bunrui)
shohin_bunrui 
FROM shohin;

--■引数がない関数
SELECT 
current_date --現在日付を返してくれる関数
--,current_date() --()をつけるとエラーになる
,current_time --現在の時刻を返してくれる関数
,current_timestamp --現在日時を返してくれる関数
,now() --現在日時 
--,now --()をつけないとエラーになる
;












