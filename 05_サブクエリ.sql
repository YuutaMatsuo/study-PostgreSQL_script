-- ■サブクエリ
-- 副問い合わせ

SELECT 
 *
FROM 
 shohin 
 ;

SELECT 
 -- サブクエリ名.列名
 sub_shohin.shohin_bunrui
FROM 
(
-- サブクエリ、副問い合わせ
 SELECT --サブクエリに書いたSELECT文を実行した結果
  shohin_bunrui
  ,count(*) AS cnt
 FROM 
  shohin 
 GROUP BY 
  shohin_bunrui
)AS sub_shohin --サブクエリの名前
WHERE 
sub_shohin.cnt >= 3
;

------------------------------------------------------------------------------------

-- ■スカラクエリについて

-- ■通常のクエリ
SELECT 
*
FROM 
shohin --6列8行の結果が戻り値として返ってくる
;

-- ■スカラクエリ
SELECT 
shohin_mei 
FROM 
shohin 
WHERE 
shohin_id = '0001' --1列1行の結果が戻り値として返ってくる
;

-- ■販売単価が平均販売単価以上のレコードを取得したい
-- 今までだったら…
SELECT 
avg(hanbai_tanka) -- 平均を出す
FROM 
shohin  --2097.5
;

SELECT 
*
FROM 
shohin 
WHERE 
hanbai_tanka >= 2097.5 --計算した平均単価以上のデータを絞込み
;

-- スカラサブクエリを使うと…
SELECT 
*
FROM 
shohin 
WHERE 
hanbai_tanka >= (
                    SELECT avg(hanbai_tanka) 
                    FROM shohin
                )
;












