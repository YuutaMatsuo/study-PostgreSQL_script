-- ■練習問題

問１

CREATE VIEW viewrenshu5_1 (
 shohin_mei
 ,hanbai_tanka
 ,torokubi
) AS
SELECT 
 shohin_mei
 ,hanbai_tanka
 ,torokubi
FROM 
 shohin
WHERE
 hanbai_tanka >= 1000
 AND
 torokubi = '2009-09-20'
;

問２
 元テーブルの商品IDがnot null制約のためエラーとなる

問３

SELECT 
 shohin_id 
 ,shohin_mei 
 ,shohin_bunrui 
 ,hanbai_tanka 
 ,(SELECT avg(hanbai_tanka)  FROM shohin) AS hanbai_tanka_all
FROM 
 shohin
;

DROP VIEW avgtankabybunrui;

問４
CREATE VIEW avgtankabybunrui( 
shohin_id
,shohin_mei
,shohin_bunrui
,hanbai_tanka
,avg_hanbai_tanka
) AS
SELECT 
 shohin_id
 ,shohin_mei
 ,shohin_bunrui
 ,hanbai_tanka
 ,( SELECT avg(hanbai_tanka) FROM shohin AS s2 
    WHERE s1.shohin_bunrui = s2.shohin_bunrui 
    GROUP BY shohin_bunrui)
FROM 
 shohin AS s1
;




















