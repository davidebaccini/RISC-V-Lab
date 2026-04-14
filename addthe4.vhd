library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addthe4 is
    port(
        pc: in std_logic_vector(11 downto 0);
        next_pc: out std_logic_vector(11 downto 0)
    );
end entity addthe4;

architecture Behavioral of addthe4 is
begin
    next_pc <= std_logic_vector(unsigned(pc) + 4);
end architecture Behavioral;