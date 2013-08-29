library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.C3PUlib.all;

entity ControlUnit is
    Port ( Clock : in  STD_LOGIC;
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
           Ctrl_Shift : out  STD_LOGIC_VECTOR (2 downto 0);
           Ctrl_ALU : out  STD_LOGIC_VECTOR (3 downto 0);
           Ctrl_Instr : out  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_Comp : out  STD_LOGIC_VECTOR (2 downto 0);
			  Instructionin : in  STD_LOGIC_VECTOR (15 downto 0);
			  dataOut: inout STD_LOGIC_VECTOR (15 downto 0) := (others => 'Z')
			  );
end ControlUnit;

architecture Behavioral of ControlUnit is

type state_type is (	res1, res2, res3, res31, res4, res5, res6, res7, res8,
							fet1, fet10, fet11, fet2, fet3,
							decode,
							load1, load11, load2, load3, load4, load5, load6,
							loadI1, loadI2, loadI3, loadI4, loadI5, loadI6, loadI7, loadI8, loadI9, loadI10, loadI11, loadI12, loadI13, loadI14, loadI15, loadI16, loadI17, loadI18,
							store1, store2, store3, store4, store5, store6, store7, store8,
							storeI1, storeI2, storeI3, storeI4, storeI5, storeI6, storeI7, storeI8, storeI9, storeI10, storeI11, storeI12, storeI13, storeI14, storeI15, storeI16, storeI17, storeI18, storeI19,
							mov1, mov2, mov3, mov4, mov5, mov6, mov7,
							jmp1, jmp2, jmp3, jmp4,
							jmpc1, jmpc2, jmpc3, jmpc4, jmpc5, jmpc6, jmpc61, jmpc7, jmpc8, jmpc9, jmpc10, jmpc11, jmpc12, jmpc13, jmpc14,
							add1, add2, add3, add4, add5, add6, add7, add8, add9, add10, add11, add12,
							inc, inc1, inc2, inc3, inc4, inc5, inc6, inc7,
							-- Following are single operand commands:
--							dec, zero, shl, shr, rotr, rotl,
							-- Following are two operand commands:
							pcInc1, pcInc2, pcInc3, pcInc4, pcInc5, pcInc6, pcInc7,
							exec);  --type of state machine.
signal current_s, next_s : state_type := res1;  --current and next state declaration.



begin
--RW  <= '0';
--CE  <= '0';
--Ctrl_RegArray  <= "00000";
--Ctrl_Address  <= '0';
--Ctrl_Comp <= "000";
			  
	process( Reset, Clock ) is
	begin
		if( Reset = '1' ) then
			current_s <= res1;
		elsif ( Rising_Edge( Clock ) ) then
			current_s <= next_s;
		end if;
	end process;
	
	process( current_s, Ready, Instructionin, Comp_Out) is
		variable regsel : std_logic_vector( 3 downto 0 ) := "0000";
		variable exeOperation : std_logic_vector(4 downto 0) := "00000";
		
		procedure disableAll is
		begin
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_RegArray <= "000010";
				Ctrl_Address <= '0';
				dataOut <= (others => 'Z');
		end procedure;
	begin
