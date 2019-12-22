-- file : demo3to2v2.vhd
-- function : 半加器（case实现，真值表）
-- author : ojw
-- createDate : 2019-09-22
-- source : example 3-2 on page61 in CASE

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY demo3to2v2 IS
	PORT
	(
		A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		SO : OUT STD_LOGIC;
		CO : OUT STD_LOGIC
	);
END ENTITY demo3to2v2;

ARCHITECTURE fh2 OF demo3to2v2 IS
SIGNAL S, R : STD_LOGIC_VECTOR ( 1 DOWNTO 0 );
BEGIN
	S <= A & B;
	PROCESS ( A,B )
	BEGIN
		CASE ( S ) IS
			WHEN "00" => R <= "00" ;	-- SO <= '0'; CO <= '0';
			WHEN "01" => R <= "10" ;	-- SO <= '1'; CO <= '0';			
			WHEN "10" => R <= "10" ;	-- SO <= '1'; CO <= '0';			
			WHEN "11" => R <= "01" ;	-- SO <= '0'; CO <= '1';		
		END CASE;
		SO <= R(1);
		CO <= R(0);	
	END PROCESS;
END ARCHITECTURE fh2
