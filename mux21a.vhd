
-- date: 2019-09-12
-- author: ojw
-- source: book example 3-1 on page58

-- FUCTION
-- multiplexer 2 choose 1 : when s='1',y output a;when s='0',y output b
-- PORT
-- a,b : data channel input interface
-- s : channel selection contorl channel terminal
-- y : data output

-- LIBRARY WORK;
-- LIBRARY STD;
-- USE STD.STANDARD.ALL;
-- LIBRARY WORK AND STANDARD default open in VHDL
-- here not necessary write ,so comment is allright


ENTITY mux21a IS
	PORT ( a,b,s : IN BIT;
			   y : OUT BIT );	-- type BIT only two value 0&1,suggest type STD_LOGIC more
END ENTITY mux21a;

ARCHITECTURE bhv OF mux21a IS
BEGIN
	PROCESS ( a,b,s )
	BEGIN
		IF (s='1')
		THEN y<=a;
		ELSE y<=b;
		END IF;
	END PROCESS;
END ARCHITECTURE bhv;