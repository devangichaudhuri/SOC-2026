library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
	port (a,b,sel : in std_logic;
			y : out std_logic);
end mux2;

architecture rtl of mux2 is
	signal notsel: std_logic;
	signal aandnotsel: std_logic;
	signal bandsel: std_logic;
begin
	g1: entity work.inverter port map (a=>sel,y=>notsel);
	g2: entity work.and_gate port map (a=>a,b=>notsel,y=>aandnotsel);
	g3: entity work.and_gate port map (a=>b,b=>sel,y=>bandsel);
	g4: entity work.or_gate port map (a=>aandnotsel,b=>bandsel,y=>y);
end rtl;