--		Ctrl_ACC <= "00"; -- clock and enable
--		Ctrl_ALU <= AluPass; -- set ALU to zero
--		Ctrl_Shift <= shiftPass; -- SHIFT pass
--		Ctrl_ACC <= "00"; -- clock disable
--		Ctrl_PC <= "00"; -- enable everything
--		Ctrl_OP <= "00";
--		Ctrl_Instr <= "00";
--		Ctrl_ACC <= "010"; -- enable, clock
--		Ctrl_PC <= "010";
--		Ctrl_OP <= "10";
--		Ctrl_Instr <= "10";
--		Ctrl_RegArray <= "000010";			-- Disable oe, enable register array, and set clock to 0.
--		Ctrl_Address <= '0';

		case current_s is
			when res1 =>			-- Put 0 through ALU, and pass it through the shifter. Enable ACC, PC, OP and instruction register.
				Ctrl_ALU <= AluZero; -- set ALU to zero
				Ctrl_Shift <= shiftPass; -- SHIFT pass
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';
				Ctrl_RegArray <= "000010";
				dataOut <= (others => 'Z');

				next_s <= res2;
			when res2 =>			-- Write 0 to ACC.
				Ctrl_ACC <= "011"; -- clock and enable (from right to left)
				next_s <= res3;
			when res3 =>			-- Stop writing to the ACC, write data output from ACC to ACC, OP and instruction register (all connected to the data bus). Prepare the enable signal for the address register.
				Ctrl_ACC <= "110"; -- Clock disable
				Ctrl_PC <= "010"; -- Write enable and enable clock, but disable output.
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				Ctrl_Address <= '0';
				next_s <= res31;
			when res31 =>
				Ctrl_PC <= "011"; -- Write enable and enable clock, but disable output.
				Ctrl_OP <= "11";
				Ctrl_Instr <= "11";
				Ctrl_Address <= '0';
				next_s <= res4;
				
			when res4 =>			-- Enable PC output one clock before we enable writing to the address register (just in case, to ensure against possible delays).
				Ctrl_PC <= "100"; -- Enable output, disable we, disable clock.
				next_s <= res5;				
			when res5 =>			-- Write to the address register and disable writing to the PC, OP and instruction register (just in case if they were accidentaly active).
				Ctrl_Address <= '1';
				Ctrl_PC <= "100"; -- Enable output, disable we, disable clock.
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				next_s <= res6;
			when res6 =>			-- Disable output of the PC register.
				Ctrl_Address <= '0';
				Ctrl_PC <= "000";
				regsel := "0000";
				next_s <= res7;
			when res7 =>
				Ctrl_RegArray <= "000010";			-- Disable oe, enable register array, and set clock to 0.
				next_s <= res8;
			when res8 =>								-- Select current register, and enable writing to the register. Increasse the current address. If the address is greater than 7, continue to the next state. (Loop until all registers have been cleared.)
				if( conv_integer( regsel ) > 7 ) then
					next_s <= fet1;
				else
					next_s <= res7;
				end if;
				Ctrl_RegArray <= ( regsel( 2 downto 0 ) & "011" );
				regsel := regsel+"0001";
				
			when fet1 =>			-- Fetch instruction. Enable writing of the current value of PC from PC to address register. Disable ACC, keep RegArray enabled but with oe=0 and clk=0. Instruction register should be enabled and clock set to 0 so it can receive an instruction.
										-- Additional comment: output of the ACC is actually the data bus, that's why it changes eventhough the component is not active.
				Ctrl_PC <= "000";
				Ctrl_Instr <= "10";
				Ctrl_RegArray <= "000010";
				Ctrl_Acc <= "010";
				RW <= '0';
				CE <= '0';
				next_s <= fet10;
			when fet10 =>
				Ctrl_PC <= "100";
				next_s <= fet11;
			when fet11 =>
				Ctrl_Address <= '1';
				next_s <= fet2;
			
			when fet2 =>			-- Enable memory device (CE='1') and disable writing (RW='0'). Disable writing to the address register.
				Ctrl_Address <= '0';
				Ctrl_PC <= "010";
				RW <= '0';
				CE <= '1';
				next_s <= fet3;
			when fet3 =>			-- Wait until the Ready signal is high, then write the data from the data bus to the instruction register. Until Ready is ready, loop through the state.
				if (Ready = '1') then
					Ctrl_Instr <= "11";
					next_s <= decode;
				else
					next_s <= current_s; 
				end if;
				
			when decode =>
				-- Increase PC
					
				Ctrl_Instr <= "10";
			
				case Instructionin(15 downto 11) is
					when opNop =>
						next_s <= pcInc1;
					when opLoad =>
						next_s <= load1;
					when opLoadI =>
						next_s <= loadI1;
					when opStore =>
						next_s <= store1;
					when opStoreI =>
						next_s <= storeI1;
					when opMov =>
						next_s <= mov1;
					when opJmp =>
						next_s <= jmp1;
					when opJmpc =>
						next_s <= jmpc1;
						
					when opAdd =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= add1;
					when opSub =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= add1;
					when opNot =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= add1;
					when opOr =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= add1;
					when opXor =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= add1;
					when opAnd =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= add1;
					when opMul =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= add1;
					when opDiv =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= add1;

					when opInc =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= inc;
					when opDec =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= inc;
					when opZero =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= inc;
					when opShl =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= inc;
					when opShr =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= inc;
					when opRotr =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= inc;
					when opRotl =>
						exeOperation := Instructionin(15 downto 11);
						next_s <= inc;
					
					when opEnd =>
						next_s <= res1;
					when others =>
						next_s <= pcInc1;
				end case;
			
			when load1 =>
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';				
				Ctrl_RegArray <= Instructionin(2 downto 0) & "010";
				next_s <= load11;
				
			when load11 =>
				dataOut <= x"00" & Instructionin(10 downto 3);				
				next_s <= load2;
				
			when load2 =>
				Ctrl_Address <= '1';
				next_s <= load3;
				
			when load3 =>
				dataOut <= (others => 'Z');
				next_s <= load4;
				
			when load4 =>
				CE <= '1';
				RW <= '0';
				next_s <= load5;
			
			when load5 =>
				if (Ready = '1') then
					Ctrl_RegArray(2 downto 0) <= "011";
					next_s <= load6;
				else
					next_s <= current_s; 
				end if;
			
			when load6 =>
				Ctrl_RegArray(2 downto 0) <= "010";
				next_s <= pcInc1;
			
			
			
			when loadI1 =>
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';				
				Ctrl_RegArray <= Instructionin(2 downto 0) & "010";
				Ctrl_ALU <= AluInc; -- set ALU to increase command.
				Ctrl_Shift <= shiftPass; -- SHIFT pass.
				next_s <= loadI2;
			when loadI2 =>
				-- Increase PC
				Ctrl_PC <= "110";
				next_s <= loadI3;
			when loadI3 =>
				Ctrl_ACC <= "011";
				next_s <= loadI4;
			when loadI4 =>
				Ctrl_PC <= "010";
				Ctrl_ACC <= "010";
				next_s <= loadI5;
			when loadI5 =>
				Ctrl_ACC <= "110";
				next_s <= loadI6;
			when loadI6 =>
				Ctrl_PC <= "011";
				next_s <= loadI7;
			when loadI7 =>
				Ctrl_PC <= "010";
				Ctrl_ACC <= "010";
				next_s <= loadI8;
			when loadI8 =>
				-- Prepare to fetch next memory address
				Ctrl_PC <= "110";
				next_s <= loadI9;
			when loadI9 =>
				Ctrl_Address <= '1';
				next_s <= loadI10;
			when loadI10 =>			-- Enable memory device (CE='1') and disable writing (RW='0'). Disable writing to the address register.
				Ctrl_Address <= '0';
				Ctrl_PC <= "010";
				RW <= '0';
				CE <= '1';
				next_s <= loadI11;
			when loadI11 =>			-- Wait until the Ready signal is high, then write the data from the data bus to the instruction register. Until Ready is ready, loop through the state.
				if (Ready = '1') then
					Ctrl_Instr <= "11";
					next_s <= loadI12;
				else
					next_s <= current_s; 
				end if;
			when loadI12 =>
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';				
				Ctrl_ALU <= AluPass;
				Ctrl_Shift <= shiftPass; -- SHIFT pass.
				dataOut <= (others => 'Z');
				next_s <= loadI13;
			when loadI13 =>
				dataOut <= Instructionin;
				next_s <= loadI14;
			when loadI14 =>
				Ctrl_Address <= '1';
				next_s <= loadI15;
			when loadI15 =>			-- Enable memory device (CE='1') and disable writing (RW='0'). Disable writing to the address register.
				Ctrl_Address <= '0';
				Ctrl_PC <= "010";
				RW <= '0';
				CE <= '1';
				next_s <= loadI16;
			when loadI16 =>
				dataOut <= (others => 'Z');
				next_s <= loadI17;
			when loadI17 =>			-- Wait until the Ready signal is high, then write the data from the data bus to the instruction register. Until Ready is ready, loop through the state.
				if (Ready = '1') then
					Ctrl_RegArray(2 downto 0) <= "011";
					next_s <= loadI18;
				else
					next_s <= current_s; 
				end if;
			when loadI18 =>
				Ctrl_RegArray(2 downto 0) <= "010";
				RW <= '0';
				CE <= '0';
				next_s <= pcInc1;
				
				

			when storeI1 =>
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';				
				Ctrl_RegArray <= Instructionin(2 downto 0) & "010";
				Ctrl_ALU <= AluInc; -- set ALU to increase command.
				Ctrl_Shift <= shiftPass; -- SHIFT pass.
				next_s <= storeI2;
			when storeI2 =>
				-- Increase PC
				Ctrl_PC <= "110";
				next_s <= storeI3;
			when storeI3 =>
				Ctrl_ACC <= "011";
				next_s <= storeI4;
			when storeI4 =>
				Ctrl_PC <= "010";
				Ctrl_ACC <= "010";
				next_s <= storeI5;
			when storeI5 =>
				Ctrl_ACC <= "110";
				next_s <= storeI6;
			when storeI6 =>
				Ctrl_PC <= "011";
				next_s <= storeI7;
			when storeI7 =>
				Ctrl_PC <= "010";
				Ctrl_ACC <= "010";
				next_s <= storeI8;
			when storeI8 =>
				-- Prepare to fetch next memory address
				Ctrl_PC <= "110";
				next_s <= storeI9;
			when storeI9 =>
				Ctrl_Address <= '1';
				next_s <= storeI10;
			when storeI10 =>			-- Enable memory device (CE='1') and disable writing (RW='0'). Disable writing to the address register.
				Ctrl_Address <= '0';
				Ctrl_PC <= "010";
				RW <= '0';
				CE <= '1';
				next_s <= storeI11;
			when storeI11 =>			-- Wait until the Ready signal is high, then write the data from the data bus to the instruction register. Until Ready is ready, loop through the state.
				if (Ready = '1') then
					Ctrl_Instr <= "11";
					next_s <= storeI12;
				else
					next_s <= current_s; 
				end if;
			when storeI12 =>
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';				
				Ctrl_ALU <= AluPass;
				Ctrl_Shift <= shiftPass; -- SHIFT pass.
				dataOut <= (others => 'Z');
				next_s <= storeI13;
			when storeI13 =>
				dataOut <= Instructionin;
				next_s <= storeI14;
			when storeI14 =>
				Ctrl_Address <= '1';
				next_s <= storeI15;
			when storeI15 =>			-- Enable memory device (CE='1') and disable writing (RW='0'). Disable writing to the address register.
				Ctrl_Address <= '0';
				next_s <= storeI16;
			when storeI16 =>
				dataOut <= (others => 'Z');
				next_s <= storeI17;
			when storeI17 =>
				Ctrl_RegArray(2 downto 0) <= "110";
				next_s <= storeI18;
			when storeI18 =>
				RW <= '1';
				CE <= '1';
				next_s <= storeI19;
			when storeI19 =>
				RW <= '0';
				CE <= '0';
				Ctrl_RegArray(2 downto 0) <= "010";
				next_s <= pcInc1;
			
			
			
			when store1 =>
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';				
				Ctrl_RegArray <= Instructionin(2 downto 0) & "010";
				next_s <= store2;
				
			when store2 =>
				dataOut <= x"00" & Instructionin(10 downto 3);
				next_s <= store3;
				
			when store3 =>
				Ctrl_Address <= '1';
				next_s <= store4;
			
			when store4 =>
				dataOut <= (others => 'Z');
				next_s <= store5;
				
			when store5 =>
				Ctrl_RegArray(2) <= '1';
				next_s <= store6;
			
			when store6 =>
				CE <= '1';
				RW <= '1';
				next_s <= store7;
			
			when store7 =>
				if (Ready = '1') then
					Ctrl_RegArray(2) <= '1';
					next_s <= store8;
				else
					next_s <= current_s; 
				end if;
			
			when store8 =>
				Ctrl_RegArray(0) <= '0';
				next_s <= pcInc1;				
				
			when mov1 =>
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';				
				Ctrl_RegArray <= Instructionin(5 downto 3) & "000";
				Ctrl_PC <= "010";
				Ctrl_Alu <= aluPass;
				Ctrl_Shift <= shiftPass;
				next_s <= mov2;
			
			when mov2 =>
				Ctrl_RegArray(2) <= '1';
				next_s <= mov3;
			
			when mov3 =>
				Ctrl_Acc(0) <= '1';
				next_s <= mov4;
			
			when mov4 =>
				Ctrl_RegArray(2) <= '0';
				next_s <= mov5;
			
			when mov5 =>
				Ctrl_RegArray <= Instructionin(2 downto 0) & "000";
				Ctrl_Acc <= "100";
				next_s <= mov6;
			
			when mov6 =>
				Ctrl_RegArray(1 downto 0) <= "11";
				next_s <= mov7;
			
			when mov7 =>
				Ctrl_RegArray(1 downto 0) <= "00";
				next_s <= pcinc1;
				
			when jmp1 =>
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';
				next_s <= jmp2;
			
			when jmp2 =>
				dataOut <= "00000" & instructionin(10 downto 0);
				next_s <= jmp3;
			
			when jmp3 =>
				Ctrl_PC <= "011";
				next_s <= jmp4;
			
			when jmp4 =>
				Ctrl_PC <= "010";
				dataOut <= (others => 'Z');
				next_s <= fet1;


