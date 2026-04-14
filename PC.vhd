library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PC is
    port(
        pc_in   : in std_logic_vector(11 downto 0);
        load_en : in std_logic;
        pc      : out std_logic_vector(11 downto 0);
        clka    : in std_logic  
    );    
end entity PC;

architecture Behavioral of PC is
begin
    process(clka)
    begin
        if rising_edge(clka) then
            if load_en = '1' then 
                pc <= pc_in; 
            end if;
        end if;
    end process;
end architecture Behavioral;