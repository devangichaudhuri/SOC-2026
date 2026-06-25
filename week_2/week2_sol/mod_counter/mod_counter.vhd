library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mod_counter is
	generic (N: integer := 10);
	port (
		clk: in std_logic;
		reset: in std_logic;
		enable: in std_logic;
		tick: out std_logic;
		count: out std_logic_vector(3 downto 0)
	);
end mod_counter;

architecture rtl of mod_counter is
	signal count_int: std_logic_vector(3 downto 0) := (others => '0');
	signal tick_int: std_logic := '0';
begin
	process (clk, reset)
	begin
		if reset='1' then
			count_int <= (others=>'0');
			tick_int <='0';
		elsif rising_edge(clk) then
			if enable='1' then
				if unsigned(count_int) = to_unsigned(N-1, count_int'length) then
					count_int <= (others=>'0');
					tick_int <= '1';
				else
					count_int <= std_logic_vector(unsigned(count_int)+1);
					tick_int <= '0';
				end if;
			end if;
		end if ;
	end process;
	
	count <= count_int;
	tick <= tick_int;
end rtl;