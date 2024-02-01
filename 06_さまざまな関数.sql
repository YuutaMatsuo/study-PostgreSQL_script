-- ■算術関数
-- ■算術演算子
-- + - * / % など

-- ABS
-- 絶対値を求める関数
SELECT
 m
 ,abs(m) AS ABS_col 
FROM 
 samplemath
;

-- ■剰余(modulus)
SELECT
 m
 ,n
 ,mod(7,3) as mod_col
-- ,n % p AS mod_col2
FROM 
 samplemath
;

-- ■丸め処理
-- ■四捨五入
-- ROUND(対象数,丸めの桁数);
--(例)
-- ROUND(1.234,1) → 1.2 (小数点2位を四捨五入する)

-- ROUND(1.245,1) → 1.2
-- ROUND(1.256,1) → 1.3

SELECT 
 m
 ,n 
 ,round(m,n)  AS round_col
FROM 
 samplemath;


SELECT 
round(123.456,2) -- 小数第３位を四捨五入
,round(123.456,1) -- 小数第２位を四捨五入
,round(123.456,0) -- 小数第１位を四捨五入
,round(123.456,-1) -- 整数第１位を四捨五入
,round(123.456,-2) -- 整数第2位を四捨五入
;

-------------------------------------------------------------------------
-- 便利な関数(テストには出ない)
-- ■引数より小さくない最小の整数にまとめる
SELECT 
 CEIL (-42.8);

SELECT 
 CEIL (42.8);
 
 -- ■引数よりも大きくない最大の整数にまとめる
 SELECT 
 floor (-42.8);
 
 SELECT 
 floor(42.8); 

-- ■切り捨て
-- 引数をひとつだけ渡すと、小数点以下を切り捨てる
-- 引数をふたつ指定すると、ひとつ目に渡した数をふたつ目に指定した数以下に切り捨てる
 SELECT 
 trunc(12.345)
 ,trunc(12.345,2)
 ,trunc(12.345,-2);
 
 ------------------------------------------------------------------------
 -- ■文字列（操作）関数
 
 -- ■文字列連結
 -- ■ || → NULLと連結すると、結果はNULLになる
 -- ■ CONCAT() → 引数がNULLの場合、その引数は利用しない
 
 SELECT
 str1 
 ,str2 
 ,str3 
 ,str1 || str2 AS str1_str2
 ,str1 || str2 || str3 AS str1_str2_str3
 ,concat(str1,str2) AS concat_str1_str2 
 ,concat(str1,str2,str3) AS concat_str1_str2_str3 
 FROM 
 samplestr
 ;
 
 -- ■文字列長(文字数)
 SELECT
 str1 
 ,length(str1) AS len_str1 --文字数
 ,octet_length(str1) --バイト数 
 FROM 
 samplestr s 
 ;
 
 -- 文字列連結をした後に、文字数を数える
 SELECT
 concat(str1,str2,str3)
 ,length(concat(str1,str2,str3)) AS len_str
 FROM 
 samplestr s 
 ;
 
 -- ■大文字、小文字の変換
 
 SELECT
  str1
  ,lower(str1) AS low_str1
  ,upper(str1) AS  up_str1
 FROM 
  samplestr s 
 ;
 
 -- ■文字列置換
 -- ■REPLACE → 文字列の置換
 
 SELECT 
  str1 
  ,str2 
  ,str3 
  ,REPLACE (str1,str2,str3) AS rep_str
 FROM 
  samplestr s 
 ;
 
 -- ■文字列の切り出し
 -- SUBSTRING( 対象文字列 FROM 開始位置 FRO 文字数(何文字切り出したいか) ) 
 -- 開始位置は１始まり
 -- ※Javaでは「終了位置」を指定していたので注意！（しかもJavaでは0からカウントする）
 
 SELECT
  str1
  ,substring(str1 FROM 3 FOR 2) AS sub_str
  ,substring(str1 FROM -1 FOR 2) AS sub_str2 --空文字
--  ,substring(str1 FROM 3 FOR -2) AS sub_str3 --エラー
  ,substr(str1,3,2)
 FROM 
  samplestr s 
;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
