-- 2章 練習問題

--問１
SELECT 
shohin_mei AS "商品名"
,torokubi AS "登録日"
FROM shohin
WHERE 
torokubi >= '2009-04-28'
;

--問２
--①
SELECT 
*
FROM shohin
WHERE 
shiire_tanka = NULL;

-- 何も返ってこない

--②
SELECT 
*
FROM 
shohin
WHERE 
shiire_tanka <> NULL

-- 何も返ってこない

--③
SELECT 
*
FROM shohin
WHERE 
shohin_mei > NULL 
;

-- 何も返ってこない

--問３

--①
SELECT 
shohin_mei 
,hanbai_tanka 
,shiire_tanka 
FROM shohin
WHERE 
(hanbai_tanka - shiire_tanka) >= 500
;

--②
SELECT 
shohin_mei 
,hanbai_tanka 
,shiire_tanka 
FROM shohin
WHERE 
NOT hanbai_tanka - shiire_tanka < 500
;

--③
SELECT 
shohin_mei 
,hanbai_tanka 
,shiire_tanka 
FROM shohin
WHERE 
NOT NOT hanbai_tanka - shiire_tanka >= 500
;

--問４
SELECT 
shohin_mei AS "商品名"
,shohin_bunrui AS "商品分類"
,hanbai_tanka * 0.9 - shiire_tanka AS "利益"
FROM shohin
WHERE 
(hanbai_tanka * 0.9 - shiire_tanka)  > 100
AND 
(shohin_bunrui = '事務用品'
OR 
shohin_bunrui = 'キッチン用品'
);







