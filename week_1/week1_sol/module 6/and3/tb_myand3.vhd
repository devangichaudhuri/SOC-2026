library ieee;
use ieee.std_logic_1164.all;

entity tb_myand3 is
end tb_myand3;

architecture sim of tb_myand3 is
	signal a,b,c,y: std_logic;
begin
	uut: entity work.myand3 port map (a=>a,b=>b,c=>c,y=>y);
	stimulus: process
	begin
		a <= '0';b <= '0';c<='0';
      wait for 10 ns;

      a <= '0';b <= '0';c<='1';
      wait for 10 ns;

      a <= '0';b <= '1';c<='0';
      wait for 10 ns;
		
		a<='0';b<='1';c<='1';
		wait for 10 ns;
		
		a <= '1';b <= '0';c<='0';
      wait for 10 ns;

      a <= '1';b <= '0';c<='1';
      wait for 10 ns;

      a <= '1';b <= '1';c<='0';
      wait for 10 ns;
		
		a<='1';b<='1';c<='1';
		wait for 10 ns;
		
		wait;
	end process;
end sim;