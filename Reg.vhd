library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg is
    Port ( D : in  STD_LOGIC_VECTOR( 15 downto 0 );
           clock : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR( 15 downto 0 )
	 );
end Reg;

architecture Behavioral of Reg is
	signal curr : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '1');			-- "0000000000000000";
begin
	process( clock ) is
	begin
		if( rising_edge( clock ) ) then
			curr <= D;
		end if;
	end process;
	Q <= curr;
end Behavioral;
