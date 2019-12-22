-- file : MULT4B.vhd
-- fuction : 二进制4位乘法器
-- author : ojw
-- date : 2019-09-09
-- source : book example 3-13 on page81

-- update : 2019-12-22
-- updateFor : 调整代码规范，增加中文注释

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY MULT4B IS
GENERIC ( S : INTEGER := 4 ); -- define parameter S as integer equal to 4
    PORT ( R : OUT STD_LOGIC_VECTOR(2*S DOWNTO 1);  -- 乘法器结果位宽为2*S-1
        A, B : IN STD_LOGIC_VECTOR (S DOWNTO 1));
END ENTITY MULT4B;

ARCHITECTURE ONE OF MULT4B IS
SIGNAL A0 : STD_LOGIC_VECTOR(2*S DOWNTO 1);
BEGIN
    A0 <= CONV_STD_LOGIC_VECTOR(0,S) & A;   --将位宽4位的输入A填充到位宽2*S，前向补零
    PROCESS (A,B)
    VARIABLE R1 : STD_LOGIC_VECTOR(2*S DOWNTO 1);
    BEGIN
        R1 := (others => '0');
        FOR i IN 1 TO S LOOP
            IF (B(i) = '1') THEN
                R1 := R1 + TO_STDLOGICVECTOR (TO_BITVECTOR(A0) SLL (i-1));
            END IF;
        END LOOP;
        R <= R1;
    END PROCESS;
END ARCHITECTURE ONE;   
