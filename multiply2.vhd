-- file : multiply1.vhd
-- fuction : rout = (a0 * a1) * (a2 * a3)
-- author : ojw
-- createDate : 2019-11-12

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity multiply2 is
	generic(s : integer := 8);
	port(
		clk : in std_logic;
		a0, a1, a2, a3 : in std_logic_vector(s-1 downto 0);
		rout : out std_logic_vector(4*s-1 downto 0)
		);
end multiply2;

architecture bhv of multiply2 is	
	signal temp1, temp2 : std_logic_vector(2*s-1 downto 0);
	signal temp : std_logic_vector(4*s-1 downto 0);	
	begin	
		process(a0, a1)
			variable a0_in : std_logic_vector(s-1 downto 0);
			variable a1_in : std_logic_vector(s-1 downto 0);
			variable temp1_out : std_logic_vector(2*s-1 downto 0);
			variable carry_in,carry : std_logic;
		begin
			a0_in := a0;
			a1_in := a1;			
			temp1_out := (others => '0');
			for count in 0 to s-1 loop
				carry := '0';
				if(a1_in(count) = '1') then
					for index in 0 to s-1 loop
						carry_in := carry;
						carry := (temp1_out(index+count) and a0_in(index))
								or (carry_in and (temp1_out(index+count) xor a0_in(index)));
						temp1_out(index+count) := temp1_out(index+count) xor a0_in(index) xor carry_in;
					end loop;
					temp1_out(count+s):=carry;
				end if;
			end loop;
			temp1 <= temp1_out;	
		end process;
		
	process(a2, a3)
		variable a2_in : std_logic_vector(s-1 downto 0);
		variable a3_in : std_logic_vector(s-1 downto 0);
		variable temp2_out : std_logic_vector(2*s-1 downto 0);
		variable carry_in,carry : std_logic;
	begin
		a2_in := a2;
		a3_in := a3;			
		temp2_out := (others => '0');
		for count in 0 to s-1 loop
			carry := '0';
			if(a3_in(count) = '1') then
				for index in 0 to s-1 loop
					carry_in := carry;
					carry := (temp2_out(index+count) and a2_in(index))
							or (carry_in and (temp2_out(index+count) xor a2_in(index)));
					temp2_out(index+count) := temp2_out(index+count) xor a2_in(index) xor carry_in;
				end loop;
				temp2_out(count+s) := carry;
			end if;
		end loop;
		temp2 <= temp2_out;
	end process;
		
	process(temp1, temp2)
		variable temp1_in : std_logic_vector(2*s-1 downto 0);
		variable temp2_in : std_logic_vector(2*s-1 downto 0);
		variable temp : std_logic_vector(4*s-1 downto 0);
		variable carry_in,carry : std_logic;
	begin
	if(rising_edge(clk)) then
		temp1_in := temp1;
		temp2_in := temp2;			
		temp := (others => '0');
		for count in 0 to s-1 loop
			carry := '0';
			if(temp2_in(count) = '1') then
				for index in 0 to s-1 loop
					carry_in := carry;
					carry := (temp(index+count) and temp1_in(index))
							or (carry_in and (temp(index+count) xor temp1_in(index)));
					temp(index+count) := temp(index+count) xor temp1_in(index) xor carry_in;
				end loop;
				temp(count+s) := carry;
			end if;
		end loop;
		rout <= temp;	
	end if;	
	end process;
		
end bhv;