-- CCCCC_UU_OOO_111_222
			when jmpc1 =>
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';
				Ctrl_RegArray <= Instructionin(2 downto 0) & "000";
				next_s <= jmpc2;
			
			when jmpc2 =>
				Ctrl_RegArray(2) <= '1';
				next_s <= jmpc3;
			
			when jmpc3 =>
				Ctrl_Op <= "11";
				next_s <= jmpc4;
			
			when jmpc4 =>
				Ctrl_Op <= "10";
				Ctrl_RegArray(2) <= '0';
				next_s <= jmpc5;
			
			when jmpc5 =>
				Ctrl_RegArray <= Instructionin(5 downto 3) & "000";
				next_s <= jmpc6;
			
			when jmpc6 =>
				Ctrl_RegArray(2) <= '1';
				next_s <= jmpc61;
				
			when jmpc61 =>
				Ctrl_Comp <= Instructionin(8 downto 6);
				next_s <= jmpc7;
				
			when jmpc7 =>
				next_s <= jmpc8;
				
			when jmpc8 =>
				if (Comp_Out = '1') then
					next_s <= jmpc9;
				else
					next_s <= pcInc1;
				end if;
				
			when jmpc9 =>
				Ctrl_RegArray(2) <= '0';
				next_s <= jmpc10;
			
			when jmpc10 =>
				Ctrl_RegArray <= "111" & "000";
				next_s <= jmpc11;
			
			when jmpc11 =>
				Ctrl_RegArray(2) <= '1';
				next_s <= jmpc12;

			when jmpc12 =>
				Ctrl_PC <= "011";
				next_s <= jmpc13;
			
			when jmpc13 =>
				Ctrl_PC <= "010";
				Ctrl_RegArray(2) <= '0';
				next_s <= fet1;
			
			
			when add1 =>
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';
				Ctrl_RegArray <= Instructionin(5 downto 3) & "010";
				next_s <= add2;
				
			when add2 =>
				Ctrl_RegArray(2) <= '1';
				next_s <= add3;
			
			when add3 =>
				Ctrl_op(0) <= '1';
				next_s <= add4;
			
			when add4 =>
				Ctrl_op(0) <= '0';
				Ctrl_RegArray(2) <= '0';
				next_s <= add5;
			
			when add5 =>
				Ctrl_RegArray <= Instructionin(2 downto 0) & "010";
				next_s <= add6;
			
			when add6 =>
				Ctrl_RegArray(2) <= '1';
				next_s <= add7;
			
			when add7 =>
				if exeOperation = opAdd then
					Ctrl_ALU <= aluPlus;
					Ctrl_Shift <= shiftPass;
				elsif exeOperation = opSub then
					Ctrl_ALU <= aluSub;
					Ctrl_Shift <= shiftPass;
				elsif exeOperation = opAnd then
					Ctrl_ALU <= aluAnd;
					Ctrl_Shift <= shiftPass;
				elsif exeOperation = opOr then
					Ctrl_ALU <= aluOr;
					Ctrl_Shift <= shiftPass;
				elsif exeOperation = opXor then
					Ctrl_ALU <= aluXor;
					Ctrl_Shift <= shiftPass;
				elsif exeOperation = opNot then
					Ctrl_ALU <= aluNot;
					Ctrl_Shift <= shiftPass;
				elsif exeOperation = opMul then
					Ctrl_ALU <= aluMul;
					Ctrl_Shift <= shiftPass;
				elsif exeOperation = opDiv then
					Ctrl_ALU <= aluDiv;
					Ctrl_Shift <= shiftPass;
				else
					Ctrl_ALU <= aluPass;
					Ctrl_Shift <= shiftPass;
				end if;
				
				Ctrl_acc <= "010";
				next_s <= add8;
			
			when add8 =>
				Ctrl_acc <= "011";
				next_s <= add9;
				
			when add9 =>
				Ctrl_RegArray(2) <= '0';
				next_s <= add10;
			
			when add10 =>
				Ctrl_acc <= "100";
				next_s <= add11;
			
			when add11 =>
				Ctrl_RegArray(0) <= '1';
				next_s <= add12;
			
			when add12 =>
				Ctrl_RegArray(2 downto 0) <= "010";
				next_s <= pcInc1;
				
				
