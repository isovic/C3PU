library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity comparator is
	Port( a: in std_logic_vector(15 downto 0);
			b: in std_logic_vector(15 downto 0);
			sel: in std_logic_vector(2 downto 0);
			y: out std_logic
			);
end comparator;

architecture Behavioral of comparator is
begin
	process(a,b,sel)
		begin
				if sel="000" then
					if a = b then
						y <= '1';
					else 
						y <= '0';
					end if;
				
				elsif sel="001" then
					if a /= b then
						y <= '1';
					else 
						y <= '0';
					end if;
				
				elsif sel="010" then
					if a > b then
						y <= '1';
					else 
						y <= '0';
					end if;
				
				elsif sel="011" then
					if a >= b then
						y <= '1';
					else 
						y <= '0';
					end if;
				
				elsif sel="100" then
					if a < b then
						y <= '1';
					else 
						y <= '0';
					end if;
				
				elsif sel="101" then
					if a <= b then
						y <= '1';
					else 
						y <= '0';
					end if;
				else
						y <= '0';
				end if;
			
		end process;
	
end Behavioral;

