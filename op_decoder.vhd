library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity op_decoder is
    generic(
        N: natural := 32
    );
    port(
        INSTRUCTION:    in std_logic_vector(N - 1 downto 0);
        
        OP_CLASS:       out std_logic_vector(4 downto 0);
        ALU_OPCODE:     out std_logic_vector(2 downto 0);
        A_SEL:          out std_logic;
        B_SEL:          out std_logic;
        COND_OPCODE:    out std_logic_vector(2 downto 0)
    );
end entity;

architecture behavioral of op_decoder is

    -- All opcodes that we will use
    constant ARITH: std_logic_vector(6 downto 0) := "011 0011";
    constant LOGIC: std_logic_vector(6 downto 0) := "001 0011";
    constant IMMEDIATE: std_logic_vector(6 downto 0) := "001 0011";
    constant LOAD: std_logic_vector(6 downto 0) := "000 0011";
    constant STORE: std_logic_vector(6 downto 0) := "010 0011";
    constant BRANCH: std_logic_vector(6 downto 0) := "110 0011";
    constant JUMP: std_logic_vector(6 downto 0) := "110 1111";

    -- All funct3 codes that we will use
    constant ADD: std_logic_vector(2 downto 0) := "000";
    constant ADDI: std_logic_vector(2 downto 0) := "001";
    constant SUB: std_logic_vector(2 downto 0) := "010";
    constant AND_LOGIC: std_logic_vector(2 downto 0) := "111";
    constant OR_LOGIC: std_logic_vector(2 downto 0) := "110";
    constant EXOR_LOGIC: std_logic_vector(2 downto 0) := "100";

    signal opcode: std_logic_vector(6 downto 0);
    signal funct3: std_logic_vector(2 downto 0);
    signal funct7: std_logic_vector(6 downto 0);

    begin
        opcode <= INSTRUCTION(6 downto 0);
        funct3 <= INSTRUCTION(14 downto 12);
        funct7 <= INSTRUCTION(31 downto 25);

        opcode: process() begin
            case opcode is
                when ARITH => 
                    OP_CLASS <= "1 0000";

                when LOGIC => 
                    OP_CLASS <= "1 0000";

                when IMMEDIATE => 
                    OP_CLASS <= "1 0000";

                when STORE => 
                    OP_CLASS <= "0 1000"; 

                when LOAD => 
                    OP_CLASS <= "0 0100";

                when BRANCH => 
                    OP_CLASS <= "0 0010";

                when JUMP => 
                    OP_CLASS <= "0 0001";
            end case;
        end process;

        alu_opcode: process() begin
            case funct3 is
                when ADD => 
                    

end architecture;