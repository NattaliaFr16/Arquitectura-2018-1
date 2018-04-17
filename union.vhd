----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity union is
    Port ( unrst : in  STD_LOGIC;      --rst
           unclk : in  STD_LOGIC;      --clk
           unout : out  STD_LOGIC_VECTOR (31 downto 0));  --asd
end union;

architecture Behavioral of union is

COMPONENT program_counter
PORT(
	pcadder : IN std_logic_vector(31 downto 0);  --data in
	rst : IN std_logic;
	clk : IN std_logic;          
	salida : OUT std_logic_vector(31 downto 0) --data out
	);
END COMPONENT;

COMPONENT sumador
PORT(
	A : IN std_logic_vector(31 downto 0); --oper1
	B : IN std_logic_vector(31 downto 0);   --oper2       
	C : OUT std_logic_vector(31 downto 0)		--result
	);
END COMPONENT;

COMPONENT alu
PORT(
	mux_in : IN std_logic_vector(31 downto 0);		--op2
	crs1 : IN std_logic_vector(31 downto 0);		--op1
	uc_in : IN std_logic_vector(5 downto 0);    --op code      
	alu_result : OUT std_logic_vector(31 downto 0)  --result
	);
END COMPONENT;

COMPONENT instruction_memory
	PORT(
		pc_in : IN std_logic_vector(31 downto 0);  --addres
		rst : IN std_logic;          
		im_out : OUT std_logic_vector(31 downto 0)  --result
		);
	END COMPONENT;

COMPONENT mux
	PORT(
		crs2 : IN std_logic_vector(31 downto 0);  --a
		seu32 : IN std_logic_vector(31 downto 0);	--b
		i : IN std_logic;          --sel
		mux_out : OUT std_logic_vector(31 downto 0) --salida
		);
	END COMPONENT;

COMPONENT register_file
	PORT(
		rs1_in : IN std_logic_vector(4 downto 0);
		rs2_in : IN std_logic_vector(4 downto 0);
		rd_in : IN std_logic_vector(4 downto 0);
		dwr_alu : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		crs1_alu : OUT std_logic_vector(31 downto 0);
		crs2_mux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT seu
	PORT(
		simm13 : IN std_logic_vector(12 downto 0);    --imm13      
		seu_out : OUT std_logic_vector(31 downto 0)		--seuimm
		);
	END COMPONENT;
	
COMPONENT uc
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		data_alu : OUT std_logic_vector(5 downto 0) --aluop
		);
	END COMPONENT;

signal aux_datainnp : std_logic_vector (31 downto 0); --addaux
signal aux_outsum : std_logic_vector (31 downto 0); --sum
signal aux_outpc : std_logic_vector (31 downto 0); --add
signal salida_im : std_logic_vector (31 downto 0); --ins
signal out_seu : std_logic_vector (31 downto 0);
signal crs1_out : std_logic_vector (31 downto 0);
signal crs2_out : std_logic_vector (31 downto 0);
signal alu_ins : std_logic_vector (5 downto 0);
signal mux_sal : std_logic_vector (31 downto 0);
signal alu_out : std_logic_vector (31 downto 0); --ALUout
signal imm13:std_logic_vector(12 downto 0);

begin
imm13<=salida_im (12 downto 0);
unout <= alu_out;  --asd aluout

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
	A => "00000000000000000000000000000001",
	B => aux_datainnp,
	C => aux_outsum
);

Inst_alu: alu PORT MAP(
		mux_in => mux_sal,
		crs1 => crs1_out,
		uc_in => alu_ins,
		alu_result => alu_out 
	);

Inst_instruction_memory: instruction_memory PORT MAP(
		pc_in => aux_outpc ,
		rst => unrst,
		im_out => salida_im
	);

Inst_mux: mux PORT MAP(
		crs2 => crs2_out,
		seu32 => out_seu,
		i => salida_im (13),
		mux_out => mux_sal 
	);
	
Inst_register_file: register_file PORT MAP(
		rs1_in => salida_im (18 downto 14),
		rs2_in => salida_im(4 downto 0),
		rd_in => salida_im(29 downto 25),
		dwr_alu => alu_out,
		rst => unrst,
		crs1_alu => crs1_out,
		crs2_mux => crs2_out
	);
	
Inst_seu: seu PORT MAP(
		simm13 => imm13,
		seu_out => out_seu
	);

Inst_uc: uc PORT MAP(
		op => salida_im(31 downto 30),
		op3 => salida_im(24 downto 19),
		data_alu => alu_ins
	);




end Behavioral;

