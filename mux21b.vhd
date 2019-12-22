-- file : mux21b.vhd
-- function : s控制二选一输出a或b（第2种实现方法）
-- author : ojw
-- createDate : 2019-09-13
-- source : another implement for example 3.1 on page58,reference of 3.3 on page66

-- update : 2019-12-22
-- updateFor : 调整代码规范，增加中文注释

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux21b IS
	PORT( 
		a, b, s : IN STD_LOGIC ;
		y       : OUT STD_LOGIC
	);
END ENTITY mux21b;

ARCHITECTURE bhv OF mux21b IS
BEGIN
	y <= (s AND a) OR ((NOT s) AND b);	-- 真值表或其他方法找到逻辑表达式（布尔表达式）
END ARCHITECTURE bhv ;
