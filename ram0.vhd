-- file : ram0.vhd
-- fuction : dataBus8b and address10b reference exp7-1 page171 and exp7-6
-- author : ojw
-- createDate : 2019-10-16

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ram0 IS
PORT(
	 CLK,WREN :IN STD_LOGIC;
			A : IN STD_LOGIC_VECTOR(9 DOWNTO 0);	-- RAM��10λ��ַ����˿�
	   	  DIN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);	-- RAM��8λ��������˿�
    		Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)	-- RAM��8λ��������˿�
	);
END;
ARCHITECTURE bhv OF ram0 IS
TYPE G_ARRAY IS ARRAY(0 TO 127) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL MEM : G_ARRAY;
BEGIN
PROCESS (CLK)
BEGIN