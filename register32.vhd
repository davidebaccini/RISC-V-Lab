library ieee;
use ieee.std_logic_1164.all;

entity register32 is
    generic(
        N: natural := 32 -- very good hajide 
    );
    port(
        CLK:    in std_logic;
        RST:    in std_logic;   -- Asynchronous reset  

        X:      in std_logic_vector(N - 1 downto 0);

        Z:      out std_logic_vector(N - 1 downto 0)
    );
end entity;

architecture behavioral of register32 is
    constant zero: std_logic_vector(N - 1 downto 0) := (others => '0');
    constant one: std_logic_vector(N - 1 downto 0) := (others => '1');

    signal memory:  std_logic_vector(N - 1 downto 0);

    begin
        process(CLK, RST)
            begin
                if rising_edge(RST) then
                    memory <= one;
                elsif rising_edge(CLK) then
                    memory <= X;
                else
                    memory <= memory;
                end if;
        end process;

        Z <= memory;
end architecture;