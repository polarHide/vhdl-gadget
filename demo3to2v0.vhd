-- file : demo3to2v0.vhd
-- function : example 3-2 on page61 in ORIGINAL
-- device : Cyclone EP1C20F400C8
-- author : ojw
-- createDate : 2019-09-18

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY demo3to2v0 IS
	PORT(
		A  : IN STD_LOGIC;
		B  : IN STD_LOGIC;
		SO : OUT STD_LOGIC;
		CO : OUT STD_LOGIC
	);
END ENTITY demo3to2v0;

ARCHITECTURE fh0 OF demo3to2v0 IS
BEGIN
	SO <= A XOR B;
	CO <= A AND B;
END ARCHITECTURE fh0;						