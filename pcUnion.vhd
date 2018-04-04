----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:18 04/03/2018 
-- Design Name: 
-- Module Name:    pcUnion - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pcUnion is
    Port ( rst : in  STD_LOGIC_VECTOR (1 downto 0);
           a : in  STD_LOGIC_VECTOR (4 downto 0);
           clk : in  STD_LOGIC_VECTOR (1 downto 0);
           s : out  STD_LOGIC_VECTOR (31 downto 0));
end pcUnion;

architecture Behavioral of pcUnion is
	
	component adder is 
	port ( A : 

begin


end Behavioral;

