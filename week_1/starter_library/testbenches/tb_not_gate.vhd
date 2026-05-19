-- tb_not_gate.vhd
-- Week 1 starter testbench for not_gate.
-- Only one input, so only two cases to test.
--
-- Expected: a='0' -> y='1' ; a='1' -> y='0'.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_not_gate is
end tb_not_gate;

architecture sim of tb_not_gate is

    signal a, y : std_logic;

begin

    uut : entity work.not_gate
        port map (
            a => a,
            y => y
        );

    stimulus : process
    begin
        a <= '0';
        wait for 10 ns;          -- expect y = '1'

        a <= '1';
        wait for 10 ns;          -- expect y = '0'

        wait;
    end process;

end sim;
