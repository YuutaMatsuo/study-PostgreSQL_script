-- ■データベースを削除
-- DROP DATABASE データベース名;
-- 例）DROP DATABASE shop;

-- ■テーブルを削除
-- DROP TABLE テーブル名
-- 例）DROP TABLE shohincopy;

-- ■データの削除
-- ◆DELETE文（DML、データ操作言語）※探索をしながら削除をする為DROPと比較すると処理が遅い
-- DELETE FROM テーブル名;
-- 処理対象は1テーブルのみ

DELETE FROM shohincopy ;

-- ■条件を設定して削除する
-- ■探索型DELETE
DELETE FROM shohinins 
WHERE 
torokubi >= '2024-01-01'
;

--------------------------------------------------------------------------------------------

--■ データの削除処理

--■物理削除
-- DELETE文で削除
--■論理削除
--UPDATE文で更新 























































