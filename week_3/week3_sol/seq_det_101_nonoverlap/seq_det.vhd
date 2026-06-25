library ieee;
use ieee.std_logic_1164.all;

entity seq_det is
	port (
		clk: in std_logic;
		reset: in std_logic;
		data: in std_logic;
		detected: out std_logic
	);
end seq_det;

architecture rtl of seq_det is
	type state_t is (S_INIT,S_1,S_10,S_101);
	signal current_state: state_t;
	signal next_state: state_t;
begin
	state_reg: process(clk)
	begin
		if rising_edge(clk) then
			if reset='1' then
				current_state <= S_INIT;
			else
				current_State<=next_state;
			end if;
		end if;
	end process state_reg;
	
	comb: process(current_state, data)
	begin
		next_state<=S_INIT;
		detected<='0';
		
		case current_state is
		
			when S_INIT=>
				if data='1' then next_state<=S_1; else next_state<=S_INIT; end if;
			when S_1=>
				if data='0' then next_state<=S_10; else next_state<=S_1; end if;
			when S_10=>
				if data='1' then next_state<=S_101; else next_state<=S_INIT; end if;
			when S_101=>
				detected<='1'; next_state<=S_INIT;
			when others=> next_state<=S_INIT;
		
		end case;
	end process comb;
	
end rtl;