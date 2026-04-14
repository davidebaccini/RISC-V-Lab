library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity inst_fetch is
    port(
        CLK:    in std_logic;
        RST:    in std_logic;
        pc_load: in std_logic;
        pc_in: in std_logic_vector(11 downto 0);
        next_pc: out std_logic_vector(11 downto 0);
        curr_pc: out std_logic_vector(11 downto 0);
        instruction: out std_logic_vector(31 downto 0)
    );
end entity;
architecture Behavioral of inst_fetch is
begin
end architecture Behavioral;