----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2018 09:57:02 AM
-- Design Name: 
-- Module Name: lab6 - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab6 is
--  Port ( );
    Port ( SW : in STD_LOGIC_VECTOR (15 downto 0);
    CLK : in STD_LOGIC;
    LED : out STD_LOGIC_VECTOR (15 downto 0)
    );
end lab6;

architecture Behavioral of lab6 is

begin
    LED <= SW ;

end Behavioral;
