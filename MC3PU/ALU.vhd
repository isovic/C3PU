----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:15:07 08/10/2013 
-- Design Name: 
-- Module Name:    ALU_test - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( a : in  STD_LOGIC_VECTOR(15 downto 0);
           s : in  STD_LOGIC_VECTOR(3 downto 0);
			  b : in  STD_LOGIC_VECTOR(15 downto 0);
           y : out  STD_LOGIC_VECTOR(15 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
with s select
	y <= 	a when "0000",
			a and b when "0001",
			a or b when "0010",
			not a when "0011",
			a xor b when "0100",
			a + b when "0101",
			a - b when "0110",
			a + '1' when "0111",
			a - '1' when "1000",
			"0000000000000000" when "1001",
--			"0000000000000000" when "1010",
--			"0000000000000000" when "1011",
			"0000000000000000" when others;
end Behavioral;
