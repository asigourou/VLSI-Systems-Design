
library ieee;
use ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

------------------------------------------------------------

entity ram32 is 
	generic (bits: integer := 8; --# bit per word
		 length: integer := 5 --# words per memory 
	);

	port (
		address: in std_logic_vector(4 downto 0);
		data_in: in std_logic_vector(7 downto 0);
		data_out: out std_logic_vector(7 downto 0);
		WE,enable, reset, clk: in std_logic

	);
end entity ram32;

-------------------------------------------------------------

architecture ram of ram32 is
	type vector_array is array (  0  to 2**(length)-1)
		 of std_logic_vector (bits-1 downto 0);
	signal memory: vector_array;

begin
	read_and_write: process (clk)
   begin

      if rising_edge(clk) then    
     
         if reset = '1' then
            -- Synchronous reset to clear memory
            memory  <= (others => (others => '0'));
            data_out <= (others => '0');
         elsif Enable = '1' then
            if WE = '1' then
               -- Write Memory
               memory(to_integer(unsigned(address))) <= data_in;
            else
               -- Read Memory
               data_out <= memory(to_integer(unsigned(address)));
            end if;
         end if;      
      end if;
   end process;

end ram;


