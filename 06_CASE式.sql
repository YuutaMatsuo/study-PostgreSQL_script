-- ■CASE式
-- 条件分岐

-- ■検索CASE式
-- Javaのif else-if else文とほぼ同じ


SELECT
 shohin_id 
 ,shohin_mei 
 ,hanbai_tanka 
 ,shiire_tanka 
 ,hanbai_tanka - COALESCE (shiire_tanka,0)  AS "利益"
 ,CASE 
--    -WHEN 条件式 THEN (値、式)
-- ※条件式に対してTRUEとなれば、THE句で指定された式や値が戻る
  WHEN hanbai_tanka - COALESCE (shiire_tanka,0) >= 1000
  THEN 'すごく儲かる商品'
-- 利益が500円以上の商品は「そこそこ儲かる商品」とする
  WHEN hanbai_tanka - COALESCE (shiire_tanka,0) >= 500
  THEN 'そこそこ儲かる商品'
  -- 利益が500円未満の商品は「儲からない商品」とする
  WHEN hanbai_tanka - COALESCE (shiire_tanka,0) < 500
  THEN '儲からない商品'
 END
 ,CASE
    WHEN hanbai_tanka - coalesce(shiire_tanka,0) >= 1000
    THEN 'すごく儲かる商品'
    WHEN hanbai_tanka - COALESCE (shiire_tanka,0) >= 500
    THEN 'そこそこ儲かる商品'
    ELSE
        '儲からない商品'
 END
FROM 
 shohin s 
;

-- ■条件ごとに異なるカラム（列）を使用することが出来る
SELECT 
 CASE 
     WHEN name = 'minato' --name列を条件①に含める
     THEN 'みなと'
     WHEN age >= 20 --age列を条件②に含める
     THEN '大人'
 END
 FROM 
  test
;

-- ■単純CASE式
-- Javaのswitch文とほぼ同じ
SELECT
 shohin_id 
 ,shohin_mei 
 ,shohin_bunrui 
 -- 単純CASE式
  ,CASE shohin_bunrui
      WHEN '衣服' 
      THEN 'A'
      WHEN '事務用品'
      THEN 'B'
      WHEN 'キッチン用品'
      THEN 'C'
  END
  -- ●検索CASE式で書くと…
  ,CASE 
      WHEN shohin_bunrui = '衣服'
      THEN 'A'
      WHEN shohin_bunrui = '事務用品'
      THEN 'B'
      WHEN shohin_bunrui = 'キッチン用品'
      THEN 'C'
  END
FROM 
 shohin s 
;

-- ■CASE式はネストできる
SELECT
 CASE --外側のCASE式
     
  WHEN gender = '男'
  THEN
   CASE --内側のCASE式 
    WHEN age >= 18
    THEN '結婚できる'
    ELSE '結婚できない'
   END
   
  WHEN gender = '女'
  THEN
   CASE --内側のCASE式 
    WHEN age >= 16
    THEN '結婚できる'
    ELSE '結婚できない'
   END 
   
 END
;

--■WHEN句は複数の条件を書ける
SELECT 
 CASE 
  WHEN gender = '男' AND age >= 18
  THEN '結婚できる'
  WHEN gender = '女' AND age >= 16
  THEN '結婚できる'
  ELSE '結婚できない'
 END
;










