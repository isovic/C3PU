
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.C3PUlib.all;

entity RAM is
    port (CLK  : in std_logic;
          WE   : in std_logic;
          EN   : in std_logic;
          ADDR : in std_logic_vector(15 downto 0);
          data   : inout std_logic_vector(15 downto 0);
			 ready : out std_logic);
			 
end RAM;

architecture Behavioral of RAM is
    type ram_type is array (0 to 11) of std_logic_vector (15 downto 0);
    signal RAM_data: ram_type :=
	 (
--"0000100001111001" ,  --0 LOAD 15 1
--"0000100010000010" ,  --1 LOAD 16 2
--"0100100000001010" ,  --2 AND 1 2
--"0000100010000001" ,  --3 LOAD 16 2
--"0101000000001010" ,  --4 OR 1 2
--"0000100010000001" ,  --5 LOAD 16 2
--"0101100000001010" ,  --6 XOR 1 2
--"0000100010000001" ,  --7 LOAD 16 2
--"0110000000001010" ,  --8 NOT 1 2
--"0000100010000001" ,  --9 LOAD 16 2
--"0100100000001010" ,  --10 AND 1 2
--"0000100010000001" ,  --11 LOAD 16 2
--"0111000000001010" ,  --12 SUB 1 2
--"0000100010000001" ,  --13 LOAD 16 2
--"0111100000000001" ,   --14 ZERO 1
--"0000000011111011",     --15 3
--"0000001001100100"     --16 4	 

"0000100001001001" ,  --0 LOAD 9 1
"0000100001010010" ,  --1 LOAD 10 2
"0100000000000001" ,  --2 DEC 1
"0011100000000001" ,  --3 INC 1
"1000000000000010" ,  --4 SHL 2
"1000100000000010" ,  --5 SHR 2
"1001000000000001" ,  --6 ROTR 1
"1001100000000001" ,  --7 ROTL 1
"0000000000000000" ,  --8 ZERO 2
"0111100000000001" ,  --9 ZERO 1
"0111100000000010",    --10 ZERO 2
opJmp		& "00000000001"


--			"0000100001010010",	-- 0  LoadI the data from the following address into R3.
--			"0011100000000001",	-- 1	
--			"1011000000000000",	-- 2	
--			"0000000000000011",	-- 3	
--			"0000000000000100",	-- 4  
--			"0000000000000101",	-- 5	
--			"0000000000000110",	-- 6
--			"0000000000000111",	-- 7
--			"0000000000001000",	-- 8
--			"0000000000001001",	-- 9	
--			"0000000000001010"	-- 10	
	 
--			"0010000000000011",	-- 0  LoadI the data from the following address into R3.
--			"0000000000001000",	-- 1	Address 8
--			"1011100000000011",	-- 2	StoreI the data from R3 into the following address.
--			"0000000000001001",	-- 3	Address 9
--			"1011100000000011",	-- 4	StoreI the data from R3 into the following address.
--			"0100000000000000",	-- 5	Address LED
--			"0010100000000100",	-- 6	JMP 4
--			"0000000000000011",	-- 7	
--			"0000000000000101",	-- 8  
--			"0000000000000111",	-- 9	
--			"0000000000000110",	-- 10
--			"0000000000000111",	-- 11
--			"0000000000001000",	-- 12
--			"0000000000001001",	-- 13
--			"0000000000001010",	-- 14	
--			"0000000000001011",	-- 15
--			"0000000000001100"	-- 16	
			
--			opLoad	& x"01" & "001",
--			opLoad	& x"01" & "010",
--			opMov		& "00000" & "010" & "011",
--			opAdd		& "00000" & "001" & "010",
--			opMov		& "00000" & "011" & "001",
--			opMov    & "00000" & "010" & "100",
--			opJmp		& "00000000010"

-- 00100

--			"0000100001010010",	-- 0  load address 9 of the RAM and put in the register 1
--			"0000100001001001",	-- 1	load address  10 of the RAM and put in the register 2
--			"0110100000001010",	-- 2	add register 1 and register 2 store this to 2
--			"0001000001000010",	-- 3	store the data to address 8 of the RAM.
--			"0000100001000111",	-- 4  Load address 8 of the RAM and put in the register 7
--			"0011000010001010",	-- 5	JMPC GT, R1, R2
--			"0011100000000010",	-- 6	INC R2
--			"0011100000000010",	-- 7	INC R2
--			"0000000000000001",	-- 8
--			"0000000000000101",	-- 9	number to process number 1
--			"0000000000000010"	-- 10	number to process number 2


--			"0001100000010011",	-- 4	MOV R2, R3
--			"0010100000000001",	-- 5	JMP 1
		);


		
begin

    process (CLK)
    begin
        if CLK'event and CLK = '1' then
            if EN = '1' then
                if WE = '1' then
                    RAM_data(conv_integer(ADDR)) <= data;
					 else
						 data <= RAM_data(conv_integer(ADDR)) ;
						 ready <= '1';
                end if;
				else
					data <= "ZZZZZZZZZZZZZZZZ";
            end if;
        end if;
    end process;

end Behavioral;

	