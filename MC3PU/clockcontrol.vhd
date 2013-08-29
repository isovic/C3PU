----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:15:13 07/25/2013 
-- Design Name: 
-- Module Name:    clockcontrol - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clockcontrol is
	 Generic ( numTicks : in integer range 0 to 50000000); -- STD_LOGIC_VECTOR (31 downto 0));

    Port ( clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           clkOut : out  STD_LOGIC);
end clockcontrol;

architecture Behavioral of clockcontrol is
	signal tickCount: integer range 0 to 50000000 := 0; -- STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
	signal outValue: STD_LOGIC := '0';
	
begin
	
	process (clk, reset)
	begin
		if reset = '1' then
			tickCount <= 0; -- x"00000000";
			outValue <= '0';
		elsif clk'event and clk='1' then
			tickCount <= tickCount + 1;
		
			if tickCount = numTicks then
				outValue <= not outValue;
				tickCount <= 0; -- x"00000000";
			end if;
		end if;
	end process;

	clkOut <= outValue;
	
end Behavioral;
