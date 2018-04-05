----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity union is
    Port ( unrst : in  STD_LOGIC;
           unclk : in  STD_LOGIC;
           unout : out  STD_LOGIC_VECTOR (31 downto 0));
end union;

architecture Behavioral of union is

COMPONENT program_counter
PORT(
	pcadder : IN std_logic_vector(31 downto 0);
	rst : IN std_logic;
	clk : IN std_logic;          
	salida : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

COMPONENT sumador
PORT(
	A : IN std_logic_vector(31 downto 0);
	B : IN std_logic_vector(31 downto 0);          
	C : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

signal aux_datainnp : std_logic_vector (31 downto 0);
signal aux_outsum : std_logic_vector (31 downto 0);
signal aux_outpc : std_logic_vector (31 downto 0); 

begin

nextprogram_counter: program_counter PORT MAP(
		pcadder => aux_outsum,
		rst => unrst ,
		clk => unclk,
		salida => aux_datainnp
	);

inst_program_counter: program_counter PORT MAP(
		pcadder => aux_datainnp,
		rst => unrst,
		clk => unclk,
		salida => aux_outpc
	);

Inst_sumador: sumador PORT MAP(
	A => "00000000000000000000000000000100",
	B => aux_outpc,
	C => aux_outsum
);

unout <= aux_outpc;

end Behavioral;

