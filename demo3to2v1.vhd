-- file : demo3to2v1.vhd
-- function : example 3-2 on page61 in IF
-- device : Cyclone EP1C20F400C8
-- author : ojw
-- createDate : 2019-09-22

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY demo3to2v1 IS
	PORT (
		A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		SO : OUT STD_LOGIC;
		CO : OUT STD_LOGIC
		);
END ENTITY demo3to2v1;

ARCHITECTURE fh1 OF demo3to2v1 IS
	SIGNAL S, R : STD_LOGIC_VECTOR ( 1 DOWNTO 0 );
	BEGIN
		S <= A & B;
		PROCESS ( A,B )
		BEGIN
			IF ( S = "00" )
				THEN R <= "00";
			ELSIF ( S = "01" )
				THEN R <= "10";
			ELSIF ( S = "10" )
				THEN R <= "10";
			ELSIF ( S = "11" )
				THEN R <= "01";
			END IF;
			SO <= R(1);
			CO <= R(0);
		END PROCESS;
END ARCHITECTURE fh1;