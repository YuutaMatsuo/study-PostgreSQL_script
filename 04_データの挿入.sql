--INSERT INTO <データ挿入対象のテーブル名>(列リスト ※既存の列を指定) VALUES (値リスト);

INSERT INTO shohinins 
(shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi) --列リスト
VALUES
('0001','Tシャツ','衣服',1000,500,'2009-09-20') --値リスト
;


--■登録対象の列名を書く順番は、自由に変更できる
-- 一般的には、テーブル定義の列順に合わせる
INSERT INTO shohinins 
(shohin_id, shohin_bunrui, shohin_mei, hanbai_tanka, shiire_tanka, torokubi) --列リスト
VALUES
('0001','衣服','Tシャツ',1000,500,'2009-09-20') --値リスト
;


--■登録対象の列名は省略できる(すべての列名を省略)
-- 省略をした場合、「テーブルの列順」挿入（処理をする）
-- 一般的には、省略はしない


-- 穴あけパンチ
INSERT INTO shohinins 
(shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
VALUES
('0002','穴あけパンチ','事務用品',500,320,'2009-09-11')
;


-- ■NULL値の登録
-- カッターシャツ
-- この書き方の方が見やすい
INSERT INTO shohinins 
(shohin_id
,shohin_mei
,shohin_bunrui
,hanbai_tanka
,shiire_tanka
,torokubi
)VALUES(
'0003'
,'カッターシャツ'
,'衣服'
,4000
,2800
,NULL
);


--■ NOT NULL制約のある列にNULL値を入れようとすると…
-- 包丁
INSERT INTO shohinins 
(shohin_id
,shohin_mei
,shohin_bunrui
,hanbai_tanka
,shiire_tanka
,torokubi
)VALUES(
'0004'
,'包丁'
--,NULL -- NOT NULL制約がある列は、NULL値を登録できない（実行エラー）
,'キッチン用品'
,3000
,2800
,'2009-09-20'
);


-- 圧力鍋
-- 包丁
INSERT INTO shohinins 
(shohin_id
,shohin_mei
,shohin_bunrui
,hanbai_tanka
,shiire_tanka
,torokubi
)VALUES(
'0005'
,'圧力鍋'
,'キッチン用品'
,6800
,5000
,'2009-01-15'
);


-- フォーク
-- 列名と値のペアを省略すると、該当する列にNULLが登録される（NOT NULL制約の場合はNG）
INSERT INTO shohinins 
(shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
VALUES
('0006', 'フォーク','キッチン用品', 500, NULL, '2009-09-20');

DELETE FROM shohinins 
WHERE shohin_id = '006';


-- ■DEFAULT制約
--商品ID：0009
-- ◆暗黙的な初期値の挿入方法：デフォルト制約の付いた列名と値を省略する
INSERT INTO shohinins 
(shohin_id, shohin_mei, shohin_bunrui , torokubi)
VALUES
('0009', 'マーカーペン', '事務用品', '2024-01-30')
;


--商品ID：0010
INSERT INTO shohinins 
(shohin_id 
,shohin_mei 
,shohin_bunrui 
,hanbai_tanka 
,shiire_tanka 
,torokubi 
)values( 
'0010'
,'メモ帳'
,'事務用品'
,NULL --デフォルト制約のついた列にNULLを登録してみると...？
,320
,'2024-01-24'
);


--商品ID：0011
--◆明示的な初期値の挿入方法：デフォルトの付いた列に対して、値として「DEFAULT」と記載する
INSERT INTO shohinins 
(shohin_id 
,shohin_mei 
,shohin_bunrui 
,hanbai_tanka 
,shiire_tanka 
,torokubi 
)values( 
'0011'
,'シャープペン'
,'事務用品'
,DEFAULT --デフォルト制約の付いた列に「DEFAULT」を登録してみると…？
,120 --もしデフォルト制約がついていない列に「DEFAULT」と記載をすると、NULLが登録される
,'2024-01-24'
);

-- ■データの登録
-- INSERT SELECT文
-- 他のテーブルからデータを取得して、またさらに別のテーブルへ登録する
-- SELECT文を実行して得たデータを、INSERTで追加する

-- ■Shohinテーブルから全レコードを取得してShohinCopyテーブルに登録したい！
-- <条件>
-- INSERT句の列名とSELECT句の列名の順序が対応していること
-- INSERT句の列数とSELECT句の列数が同じであること
-- INSERT句とSELECT句のそれぞれの列のデータ型が同じであること

INSERT INTO shohincopy 
-- 登録対象の列名
(shohin_id
,shohin_mei
,shohin_bunrui
,hanbai_tanka
,shiire_tanka
,torokubi 
)-- VALUES(値リスト)は使わない！
SELECT
shohin_id
,shohin_mei
,shohin_bunrui
,hanbai_tanka
,shiire_tanka 
,torokubi 
FROM shohin ;


-- ■shohinテーブルのレコードから「販売単価」を2倍にして登録する
INSERT INTO shohincopy 
(shohin_id
,shohin_mei
,shohin_bunrui
,hanbai_tanka
,shiire_tanka
,torokubi 
)
SELECT
shohin_id
,shohin_mei
,shohin_bunrui
,hanbai_tanka *2 --元の2倍の値となる
,shiire_tanka 
,torokubi 
FROM shohin ;



--■shohinテーブルから「販売単価が1000円以上」のレコードのみを登録
INSERT INTO shohincopy 
(shohin_id
,shohin_mei
,shohin_bunrui
,hanbai_tanka
,shiire_tanka
,torokubi 
)
SELECT
shohin_id
,shohin_mei
,shohin_bunrui
,hanbai_tanka
,shiire_tanka 
,torokubi 
FROM shohin ;
WHERE
hanbai_tanka >= 1000
;


-- ■複数のレコードを1文だけで登録する
-- 1文で2件のレコードを登録する
-- バルクインサート（一括登録）

INSERT INTO shohinins (
shohin_id , shohin_mei , shohin_bunrui , hanbai_tanka , shiire_tanka , torokubi 
) VALUES ( 
'0012' --1件目のデータ
,'クリップ'
,'事務用品'
,100
,20
,'2024-01-25'
),( 
'0013'
,'スプーン'
,'キッチン用品'
,300
,150
,'2024-01-20'
);








