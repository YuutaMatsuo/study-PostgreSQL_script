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

--------------------------------------------------------------------------------------
 
-- ■テーブルの記載順序を入れ替えてみる
-- テーブルの記載順序を入れ替えても、検索結果は同じ

SELECT 
 ts.tenpo_id 
 ,ts.shohin_id 
 ,s.shohin_id 
 ,s.shohin_mei 
-- ,shohin_id -- テーブル名を指定しないとエラーになる
FROM -- テーブルに別名をつけるとSELECT句でも使えるようになる
 shohin AS S
 INNER JOIN --2つのテーブルを「内部結合」する
 tenposhohin AS TS --別名をつける -- 別名をつける
--結合条件を書く (結合キー)
 ON
 ts.shohin_id = s.shohin_id 
;

-- ■複数のテーブルを結合できる
-- INNER JOINで１つずつ結合
-- Aテーブル INNER JOIN Bテーブル INNER JOIN Cテーブル

-- 実行順序
-- Aテーブル INNER JOIN Bテーブル → A+B  ※テーブルの結合につき1つのON句が必要
-- A+B INNER JOIN Cテーブル → A+B+C

SELECT 
 *
FROM 
 --Aテーブル
 tenposhohin AS TS
INNER JOIN 
 --Bテーブル
 shohin AS S
ON --A+Bの結合条件 
 TS.shohin_id = s.shohin_id -- ここまでが先に結合される
INNER JOIN                  -- 上の結合が行われた後に下と結合される
 --Cテーブル
 shohin2 AS S2
ON --A+BとCの結合条件
 S.shohin_id = S2.shohin_id -- 左辺のS.shohin_idはTS.shohin_idでも問題ない 
;


-- tenposhohinテーブルとshohin2テーブルを「shohin_id」で照合し内部結合する
SELECT 
 * --すべてのテーブルのすべての列を表示する
 ,TS.* --tenposhohinテーブルのすべての列
 ,s2.* --shohin2テーブルのすべての列
FROM 
 tenposhohin TS
INNER JOIN 
 shohin2 S2
ON
 TS.shohin_id  = S2.shohin_id 
;

-- ■各テーブルから必要な列を取得する
SELECT 
 --テーブル名(別名).列名
 TS.tenpo_id    --片方のテーブルにしか存在しない列（テーブル名の指定なしでもOK！） 
 ,S2.shohin_id  -- shohin_id列が複数存在する(この場合エラー(取得元を特定できない))
 ,shohin_mei 
FROM 
 tenposhohin TS
INNER JOIN 
 shohin2 S2
ON
 TS.shohin_id  = S2.shohin_id 
;


-- 結合に「WHERE句」を使ってみる
-- tenposhohinテーブルとshohinテーブルを[shohin_id]で結合
-- さらに、「東京支店」が取り扱う商品一覧を返す
SELECT 
 *
FROM 
 tenposhohin TS
INNER JOIN 
 shohin S
ON 
 TS.shohin_id = S.shohin_id 
WHERE 
  TS.tenpo_id = '000A' --東京支店で絞り込む
;












