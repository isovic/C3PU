--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:34:04 08/10/2013
-- Design Name:   
-- Module Name:   C:/Documents and Settings/ALU/ALU.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_test
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU IS
END ALU;
 
ARCHITECTURE behavior OF ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_test
    PORT(
         a : IN  std_logic_vector(15 downto 0);
         s : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal s : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_test PORT MAP (
          a => a,
          s => s,
          b => b,
          y => y
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			s <= "0000";
			a <= "0001000111101101";
			b <= "0000000010101100";
		wait for 100 ns;	
			s <= "0001";
			a <= "0001000111101101";
			b <= "0000000010101100";
		wait for 100 ns;	
			s <= "0010";
			a <= "0001000111101101";
			b <= "0000000010101100";
		wait for 100 ns;	
			s <= "0011";
			a <= "0001000111101101";
			b <= "0000000010101100";
		wait for 100 ns;	
			s <= "0100";
			a <= "0001000111101101";
			b <= "0000000010101100";
		wait for 100 ns;	
			s <= "0101";
			a <= "0001000111101101";
			b <= "0000000010101100";
		wait for 100 ns;	
			s <= "0110";
			a <= "0001000111101101";
			b <= "0000000010101100";
		wait for 100 ns;	
			s <= "0111";
			a <= "0001000111101101";
			b <= "0000000010101100";
		wait for 100 ns;	
			s <= "1000";
			a <= "0001000111101101";
			b <= "0000000010101100";
		wait for 100 ns;	
			s <= "1001";
			a <= "0001000111101101";
			b <= "0000000010101100";
      wait for period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
