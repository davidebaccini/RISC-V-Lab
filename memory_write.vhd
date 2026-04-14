entity memory_write is
    generic(
        N: natural := 32
    );
    port(
        CLKa: in std_logic;
        RST: in std_logic;   
        MEMORY_WE: in std_logic;
        RS2_VALUE: in std_logic_vector(N - 1 downto 0);
        OP_CLASS: in std_logic_vector(4 downto 0);
        ALU_PRE_RESULT: in std_logic_vector(N - 1 downto 0); -- SOLO 13 TO 2
        ALU_RESULT: in std_logic_vector(N - 1 downto 0);
        NEXT_PC: in std_logic_vector(11 downto 0);
        BRANCH_COND: in std_logic;

        PC_OUT: out std_logic_vector(N - 1 downto 0);
        RD_VALUE: out std_logic_vector(N - 1 downto 0)
    );
end entity;

architecture behavioral of memory_write is
    signal mem_out : std_logic_vector(31 downto 0);
    signal wea : std_logic;
begin
    wea <= op_class(2) and MEMORY_WE;

    process(BRANCH_COND, OP_CLASS, ALU_RESULT, NEXT_PC)
    begin
        if (BRANCH_COND = '1') and (OP_CLASS(5) = '1') then
            PC_OUT <= ALU_RESULT;
        else
            PC_OUT <= NEXT_PC;
        end if;
    end process;
    
    process(NEXT_PC, ALU_RESULT, mem_out, OP_CLASS)
    begin
        case OP_CLASS is
            when "00001" => 
                RD_VALUE <= NEXT_PC;  
            when "10000" => 
                RD_VALUE <= ALU_RESULT;
            when "00100" =>  
                RD_VALUE <= mem_out; 
            when others =>
                RD_VALUE <= (others => 'Z');  -- Default case, high impedance
        end case;
    end process;


    --waiting for component "data memory"


end architecture;