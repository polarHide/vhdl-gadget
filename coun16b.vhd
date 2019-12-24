-- file : counter16b.vhd
-- fuction : 修改例5-15
-----------  进位输出COUT与异步加载控制LOAD相连，构成自动加载型16位二进制数计数器（16位可控分频器）
-- device : Cyclone EP1C20F400C8
-- author : ojw
-- createDate : 2019-10-09

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY coun16b IS
	PORT (
		 CLK,RST,EN,LOAD : IN STD_LOGIC;	-- CLK时钟信号输入端,LOAD预置初值使能端:高电平有效,RST清零端:高电平有效,EN计数使能端,高电平有效
		 DATA 		 	 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		 DOUT 			 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		 COUT			 : OUT STD_LOGIC	--COUT进位输出,计数满2^16产生一个进位
);
END coun16b;

ARCHITECTURE bhv OF coun16b IS
BEGIN
	PROCESS(CLK,RST)
	VARIABLE Q : STD_LOGIC_VECTOR (15 DOWNTO 0);
	BEGIN 	
		IF RST='1' 	-- 复位1时，计数寄存器清零
			THEN Q:=(OTHERS=>'0');
		ELSIF CLK'EVENT AND CLK='1' THEN	-- 上升沿触发
			IF LOAD='1' THEN Q:=DATA;
			ELSIF EN='1' THEN Q:=Q+1;
			ELSE
			Q:=Q;
			END IF;
		END IF;
			
		IF Q="1111111111111111" AND EN='1'
		THEN COUT<='1';
		ELSE COUT<='0';
		END IF;
		
		COUT<=LOAD;
		DOUT<=Q;
		
	END PROCESS;
END bhv;
