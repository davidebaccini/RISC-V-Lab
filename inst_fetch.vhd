library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity inst_fetch is
    port(
        clk         : in std_logic;                     
        pc_load     : in std_logic;                     
        pc_in       : in std_logic_vector(11 downto 0); 
        next_pc     : out std_logic_vector(11 downto 0);
        curr_pc     : out std_logic_vector(11 downto 0);-- PC attuale
        instruction : out std_logic_vector(31 downto 0) 
    );
end entity;

architecture Behavioral of inst_fetch is

    component PC is
        port(
            pc_in   : in std_logic_vector(11 downto 0);
            load_en : in std_logic;
            pc      : out std_logic_vector(11 downto 0);
            clka    : in std_logic  
        );
    end component;

    component addthe4 is
        port(
            pc      : in std_logic_vector(11 downto 0);
            next_pc : out std_logic_vector(11 downto 0)
        );
    end component;

    signal internal_pc : std_logic_vector(11 downto 0);

begin
    PROGRAM_COUNTER: PC 
        port map(
            pc_in   => pc_in,
            load_en => pc_load,
            pc      => internal_pc,
            clka    => clk
        );

    PC_INCREMENTER: addthe4 
        port map(
            pc      => internal_pc,
            next_pc => next_pc
        );

    curr_pc <= internal_pc;

end architecture Behavioral;