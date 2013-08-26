--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:59:28 08/14/2013
-- Design Name:   
-- Module Name:   /home/ivan/Dropbox/S3/C3PU/tb_c3pu.vhd
-- Project Name:  C3PU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Cpu_blackbox
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
 
ENTITY tb_c3pu IS
END tb_c3pu;
 
ARCHITECTURE behavior OF tb_c3pu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Cpu_blackbox
    PORT(
         addressbus : OUT  std_logic_vector(15 downto 0);
         databus : INOUT  std_logic_vector(15 downto 0);
         clock : IN  std_logic;
         reset : IN  std_logic;
         RW : OUT  std_logic;
         CE : OUT  std_logic;
         ready : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal ready : std_logic := '0';

	--BiDirs
   signal databus : std_logic_vector(15 downto 0);

 	--Outputs
   signal addressbus : std_logic_vector(15 downto 0);
   signal RW : std_logic;
   signal CE : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Cpu_blackbox PORT MAP (
          addressbus => addressbus,
          databus => databus,
          clock => clock,
          reset => reset,
          RW => RW,
          CE => CE,
          ready => ready
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
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		reset <= '0';
      wait for clock_period*10;
		

      -- insert stimulus here 

      wait;
   end process;

END;
