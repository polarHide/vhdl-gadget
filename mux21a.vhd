-- file : mux21a.vhd
-- fuction : s控制2选1输出
-- author : ojw
-- createDate : 2019-09-12
-- source : book example 3-1 on page58

-- update : 2019-12-22
-- updateFor : 调整代码规范，增加中文注释

ENTITY mux21a IS
	PORT( 
		a,b,s : IN BIT;
		y     : OUT BIT	--BIT型只有0或1，建议多用std_logic
	);
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
