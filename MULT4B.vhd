
-- date: 2019-09-09
-- author: ojw
-- source: book example 3-13 on page81

-- library and program package invoke declarations -----

LIBRARY IEEE;	-- open library IEEE
USE IEEE.STD_LOGIC_1164.ALL;	-- allow to use ALL content in program packsge STD_LOGIC_1164 in library IEEE
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

-- library and program package invoke declarations -----


-- vhdl made of two parts:entity,and,structural body

-- ENTITY ---------------------------------------

-- statement lead with keyword ENTITY and end with END ENTITY MULT4B;called entity,MULT4B as entity name named by you
-- entity:external situation of circuit device,basic property of each signal ;
-- eg:the direction of signal flowing,the data type of flowing signal

ENTITY MULT4B IS
GENERIC ( S : INTEGER :=4 ); -- define parameter S as integer equal to 4
    PORT ( R : OUT STD_LOGIC_VECTOR(2*S DOWNTO 1);	-- vector or bus port signal whose width of array is 2*S~1 bit
        A, B : IN STD_LOGIC_VECTOR (S DOWNTO 1));
END ENTITY MULT4B;

-- GENERIC: placed before PORT,参数传递说明语句,passed parameter allow to change/reset from outside of ENTITY ;
-- while general constant only assign from inside of ENTITY,and,unchangable
-- GENERIC ( constannt_name : data_type [:settle_value] );
-- PORT ( port_name : port_m data_type;);

-- ENTITY ---------------------------------------


-- ARCHITECTURE:structural body -----------------------------------------------

-- statement lead with keyword ARCHITECTURE and end with END ARCHITECTURE ONE,ONE as structural body name
-- ARCHITECTURE:internal logic function and struction of circuit device

ARCHITECTURE ONE OF MULT4B IS
    SIGNAL A0 : STD_LOGIC_VECTOR(2*S DOWNTO 1);
BEGIN
    A0 <= CONV_STD_LOGIC_VECTOR(0,S) & A;	-- <= right result send to left
    PROCESS (A,B)
    VARIABLE R1 : STD_LOGIC_VECTOR(2*S DOWNTO 1);
    BEGIN
        R1 := (others => '0');  -- if S==4,this statement equal to 'R1:="00000000"'
        FOR i IN 1 TO S LOOP
            IF (B(i) = '1') THEN
                R1 := R1 + TO_STDLOGICVECTOR (TO_BITVECTOR(A0) SLL (i-1));
            END IF;
        END LOOP;
        R <= R1;
    END PROCESS;
END ARCHITECTURE ONE;   

-- ARCHITECTURE:structural body -----------------------------------------------
