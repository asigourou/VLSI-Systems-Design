LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY AndXorLU IS
Port (InputA,InputB :IN std_logic_vector(7 downto 0);
   OutputC, OutputD :OUT std_logic_vector(7 downto 0));
END AndXorLU;
ARCHITECTURE Structural of AndXorLU IS
BEGIN
AndLoop: FOR i IN 0 to 7 GENERATE
OutputC(i) <= InputA(i) AND InputB(i);
END GENERATE;
XorLoop: FOR i IN 0 to 7 GENERATE
OutputD(i) <= InputA(i) xor InputB(i);
END GENERATE;
END Structural ;