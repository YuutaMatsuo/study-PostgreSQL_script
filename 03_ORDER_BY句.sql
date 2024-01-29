-- 検索結果の並べ替え

-- ■ORDER BY句
SELECT 
*
FROM shohin
ORDER BY -- ORDER BY句で指定をした列名「ソートキー」という
--shohin_id -- 「shohin_id列」の昇順
--shohin_id ASC -- 「shohin_id列」の昇順 ASC：「昇順」省略することもできる
shohin_id DESC -- 「shohin_id列」の降順 
;

-- ■昇順
--数値型 → 数が小さいものが前(上)にくるJ
--文字列型 → 辞書順で並べる、文字コードが小さいものが前（上）にくる
-- 日付型 → 過去の弐付けが前（上）にくる

-- ■販売単価が高い順にソートする
SELECT
*
FROM shohin
ORDER BY
hanbai_tanka DESC --高い順（降順）
;

-- ■販売単価が安い順にソートする
SELECT
*
FROM shohin
ORDER BY
hanbai_tanka ASC  --安い順（昇順）
;

-- ■仕入単価が安い順にソートする
SELECT 
*
FROM shohin
ORDER BY
shiire_tanka ASC --安い順（昇順） 
;

-- ■仕入単価が高い順にソートする
SELECT 
*
FROM shohin
WHERE 
shiire_tanka IS NOT NULL -- NULLを省く
ORDER BY
shiire_tanka DESC  --高い順（降順）
;

-- ■NULL値の並べ替え
-- デフォルトでは、NULL値は一番大きい値として処理される



-- NULL値の表示位置を先頭・末尾に指定する（応用編）※テストには出さない
SELECT 
*
FROM shohin
ORDER BY
shiire_tanka DESC NULLS LAST --NULLのレコードを末尾に配置する
;

SELECT 
*
FROM shohin
ORDER BY
shiire_tanka ASC NULLS FIRST  --NULLのレコードを先頭に配置する
;


-- ■ソートキーは複数指定できる ※第1ソートキーで並べ替えが完了したら第2ソートキーは無視される
-- カンマ（,）区切りで指定する
SELECT 
*
FROM shohin
ORDER BY
shohin_bunrui ASC --第1ソートキーの値が重複する場合は…
,torokubi ASC -- 第2ソートキーの値で並べ替え！それでも重複する場合は…
,shohin_id ASC -- 第3ソートキーで並び替え！
;


-- ■句を書く順番
--SELECT句
--FROM句
--WHERE句
--GROUP BY句
--HAVING句
--ORDER BY句

-- ■句を処理する順番
--FROM句 --どのテーブルを見るか
--WHERE句 --テーブルに対して絞込み
--GROUP BY句 --グループ分け
--HAVING句 --グループに対して絞込み
--SELECT句 --どのカラムを表示するか
--ORDER BY句 --並べ替え

SELECT
shohin_bunrui 
,count(*) AS "データ数"
FROM shohin
GROUP BY 
shohin_bunrui
ORDER BY --SELECT句でつけた別名を使用することが可能！
データ数 ASC --別名
-- shohin_id --GROUP BY句で指定していない列は使用できない！
;

-- ■列番号を使った指定方法 (非推奨) ※テストには出ない
SELECT
count(shohin_id)
,count(1)
,count(2) 
,count(3) 
,count(4) 
,count(5) 
,count(6)
,count(7)
,count(8) 
FROM shohin
;



