------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
----------Main code:------------------------------
ENTITY xor_gate IS
 
GENERIC (N: POSITIVE := 64);
PORT (x1,x2: IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		  y: OUT  STD_LOGIC_VECTOR(N-1 DOWNTO 0));
		  
END xor_gate;
--------------------------------------------------
ARCHITECTURE xor_struct OF xor_gate IS
--------------------------------------------------
COMPONENT xor_gt IS
 
GENERIC (inputs: POSITIVE);
PORT (a,b: IN STD_LOGIC_VECTOR(inputs-1 DOWNTO 0);
        c: OUT STD_LOGIC_VECTOR(inputs-1 DOWNTO 0));
END COMPONENT;
---------------------------------------------------
BEGIN
	xg: xor_gt GENERIC MAP (inputs=>N) PORT MAP (a=>x1, b=>x2, c=>y);
END xor_struct ;
--------------------------------------------------