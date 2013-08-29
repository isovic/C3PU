library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;

package C3PUlib is

	constant aluPass	: std_logic_vector(3 downto 0) := "0000";
	constant aluAnd		: std_logic_vector(3 downto 0) := "0001";
	constant aluOr		: std_logic_vector(3 downto 0) := "0010";
	constant aluNot		: std_logic_vector(3 downto 0) := "0011";
	constant aluXor		: std_logic_vector(3 downto 0) := "0100";
	constant aluPlus	: std_logic_vector(3 downto 0) := "0101";
	constant aluSub		: std_logic_vector(3 downto 0) := "0110";
	constant aluInc		: std_logic_vector(3 downto 0) := "0111";
	constant aluDec		: std_logic_vector(3 downto 0) := "1000";
	constant aluZero	: std_logic_vector(3 downto 0) := "1001";
	constant aluMul		: std_logic_vector(3 downto 0) := "1010";
	constant aluDiv	: std_logic_vector(3 downto 0) := "1011";

	constant shiftPass			: std_logic_vector(2 downto 0) := "000";
	constant shiftLeft			: std_logic_vector(2 downto 0) := "001";
	constant shiftRight			: std_logic_vector(2 downto 0) := "010";
	constant shiftRotLeft		: std_logic_vector(2 downto 0) := "011";
	constant shiftRotRight		: std_logic_vector(2 downto 0) := "100";

	constant compEq		: std_logic_vector(2 downto 0) := "000";
	constant compNeq	: std_logic_vector(2 downto 0) := "001";
	constant compGt		: std_logic_vector(2 downto 0) := "010";
	constant compGte	: std_logic_vector(2 downto 0) := "011";
	constant compLt		: std_logic_vector(2 downto 0) := "100";
	constant compLte	: std_logic_vector(2 downto 0) := "101";
	
	constant opNop: std_logic_vector(4 downto 0) := "00000";
	constant opLoad: std_logic_vector(4 downto 0) := "00001";
	constant opStore: std_logic_vector(4 downto 0) := "00010";
	constant opMov: std_logic_vector(4 downto 0) := "00011";
	constant opLoadI: std_logic_vector(4 downto 0) := "00100";
	constant opJmp: std_logic_vector(4 downto 0) := "00101";
	constant opJmpc: std_logic_vector(4 downto 0) := "00110";
	constant opInc: std_logic_vector(4 downto 0) := "00111";
	constant opDec: std_logic_vector(4 downto 0) := "01000";
	constant opAnd: std_logic_vector(4 downto 0) := "01001";
	constant opOr: std_logic_vector(4 downto 0) := "01010";
	constant opXor: std_logic_vector(4 downto 0) := "01011";
	constant opNot: std_logic_vector(4 downto 0) := "01100";
	constant opAdd: std_logic_vector(4 downto 0) := "01101";
	constant opSub: std_logic_vector(4 downto 0) := "01110";
	constant opZero: std_logic_vector(4 downto 0) := "01111";
	constant opShl: std_logic_vector(4 downto 0) := "10000";
	constant opShr: std_logic_vector(4 downto 0) := "10001";
	constant opRotr: std_logic_vector(4 downto 0) := "10010";
	constant opRotl: std_logic_vector(4 downto 0) := "10011";
	constant opMul: std_logic_vector(4 downto 0) := "10100";
	constant opDiv: std_logic_vector(4 downto 0) := "10101";
	constant opEnd: std_logic_vector(4 downto 0) := "10110";
	constant opStoreI: std_logic_vector(4 downto 0) := "10111";

end C3PUlib;

package body C3PUlib is

end C3PUlib;
