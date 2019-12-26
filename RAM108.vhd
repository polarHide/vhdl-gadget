-- file : 
-- function : RAM of 10bADDRESS and 8bDATA
-- author : ojw
-- createDate : 2019-10-22

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY RAM108 IS
PORT (CLK,WREN : IN STD_LOGIC;	-- CLKʱ�ӣ�WRENʹ��
			 A : IN STD_LOGIC_VECTOR(9 DOWNTO 0);	-- RAM��10λ��ַ����˿�
		   DIN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);	-- RAM��8λ��������˿�
			 Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)	-- RAM��8λ��������˿�
	  );
END;

ARCHITECTURE bhv OF RAM108 IS
TYPE G_ARRAY IS ARRAY(0 TO 127) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL MEM : G_ARRAY;
	attribute ram_init_file:string;
	attribute ram_init_file of MEM :							-- ʹ�ô洢�����ó�ʼ���ļ������Զ���
	SIGNAL IS "E:\abigBUN\vhdl_demo\RAM108\sin8bit_128.mif";	-- ����sin8bit_128.mif
BEGIN
	PROCESS (CLK)
	BEGIN
	IF rising_edge(CLK) THEN
		IF WREN = '1' THEN
			MEM(CONV_INTEGER(A)) <= DIN;	-- ʱ����������ʹ�ܸߵ�ƽʱ������д��ָ����ַ�ĵ�Ԫ
		END IF;
	END IF;
	IF falling_edge(CLK) THEN
		Q <= MEM(CONV_INTEGER(A));	-- ��RAM����
	END IF;
	END PROCESS;
END bhv;