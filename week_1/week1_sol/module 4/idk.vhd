
library ieee;
use ieee.std_logic_1164.all;

entity xor_structural is
	port (a,b: in std_logic;
			y : out std_logic);
end xor_structural;

architecture rtl of xor_structural is
	signal not_a: std_logic;
	signal not_b: std_logic;
	signal aandnotb: std_logic;
	signal notaandb: std_logic;
begin
	g1: entity work.inverter port map (a=>b, y=>not_b);
	g2: entity work.inverter port map (a=>a, y=>not_a);
	g3: entity work.and_gate port map (a=>a, b=>not_b, y=>aandnotb);
	g4: entity work.and_gate port map (a=>not_a, b=>b, y=>notaandb);
	g5: entity work.or_gate port map (a=>aandnotb, b=>notaandb, y=>y);
end rtl;