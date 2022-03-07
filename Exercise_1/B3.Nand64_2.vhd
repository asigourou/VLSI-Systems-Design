LIBRARY std;
USE std.standard.all;
ENTITY nand64 IS
GENERIC (looptimes: natural := 64);
PORT (inputA, inputB :IN bit_vector(looptimes - 1 downto 0); 
             outputC :OUT bit_vector(looptimes - 1 downto 0));
END nand64;
ARCHITECTURE structural OF nand64 IS
	BEGIN
		outputC <= inputA NAND inputB;
	END structural;
