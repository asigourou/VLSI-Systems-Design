
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
----------------------------------------------------------------------
entity B2_RAM_wrapper_tb is
end;
---------------------------------------------------------------------
architecture bench of B2_RAM_wrapper_tb is

  component B2_RAM_wrapper
    port (
      addra_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
      clka_0 : in STD_LOGIC;
      dina_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
      douta_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
      ena_0 : in STD_LOGIC;
      wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
    );
  end component;

  signal addra_0: STD_LOGIC_VECTOR ( 4 downto 0 );
  signal clka_0: STD_LOGIC;
  signal dina_0: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal douta_0: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ena_0: STD_LOGIC;
  signal wea_0: STD_LOGIC_VECTOR ( 0 to 0 ) ;
begin

  uut: B2_RAM_wrapper port map ( addra_0 => addra_0,
                                 clka_0  => clka_0,
                                 dina_0  => dina_0,
                                 douta_0 => douta_0,
                                 ena_0   => ena_0,
                                 wea_0   => wea_0 );

  stimulus: process
  begin
  
     
      ena_0 <= '1' AFTER 100ns ; 
      wea_0 <= '1' AFTER 100ns, '0' AFTER 550ns;
      dina_0 <= x"02" AFTER 100ns, x"04" AFTER 300 ns, x"ab"  AFTER 500 ns, 
		x"68"  AFTER 600 ns, x"46"  AFTER 800 ns;
      addra_0 <= "00000"AFTER 100ns, "01000" AFTER 200 ns, "11011"  AFTER 300 ns,
                 "10101"  AFTER 400 ns, "00010"  AFTER 500 ns,"00000"AFTER 600ns,
		 "01000" AFTER 700 ns, 
                 "11011"  AFTER 800 ns, "10101"  AFTER 900 ns;
    
     
    wait;
  end process;


end;
