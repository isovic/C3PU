----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:26 08/13/2013 
-- Design Name: 
-- Module Name:    MC3PU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MC3PU is
	Port (clock: in STD_LOGIC;
			reset: in STD_LOGIC;
			led: out STD_LOGIC_VECTOR(7 downto 0));
end MC3PU;

architecture Behavioral of MC3PU is
	component Cpu_blackbox is
		 Port ( addressbus : out  STD_LOGIC_VECTOR(15 downto 0);
				  databus : inout  STD_LOGIC_VECTOR(15 downto 0);
				  clock : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  RW : out  STD_LOGIC;
				  CE : out  STD_LOGIC;
				  ready : in  STD_LOGIC);
	end component;
	
	component RAM is
		 port (CLK  : in std_logic;
				 WE   : in std_logic;
				 EN   : in std_logic;
				 ADDR : in std_logic_vector(15 downto 0);
				 data   : inout std_logic_vector(15 downto 0);
				 ready : out std_logic);
	end component;
	
	component perco is			-- Perifery Controller
		 Port ( addr_in : in  STD_LOGIC_VECTOR (15 downto 0);
				  sel_in : in  STD_LOGIC;
				  rw_in : in STD_LOGIC;
				  ready_out : out STD_LOGIC;
				  irq_out : out STD_LOGIC;
				  addr_out : out  STD_LOGIC_VECTOR (15 downto 0);
				  sel_out : out  STD_LOGIC_VECTOR (3 downto 0);
				  rw_out : out STD_LOGIC;
				  ready_in : in STD_LOGIC_VECTOR (3 downto 0);
				  irq_in : in STD_LOGIC_VECTOR (3 downto 0)
				  );
	end component;
	
	component ledcontroller is
	port (
				clk : in std_logic;
				rw : in std_logic;
				sel : in std_logic;
				addr : in std_logic_vector(15 downto 0);
				data : inout std_logic_vector(15 downto 0);
				ready : out std_logic;
				led : out std_logic_vector(7 downto 0)
			);
	end component;
		
	component clockcontrol is
		 Generic ( numTicks : in integer range 0 to 50000000); -- STD_LOGIC_VECTOR (31 downto 0));

		 Port ( clk : in  STD_LOGIC;
				  reset : in STD_LOGIC;
				  clkOut : out  STD_LOGIC);
	end component;

	signal addressbus : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	signal databus : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	signal RW : STD_LOGIC := '0';
	signal CE : STD_LOGIC := '0';
	signal ready : STD_LOGIC := '0';
	
	signal percoAddress : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	signal percoSelect : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal percoRW : STD_LOGIC := '0';
	signal percoReady : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal percoIRQ : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	
	signal clockDivided : STD_LOGIC := '0';
	
	
	
begin

--	cpuComponent: component Cpu_blackbox port map (addressbus, databus, clock, reset, RW, CE, ready);
--	ramComponent: component RAM port map (clock, RW, CE, addressbus, databus, ready);
	
	clockComponent: component clockcontrol generic map (2500000) port map (clock, reset, clockDivided);
	cpuComponent: component Cpu_blackbox port map (addressbus, databus, clock, reset, RW, CE, ready);
	percoController: component perco port map (addressbus, CE, RW, ready, open, percoAddress, percoSelect, percoRW, percoReady, percoIRQ);
	ramComponent: component RAM port map (clock, percoRW, percoSelect(0), percoAddress, databus, percoReady(0));
	ledComponent: component ledcontroller port map (clock, percoRW, percoSelect(1), percoAddress, databus, percoReady(1), open);
	
	led(7 downto 0) <= databus(7 downto 0);
	
end Behavioral;
