
ホワイトボード メモ

述語…「主語」をより詳しくするもの

    主語 WHERE（絞込み）
    述語 LIKE BETWEEN  WHERE句を主語として、絞込みを行う際により詳しくするもの
            AND OR も述語の一種


-- ■述語
-- ■LIKE
-- 文字列の部分一致検索
-- あいまい検索

-- ■完全一致検索
-- samplelikeテーブルの「strcol列」が「abcdd」であるものを検索する    
SELECT 
 strcol
FROM 
 samplelike s
WHERE
 strcol = 'abcdd'
;


-- ■LIKE検索
-- パターンマッチング
-- ■完全一致検索
SELECT 
 strcol
FROM 
 samplelike s
WHERE
 strcol LIKE  'abcdd' --LIKE述語を使ってみる ＝と同じ結果が返ってくる
;

-- ■部分一致検索
-- 「abc」から始まる文字列をあいまい検索したい
-- %は任意の長さの文字列(0文字以上)

-- ■前方一致検索
SELECT
 strcol 
FROM 
 samplelike s 
WHERE 
 strcol LIKE 'abc%' --ワイルドカードを後ろにつけることで前方一致検索になる
;

-- ■後方一致検索
SELECT
 strcol 
FROM 
 samplelike s 
WHERE 
 strcol LIKE '%c' --ワイルドカードを後ろにつけることで前方一致検索になる
;

-- ■中間一致検索
SELECT
 strcol 
FROM 
 samplelike s 
WHERE 
 strcol LIKE '%ddd%' --ワイルドカードを両方につけることで中間一致検索になる
;

-- ■前方一致検索
-- 「abc」から始まる5文字の文字列
-- 「 _ 」は任意の1文字
SELECT
 strcol 
FROM 
 samplelike s 
WHERE 
 strcol LIKE 'abc__' --abcの後に何か２文字
;

SELECT 
FROM 
 escape_str
WHERE 
;

-- おまけ(特別な意味を持つ文字の扱い)
SELECT
 *
FROM 
 escape_str
WHERE 
-- esc_str LIKE '%%%' --任意の長さの文字列を何でも検索してしまう…
--esc_str LIKE '%0%%' ESCAPE '0' --「%」を含む文字列を検索することが出来る!
esc_str NOT  LIKE '%0%%' ESCAPE '0' --NOTつけることで反転させることが出来る
;

----------------------------------------------------------------------------
-- ■BETWEEN
-- 上限値、下限値を指定して範囲検索
-- ■販売単価が1000円以上、かつ、3000円以下

--いままでの方法
SELECT
 *
FROM
 shohin s
WHERE 
 hanbai_tanka >= 1000
 AND 
 hanbai_tanka <= 3000
;

--BETWEENを用いた方法
SELECT 
 *
FROM 
 shohin s 
WHERE
-- 列名 BETWEEN 下限値 AND 上限値
-- 下限値と上限値の位置は必ず守る（入れ替え不可）
 hanbai_tanka BETWEEN 1000 AND 3000
-- hanbai_tanka BETWEEN 1000 AND 3000 --3000円以上かつ1000円以下になってしまう

-- BETWEENを使わない方がいいパターン
-- 販売単価が1000円より大きい、かつ、3000円未満
-- hanbai_tanka BETWEEN 1001 AND 2999 --販売単価が1001円以上かつ2999円以下を表す
 
-- この書き方の方が分かりやすい
-- hanbai_tanka > 1000
-- AND
-- hanbai_tanka < 3000
;

-- ■BETWEENが使えるデータ型
SELECT
 *
FROM 
 shohin s 
WHERE
 -- 数値型
-- hanbai_tanka BETWEEN 100 AND 2000 --OK!
 -- 文字列型
-- shohin_id BETWEEN '0002' AND '0005' --OK!
 -- 日付型
 torokubi BETWEEN '2009-09-01' AND '2009-09-30' --OK!
-- torokubi BETWEEN '2009.01.01' AND '20010.12.31' -- 区切りに.を使っても動作した
;

-- ■BETWEENを使わずに「2009年9月」のレコードを取得する
SELECT 
 *
FROM 
 shohin s 
WHERE 
 EXTRACT (YEAR FROM torokubi) = 2009
 AND 
 EXTRACT (MONTH FROM torokubi) = 9
;

-- ■NOT BETWEEN
SELECT
 *
FROM 
 shohin s 
WHERE 
-- torokubi NOT BETWEEN '2009-09-01' AND '2009-09-30'
 NOT torokubi BETWEEN '2009-09-01' AND '2009-09-30' -- 先頭につけても同じ結果が返ってくる
;

---------------------------------------------------------------------------------------

-- ■IS NULL
-- ■IS NOT NULL
-- NULL値は=などで比較ができない
SELECT 
 *
FROM 
 shohin s 
WHERE 
-- shiire_tanka IS NULL -- ■仕入単価がNULLのレコ―ドを取得する
 shiire_tanka IS NOT NULL -- ■仕入単価がNULLではないレコードを取得する 
;

--------------------------------------------------------------------------------------

-- ■IN
-- 範囲検索
-- 上限値、下限値を指定できない場合の検索
-- （例）血液型
-- A,B,O,AB 　どれが上限値と下限値なのか分からない…

-- ■商品IDが「0001」「0003」「0007」のいずれかに一致する
SELECT
 *
FROM 
 shohin s 
WHERE 
 -- 列名 IN (指定したい値をカンマ区切りで)
 shohin_id IN ('0001','0003','0007')
-- shohin_id NOT IN ('0001','0003','0007') -- NOT INにすると条件を反転させることが出来る

--shiire_tanka IN (500, 320 , 2800) --INTEGER型の者も選択できる 
--shiire_tanka NOT IN (500, 320 , 2800)

-- shiire_tanka IN (500, NULL , 2800) -- IN述語にNULLは書けるが、処理されない(使えないものと考える)
--  shiire_tanka NOT IN (500, NULL , 2800)  -- NOT IN述語のNULL禁止
;


























