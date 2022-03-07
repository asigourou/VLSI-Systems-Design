
library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------

entity Mux is
port(	I1: 	in std_logic_vector(7 downto 0);
	    I0: 	in std_logic_vector(7 downto 0);
	    S:	    in std_logic_vector(1 downto 0);
	    O:	    out std_logic_vector(7 downto 0)
);
end Mux;  

-------------------------------------------------

architecture behv1 of Mux is
begin
    process(I1,I0,S)
    begin
    
        if (s = "00") then
	       O <= "00000000";
        elsif (S = "01") then
	       O <= I0;
	    elsif (s = "10") then 
	       O <= I1;
	    elsif (s = "11") then
	       O <= "ZZZZZZZZ";
	    else 
	       O <= "XXXXXXXX";
	    end if;

    end process;
end behv1;
