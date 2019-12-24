-- file : demo3to2v4.vhd
-- function : 半加器（select实现，真值表）
-- device : Cyclone EP1C20F400C8
-- author : ojw
-- createDate : 2019-09-22

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY demo3to2v4 IS
PORT(
	A  : IN STD_LOGIC;
	B  : IN STD_LOGIC;
	SO : OUT STD_LOGIC;
	CO : OUT STD_LOGIC
	);
END ENTITY demo3to2v4;

ARCHITECTURE fh4 OF demo3to2v4 IS
	SIGNAL S, R : STD_LOGIC_VECTOR ( 1 DOWNTO 0 );
	BEGIN
		S <= A & B;
		WITH S SELECT
		R <= "00" WHEN "00",
			 "10" WHEN "01",
			 "10" WHEN "10",
			 "01" WHEN "11";
		SO <= R(1);
		CO <= R(0);
END ARCHITECTURE fh4;
-- SELCET parallel statement donot need PROCESS concept 
