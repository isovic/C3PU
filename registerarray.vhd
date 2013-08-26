--------------------------------------------------------------
--				green															--
--------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity registerarray is
	Port ( data: in std_logic_vector(15 downto 0);
			 clock: in std_logic;
			 sel: in std_logic_vector(2 downto 0);
			 we: in std_logic;
			 oe: in std_logic;
			 Q: inout std_logic_vector(15 downto 0)
		   );
end registerarray;

architecture Behavioral of registerarray is
	type ram_t is array (0 to 7) of std_logic_vector(15 downto 0);
	signal ram : ram_t := (others => (others => '1'));
--	signal tempOutput : std_logic_vector(15 downto 0) := (others => 'Z');

begin
	process(clock,we,oe,sel,ram) is
		begin
			if rising_edge(clock) then
				if(we = '1') then
						ram(conv_integer(sel)) <= data;
				end if;
			end if;

			if (oe = '1') then
				Q	 <= ram(conv_integer(sel));
			else
				Q <= (others => 'Z');
			end if;
--				end if;
				
--				tempOutput <= ram(conv_integer(sel));
--			else
--				tempOutput <= (others => 'Z'); -- x"ZZZZ";
--			end if;
	end process;
--			Q <= tempOutput;

end Behavioral;
