library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity inst_memory is
    port(
        wea: in std_logic;
        dina: in std_logic;
        addra: in std_logic_vector(11 downto 2);
        clka: in std_logic;
        douta: out std_logic_vector(31 downto 0)
    );
end entity inst_memory;

architecture Behavioral of inst_memory is
    begin
end architecture Behavioral;