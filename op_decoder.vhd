library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity op_decoder is
    port(
        CLK:    in std_logic;
        RST:    in std_logic;

        OP:     in std_logic_vector(6 downto 0);
        F3:     in std_logic_vector(2 downto 0);
        F7:     in std_logic_vector(6 downto 0);

        ADD:    out std_logic;
        ADDI:   out std_logic;
        NEG:    out std_logic;
        SUB:    out std_logic;
        LW:     out std_logic;
        SW:     out std_logic;
        J:      out std_logic;
        RET:    out std_logic;
        BEQ:    out std_logic
    );
end entity

architecture behavioral of op_decoder is

    constant ARITH: std_logic_vector := "011 0011";
    constant LOGIC: std_logic_vector := "011 0011";
    constant ADDI: std_logic_vector := "001 0011";
    constant LOAD: std_logic_vector := "000 0011";
    constant STORE: std_logic_vector := "010 0011";

    begin
        process(CLK, RST) begin
            if falling_edge(RST) then

            