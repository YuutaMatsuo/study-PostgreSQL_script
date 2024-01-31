--■ ビュー
-- 作りすぎに注意（作っても2段・3段)

CREATE VIEW shohin_cnt(
-- 列名を定義する
-- データ型はSELECT文(クエリ)に依存する
shohin_bunrui　
,cnt
)AS 
-- データを取得するSQL文（SELECT）
SELECT -- 実行したクエリをしっかりとイメージすること！
 shohin_bunrui
 ,count(*) AS cnt --別名をつけるASキーワード
FROM 
 shohin
GROUP BY 
 shohin_bunrui
;

--ビュー名の変更
ALTER VIEW shouhin_cnt RENAME TO shohin_cnt;



--■ ビューを検索する
SELECT 
--ビュー名、列名
shohin_cnt.syouhin_bunrui AS "商品分類"
,shohin_cnt.cnt AS "在庫数"
FROM 
-- ここでビューを指定する
shohin_cnt
;

-- ■ビューをもとにビューを定義する（多段ビュー）
CREATE VIEW shohin_cnt2( 
--shohin_cnt2ビューとして列定義
shohin_bunrui
,cnt
)AS
SELECT 
--ビュー名,列名
shohin_cnt.shohin_bunrui
,shohin_cnt.cnt 
FROM 
-- ここで元となる「ビュー」を指定してみる
shohin_cnt
ORDER BY --並び替えは出来るが、あまり使用はしない傾向
shohin_cnt.cnt ASC
;

-- ビューに対する更新（非推奨）
INSERT INTO shohin_cnt (
 shohin_bunrui
 ,cnt
 )VALUES ( --shohinテーブルに対し、更新のしようがない…
 '家電'
 ,10 -- あくまで集約結果を表示するcnt列に値を入れることが出来ない・・・
 );

--　■ビューの削除
-- DROP VIEW ビュー名;
 DROP VIEW shohin_cnt;


CREATE VIEW shohinsum(
 shohin_bunrui
 ,cnt_shohin
) AS 
SELECT 
 shohin_bunrui
 ,count(*)
FROM shohin 
GROUP BY 
 shohin_bunrui
 ;












