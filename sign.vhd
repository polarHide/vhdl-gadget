-- function : signal

library ieee;
use ieee.std_logic_1164.all;

entity sign is
	port
	(
		CLK : in std_logic;
		x_out, y_out: out integer range 15 downto 0;
		a_out, b_out: out std_logic_vector(7 downto 0)
	);
end sign;

architecture bhv of sign is
	signal x, y: integer range 15 downto 0;
	signal a, b: std_logic_vector(7 downto 0);
begin
	process (CLK)		
	begin
	
	if rising_edge(CLK) then
		b <= "10110100";
	
		x <= 11;
		y <= 2 + x;
		a <= b;
		a(5 downto 0) <= b(7 downto 2);
	end if;
	end process;	
		x_out <= x;
		y_out <= y;
		a_out <= a;
		b_out <= b;
		
end;
