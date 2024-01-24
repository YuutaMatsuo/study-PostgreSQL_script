-- 検索処理
-- ■SELECT文
--→ query,クエリ
--→ 問い合わせ

-- ◆SELECT 列名 FROM テーブル名;
-- SELECT句
SELECT shohin_id
-- FROM句
FROM shohin;

SELECT
 shohin_mei
 ,hanbai_tanka
 FROM
 shohin;
 
-- ◆現在日付
 SELECT
  current_date
  ; -- FROM句は省略できる
 
-- ■複数の列を取得する
-- SELECT 列名１,列名２ FROM テーブル名
  
-- shohinテーブルから「商品ID」と「商品名」の列を検索する
  
SELECT shohin_id,shohin_mei
FROM shohin;
  
-- ■同じ列を複数回取得する

SELECT shohin_id,shohin_id,shohin_mei
FROM shohin;
    
 SELECT shohin_mei,hanbai_tanka ,shohin_mei,shiire_tanka
 FROM shohin;
 
 
 -- ■すべての列を取得する
 SELECT 
 shohin_id 
 ,shohin_mei 
 ,shohin_bunrui 
 ,hanbai_tanka 
 ,shiire_tanka
 FROM shohin;
 
 -- 省略記法
 SELECT 
 *
 FROM 
 shohin tablee
 -- ※非推奨となる場合となります
 
 
 
 -- ■列名に別名をつける
 -- 日本語をつけるときはダブルクォーテーションで囲む
 SELECT 
    shohin_id AS "商品ID"
    ,shohin_mei AS "商品名"
    ,shohin_id AS id
--    ,shiire_tanka AS '仕入単価' 実行エラーになる　シングルクォートの為
    ,shiire_tanka AS "仕入単価"
 FROM 
    shohin;
    

-- ■定数を出力する
SELECT 
    shohin_mei AS "商品名"
    ,hanbai_tanka AS "販売単価"
    ,'2024-01-25' AS "発売日"
    ,'1'
FROM 
    shohin;