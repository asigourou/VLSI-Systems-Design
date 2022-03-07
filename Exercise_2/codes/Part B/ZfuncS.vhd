library ieee;				-- component #1
use ieee.std_logic_1164.all;

entity OR_GATE is
port(  	X:	in std_logic;
	Y:	in std_logic;
	Z:	in std_logic;
	F3:	out std_logic
);
end OR_GATE;

architecture behv of OR_GATE is
begin
process(X,Y,Z)
begin
	F3 <= (X or Y) or Z;			-- behavior des.
end process;
end behv;

-------------------------------------------------------------

library ieee;				-- component #2
use ieee.std_logic_1164.all;

entity AND3_GATE is
port(  	A:	in std_logic;
	B:	in std_logic;
	C:	in std_logic;
	F1:	out std_logic
	
);
end AND3_GATE;

architecture behv of AND3_GATE is
begin
process(A,B,C)
begin
	F1 <= A and B and C;	-- behavior des.

end process;
end behv;

--------------------------------------------------------------
library ieee;				-- component #3
use ieee.std_logic_1164.all;

entity AND2_GATE is
port(  	A:	in std_logic;
	B:	in std_logic;
	F1:	out std_logic;
	F2:	out std_logic
);
end AND2_GATE;

architecture behv of AND2_GATE is
begin
process(A,B)
begin
	F2 <= A and B; -- behavior des.
end process;
end behv;

--------------------------------------------------------------

library ieee;				-- component #2
use ieee.std_logic_1164.all;

entity NOT_GATE is
port(  	A:	in std_logic;
	   F4: out std_logic
);
end NOT_GATE;

architecture behv of NOT_GATE is
begin
process(A)
begin
	F4 <= not A ; -- behavior des.
end process;
end behv;

--------------------------------------------------------------

library ieee;				-- top level circuit
use ieee.std_logic_1164.all;
use work.all;

entity comb_zfunc is
port(inputA: in std_logic;
	 inputB: in std_logic;
	 inputC: in std_logic;
	 outputZ: out std_logic
);
end comb_zfunc;

architecture struct of comb_zfunc is

    component AND3_GATE is		-- as entity of AND_GATE
    port(   A:	in std_logic;
    	    B:	in std_logic;
	        C:	in std_logic;
            F1:	out std_logic	      
    );
    end component;
    
    component AND2_GATE is		-- as entity of AND_GATE
    port(   A:	in std_logic;
    	    B:	in std_logic;
            F2:	out std_logic
	      
    );
    end component;

    component OR_GATE is		-- as entity of OR_GATE
    port(   X:	in std_logic;
    	    Y:	in std_logic;
	        Z:  in std_logic;
    	    F3: out std_logic
    );
    end component;
    
    component NOT_GATE is		-- as entity of NOT_GATE
    port(   A:	in std_logic;
    	    F4: out std_logic
    );
    end component;

    signal wire1: std_logic;		-- signal just like wire
    signal wire2: std_logic;	
    signal wire3: std_logic;
    
begin

    Gate1: NOT_GATE port map (A=>inputC, F4=>wire1);
    Gate2: AND3_GATE port map (A=>inputA, B=>inputB, C=>wire1, F1=>wire2);
    Gate3: AND2_GATE port map (A=>inputA, B=>inputB, F2=>wire3);
    Gate4: OR_GATE port map (X=>inputC, Y=>wire2, Z=>wire3, F3=>outputZ);

end struct;

