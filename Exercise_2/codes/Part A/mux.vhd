
library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------

entity Mux is
port(	I1: 	in std_logic_vector(7 downto 0);
	I0: 	in std_logic_vector(7 downto 0);
	S:	in std_logic_vector(1 downto 0);
	O:	out std_logic_vector(7 downto 0)
);
end Mux;  

-------------------------------------------------

architecture behv1 of Mux is
begin
    process(I1,I0,S)
    begin
    
        -- use case statement
        case S is
	    when "00" =>	O <= "00000000";
	    when "01" =>	O <= I0;
	    when "10" =>	O <= I1;
	    when "11" =>	O <= "ZZZZZZZZ";
	    when others =>	O <= "XXXXXXXX";
	end case;

    end process;
end behv1;
