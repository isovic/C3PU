----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:35 08/16/2013 
-- Design Name: 
-- Module Name:    perco - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity perco is			-- Perifery Controller
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
end perco;

architecture RTL of perco is

begin	
	ready_out <= ready_in(CONV_INTEGER(addr_in(15 downto 14)));
	
	sel_out <=	"000" & sel_in when (addr_in(15 downto 14) = "00") else
					"00" & sel_in & "0" when (addr_in(15 downto 14) = "01") else
					"0" & sel_in & "00" when (addr_in(15 downto 14) = "10") else
					sel_in & "000" when (addr_in(15 downto 14) = "11") else
					"0000";
					
	addr_out <= "00" & addr_in(13 downto 0);
	
	rw_out <= rw_in;
	irq_out <= irq_in(0) or irq_in(1) or irq_in(2) or irq_in(3);

end RTL;

