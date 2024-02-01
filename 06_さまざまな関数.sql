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



