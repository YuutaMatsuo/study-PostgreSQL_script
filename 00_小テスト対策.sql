-- SQL 小テスト例題

-- ■問題(SQLの概要)
1. SQL文はDBMSに与える命令の種類により３つに分類される。データベースやテーブルに対して作成、削除を行う「検索データ定義言語」とも呼ばれるものはDDLである
	(イ?) --教科書では「データ定義言語」となっているため、おそらく誤りではないかと思う。あくまでDDLはCREATE,DROP,ALTERなどデータベースの定義を行うだけで検索は行わないため

2. SQL文は終わりを表す区切り文字にカンマを使う
	(イ) -- 区切り文字にはセミコロンを使う
	
3. SQQL文のキーワード(命令)は大文字と小文字を区別されるが、テーブルに登録されているデータについては大文字と小文字が区別されない
	(イ) -- キーワードは大文字と小文字を区別しないが、テーブルに登録されているデータは区別される
	
4. SQL文では定数の書き方に以下の決まりがあり、以下のように記述する
	文字列		"Hello" -- 文字列はシングルクォーテーションで囲む
	日付			'2022-12-21'
	数値			1234
	(イ) -- ダブルクォーテーションで囲むのはASキーワードで別名をつける時

	
-- ■問題(テーブルの作成)
CREATE TABLE (⑤ イ.Menu)( 
coffee_id char(4) NOT NULL
,coffee_name varchar(30) NOT NULL 
,(⑥ ク.coffee_model) varchar(20) NOT NULL 
,sell_price INTEGER
,cost INTEGER
,sell_date (⑦ オ.DATE)
,PRIMARY KEY ((⑧ カ.coffee_id)));


-- ■問題(データの登録)
(⑨ ア.INSERT INTO) menu (⑩　エ.VALUES)( (⑪ カ.'0004'), 'コールドブリュー', 'ice', 407, 150, (⑫ ク.'2015/11/20'));


-- ■問題 (nullとの比較)

13.　(エ)
-- menu2テーブルからcoffee_nameとsell_priceに1.08を掛けたものに別名をつけて出力する
SELECT
 coffee_name, sell_price * 1.08 AS Tax_amount --selectでnullと演算を行った場合はNULLと表示される
FROM 
 menu2
;

14. (イ)
-- sell_pricedが400以上のレコードを絞り込み、coffee_nameとsell_priceを出力する
-- sell_priceにnullが含まれているため、nullとの比較は無視され4行のレコードが出力される
SELECT 
 coffee_name
 ,sell_price
FROM 
 menu2
WHERE 
 sell_price >= 400 -- where句でnullと比較を行った場合無視される
;

15. (イ)
-- sell_priceがnullではないレコードを絞り込み、coffee_nameとsell_priceを表示させる
-- nullに対して比較演算子を使うとエラーにはならないが無視されるため、レコードは１行も出力されない
SELECT
 coffee_name
 ,sell_price
FROM 
 menu2
WHERE 
 sell_price = null
;

16. (エ)
-- sell_priceがnullではないレコードを絞り込み、coffee_nameとsell_priceを表示させる
-- is not nullを用いているので４行のレコードが出力される
SELECT
 coffee_name
 ,sell_price
FROM 
 menu2
WHERE 
 sell_price is not null
;

-- ■問題(集約・グループ化・並び替え)

17. (イ)
-- coffee_modelごとのレコード数をカウントし、昇順に並び替えを行う
-- 実行結果は降順になっているため誤り
select
 coffee_model
 ,count(*)
from 
 menu3
group by 
 coffee_model
order by
 count(*) asc 
;

18. (ア)
-- coffee_modelごとのcoffee_modelとsell_priceの最大値と最小値を表示する
select
 coffee_model 
,max(sell_price)
,min(sell_price) 
from 
 menu3
group by
 coffee_model 
;

19. (イ)
-- coffee_modelが'ice'のレコードをcoffee_modelごとに絞り込みを行い、sell_priceの平均を表示する
-- 平均は440のため実行結果は誤り
select 
 coffee_model
 ,avg(sell_price) 
from
 menu3
where 
 coffee_model = 'ice'
group by 
 coffee_model
;

20. (イ)
-- coffee_modelごとのレコード数をカウントし、カウントした数が１より大きいものを表示する
-- tealatteはレコード数１のため結果には含まれないため誤り
select 
 coffee_model
 ,count(*) 
from
 menu3
group by
 coffee_model 
having
 count(*) > 1 
order by 
 count(*) desc
;










