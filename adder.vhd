----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:57 04/03/2018 
-- Design Name: 
-- Module Name:    adder - arqAdderModule 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity adder is
    Port ( a : in  STD_LOGIC_vector (31 downto 0);
           b : in  STD_LOGIC_vector  (31 downto 0);
           c : out  STD_LOGIC_vector (31 downto 0));
end adder;

architecture arqAdderModule of adder is

begin

c <= a+b;

end arqAdderModule;

