
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

-------------------------------------------------------

entity B2_RAM_wrapper is
  port (
    addra_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    clka_0 : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    douta_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ena_0 : in STD_LOGIC;
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end B2_RAM_wrapper;
--------------------------------------------------------
architecture STRUCTURE of B2_RAM_wrapper is
  component B2_RAM is
  port (
    addra_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    douta_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ena_0 : in STD_LOGIC;
    clka_0 : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component B2_RAM;

begin
B2_RAM_i: component B2_RAM
     port map (
      addra_0(4 downto 0) => addra_0(4 downto 0),
      clka_0 => clka_0,
      dina_0(7 downto 0) => dina_0(7 downto 0),
      douta_0(7 downto 0) => douta_0(7 downto 0),
      ena_0 => ena_0,
      wea_0(0) => wea_0(0)
    );
end STRUCTURE;
