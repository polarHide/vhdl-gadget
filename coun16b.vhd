-- file : counter16b.vhd
-- fuction : �޸���5-15
-- 			��λ���COUT���첽���ؿ���LOAD�����������Զ�������16λ����������������16λ�ɿط�Ƶ����
-- device : Cyclone EP1C20F400C8
-- author : ojw
-- createDate : 2019-10-09

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY coun16b IS
	PORT (
		 CLK,RST,EN,LOAD : IN STD_LOGIC;	
		 -- CLKʱ���ź������,LOADԤ�ó�ֵʹ�ܶ�:�ߵ�ƽ��Ч,RST�����:�ߵ�ƽ��Ч,EN����ʹ�ܶ�,�ߵ�ƽ��Ч,
					DATA : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
					DOUT : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
					COUT : OUT STD_LOGIC	--COUT��λ���,������2^16����һ����λ
);
END coun16b;

ARCHITECTURE bhv OF coun16b IS
BEGIN
	PROCESS(CLK,RST)
	VARIABLE Q : STD_LOGIC_VECTOR (15 DOWNTO 0);
	BEGIN 	
		IF RST='1' 							-- ��λ1ʱ�������Ĵ�������
			THEN Q:=(OTHERS=>'0');
		ELSIF CLK'EVENT AND CLK='1' THEN	-- �����ش���
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