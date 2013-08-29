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
			reset: in STD_LOGIC);
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

	signal addressbus : STD_LOGIC_VECTOR(15 downto 0);
	signal databus : STD_LOGIC_VECTOR(15 downto 0);
	signal RW : STD_LOGIC;
	signal CE : STD_LOGIC;
	signal ready : STD_LOGIC;
	
begin

	cpuComponent: component Cpu_blackbox port map (addressbus, databus, clock, reset, RW, CE, ready);
	ramComponent: component RAM port map (clock, RW, CE, addressbus, databus, ready);
	
end Behavioral;

