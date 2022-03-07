------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
----------------------------------------
ENTITY or_gt IS

GENERIC (inputs: POSITIVE); 
PORT (a, b: IN  STD_LOGIC_VECTOR(inputs-1 DOWNTO 0);
	     c: OUT  STD_LOGIC_VECTOR(inputs-1 DOWNTO 0));

END or_gt;
------------------------------------------------------------
ARCHITECTURE or_gate_arch OF or_gt IS

BEGIN
XLoop: For i IN 0 TO inputs-1 Generate
		c(i) <= a(i) OR b(i);
	End Generate XLoop;

END or_gate_arch;
--------------------------------------------------
