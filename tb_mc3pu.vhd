-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
		component MC3PU is
			Port (clock: in STD_LOGIC;
					reset: in STD_LOGIC;
					led: out STD_LOGIC_VECTOR(7 downto 0));
		end component;

		signal clock: std_logic := '0';
		signal reset: std_logic := '0';
		
   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
  BEGIN

  -- Component Instantiation
          uut: MC3PU PORT MAP(
                  clock => clock,
						reset => reset
          );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
	
  --  Test Bench Statements
     tb : PROCESS
     BEGIN
	  
			reset <= '1';

        wait for 100 ns; -- wait until global set/reset completes
		  
			reset <= '0';

        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
