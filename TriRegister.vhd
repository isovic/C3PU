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

entity TriRegister is
    Port ( D : in  STD_LOGIC_VECTOR(15 downto 0);
           clock : in  STD_LOGIC;
           en : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(15 downto 0));
end TriRegister;

architecture Behavioral of TriRegister is
		signal currentState: STD_LOGIC_VECTOR(15 downto 0) := "ZZZZZZZZZZZZZZZZ";

begin
	process(clock,en) is
	begin
		if (en='1')then
			if(clock'event and clock='1')then
				currentState <= D;
			end if;
		else
			currentState <= "ZZZZZZZZZZZZZZZZ";
		end if;
	end process;
	Q <= currentState;
end Behavioral;

