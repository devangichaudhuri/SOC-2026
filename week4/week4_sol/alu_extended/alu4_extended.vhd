library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu4_extended is
    port (
        a        : in  std_logic_vector(3 downto 0);
        b        : in  std_logic_vector(3 downto 0);
        op       : in  std_logic_vector(2 downto 0);
        result   : out std_logic_vector(3 downto 0);
        zero     : out std_logic;
        carry    : out std_logic;
        negative : out std_logic
    );
end alu4_extended;

architecture rtl of alu4_extended is
    signal result_int : std_logic_vector(3 downto 0);
    signal carry_int  : std_logic;
begin

    process(a, b, op)
        variable a5, b5, sum5 : unsigned(4 downto 0);
    begin
        carry_int  <= '0';
        result_int <= "0000";

        case op is
            when "000" =>  
                a5   := '0' & unsigned(a);
                b5   := '0' & unsigned(b);
                sum5 := a5 + b5;
                result_int <= std_logic_vector(sum5(3 downto 0));
                carry_int  <= sum5(4);

            when "001" =>  
                result_int <= std_logic_vector(unsigned(a) - unsigned(b));

            when "010" =>  
                result_int <= a and b;

            when "011" =>  
                result_int <= a or b;

            when "100" =>  
                result_int <= a xor b;

            when "101" =>  
                result_int <= not a;

            when "110" =>  
                result_int <= std_logic_vector(-signed(a));

            when others =>  
                result_int <= "0000";
        end case;
    end process;

    result   <= result_int;
    carry    <= carry_int;
    zero     <= '1' when result_int = "0000" else '0';
    negative <= result_int(3);

end rtl;