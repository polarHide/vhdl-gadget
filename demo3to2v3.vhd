-- file : demo3to2v3.vhd
-- function : 半加器（when-else实现，真值表）
-- author : ojw
-- createDate : 2019-09-22
-- source : example 3-2 on page61 in WHEN-ELSE

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY demo3to2v3 IS
	PORT
	(
		A  : IN STD_LOGIC;
		B  : IN STD_LOGIC;
		SO : OUT STD_LOGIC;
		CO : OUT STD_LOGIC
	);
END ENTITY demo3to2v3;

ARCHITECTURE fh3 OF demo3to2v3 IS
	SIGNAL S, R : STD_LOGIC_VECTOR ( 1 DOWNTO 0 );
	BEGIN
	S <= A & B;
	R <= "00" WHEN S = "00" ELSE
		 "10" WHEN S = "01" ELSE
		 "10" WHEN S = "10" ELSE
		 "01" WHEN S = "11";
	SO <= R(1);
	CO <= R(0);
END ARCHITECTURE fh3;
