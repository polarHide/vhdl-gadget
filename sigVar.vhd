-- file : sigVar.vhd
-- function : 二进程比较signal与variable类型的赋值顺序
-- author : ojw
-- createDate : 2019-10-24

library ieee;
use ieee.std_logic_1164.all;
 
entity sigVar is
port(
		clk 				 : in std_logic;
		x_sig_out, y_sig_out : out integer range 15 downto 0;
		a_sig_out, b_sig_out : out std_logic_vector(7 downto 0);
		x_var_out, y_var_out : out integer range 15 downto 0;
		a_var_out, b_var_out : out std_logic_vector(7 downto 0)
	);
end sigVar;

architecture bhv of sigVar is
	signal x_sig, y_sig : integer range 15 downto 0;	-- 定义信号
	signal a_sig, b_sig : std_logic_vector(7 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) then
		b_sig <= "10110100";	-- 信号赋值
		x_sig <= 11;
		y_sig <= 2 + x_sig;
		a_sig <= b_sig;
		a_sig(5 downto 0) <= b_sig(7 downto 2);
	end if;
	end process;
		x_sig_out <= x_sig;		-- 信号输出
		y_sig_out <= y_sig;
		a_sig_out <= a_sig;
		b_sig_out <= b_sig;
		
	process(clk)	
		variable x_var, y_var : integer range 15 downto 0;	-- 定义变量
		variable a_var, b_var : std_logic_vector(7 downto 0);	
	begin
		if rising_edge(clk) then
		b_var := "10110100";	-- 变量赋值
		x_var := 11;
		y_var := 2 + x_var;
		a_var := b_var;
		a_var(5 downto 0) := b_var(7 downto 2);
	end if;	
		x_var_out <= x_var;	-- 变量输出
		y_var_out <= y_var;
		a_var_out <= a_var;
		b_var_out <= b_var;	
	end process;
end bhv;	
