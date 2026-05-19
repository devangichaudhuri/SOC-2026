-- tb_or_gate.vhd
-- Week 1 starter testbench for or_gate.
--
-- Expected: y = '1' for every case EXCEPT the first (a='0', b='0').

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_or_gate is
end tb_or_gate;

architecture sim of tb_or_gate is

    signal a, b, y : std_logic;

begin

    uut : entity work.or_gate
        port map (
            a => a,
            b => b,
            y => y
        );

    stimulus : process
    begin
        a <= '0'; b <= '0';
        wait for 10 ns;          -- expect y = '0'

        a <= '0'; b <= '1';
        wait for 10 ns;          -- expect y = '1'

        a <= '1'; b <= '0';
        wait for 10 ns;          -- expect y = '1'

        a <= '1'; b <= '1';
        wait for 10 ns;          -- expect y = '1'

        wait;
    end process;

end sim;