-- INC command:
-- 00111_UUUUUUUU_RRR
			
			when inc =>
				Ctrl_ACC <= "010"; -- enable, clock
				Ctrl_PC <= "010";
				Ctrl_OP <= "10";
				Ctrl_Instr <= "10";
				RW <= '0';
				CE <= '0';
				Ctrl_Address <= '0';
				Ctrl_RegArray <= Instructionin(2 downto 0) & "000";
				next_s <= inc1;
				
			when inc1 =>
				Ctrl_RegArray <= Instructionin(2 downto 0) & "110";
				next_s <= inc2;
				
			when inc2 =>
				if exeOperation = opInc then
					Ctrl_ALU <= aluInc;
					Ctrl_Shift <= shiftPass;
				elsif exeOperation = opDec then
					Ctrl_ALU <= aluDec;
					Ctrl_Shift <= shiftPass;
				elsif exeOperation = opZero then
					Ctrl_ALU <= aluZero;
					Ctrl_Shift <= shiftPass;
				elsif exeOperation = opShl then
					Ctrl_ALU <= aluPass;
					Ctrl_Shift <= shiftLeft;
				elsif exeOperation = opShr then
					Ctrl_ALU <= aluPass;
					Ctrl_Shift <= shiftRight;
				elsif exeOperation = opRotr then
					Ctrl_ALU <= aluPass;
					Ctrl_Shift <= shiftRotRight;
				elsif exeOperation = opRotl then
					Ctrl_ALU <= aluPass;
					Ctrl_Shift <= shiftRotLeft;
				else
					Ctrl_ALU <= aluPass;
					Ctrl_Shift <= shiftPass;
				end if;
				
				next_s <= inc3;
				
			when inc3 =>
				Ctrl_ACC <= "011";
				next_s <= inc4;
				
			when inc4 =>
				Ctrl_ACC <= "010";
				Ctrl_RegArray <= Instructionin(2 downto 0) & "010";
				next_s <= inc5;
				
			when inc5 =>
				Ctrl_ACC <= "110";
				next_s <= inc6;


			when inc6 =>
				Ctrl_RegArray <= Instructionin(2 downto 0) & "011";
				next_s <= inc7;
				
			when inc7 =>
				Ctrl_ACC <= "000";
				Ctrl_RegArray <= Instructionin(2 downto 0) & "000";
				next_s <= pcInc1;
			
			
				
				
			
			when pcInc1 =>
				RW <= '0';
				CE <= '0';
				Ctrl_ACC <= "010"; -- oe=0, we=1, clock=0 .
				Ctrl_Instr <= "10";
				Ctrl_PC <= "010";
				Ctrl_RegArray <= "000010";
				Ctrl_ALU <= AluInc; -- set ALU to increase command.
				Ctrl_Shift <= shiftPass; -- SHIFT pass.
				dataOut <= (others => 'Z');
				next_s <= pcInc2;
			when pcInc2 =>
				Ctrl_Address <= '0';
				Ctrl_PC <= "110";
				next_s <= pcInc3;
			when pcInc3 =>
				Ctrl_PC <= "110";
				next_s <= pcInc4;
			when pcInc4 =>
				Ctrl_ACC <= "011"; -- oe=0, we=1, clock=1
				next_s <= pcInc5;				
			when pcInc5 =>
				Ctrl_ACC <= "110"; -- oe=1, we=1, clock=0
				Ctrl_PC <= "010";
				next_s <= pcInc6;
			when pcInc6 =>
				Ctrl_PC <= "011";
				next_s <= pcInc7;
			when pcInc7 =>
				Ctrl_ACC <= "010"; -- oe=0, we=1, clock=1
				Ctrl_PC <= "010";
				next_s <= fet1;
				
			when others =>
				next_s <= current_s;
		end case;
	end process;
end Behavioral;
