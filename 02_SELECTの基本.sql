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
 -- ※非推奨となる場合があります
 
 
 
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
    
-- ■検索結果から重複行を取り除く
-- DISTINCT キーワードをSELECTの後につけると重複を除いて出力してくれる
SELECT DISTINCT
    shohin_bunrui 
FROM 
    shohin;

-- レコードのすべての列の値が同じ場合、重複行とみなす
SELECT DISTINCT 
    shohin_bunrui 
    ,torokubi 
FROM
    shohin;

-- DISTINCTはSELECT句の直後に書く
-- 途中に書くことはできない
SELECT 
 shohin_bunrui
 ,DISTINCT torokubi -- 実行エラーになる
FROM
 shohin;

SELECT DISTINCT 
-- shohin_mei 
 shiire_tanka 
FROM
 shohin;


-- ■行の絞込み
-- WHERE
 
-- shohinテーブルの「商品ID」と「商品名」を検索する
-- 「商品ID」が「0008」の行を取得する
 SELECT 
 shohin_id 
 ,shohin_mei 
 FROM
 shohin
 WHERE 
 shohin_id = '0008';
 
 -- WHERE句に書ける条件はSELECTで指定していない列も指定することが出来る
 
 
 
 -- shohinテーブルから「商品分類」が「事務用品」の「商品ID」と「商品名」を取得する
SELECT 
shohin_id
,shohin_mei
FROM
shohin
WHERE 
shohin_bunrui = '事務用品'
;

-----------------------------------------------------------------
-- ■句を書く順序
-- SELECT句
-- FROM句 
-- WHERE句


-- ■句を処理する順序
-- コンピュータ（DBMS）が処理する順序
-- ①FROM句 →テーブルを選択する
-- ②WHERE句 →行を選択する（絞り込む）
-- ③SELECT句 →列を選択する


-- 演算子
-- ■算術演算子
-- 四則演算

-- nullとの算術演算
-- ※nullと演算すると結果はnullになる
SELECT 
shohin_mei 
,hanbai_tanka 
,hanbai_tanka * 2 AS "2倍の販売単価"
,shiire_tanka 
,shiire_tanka * 2 AS "2倍の仕入単価"
FROM
shohin;


-- （　）を使うと先に計算を行うことが出来る
SELECT 
shohin_mei 
,hanbai_tanka 
--,hanbai_tanka * 2 + 1 AS "2倍の販売単価"
,hanbai_tanka * (2 + 1) AS "2倍の販売単価"
FROM
shohin;



-- ■比較演算子
-- 演算結果が真偽値型になる
-- true/false になる

SELECT 
 1 = 1 --左辺と右辺が同じ
 ,1 <> 2　--左辺と右辺が異なる
 ;






