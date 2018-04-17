----------------------------------------------------------------------------------

--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;


entity alu is
    Port ( mux_in : in  STD_LOGIC_VECTOR (31 downto 0);	--op2
           crs1 : in  STD_LOGIC_VECTOR (31 downto 0);		--op1
           uc_in : in  STD_LOGIC_VECTOR (5 downto 0);   --op code
           alu_result : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is

begin
process (mux_in, crs1, uc_in )

begin
		--report"uc_in: "&integer'image(conv_integer(uc_in));
		case uc_in is 
			
			--add
			when "000000" => alu_result <= std_logic_vector ( signed(crs1) + signed (mux_in));
			
			--sub 
			when "000100" => alu_result <= std_logic_vector ( signed(crs1) - signed (mux_in));
			
			--and
			when "000001" => alu_result <= crs1 and mux_in;
			
			--nand
			when "000101" => alu_result <= crs1 nand mux_in;
			
			--or
			when "000010" => alu_result <= crs1 or mux_in;
			
			--nor
			when "000110" => alu_result <= crs1 nor mux_in;
			
			--xor
			when "000011" => alu_result <= crs1 xor mux_in;
			
			--xnor
			when "000111" => alu_result <= crs1 xnor mux_in;
			
			when others => alu_result <= "11111111111111111111111111111111"; -- cuando no se cumplen los casos anteriores, me devuelve -1
			
		end case;
end process;
	

end Behavioral;

