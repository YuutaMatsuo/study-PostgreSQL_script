--3章 練習問題

--問1.
SELECT文のなかのsum関数で商品名を指定している
GROUPBY句で商品分類を指定しているのに、SELECT文でshohin_idを指定している
WHERE句がGROUPBY句より手前にある


--問２
-- 販売単価の合計が仕入単価の合計の1.5倍より大きい商品分類を求めるSELECT文
SELECT
shohin_bunrui 
,sum(hanbai_tanka)
,sum(shiire_tanka) 
FROM shohin
GROUP BY 
shohin_bunrui 
HAVING 
sum(hanbai_tanka) > (sum(shiire_tanka) * 1.5) 
;

--問３
登録日の降順、販売単価の昇順






































