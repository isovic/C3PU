----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:05:25 07/26/2013 
-- Design Name: 
-- Module Name:    ledcontroller - Behavioral 
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ledcontroller is
port (
			clk : in std_logic;
			rw : in std_logic;
			sel : in std_logic;
			addr : in std_logic_vector(15 downto 0);
			data : inout std_logic_vector(15 downto 0);
			ready : out std_logic;
			led : out std_logic_vector(7 downto 0)
		);
end ledcontroller;

architecture Behavioral of ledcontroller is
	type t_mem is array(0 to 1) of std_logic_vector(15 downto 0);
	signal led_mem_data : t_mem :=
				("0000000010101010",
				 "0000000000000000");

begin

--	data <= data_out when (sel='1' and rw='0') else (others => 'Z');

	data <= led_mem_data(CONV_INTEGER(addr(0))) when (sel='1' and rw='0') else (others => 'Z');
	ready <= '1' when (sel='1' and rw='0') else '0';
	
	memWrite: process (addr, data, sel, rw)
	begin
		if (sel='1' and rw='1') then
			led_mem_data(CONV_INTEGER(addr(0))) <= data;
		else
			
		end if;
	end process;

	led <= led_mem_data(0)(7 downto 0);
	
end Behavioral;
