-- file : counter16b.vhd
-- fuction : �޸���5-15
-- 			��λ���COUT���첽���ؿ���LOAD�����������Զ�������16λ����������������16λ�ɿط�Ƶ����
-- device : Cyclone EP1C20F400C8
-- author : ojw
-- createDate : 2019-10-09


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY counter16b IS
	PORT (
			 CLK : IN STD_LOGIC;
			DATA : IN STD_LOGIC_VECTOR (15 DOWNTO 0);	-- 16λԤ����
			DOUT : BUFFER STD_LOGIC						-- ����ֵ���					
);
END counter16b;

ARCHITECTURE bhv OF counter16b IS
SIGNAL Q : STD_LOGIC;
BEGIN
	PROCESS(CLK)
	VARIABLE cnt : STD_LOGIC_VECTOR(15 DOWNTO 0);
	BEGIN 
	
		IF CLK'EVENT AND CLK='1' THEN	-- �����ش���
			IF cnt=0  THEN					-- ����ʹ�ܸߵ�ƽ���������
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