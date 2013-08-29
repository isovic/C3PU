--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:28:45 08/14/2013
-- Design Name:   
-- Module Name:   /home/ivan/Dropbox/S3/C3PU/tb_registerarray.vhd
-- Project Name:  C3PU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registerarray
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
 
ENTITY tb_registerarray IS
END tb_registerarray;
 
ARCHITECTURE behavior OF tb_registerarray IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerarray
    PORT(
         data : IN  std_logic_vector(15 downto 0);
         clock : IN  std_logic;
         sel : IN  std_logic_vector(2 downto 0);
         en : IN  std_logic;
         Q : INOUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic_vector(15 downto 0) := (others => '0');
   signal clock : std_logic := '0';
   signal sel : std_logic_vector(2 downto 0) := (others => '0');
   signal en : std_logic := '0';

	--BiDirs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerarray PORT MAP (
          data => data,
          clock => clock,
          sel => sel,
          en => en,
          Q => Q
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		data <= x"00A5";
		sel <= "000";
		en <= '0';
      wait for 100 ns;	
		
		data <= x"00A5";
		sel <= "000";
		en <= '1';

      wait for clock_period*10;
		
		data <= x"00A5";
		sel <= "011";
		en <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
