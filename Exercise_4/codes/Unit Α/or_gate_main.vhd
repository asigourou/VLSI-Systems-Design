------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
----------Main code:------------------------------
ENTITY or_gate IS
 
GENERIC (N: POSITIVE := 32);
PORT (x1,x2: IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		  y: OUT  STD_LOGIC_VECTOR(N-1 DOWNTO 0));
		  
END or_gate;
--------------------------------------------------
ARCHITECTURE or_struct OF or_gate IS
--------------------------------------------------
COMPONENT or_gt IS
 
GENERIC (inputs: POSITIVE);
PORT (a,b: IN STD_LOGIC_VECTOR(inputs-1 DOWNTO 0);
        c: OUT STD_LOGIC_VECTOR(inputs-1 DOWNTO 0));
END COMPONENT;
---------------------------------------------------
BEGIN
	og: or_gt GENERIC MAP (inputs=>N) PORT MAP (a=>x1, b=>x2, c=>y);
END or_struct ;
--------------------------------------------------