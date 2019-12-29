-- file : addmux.vhd
-- fuction : 利用资源共享的面积优化方法(优化前)
-- author : ojw
-- createDate : 2019-11-06

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity addmux is
    port (
            R          : out std_logic_vector(7 downto 0);
            sel        : in std_logic;
            A, B, C, D : in std_logic_vector(7 downto 0)
        );
end addmux;

architecture rtl of addmux is
begin
        process(A, B, C, D, sel)
        begin
        if(sel = '0') then
            R <= A + B;
        else
            R <= C + D;
        end if;
	end process;
end rtl;
