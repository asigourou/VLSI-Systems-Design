library ieee;				-- component #1
use ieee.std_logic_1164.all;
---------------------------------------------
entity function_behav is
	port(  	
		a, b, c: in std_logic;
		z:	out std_logic
	);

end function_behav;
---------------------------------------------
architecture behavioral of function_behav is
begin
    process (a, b, c)
    begin
        if (c = '1') then
	       z <= '1';
        elsif (a = '1') AND (b = '1') then
	       z <= '1';
	else 
	       z <= '0';
	end if;

    end process;

end behavioral;
