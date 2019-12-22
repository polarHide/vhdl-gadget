-- file : adder8b.vhd
-- function : 8-bit adder from 8 fulladder in loop
-- device : Cyclone EP1C20F400C8
-- author : ojw
-- createDate : 2019-10-6

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY adder8b IS
	GENERIC( S : INTEGER := 8 );		-- 定义参数S为整数类型,且等于8;当需求为32位加法器时此处令S:=32
	PORT(
		  A, B : IN STD_LOGIC_VECTOR (S-1 DOWNTO 0);
		   CIN : IN STD_LOGIC;							-- 进位向低位输入
		  COUT : OUT STD_LOGIC;							-- 进位向高位输出
		   SUM : OUT STD_LOGIC_VECTOR(S DOWNTO 0)		-- 本位和输出
		 );
END ENTITY adder8b;

ARCHITECTURE bhv OF adder8b IS
BEGIN
	PROCESS ( A, B, CIN )
		VARIABLE Si : STD_LOGIC_VECTOR ( S DOWNTO 0 );
		VARIABLE C : STD_LOGIC;
		BEGIN
			C := CIN;
			FOR i IN 1 TO S LOOP	-- 真值表
								
				IF 	( A(i-1)='0'  AND  B(i-1)='0'  AND  C='1' ) OR
					( A(i-1)='0'  AND  B(i-1)='1'  AND  C='0' ) OR
					( A(i-1)='1'  AND  B(i-1)='0'  AND  C='0' ) OR
					( A(i-1)='1'  AND  B(i-1)='1'  AND  C='1' )
				THEN Si(i-1) := '1';
				ELSE Si(i-1) := '0';
				END IF;
				
				IF 	( A(i-1)='0'  AND  B(i-1)='1'  AND  C='1' ) OR
					( A(i-1)='1'  AND  B(i-1)='0'  AND  C='1' ) OR
					( A(i-1)='1'  AND  B(i-1)='1'  AND  C='0' ) OR
					( A(i-1)='1'  AND  B(i-1)='1'  AND  C='1' )
				THEN C :='1';
				ELSE C :='0';				
				END IF;				
			END LOOP;
						
			SUM <= Si;
			COUT <= C;
			
			IF  ( CONV_INTEGER(A)>= 2**(S-1) OR CONV_INTEGER(B)>= 2**(S-1) )AND( CONV_INTEGER(Si)< 2**S-1 )		--防溢出
			THEN SUM(S) <= '1';
			END IF;									
	END PROCESS;
END ARCHITECTURE bhv;

				