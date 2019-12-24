-- file : parity5checker.
-- fuction : 同步时序，每5位串行二进制输入，输出奇偶校验结果，奇数个1在最后一位输出1
-- device : Cyclone EP1C20F400C8
-- author : ojw
-- createDate : 2019-10-15

LIBRARY IEEE;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY parity5checker IS
PORT (
	   CLK, SerialIn : IN STD_LOGIC;	-- CLK时钟信号，SerialIn串行输入
			CheckOut : OUT STD_LOGIC	-- CheckOut检验输出		
	  );
END ENTITY;

ARCHITECTURE bhv OF parity5checker IS
BEGIN
	PROCESS( CLK, SerialIn )
		VARIABLE Q : STD_LOGIC_VECTOR( 4 DOWNTO 0 );	-- 串行输入转换数组，宽度5位
		VARIABLE cnt : STD_LOGIC_VECTOR( 2 DOWNTO 0 );	-- 计数
	BEGIN
		IF rising_edge( CLK ) THEN	-- 上升沿触发
			CheckOut<='0';		
			IF cnt=4 THEN
				cnt:="000";		-- 每读5位将cnt清零
				Q := SerialIn & Q( 4 DOWNTO 1 );	-- 逐位读进
				CheckOut<=Q(4) XOR Q(3) XOR Q(2) XOR Q(1) XOR Q(0);		-- 计数时达5位输出检验结果			
			ELSE
				cnt := cnt + 1;		-- 每读进1位将计数cnt加1
				Q := SerialIn & Q( 4 DOWNTO 1 );	-- 逐位读进
			END IF;			
		END IF;
	END PROCESS;
END ARCHITECTURE bhv;
