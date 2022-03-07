LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY onebit_Full_Adder IS
PORT (inputA, inputB, cin : in std_logic;
				sum, cout : out std_logic);
END onebit_Full_Adder;
architecture dataflow of onebit_Full_Adder is
	signal abxorgate, abandgate, cinxorgate: std_logic;
BEGIN 
	abxorgate<= inputA xor inputB;
	abandgate<= inputA and inputB;
	cinxorgate<= abxorgate and cin;
	sum<= abxorgate xor cin;
	cout<= abandgate or cinxorgate;
END architecture;
	