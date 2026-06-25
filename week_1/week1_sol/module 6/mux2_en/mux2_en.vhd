library ieee;
use ieee.std_logic_1164.all;

entity mux2_en is
	port (a,b,sel,en: in std_logic;
			y : out std_logic);
end mux2_en;

architecture rtl of mux2_en is
begin
	y <= '0'              when en  = '0' else
			a               when sel = '0' else
			b;
end rtl;