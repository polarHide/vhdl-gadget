-- file : 
-- function : RAM of 10bADDRESS and 8bDATA
-- author : ojw
-- createDate : 2019-10-22

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY RAM108 IS
PORT (CLK,WREN : IN STD_LOGIC;	-- CLK时钟，WREN使能
			 A : IN STD_LOGIC_VECTOR(9 DOWNTO 0);	-- RAM的10位地址输入端口
		   DIN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);	-- RAM的8位数据输入端口
			 Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)	-- RAM的8位数据输出端口
	  );
END;

ARCHITECTURE bhv OF RAM108 IS
TYPE G_ARRAY IS ARRAY(0 TO 127) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL MEM : G_ARRAY;
	attribute ram_init_file:string;
	attribute ram_init_file of MEM :							-- 使用存储器配置初始化文件的属性定义
	SIGNAL IS "E:\abigBUN\vhdl_demo\RAM108\sin8bit_128.mif";	-- 烧入sin8bit_128.mif
BEGIN
	PROCESS (CLK)
	BEGIN
	IF rising_edge(CLK) THEN
		IF WREN = '1' THEN
			MEM(CONV_INTEGER(A)) <= DIN;	-- 时钟上升沿且使能高电平时，数据写入指定地址的单元
		END IF;
	END IF;
	IF falling_edge(CLK) THEN
		Q <= MEM(CONV_INTEGER(A));	-- 读RAM数据
	END IF;
	END PROCESS;
END bhv;