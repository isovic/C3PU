LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY shf_tb IS
END shf_tb;
 
ARCHITECTURE behavior OF shf_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shf
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shf PORT MAP (
          D => D,
          sel => sel,
          Q => Q
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		sel <= "000";
		D <= "1001001100100100";
      wait for 10 ns;
		
		sel <= "001";
		D <= "1111111111111111";
      wait for 10 ns;
		
		sel <= "010";
		D <= "1111111111111111";
      wait for 10 ns;
		
		sel <= "011";
		D <= "0111111111111110";
      wait for 10 ns;
		
		sel <= "100";
		D <= "0111111111111110";
      wait for 10 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
