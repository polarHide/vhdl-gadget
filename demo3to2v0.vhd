-- file : demo3to2v0.vhd
-- function : 半加器（根据半加器电路结构写成）
-- author : ojw
-- createDate : 2019-09-18
-- source : example 3-2 on page61 in ORIGINAL

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
