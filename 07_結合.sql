-- ■結合
-- ■INNER JOIN(内部結合)
-- 「INNER JOIN」と「ON」を使う
-- ■店舗商品のレコードと、該当する商品の商品情報を一緒に取得する
-- ■片方のテーブルにしかないレコードは除外される

SELECT 
 ts.tenpo_id 
 ,ts.shohin_id 
 ,s.shohin_id 
 ,s.shohin_mei 
-- ,shohin_id -- テーブル名を指定しないとエラーになる
FROM -- テーブルに別名をつけるとSELECT句でも使えるようになる
 tenposhohin AS TS --別名をつける
 INNER JOIN --2つのテーブルを「内部結合」する
 shohin AS S -- 別名をつける
--結合条件を書く (結合キー)
 ON
 ts.shohin_id = s.shohin_id 
;

-- 番外
SELECT 
FROM 
 shohin s ; --これもshohinテーブルに別名をつけていた！ASは省略する事が出来る































