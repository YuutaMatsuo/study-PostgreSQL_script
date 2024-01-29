--グループの絞込み

--■WHERE句
-- レコード単位で絞込む
--■HAVING句
-- グループ単位で絞り込む

--商品テーブルを「商品分類」ごとに分けて、データ数を数えたい
--SELECTするのは「商品分類」と「データ数」
SELECT 
shohin_bunrui AS "商品分類"
,count(shohin_id) AS "データ数"
FROM shohin
GROUP BY
shohin_bunrui 
;

--商品テーブルを「商品分類」ごとに分けて、データ数を数えた結果、3件以上の商品分類を確認したい
--SELECTするのは「商品分類」と「データ数」

SELECT
shohin_bunrui AS "商品分類"
,count(*) AS "データ数"
FROM shohin
GROUP BY
shohin_bunrui 
HAVING
count(*) >= 3 --集約結果に対して絞込みを行う
;


--「問題」
--商品テーブルの中で「販売単価が500円以上である商品」を
--「商品分類」ごとに分けて、データ数を数えた結果、3件以上の商品分類を確認したい
-- SELECTするのは「商品分類「と「データ数」

SELECT --どんな列を出力するか
shohin_bunrui AS "商品分類" 
,count(*) AS "データ数"
FROM shohin --どのテーブルを対象とするか
WHERE --対象（レコード）に対してどんな絞り込みをするか
hanbai_tanka >= 500
GROUP BY --どの列を基準としてグループ分けするか
shohin_bunrui 
HAVING --結果(グループ)に対してどんな絞り込みをするか
count(*) >= 3
;


--■HAVING句に掛けるもの
-- 定数
-- 集約関数
-- GROUP BY句で指定されている列名

--■HAVING句の絞込み条件は複数指定できる
SELECT
shohin_bunrui 
,count(*) 
FROM shohin
GROUP BY
shohin_bunrui
HAVING 
count(*) >= 2
AND --WHERE句と同じように「論理演算子」を使用する！
shohin_bunrui = 'キッチン用品'
--AND 
--hanbai_tanka > 1000 --エラーになる(GROUP BY句で指定されていない列名の為)
; --1件出力される































