-- file : counter16b.vhd
-- fuction : 修改例5-15
-- 			进位输出COUT与异步加载控制LOAD相连，构成自动加载型16位二进制数计数器（16位可控分频器）
-- device : Cyclone EP1C20F400C8
-- author : ojw
-- createDate : 2019-10-09


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY counter16b IS
	PORT (
			 CLK : IN STD_LOGIC;
			DATA : IN STD_LOGIC_VECTOR (15 DOWNTO 0);	-- 16位预置数
			DOUT : BUFFER STD_LOGIC						-- 计数值输出					
);
END counter16b;

ARCHITECTURE bhv OF counter16b IS
SIGNAL Q : STD_LOGIC;
BEGIN
	PROCESS(CLK)
	VARIABLE cnt : STD_LOGIC_VECTOR(15 DOWNTO 0);
	BEGIN 
	
		IF CLK'EVENT AND CLK='1' THEN	-- 上升沿触发
			IF cnt=0  THEN					-- 计数使能高电平，允许计数
				cnt := DATA-1;
				DOUT <= '1';
			ELSIF cnt=('0'&DATA(15 DOWNTO 1)) THEN
					cnt := ('0'&DATA(15 DOWNTO 1))-1;
					DOUT <= '1';
			ELSE cnt := cnt-1;
				DOUT <='0';
		END IF;
		END IF;
	END PROCESS;
	
	PROCESS(DOUT)
	VARIABLE cnt0 : STD_LOGIC;
	BEGIN
		IF DOUT'EVENT AND DOUT='1' THEN
			cnt0 := NOT cnt0;
			IF cnt0='1' THEN DOUT<='1';
			ELSE DOUT<='0';
			END IF;
		END IF;
	END PROCESS;
		
END bhv;