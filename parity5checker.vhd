-- file : parity5checker.
-- fuction : ͬ��ʱ��ÿ5λ���ж��������룬�����żУ������������1�����һλ���1
-- device : Cyclone EP1C20F400C8
-- author : ojw
-- createDate : 2019-10-15

LIBRARY IEEE;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY parity5checker IS
PORT (
	   CLK, SerialIn : IN STD_LOGIC;	-- CLKʱ���źţ�SerialIn��������
			CheckOut : OUT STD_LOGIC	-- CheckOut�������		
	  );
END ENTITY;

ARCHITECTURE bhv OF parity5checker IS
BEGIN
	PROCESS( CLK, SerialIn )
		VARIABLE Q : STD_LOGIC_VECTOR( 4 DOWNTO 0 );	-- ��������ת�����飬���5λ
		VARIABLE cnt : STD_LOGIC_VECTOR( 2 DOWNTO 0 );	-- ����
	BEGIN
		IF rising_edge( CLK ) THEN	-- �����ش���
			CheckOut<='0';		
			IF cnt=4 THEN
				cnt:="000";		-- ÿ��5λ��cnt����
				Q := SerialIn & Q( 4 DOWNTO 1 );	-- ��λ����
				CheckOut<=Q(4) XOR Q(3) XOR Q(2) XOR Q(1) XOR Q(0);		-- ����ʱ��5λ���������			
			ELSE
				cnt := cnt + 1;		-- ÿ����1λ������cnt��1
				Q := SerialIn & Q( 4 DOWNTO 1 );	-- ��λ����
			END IF;			
		END IF;
	END PROCESS;
END ARCHITECTURE bhv;
