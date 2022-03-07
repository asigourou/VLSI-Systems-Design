LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY LogicUnitRegister IS
Port (InputA, InputB :IN std_logic_vector(7 downto 0);
    OutputC, OutputD :BUFFER std_logic_vector(7 downto 0);
			      clk:IN STD_LOGIC;
				   en:IN std_logic;
		      reg_and:OUT std_logic_vector(7 downto 0);
			  reg_xor:OUT std_logic_vector(7 downto 0));
END LogicUnitRegister;
ARCHITECTURE Structural of LogicUnitRegister IS
BEGIN
		OutputC <= InputA AND InputB;
		OutputD <= InputA xor InputB;
		PROCESS (clk)IS
		BEGIN
			IF (clk'EVENT AND clk='1' AND en='1') THEN
				reg_and<= OutputC;
				reg_xor<= OutputD;
			END IF;
        END PROCESS;
END Structural;