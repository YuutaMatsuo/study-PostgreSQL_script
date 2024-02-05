6章 練習問題

問１.
①
 穴あけパンチ 320,おろし金 790 が出力される 

SELECT
 shohin_mei 
 ,shiire_tanka 
FROM 
 shohin s 
WHERE 
 shiire_tanka NOT IN (500, 2800, 5000)
;

②
穴あけパンチ 320,おろし金 790 が出力される 
-- × NULLが含まれているためエラーにはならないが何も出力されない

SELECT
 shohin_mei 
 ,shiire_tanka 
FROM 
 shohin s 
WHERE 
 shiire_tanka NOT IN (500, 2800, 5000, NULL)
;

問２
 
-- 自力で解けず…
-- SELECT
--    count(*) AS low_price
--    ,count(*) AS mid_price
--    ,count(*) AS high_price
-- FROM 
--  shohin
-- GROUP BY 
--  CASE 
--    WHEN hanbai_tanka <= 1000 
--    THEN 'low_price'
--    WHEN hanbai_tanka <= 3000
--    THEN 'mid_price'
--    WHEN hanbai_tanka >= 3001
--    THEN 'high_price'
--  END
-- ;

-- 解答
SELECT 
 sum(CASE 
      WHEN hanbai_tanka <= 1000
      THEN 1 ELSE 0 
     END) AS low_price
  ,sum(CASE 
      WHEN hanbai_tanka BETWEEN 1001 AND 3000
      THEN 1 ELSE 0 
     END) AS mid_price
  ,sum(CASE 
      WHEN hanbai_tanka >= 3001
      THEN 1 ELSE 0 
     END) AS high_price
FROM 
 shohin s 
;




















