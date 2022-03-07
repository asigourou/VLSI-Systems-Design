--3 by 3 matrix multiplier. Each element of the matrix is 5 bit wide. 
--Inputs are called A and B and output is called C. 
--Each matrix has 9 elements each of which is 5 bit wide. So the inputs is 9*5= 45 bit long.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity matrix_mult is
    port (  Clock: in std_logic; 
            reset : in std_logic;   --active high reset
            start : in std_logic;   --A '1' starts the matrix multiplication process.
            A,B : in unsigned(44 downto 0);
            C : out unsigned(89 downto 0);
            done : out std_logic    --a '1' indicates that multiplication is done and result is availble at C.
            );
end entity;

architecture Behav of matrix_mult is

type matType is array(0 to 2,0 to 2) of unsigned(4 downto 0);
signal matA, matB : matType := (others => (others => "00000"));

type matType2 is array(0 to 2,0 to 2) of unsigned(9 downto 0);
signal  matC : matType2 := (others => (others => "0000000000"));
type state_type is (init,do_mult,apply_outputs);
signal state : state_type := init;
signal i,j : integer := 0;

begin 

sm : process (Clock,reset)    --process implementing the state machine for multiplying the matrices.

begin
    if(reset = '1') then
        state <= init;
        i <= 0;
        j <= 0;
       
        done <= '0';
        matA <= (others => (others => "00000"));
        matB <= (others => (others => "00000"));
        matC <= (others => (others => "0000000000"));
    elsif rising_edge(Clock) then
        case state is
            when init =>    --the matrices which are in a 1-D array are converted to 2-D matrices first.
                if(start = '1') then
                    for i in 0 to 2 loop    --run through the rows
                        for j in 0 to 2 loop    --run through the columns
                            matA(i,j) <= A((i*3+j+1)*5-1 downto (i*3+j)*5);
                            matB(i,j) <= B((i*3+j+1)*5-1 downto (i*3+j)*5);
                        end loop;
                    end loop;
                    state <= do_mult;
                end if;
                
            when do_mult =>
                for i in 0 to 2 loop    
                    for j in 0 to 2 loop 
                        matC(i,j) <=  matA(i,j)*matB(i,j);
                    end loop;
                end loop; 
                    
                state <= apply_outputs;
                     
               
                    
            when apply_outputs =>   --convert 3 by 3 matrix into a 1-D matrix.
                for i in 0 to 2 loop    --run through the rows
                    for j in 0 to 2 loop    --run through the columnss
                        C((i*3+j+1)*10-1 downto (i*3+j)*10) <= matC(i,j);
                    end loop;
                end loop;   
                done <= '1';
                state <= init;  
        end case;
    end if;
end process;
 
end architecture;