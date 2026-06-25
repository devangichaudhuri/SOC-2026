library ieee;
use ieee.std_logic_1164.all;
entity myand3 is
    port (a,b,c : in std_logic;
            y : out std_logic);
end myand3;
architecture rtl of myand3 is
begin
    y <= a and b and c;
end rtl;