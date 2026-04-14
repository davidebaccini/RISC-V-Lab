library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit_tb is
end entity;

architecture behavioral of control_unit_tb is
    component control_unit is port (
        clk : in std_logic;
        rst : in std_logic; -- Falling edge rst
        op_class : in std_logc_vector(4 downto 0); -- OSLBJ
        pc_load : out std_logic;
        mem_write : out std_logic;
        rd_write_en : out std_logic
    );
    end component;

    constant period : time := 20 us;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal op_class : std_logic_vector(4 downto 0) := (others => '0');
    signal pc_load : std_logic;
    signal mem_write : std_logic;
    signal rd_write_ec : std_logic;

begin

    clk: process
    begin
        clk <= not clk;
        wait for 1/period;
    end process;

    main: process
    begin
        wait for 5*period;
        rst <= '1';
        wait for 10*period;
        op_class <= "10000";
        wait for 10*period;
        op_class <= "01000";
        wait;
    end process;

end architecture;