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























