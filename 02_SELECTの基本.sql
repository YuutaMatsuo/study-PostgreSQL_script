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


---------------------------------------------------------------

-- ○演算子
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
 ,2 > 1 --左辺が右辺よりも大きい
 ,2 >= 1 --左辺が右辺以上
 ,2 < 1 --左辺が右辺よりも小さい
 ,2 <= 1 --左辺が右辺以下
 ;

 
-- ■販売単価が1000円以上の商品を取得する
 SELECT 
 shohin_id 
 ,shohin_mei 
 ,hanbai_tanka 
 FROM
 shohin
 WHERE
 hanbai_tanka >= 1000;


-- ■販売単価が1000円未満の「商品ID」「商品名」「販売単価」
 SELECT 
 shohin_id AS "商品ID"
 ,shohin_mei AS "商品名"
 ,hanbai_tanka AS "販売単価"
 FROM
 shohin
 WHERE 
 hanbai_tanka < 1000
 ;


 --■登録日が2009-09-27より前の商品を取得する
 SELECT
 shohin_id AS "商品ID" 
 ,shohin_mei AS "商品名" 
 ,torokubi AS "登録日"
 FROM 
 shohin
 WHERE 
 torokubi < '2009-09-27' --日付はシングルクォーテーションで囲む
 ;
 
 --■登録日が「2009-09-27」以降の商品を取得する
 SELECT
 shohin_mei AS "商品名"
 ,torokubi AS "登録日"
 FROM 
 shohin
 WHERE 
 torokubi >= '2009-09-27'
 ;
 
 --検索条件にnullが含まれている場合、除外されてしまう
 --nullに比較演算子は使えない
 SELECT 
 *
 FROM
 shohin
 WHERE
 shiire_tanka > 500
 ;
 
 
 --NULL値との比較
 -- ※NULL値には比較演算子が使えない！
 -- IS NULL → NULLであればtrue
 -- IS NOT NULL → NULL以外であればtrue
 
 --■仕入単価がnullの商品を取得する
 SELECT
 shohin_id AS "商品ID"
 ,shohin_mei AS "商品名"
 ,shiire_tanka AS "仕入単価"
 FROM shohin
 WHERE 
 shiire_tanka IS NULL
 -- shiire_tanka = nullと書かない  --unknown(不明)
 ;
 
 --■仕入単価がnull以外の商品を取得する
 SELECT 
 shohin_id AS "商品ID"
 ,shohin_mei AS "商品名"
 ,shiire_tanka AS "仕入単価"
 FROM shohin
 WHERE 
 shiire_tanka IS NOT NULL 
 ;
 
 --■SQLの真偽値型
 -- 1 = 1 → true
 -- 1 = 2 → false
 -- 1 = null → unknown(不明)
 
 --WHERE句でレコードを取得する条件
 -- 条件式の比較結果がtrueのレコードを取得する
 -- 条件式の比較結果がfalse,unknown（不明）のレコードを取得しない
 
 --■比較演算子で比較できるもの
 SELECT 
 2 > 1 --整数 → OK
,2.0 > 1 --小数 → OK
,'2024-01-24' < '2024-01-25' --日付 → OK
,'a' > 'b'
,'a' < 'b'
,'ab' > 'ab'
,'ab' < 'ab'
,'11' > '2' --文字列 → OK
--,'a' > 1 --文字列と整数 → NG
--,'2024-01-25' > 1 --日付と整数 → NG
 ;
 
 --■同じデータ型同士であれば比較できる
 --■異なるデータ型同士だと比較できない
 --  整数型と小数型は例外的に比較できる
 
 SELECT 
*
FROM chars
WHERE
chr > '2'
;

-----------------------------------------------------------------------

--○論理演算子
-- 評価結果 → 真理値型

--■Javaの論理演算子
--&& → AND
--|| → OR
--!  → NOT

--■ 商品分類が「キッチン用品」かつ、販売単価が「1000円以上」

SELECT 
shohin_id AS "商品ID"
,shohin_mei AS "商品名"
,shohin_bunrui AS "分類"
,hanbai_tanka AS "単価"
FROM shohin
WHERE 
shohin_bunrui = 'キッチン用品' --条件式①
AND --かつ
hanbai_tanka >= 1000 -- 条件式②
;

--■ 商品分類が「キッチン用品」または、販売単価が「1000円以上」

SELECT 
shohin_id 
,shohin_mei 
,shohin_bunrui 
,hanbai_tanka 
FROM shohin 
WHERE 
shohin_bunrui = 'キッチン用品'
OR 
hanbai_tanka >= 1000
OR --複数でもOK
shiire_tanka >= 500
;

--■ 商品分類「事務用品」かつ、登録日が「2009-09-11」または「2009-09-20」
--SELECTするのは「商品ID」「商品名」「商品分類」「登録日」

SELECT 
shohin_id AS "商品ID"
,shohin_mei AS "商品名"
,shohin_bunrui AS "分類"
,torokubi AS "登録日"
FROM shohin 
WHERE 
shohin_bunrui = '事務用品'
AND 
(torokubi = '2009-09-11' OR torokubi = '2009-09-20')
;

-- この書き方だと意図しない結果が出力されてしまう
SELECT 
shohin_id AS "商品ID"
,shohin_mei AS "商品名"
,shohin_bunrui AS "分類"
,torokubi AS "登録日"
FROM shohin 
WHERE 
shohin_bunrui = '事務用品'
AND -- AND演算子の方がOR演算子よりも優先される為
torokubi = '2009-09-11' 
OR
torokubi = '2009-09-20'
;

-- ■（）で優先順位を変更できる

-- ■NOT演算子
SELECT 
*
FROM shohin 
WHERE 
--商品分類が「事務用品」以外のレコードを取得したい
--shohin_bunrui = '事務用品'
-- <>を使うパターン
--shohin_bunrui <> '事務用品'
-- NOTを使うパターン
-- NOT shohin_bunrui = '事務用品'
-- NOTは重ねることもできる（あまり使わない）
NOT NOT shohin_bunrui = '事務用品'
;










