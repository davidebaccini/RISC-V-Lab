library ieee;
use ieee.std_logic_1164.all;

entity mux32 is
    generic(
        N: natural := 32
    );
    port(
        X:  in std_logic_vector(N - 1 downto 0);
        Y:  in std_logic_vector(N - 1 downto 0);
        S:  in std_logic;

        Z:  out std_logic_vector(N - 1 downto 0)
    );
end entity;

architecture behavioral of mux32 is
    begin
        process(S)
            begin
                if S = '0' then
                    Z <= X;
                else
                    Z <= Y;
                end if;
        end process;
end architecture;