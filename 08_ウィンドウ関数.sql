 -- ■ウィンドウ関数
 -- ■オーラップ(OLAP)関数
 -- データを分析するために使用する関数
 
 -- ■順位をつける
 -- RANK() OVER(ORDER BY 列名 ASC(昇順)/DESC(降順))
 -- 同順位が存在する場合、同順位のレコードの数だけ次の順位をとばす 
 -- (例）6位,6位,8位…（7位を飛ばす）
 
 -- shohinテーブルの中で「販売単価」が「低い順」(昇順)
 -- OVERの中に入っているORDER BY句は
 -- 「販売単価の安い順（昇順）」でランキングする、という基準を設定している
 SELECT
 shohin_mei
 ,shohin_bunrui 
 ,hanbai_tanka 
 ,RANK() OVER(ORDER BY hanbai_tanka ASC) AS RANKING
 FROM 
  shohin
 ORDER BY 
   RANKING DESC --検索結果を並べ替えるためのORDER BY
;

-- ■グループ内で順位をつける
-- PARTITION BY
  SELECT
 shohin_mei
 ,shohin_bunrui 
 ,hanbai_tanka 
 ,RANK() OVER(PARTITION BY shohin_bunrui ORDER BY hanbai_tanka ASC) AS RANKING
 --OVERの中に入っているORDER BYは
 --「商品分類別に」「販売単価の安い順(昇順）」でランキングする、という基準を設定している
 FROM 
  shohin
;

-- ■複数の列でグループ分けもできる！
-- 「学年」でみたテストの点数のランキング
-- RANK() OVER(PARTITION BY 学年 ORDER BY test_tensu DESC)

-- 「学年」と「クラス」でみたテスト点数のランキング
-- RANK() OVER(PARTITION BY 学年,クラス ORDER BY test_tensu DESC) 
-- ※ PARTITION BYにカンマ区切りで複数の列を指定できる


-- ■順位をつける
-- DENSE_RANK() OVER(ORDER BY 列名 ASC/DESC)
-- 同順位が存在していても、同順位のレコードの数だけ順位を飛ばさない
-- (例) 6位,6位,7位… (7位を飛ばさない)

SELECT
 shohin_id 
 ,shohin_mei 
 ,hanbai_tanka  
 ,DENSE_RANK() over(ORDER BY hanbai_tanka DESC) AS ranking
FROM 
 shohin
;

-- 第2ソートキーを指定する
-- 【第1ソート：販売単価が高いランキング】
-- (同順位がいたら…)【第2ソート：商品IDの小さいランキング】
-- 第2ソートキーに「主キー制約」の付いた列を指定すると、必ず同順位を無くすことが出来る

SELECT
 shohin_id 
 ,shohin_mei 
 ,hanbai_tanka  
 ,DENSE_RANK() over(ORDER BY hanbai_tanka DESC,shohin_id ASC) AS ranking
FROM 
 shohin
;


---------------------------------------------------------------------------------------
-- ■集約関数をウィンドウ関数として使う

-- 通常の集約関数
SELECT 
 sum(hanbai_tanka)
FROM 
 shohin
;

--SUM関数(集約関数)をウィンドウ関数として使ってみる！
--現在行までのデータを対象に集計(累計)する

SELECT
 shohin_id 
 ,shohin_mei 
 ,hanbai_tanka 
 ,sum(hanbai_tanka) over(ORDER BY shohin_id ASC) AS ranking -- 累計を求める
FROM 
 shohin
;


SELECT
 shohin_id 
 ,shohin_mei 
 ,hanbai_tanka 
 ,sum(hanbai_tanka) OVER(ORDER BY shohin_id ASC)
 --商品IDを昇順に並べて、順に合計(累計)していく
 ,avg(hanbai_tanka) OVER(ORDER BY shohin_id ASC) 
 --商品IDを昇順に並べて、順に平均(累計)していく
 ,max(hanbai_tanka) OVER(ORDER BY shohin_id ASC) 
 --商品IDを昇順に並べて、その行までの範囲内で最大値(暫定)を出していく
FROM 
 shohin
;


-- ■ウィンドウ関数の集計は荷は動的な指定が可能
-- ■移動平均を求める
-- PRECEDING…前の
-- FOLLOWING…後の

SELECT
 shohin_id 
 ,shohin_mei 
 ,hanbai_tanka 
 --■1行前～現在行までの範囲
 ,avg(hanbai_tanka) OVER(ORDER BY shohin_id ASC ROWS 1 PRECEDING)
 --■2行前～現在行までの範囲
 ,avg(hanbai_tanka) over(ORDER BY shohin_id ASC ROWS 2 PRECEDING)
 --■1行前～現在行～1行後までの範囲
 ,avg(hanbai_tanka) OVER(ORDER BY shohin_id ASC
                        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) 
FROM 
 shohin
;














