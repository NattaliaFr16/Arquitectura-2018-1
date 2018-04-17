library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;	
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 



entity instruction_memory is
    Port ( pc_in : in  STD_LOGIC_VECTOR (31 downto 0); --adress
           rst : in  STD_LOGIC;
           im_out : out  STD_LOGIC_VECTOR (31 downto 0)); --instruction
end instruction_memory;

architecture Behavioral of instruction_memory is

type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
	signal rom : rom_type := 	("10100000000100000010000000000101","10100010000100000010000000000110","10100100000001000000000000010001",
										 "10100110001001001010000000000011","00100011001111111111111111111000","10100010000101000110001010010100",others =>"00000000000000000000000000000000");   

begin

process (pc_in,rst,rom)
	begin
	if (rst = '0') then
		im_out <= rom (conv_integer (pc_in));
		
	else
		im_out <= x"00000000";
	
	end if;
		
end process;

end Behavioral;

