-- file : fsmDiretOutput.vhd
-- function : demo 10-1 in three process in DiretOutput Coding
-- author : ojw
-- createDate : 2019-11-01

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsmDiretOutput is
	port (	  clk, reset : in STD_LOGIC;
			state_inputs : in STD_LOGIC_VECTOR(0 to 1);
			comb_outputs : out INTEGER RANGE 0 to 15
		  );
end fsmDiretOutput;

architecture bhv of fsmDiretOutput is
	-- ��ʽһ��״̬�������Զ������ָʾ���뷽ʽ��ֱ������ͱ��룩
	type FSM_ST is (s0, s1, s2, s3, s4);
	attribute enum_encoding : string;
	attribute enum_encoding of FSM_ST : type is "000 010 100 110 111";
	signal c_st, next_state : FSM_ST;

	-- ��ʽ������״̬Ԫ�ض��峣����������
--	constant s0 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";	-- state_inputs = "00"������ĩβλ0
--	constant s1 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "010";	-- state_inputs = "01"������ĩβλ0
--	constant s2 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "100";	-- state_inputs = "10"������ĩβλ0
--	constant s3 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "110";	-- state_inputs = "11"������ĩβλ0
--	constant s4 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "111";	-- state_inputs = "/"������ĩβλ1
--	signal c_st, next_state : STD_LOGIC_VECTOR(2 DOWNTO 0);
	
begin

	REG : process (reset, clk)	-- ʱ�����
	begin
		if reset = '0' then
			c_st <= s0;
		elsif clk = '1' and clk'EVENT then
			c_st <= next_state;
		end if;
	end process REG;
	
	COM1 : process (c_st, state_inputs)		-- state����
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
	
	COM2 : process (c_st)	-- �������
	begin
		case c_st is
			when s0 => comb_outputs <= 5;	-- 0101						
			when s1 => comb_outputs <= 8;	-- 1000
			when s2 => comb_outputs <= 12;	-- 1100
			when s3 => comb_outputs <= 14;	-- 1110
			when s4 => comb_outputs <= 9;	-- 1001
			when others => null;
		end case;
	end process COM2;
	
end bhv;
	