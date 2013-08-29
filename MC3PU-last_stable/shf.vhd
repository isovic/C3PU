library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shf is
    Port ( D : in  STD_LOGIC_VECTOR( 15 downto 0 );
           sel : in  STD_LOGIC_VECTOR( 2 downto 0 );
           Q : out  STD_LOGIC_VECTOR( 15 downto 0 )
	 );
end shf;

architecture Behavioral of shf is
begin
	process( sel, D ) is
	begin
		if( sel = "000" ) then -- PASS
			Q <= D;
		elsif ( sel = "001" ) then -- SHIFT ONE BIT TO THE LEFT
			Q <= D( 14 downto 0 ) & '0';
		elsif ( sel = "010" ) then -- SHIFT ONE BIT TO THE RIGHT
			Q <= '0' & D( 15 downto 1 );
		elsif ( sel = "011" ) then -- ROTATE ONE BIT TO THE LEFT
			Q <= D( 14 downto 0 ) & D( 15 downto 15 );
		elsif ( sel = "100" ) then -- ROTATE ONE BIT TO THE RIGHT
			Q <= D( 0 downto 0 ) & D( 15 downto 1 );
		else 
			Q <= D;
		end if;
	end process;
end Behavioral;