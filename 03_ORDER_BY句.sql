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


-- ■










