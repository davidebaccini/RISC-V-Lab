library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit is port (
    clk : in std_logic;
    rst : in std_logic; -- Falling edge rst
    op_class : in std_logc_vector(4 downto 0); -- OSLBJ
    pc_load : out std_logic;
    mem_write : out std_logic;
    rd_write_en : out std_logic;
);
end entity;

architecture behavioral of control_unit is
    type state is ("Fetch", "Decode", "Execute", "Mem_write");
    signal current_state : state := "Fetch";
    signal pc_load : std_logic := '0';
    signal mem_write : std_logic := '0';
    signal rd_write_en : std_logic := '0';

begin

    process(clk, rst)
    begin (
        if rst == '0' then
            -- Reset state and outputs
            current_state = "Fetch";
            pc_load <= '0';
            mem_write <= '0';
            rd_write_en <= '0';

        else if rising_edge(clk) then
            -- Default values
            current_state = "Fetch";
            pc_load <= '0';
            mem_write <= '0';
            rd_write_en <= '0';

            case current_state is
                when "Fetch" => 
                    current_state <= "Decode";
                when "Decode" => 
                    current_state <= "Execute";
                when "Execute" => 
                    current_state <= "Mem_write";
                    mem_write <= '1';
                when "Mem_write" => 
                    -- State already defined
                    pc_load <= '1';
                    -- Active for operations, loads and jumps
                    if (op_class(0) == '1' || op_class(2) == '1' || op_class(4) == '1') then
                        rd_write_en <= '1'
                    end if;
            end case;
        end if;
    )

end architecture;