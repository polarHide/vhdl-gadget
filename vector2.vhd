-- file : vector2.vhd
-- function : test on STD_LOGIC_VECTOR
-- device : Cyclone EP1C20F400C8
-- author : ojw
-- createDate : 2019-09-25

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY vector2 IS
	PORT 
	(
		A : BUFFER STD_LOGIC_VECTOR ( 1 TO 4 );
		B : OUT STD_LOGIC_VECTOR ( 7 DOWNTO 0 );
		S : IN STD_LOGIC_VECTOR ( 1 DOWNTO 0 )	--	control
	);
END ENTITY vector2;

ARCHITECTURE fh OF vector2 IS
BEGIN
	PROCESS (S)
	BEGIN
		CASE (S) IS
			WHEN "00" => B <= "01100010";
			WHEN "01" => B <= "01100010"; B ( 4 DOWNTO 1 ) <= "1101"; 
--			WHEN "10" => B <= "01100010"; B ( 1 TO 4 ) <= "1101"; 		--ERROR!
			WHEN "11" => B <= "01100010"; A <= "1011"; B ( 7 DOWNTO 4 ) <= A;
			WHEN OTHERS => A <= "0000";
		END CASE;
	END PROCESS;
END ARCHITECTURE fh;

-- ERROR INFO: range direction of object slice must be same as range direction of project		