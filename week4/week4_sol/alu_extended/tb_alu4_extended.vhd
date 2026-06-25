library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_alu4_extended is
end tb_alu4_extended;

architecture sim of tb_alu4_extended is

    signal a        : std_logic_vector(3 downto 0) := (others => '0');
    signal b        : std_logic_vector(3 downto 0) := (others => '0');
    signal op       : std_logic_vector(2 downto 0) := (others => '0');
    signal result   : std_logic_vector(3 downto 0);
    signal zero     : std_logic;
    signal carry    : std_logic;
    signal negative : std_logic;

    constant PROP_DELAY : time := 10 ns;

begin

    uut : entity work.alu4_extended
        port map (a => a, b => b, op => op,
                  result => result, zero => zero,
                  carry => carry, negative => negative);

    stimulus : process
    begin

        -- --------------------------------------------------------
        -- ADD
        -- --------------------------------------------------------
        op <= "000";
        a <= "0111"; b <= "0001"; wait for PROP_DELAY;   -- 7+1=8, negative=1
        assert result = "1000" and zero = '0' and carry = '0' and negative = '1'
            report "FAIL: ADD 7+1" severity error;

        a <= "1111"; b <= "0001"; wait for PROP_DELAY;   -- 15+1=16, carry=1, zero=1
        assert result = "0000" and zero = '1' and carry = '1' and negative = '0'
            report "FAIL: ADD 15+1 (carry+zero)" severity error;

        a <= "0011"; b <= "0101"; wait for PROP_DELAY;   -- 3+5=8
        assert result = "1000" and carry = '0' and negative = '1'
            report "FAIL: ADD 3+5" severity error;

        -- --------------------------------------------------------
        -- SUB
        -- --------------------------------------------------------
        op <= "001";
        a <= "0101"; b <= "0011"; wait for PROP_DELAY;   -- 5-3=2
        assert result = "0010" and zero = '0' and carry = '0' and negative = '0'
            report "FAIL: SUB 5-3" severity error;

        a <= "0100"; b <= "0100"; wait for PROP_DELAY;   -- 4-4=0, zero=1
        assert result = "0000" and zero = '1' and carry = '0'
            report "FAIL: SUB 4-4 (zero flag)" severity error;

        -- --------------------------------------------------------
        -- AND
        -- --------------------------------------------------------
        op <= "010";
        a <= "1100"; b <= "1010"; wait for PROP_DELAY;   -- 1000, negative=1
        assert result = "1000" and zero = '0' and carry = '0' and negative = '1'
            report "FAIL: AND 1100,1010" severity error;

        a <= "1010"; b <= "0101"; wait for PROP_DELAY;   -- 0000, zero=1
        assert result = "0000" and zero = '1'
            report "FAIL: AND 1010,0101 (zero flag)" severity error;

        -- --------------------------------------------------------
        -- OR
        -- --------------------------------------------------------
        op <= "011";
        a <= "1010"; b <= "0101"; wait for PROP_DELAY;   -- 1111, negative=1
        assert result = "1111" and zero = '0' and carry = '0' and negative = '1'
            report "FAIL: OR 1010,0101" severity error;

        -- --------------------------------------------------------
        -- XOR
        -- --------------------------------------------------------
        op <= "100";
        a <= "1010"; b <= "1010"; wait for PROP_DELAY;   -- 0000, zero=1
        assert result = "0000" and zero = '1' and carry = '0' and negative = '0'
            report "FAIL: XOR 1010,1010 (zero flag)" severity error;

        a <= "1100"; b <= "0101"; wait for PROP_DELAY;   -- 1001, negative=1
        assert result = "1001" and zero = '0' and negative = '1'
            report "FAIL: XOR 1100,0101" severity error;

        -- --------------------------------------------------------
        -- NOT
        -- --------------------------------------------------------
        op <= "101";
        a <= "1000"; b <= "0000"; wait for PROP_DELAY;   -- 0111
        assert result = "0111" and zero = '0' and carry = '0' and negative = '0'
            report "FAIL: NOT 1000" severity error;

        a <= "1111"; wait for PROP_DELAY;                 -- 0000, zero=1
        assert result = "0000" and zero = '1'
            report "FAIL: NOT 1111 (zero flag)" severity error;

        a <= "0000"; wait for PROP_DELAY;                 -- 1111, negative=1
        assert result = "1111" and negative = '1'
            report "FAIL: NOT 0000 (negative flag)" severity error;

        -- --------------------------------------------------------
        -- NEGATE
        -- --------------------------------------------------------
        op <= "110";
        a <= "0011"; wait for PROP_DELAY;                 -- -3 = 1101, negative=1
        assert result = "1101" and zero = '0' and carry = '0' and negative = '1'
            report "FAIL: NEGATE 3" severity error;

        a <= "0000"; wait for PROP_DELAY;                 -- -0 = 0, zero=1
        assert result = "0000" and zero = '1'
            report "FAIL: NEGATE 0 (zero flag)" severity error;

        -- --------------------------------------------------------
        -- op=111: all zeros
        -- --------------------------------------------------------
        op <= "111";
        a <= "1111"; b <= "1111"; wait for PROP_DELAY;
        assert result = "0000" and carry = '0' and negative = '0'
				report "FAIL: op=111" severity error;

        wait for PROP_DELAY;
        report "alu4_extended testbench complete." severity note;
        wait;

    end process stimulus;

end sim;