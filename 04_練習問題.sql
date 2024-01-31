4章練習問題

DELETE FROM  shohin;

問１
BEGIN TRANSACTION;
INSERT INTO shohin
VALUES 
('0001', 'Tシャツ', '衣服', 1000, 500, '2008-09-20');
INSERT INTO shohin
VALUES 
('0002', '穴あけパンチ', '事務用品', 500, 320, '2008-09-11');
INSERT INTO shohin
VALUES 
('0003', 'カッターシャツ', '衣服', 4000, 280, NULL );
COMMIT


























