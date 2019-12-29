-- file : addmuxv2.vhd
-- fuction : 利用资源共享的面积优化方法(选乘器优化后)
-- author : ojw
-- createDate : 2019-11-06

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity addmuxv2 is
	port (
			R 		   : out std_logic_vector(7 downto 0);
			sel 	   : in std_logic;
			A, B, C, D : in std_logic_vector(7 downto 0)
		  );
end addmuxv2;

architecture rtl of addmuxv2 is
	signal temp0 : std_logic_vector(7 downto 0);
	signal temp1 : std_logic_vector(7 downto 0);
begin
	process(A, B, C, D, sel)
	begin
		if(sel = '0') then
		temp0 <= A;
		temp1 <= B;
		R <= temp0 + temp1;
		else
		temp0 <= C;
		temp1 <= D;
		R <= temp0 + temp1;
		end if;
	end process;
end rtl;
