----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:46:52 08/10/2013 
-- Design Name: 
-- Module Name:    TriRegister - Behavioral 
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

entity RegisterOE is
    Port ( D : in  STD_LOGIC_VECTOR(15 downto 0);
           clock : in  STD_LOGIC;
           we : in  STD_LOGIC;
			  oe : in STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(15 downto 0));
end RegisterOE;

architecture Behavioral of RegisterOE is
		signal currentState: STD_LOGIC_VECTOR(15 downto 0) := "ZZZZZZZZZZZZZZZZ";

begin
	process(clock, we, oe, D, currentState) is
	begin
		if (we = '1')then
			if(clock'event and clock='1')then
				currentState <= D;
			end if;
		end if;

		if (oe = '1') then
			Q <= currentState;
		else
			Q <= (others => 'Z');
		end if;
	end process;
	
end Behavioral;
