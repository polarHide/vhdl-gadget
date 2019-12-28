-- file : fsm3process.vhd
-- function : demo 10-1 in three process(better version)
-- author : ojw
-- createDate : 2019-10-31

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm3process is
	port (	  clk, reset : in STD_LOGIC;
			state_inputs : in STD_LOGIC_VECTOR(0 to 1);
			comb_outputs : out INTEGER RANGE 0 to 15
		  );
end fsm3process;

architecture bhv of fsm3process is
	type FSM_ST is (s0, s1, s2, s3, s4);
	signal c_st, next_state : FSM_ST;
begin
	REG : process (reset, clk)	-- 时序进程
	begin
		if reset = '0' then
			c_st <= s0;
		elsif clk = '1' and clk'EVENT then
			c_st <= next_state;
		end if;
	end process REG;
	COM1 : process (c_st, state_inputs)	-- state控制
	begin
		case c_st is
			when s0 => 	if state_inputs = "00" then next_state <= s0;
							else next_state <= s1;
						end if;
			when s1 =>  if state_inputs = "01" then next_state <= s1;
							else next_state <= s2;
						end if;
			when s2 =>  if state_inputs = "10" then next_state <= s0;
							else next_state <= s3;
						end if;				
			when s3 =>  if state_inputs = "11" then next_state <= s3;
							else next_state <= s4;
						end if;	
			when s4 =>  next_state <= s0;
			when others => next_state <= s0;
		end case;
	end process COM1;
	
	COM2 : process (c_st)	-- 输出控制
	begin
		case c_st is
			when s0 => comb_outputs <= 5;						
			when s1 => comb_outputs <= 8;
			when s2 => comb_outputs <= 12;
			when s3 => comb_outputs <= 14;
			when s4 => comb_outputs <= 9;
			when others => null;
		end case;
	end process COM2;
	
end bhv;
	