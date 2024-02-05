-- ■集合演算
-- ■行方向に集計結果を取得する （同じカラムを持つ複数のテーブルを集計する）
-- ■UNION

-- ■shohinテーブルから検索
SELECT
 *
FROM 
 shohin;

-- ■shohin2テーブルから検索
SELECT
 *
FROM 
 shohin2;

 
-- ■shohinテーブルの検索結果+shohin2テーブルの検索結果
-- ■UNIONは重複行を取り除く 
SELECT 
 *
FROM 
 shohin
UNION --2つのSELECT文の間に書くことで、2つのテーブルを足し合わせてくれる
SELECT
 *
FROM 
 shohin2
ORDER BY --ORDER BYは最後に一つだけ付与できる
 shohin_id ASC 
 ;

-- ■UNIONで複数のSELECT文の検索結果を足せる
-- Aテーブル+Bテーブル+Cテーブル
-- SELECT文1 + SELECT文2 → クエリA
-- クエリA + SELECT3 → クエリB 
 
 SELECT 
 *
 FROM 
  Aテーブル
 UNION 
 SELECT 
 *
 FROM 
  Bテーブル
 UNION 
 SELECT 
 *
 FROM 
  Cテーブル
;

-- ■重複行を遺したい場合
-- UNION ALL を使用する

SELECT 
 *
FROM 
 shohin
UNION ALL --2つのSELECT文の間に書くことで、2つのテーブルを足し合わせてくれる
SELECT
 *
FROM 
 shohin2
ORDER BY --ORDER BYは最後に一つだけ付与できる
 shohin_id ASC 
 ;

-- ■UNIONを使用できる条件
-- ■すべての検索結果の列数が同じであること
-- ■それぞれの列のデータ型が同じであること
--(NG例)

SELECT 
 hanbai_tanka --数値型
 ,shohin_bunrui --もう一方のSELECT文と列数が合わなくなる
FROM shohin s 
UNION 
SELECT 
 shohin_mei --文字列型 
FROM shohin2 s ;

--(対策例)cast()関数などでデータ型を変換して演算する
SELECT
-- hanbai_tanka --エラーが起きる
cast(hanbai_tanka AS text) 
FROM shohin s 
UNION 
SELECT
 shohin_mei 
FROM shohin2 s2 ;


--------------------------------------------------------------------------------
-- ■INTERSECT
-- 複数のSELECT文によるクエリの共通部分を返す

SELECT
 *
FROM 
 shohin
INTERSECT --ALLをつけても結果は変わらない
SELECT 
 *
FROM 
 shohin2 ;


-----------------------------------------------------------------------------------
-- ■EXCEPT
-- テーブル同士の引き算をする
 
SELECT 
 *
FROM 
 shohin
EXCEPT 
SELECT
 *
FROM
 shohin2 --shohinテーブル２にしかない、やかんや手袋は無視される
;

-- 対象のテーブルを逆転させると…
SELECT 
 *
FROM 
 shohin2
EXCEPT
SELECT
 *
FROM
 shohin
;

------------------------------------------------------------------------



















