--------------------------------------------------------------------------------
--																										--		
--							Green is so beautifull!!!											--
--																										--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--                              Green, green & green

entity Cpu_blackbox is
    Port ( addressbus : out  STD_LOGIC_VECTOR(15 downto 0);
           databus : inout  STD_LOGIC_VECTOR(15 downto 0);
           clock : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
			  RW : out  STD_LOGIC;
			  CE : out  STD_LOGIC;
			  ready : in  STD_LOGIC);

end Cpu_blackbox;

architecture Behavioral of Cpu_blackbox is
		component Reg is
			port (
				D : in  STD_LOGIC_VECTOR( 15 downto 0 );
				clock : in  STD_LOGIC;
				Q : out  STD_LOGIC_VECTOR( 15 downto 0 )
			);
		end component;
		
		component ALU is
			port(
				s : in  std_logic_vector(3 downto 0);
				a : in  std_logic_vector(15 downto 0);
				b : in  std_logic_vector(15 downto 0);
				y : out std_logic_vector(15 downto 0)
        );
		end component;
		
		component TriRegister is
			port ( 
				D : in  STD_LOGIC_VECTOR(15 downto 0);
				clock : in  STD_LOGIC;
				en : in  STD_LOGIC;
				Q : out  STD_LOGIC_VECTOR(15 downto 0));
		end component;
		
		component RegisterOE is
			 Port ( D : in  STD_LOGIC_VECTOR(15 downto 0);
					  clock : in  STD_LOGIC;
					  we : in  STD_LOGIC;
					  oe : in STD_LOGIC;
					  Q : out  STD_LOGIC_VECTOR(15 downto 0));
		end component;
		
		component comparator is
			port(
				a: in std_logic_vector(15 downto 0);
				b: in std_logic_vector(15 downto 0);
				sel: in std_logic_vector(2 downto 0);
				y: out std_logic
			);
		end component;
		
		component registerarray is
			port( 
				data: in std_logic_vector(15 downto 0);
				clock: in std_logic;
				sel: in std_logic_vector(2 downto 0);
				we: in std_logic;
				oe: in std_logic;
				Q: inout std_logic_vector(15 downto 0)
		   );
		end component;
		
		component shf is
			port( 
				D : in  STD_LOGIC_VECTOR( 15 downto 0 );
				sel : in  STD_LOGIC_VECTOR( 2 downto 0 );
				Q : out  STD_LOGIC_VECTOR( 15 downto 0 )
			);
		end component;
		
		component controlunit is
			port(   Clock : in  STD_LOGIC;
					  Reset : in  STD_LOGIC;
					  Ready : in  STD_LOGIC;
					  Comp_Out : in  STD_LOGIC;
					  RW : out  STD_LOGIC;
					  CE : out  STD_LOGIC;
					  Ctrl_RegArray : out  STD_LOGIC_VECTOR (5 downto 0);
					  Ctrl_Op : out  STD_LOGIC_VECTOR (1 downto 0);
					  Ctrl_Address : out  STD_LOGIC;
					  Ctrl_PC : out  STD_LOGIC_VECTOR (2 downto 0);
					  Ctrl_ACC : out  STD_LOGIC_VECTOR (2 downto 0);
					  Ctrl_Shift : out  STD_LOGIC_VECTOR 	(2 downto 0);
					  Ctrl_ALU : out  STD_LOGIC_VECTOR (3 downto 0);
					  Ctrl_Instr : out  STD_LOGIC_VECTOR (1 downto 0);
					  Ctrl_Comp : out  STD_LOGIC_VECTOR (2 downto 0);
					  Instructionin : in  STD_LOGIC_VECTOR (15 downto 0);
					  dataOut: inout STD_LOGIC_VECTOR (15 downto 0)
			);
		end component;

		signal ctrlALU: STD_LOGIC_VECTOR(3 downto 0);
		signal dataB: STD_LOGIC_VECTOR(15 downto 0);
		signal dataShift: STD_LOGIC_VECTOR(15 downto 0);
		signal dataACC: STD_LOGIC_VECTOR(15 downto 0);
		signal dataaddress: STD_LOGIC_VECTOR(15 downto 0);
		signal dataCtrlUnit: STD_LOGIC_VECTOR(15 downto 0);
		signal CtrlPC: STD_LOGIC_VECTOR(2 downto 0);					-- MSB (oe, we, clock) LSB
		signal CtrlACC: STD_LOGIC_VECTOR(2 downto 0);
		signal CtrlShift: STD_LOGIC_VECTOR(2 downto 0);
		signal CtrlInstr: STD_LOGIC_VECTOR(1 downto 0);
		signal CtrlComp: STD_LOGIC_VECTOR(2 downto 0);
		signal CtrlOp: STD_LOGIC_VECTOR(1 downto 0);
		signal CtrlRegArray: STD_LOGIC_VECTOR(5 downto 0);
		signal CtrlAddress: STD_LOGIC;
		signal Compout: STD_LOGIC;
--		signal instructionIn: STD_LOGIC_VECTOR(15  downto 0);

begin

	alunit: component ALU port map (ctrlALU, databus, dataB, dataShift);
	Reg_Address: component Reg port map (databus, CtrlAddress, addressbus);
	Instr_reg: component TriRegister port map (databus, CtrlInstr(0), CtrlInstr(1), dataCtrlUnit);
	Reg_OP: component TriRegister port map (databus, CtrlOp(0), CtrlOp(1), dataB);
	PC: component RegisterOE port map (databus, CtrlPC(0), CtrlPC(1), CtrlPC(2), databus);
	Acc_reg: component RegisterOE port map (dataACC, CtrlACC(0), CtrlACC(1), CtrlACC(2), databus);
	comp: component comparator port map (databus, dataB, CtrlComp, Compout);
	Regbank: component registerarray port map (databus, CtrlRegArray(0), CtrlRegArray(5 downto 3),CtrlRegArray(1),CtrlRegArray(2), databus);
	Shifter: component shf port map (dataShift, CtrlShift, dataACC);
	CU: component controlunit port map (clock, reset, ready, Compout, RW, CE, CtrlRegArray, CtrlOp, CtrlAddress, CtrlPC, CtrlACC, CtrlShift, ctrlALU, CtrlInstr, CtrlComp, dataCtrlUnit, databus);
	
end Behavioral;
