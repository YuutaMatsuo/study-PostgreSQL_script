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





































