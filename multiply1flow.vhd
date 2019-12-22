-- file : multiply1flow.vhd
-- fuction : rout = ((a0 * a1) * a2) * a3
-- author : ojw
-- createDate : 2019-11-09

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity multiply1flow is
	generic(s : integer := 8);
	port(
		clk : in std_logic;
		a0, a1, a2, a3 : in std_logic_vector(s-1 downto 0);
		rout : out std_logic_vector(4*s-1 downto 0)
		);
end multiply1flow;

architecture bhv of multiply1flow is
	signal temp1 : std_logic_vector(2*s-1 downto 0);
	signal temp2 : std_logic_vector(3*s-1 downto 0);
	signal temp3 : std_logic_vector(4*s-1 downto 0);
	signal d0 : std_logic_vector(s-1 downto 0);	-- 补零向量
	signal d1 : std_logic_vector(2*s-1 downto 0);	-- 补零向量
	
	begin
		d0 <= (others => '0');
		d1 <= (others => '0');
		process(clk)
			variable a0_in : std_logic_vector(s-1 downto 0);
			variable a1_in : std_logic_vector(s-1 downto 0);
			variable temp1_out : std_logic_vector(2*s-1 downto 0);
			variable carry_in,carry : std_logic;
		begin
--		if(rising_edge(clk)) then
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
--		end if;
		end process;
		
		process(temp1, a2, clk)
			variable a2_in : std_logic_vector(2*s-1 downto 0);
			variable temp1_in : std_logic_vector(2*s-1 downto 0);
			variable temp2_out : std_logic_vector(3*s-1 downto 0);
			variable carry_in,carry : std_logic;
		begin
--		if(rising_edge(clk)) then
			temp1_in := temp1;
			a2_in :=  d0 & a2;					
			temp2_out := (others => '0');
			for count in 0 to 2*s-1 loop
				carry := '0';
				if(a2_in(count) = '1') then
					for index in 0 to s-1 loop
						carry_in := carry;
						carry := (temp2_out(index+count) and temp1_in(index))
								or (carry_in and (temp2_out(index+count) xor temp1_in(index)));
						temp2_out(index+count) := temp2_out(index+count) xor temp1_in(index) xor carry_in;
					end loop;
					temp2_out(count+s) := carry;
				end if;
			end loop;
			temp2 <= temp2_out;
--		end if;
		end process;
	
		process(temp2, a3, clk)
			variable a3_in : std_logic_vector(3*s-1 downto 0);
			variable temp2_in : std_logic_vector(3*s-1 downto 0);
			variable temp_out : std_logic_vector(4*s-1 downto 0);
			variable carry_in,carry : std_logic;
		begin
		if(rising_edge(clk)) then
			temp2_in := temp2;
			a3_in :=  d1 & a3;					
			temp_out := (others => '0');
			for count in 0 to 3*s-1 loop
				carry := '0';
				if(a3_in(count) = '1') then
					for index in 0 to s-1 loop
						carry_in := carry;
						carry := (temp_out(index+count) and temp2_in(index))
								or (carry_in and (temp_out(index+count) xor temp2_in(index)));
						temp_out(index+count) := temp_out(index+count) xor temp2_in(index) xor carry_in;
					end loop;
					temp_out(count+s) := carry;
				end if;
			end loop;
			rout <= temp_out;
		end if;
		end process;	
end bhv;
