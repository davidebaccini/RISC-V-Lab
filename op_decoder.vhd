library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity op_decoder is
    generic(
        N: natural := 32
    );
    port(
        INSTRUCTION:    in std_logic_vector(N - 1 downto 0);
        
        
    );
end entity;

architecture behavioral of op_decoder is

    -- All opcodes that we will use in this architecture
    constant ARITH: std_logic_vector(6 downto 0) := "011 0011";
    constant LOGIC: std_logic_vector(6 downto 0) := "001 0011";
    constant IMMEDIATE: std_logic_vector(6 downto 0) := "001 0011";
    constant LOAD: std_logic_vector(6 downto 0) := "000 0011";
    constant STORE: std_logic_vector(6 downto 0) := "010 0011";
    constant BRANCH: std_logic_vector(6 downto 0) := "110 0011";
    constant SYS_CALL: std_logic_vector(6 downto 0) := "111 0011";

    signal opcode: std_logic_vector(6 downto 0) := INSTRUCTION(6 downto 0);
    signal funct3: std_logic_vector(2 downto 0) := INSTRUCTION(14 downto 12);
    signal funct7: std_logic_vector(6 downto 0) := INSTRUCTION(31 downto 25);

    begin
        

end architecture;    