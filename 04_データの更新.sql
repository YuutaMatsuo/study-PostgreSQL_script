-- ■データの更新
-- UPDATE文

--　★データの更新
--    ★何を更新する（テーブル）
--    UPDATE テーブル名
--    ★どのように更新する？
--    SET 更新内容


-- ■全レコードを更新する
-- ■shohininsテーブルの「登録日」を'2024-02-01'に更新する
UPDATE 
shohinins 
SET 
-- 列名 = 値
torokubi = '2024-02-01'
;

-- 登録日をUPDATE文実行日に更新する
-- SETに関数を用いることもできる
UPDATE 
shohinins 
SET 
-- 列名 = 値
torokubi = current_date 
;

--■条件をせていして、レコードを更新する
--■探索型UPDATE
--shohininsテーブルの「商品分類が'衣服'」であるレコードの、「登録日」を「2024-02-01」に更新

UPDATE 
shohinins 
SET 
torokubi ='2024-02-01'
WHERE 
shohin_bunrui = '衣服'
;


--■登録値として書くことができるもの
UPDATE 
shohinins 
SET 
-- ◆定数OK！
torokubi = '2024-03-01'
-- ◆関数OK！
torokubi = current_date 
-- ◆列名OK！
hanbai_tanka = shiire_tanka
-- ◆式OK！
hanbai_tanka = shiire_tanka *2
;


UPDATE 
shohinins 
SET 
--shiire_tanka = NULL
--hanbai_tanka  = NULL 

--★対象列にデフォルト制約がある → 初期値更新
--hanbai_tanka = DEFAULT 
--★対象列にデフォルト制約がない → NULL値更新
shiire_tanka = DEFAULT 
;

-- ■複数列を更新する その１
-- カンマ区切りで更新内容を追記することが出来る
-- ◎よく使われる記法
UPDATE 
shohinins 
SET 
hanbai_tanka = hanbai_tanka *2
,shiire_tanka = shiire_tanka /2
WHERE 
shohin_bunrui = '衣服'
;

--★構文
--UPDATE 更新対象のテーブル名
--SET 更新内容①,更新内容② 複数OK！
--WHERE 絞込み条件


--■複数列を更新する その②
UPDATE 
shohinins 
SET 
-- （更新したいすべての列リスト） = （更新するすべての値リスト）
(hanbai_tanka,shiire_tanka) = (hanbai_tanka*2,shiire_tanka/2)
WHERE 
shohin_bunrui = 'キッチン用品'
;













