----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2018 05:57:59 PM
-- Design Name: 
-- Module Name: pwm_gen - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_gen is
  Port (clk        : in STD_LOGIC;
        enable     : in STD_LOGIC;
        count_in   : in STD_LOGIC_VECTOR (3 downto 0);
        enable_led : out STD_LOGIC;        
        SSEG_CA    : out STD_LOGIC_VECTOR (7 downto 0);
        SSEG_AN    : out STD_LOGIC_VECTOR (7 downto 0));
end pwm_gen;

architecture Behavioral of pwm_gen is
signal output1  : STD_LOGIC_VECTOR ( 7 downto 0 )  := "00000000" ;
signal BOB      : STD_LOGIC_VECTOR ( 3 downto 0 )  := "0000" ;
signal ALICE    : STD_LOGIC_VECTOR ( 15 downto 0 ) := "0000000000000000" ; 


begin 

SSEG_CA <= output1;
with count_in select
output1 <=  "01000000" when "0000",  --0
            "11111001" when "0001",  --1  
            "10100100" when "0010",  --2
            "10110000" when "0011",  --3
            "10011001" when "0100",  --4
            "10010010" when "0101",  --5
            "10000010" when "0110",  --6
            "11111000" when "0111",  --7
            "10000000" when "1000",  --8
            "10011000" when "1001",  --9
            "10001000" when "1010",  --A
            "10000011" when "1011",  --B
            "11000110" when "1100",  --C
            "10100001" when "1101",  --D
            "10000110" when "1110",  --E
            "10001110" when "1111";  --F
                       
SSEG_AN<="11111110";

process (clk) 
begin
   if (clk='1' and clk'event) then
    ALICE<=ALICE+1;
   
   if ALICE<="1111111111111111" then
    BOB<=BOB+1;
   
   if BOB<count_in then
    enable_led<='1';
   
   else
    enable_led<='0'; 
   end if;
   end if;   
     
end if;  

end process;

end Behavioral;
