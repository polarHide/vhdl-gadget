
-- date : 2019-09-13
-- author : ojw
-- source : another implement for example 3.1 on page58,reference of 3.3 on page66

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- recommend the three declaration together

ENTITY mux21b IS
	PORT ( a,b,s : IN STD_LOGIC ;
			   y : OUT STD_LOGIC );
END ENTITY mux21b;

ARCHITECTURE bhv OF mux21b IS
BEGIN
	y <= (s AND a) OR ((NOT s) AND b);
END ARCHITECTURE bhv ;