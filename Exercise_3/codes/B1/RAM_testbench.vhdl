
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------
 
ENTITY ram_tb IS
END ram_tb;

ARCHITECTURE behavior OF ram_tb IS 
    COMPONENT ram32
    generic (bits: integer := 8; --# bit per word
		 length: integer :=5 --# words per memory 
	);

	port (
		address: in std_logic_vector(4 downto 0);
		data_in: in std_logic_vector(7 downto 0);
		data_out: out std_logic_vector(7 downto 0);
		WE,enable, reset, clk: in std_logic

	);
    END COMPONENT;
     
   --Inputs
   signal clk  : std_logic := '0';
   signal reset   : std_logic := '1';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal address : std_logic_vector(4 downto 0) := (others => '0');
   signal WE : std_logic := '0';
   signal enable  : std_logic := '0';
 
     --Outputs
   signal data_out : std_logic_vector(7 downto 0);
 
   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
uut : ram32
   Generic map (
     bits  => data_in'length,
   length => address'length
   ) PORT MAP (
      clk  => clk,
      reset   => reset,
      data_in  => data_in,
      address => address,
      WE => WE,
      enable  => enable,
      data_out => data_out
   );
 
   -- Clock process definitions
CLK_process : process
   begin
        clk <= '0';
        wait for CLK_period/2;
        clk <= '1';
        wait for CLK_period/2;
   end process;
 
   -- Stimulate Write process
   
stim_write_read : process
   begin 
      reset <= '0' AFTER 80ns; 
      enable <= '1' AFTER 100ns ; 
      WE <= '1' AFTER 100ns, '0' AFTER 550ns;
      data_in <= x"02" AFTER 100ns, x"04" AFTER 300 ns, x"ab"  AFTER 500 ns, x"68" 
		 AFTER 600 ns, x"46"  AFTER 800 ns;
      Address <= "00000"AFTER 100ns, "01000" AFTER 200 ns, "11011"  AFTER 300 ns,
                 "10101"  AFTER 400 ns, "00010"  AFTER 500 ns,"00000"AFTER 600ns,
		 "01000" AFTER 700 ns, 
                 "11011"  AFTER 800 ns, "10101"  AFTER 900 ns;
    
     
      wait;
   end process;
end;

