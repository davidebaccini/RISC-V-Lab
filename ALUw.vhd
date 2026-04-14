library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity ALUw is
  generic (
    N : natural := 32
  );

  port (
    --IO
    A, B : in std_logic_vector(N - 1 downto 0);
    O    : out std_logic_vector(N - 1 downto 0);

    --OP_codes
    alu_opcode : in std_logic_vector(2 downto 0);

    --Flags
    C   : out std_logic; --Carry out
    V   : out std_logic; --Overflow 
    Neg : out std_logic; --Negative
    Z   : out std_logic; --Zero 
    P   : out std_logic; --Parity (Paride, if odd even)

  );
end ALUw;

architecture ARCH of ALUw is

  --encoding: 
  --000 – ADD
  --001 – ADDI
  --010 – SUB
  --111 – AND
  --110 – OR
  --100 – EXOR

begin

  process (A, B, alu_opcode)

    variable res : unsigned(N downto 0) := (others => '0');

  begin
    case alu_opcode is -- 

      when '000' => --ADD

        res := std_logic_vector( signed(A) + signed(B));

      when '001' => --ADDI

        res := std_logic_vector(to_unsigned(A) + to_unsigned(B));

      when '010' => --SUB

        res := std_logic_vector(signed(A) - signed(B));

      when '111' => --AND

        res := A and B;

      when '110' => --OR

        res := A or B;

      when '100' => --EXOR

        res := A xor B;

      when others    =>
        res := (others => '0');

    end case;

    O <= res(31 downto 0);

    C <= res(32 downto 32); --Carry out, for signed 

    V <= res(32 downto 32); --Overflow , for unsigned 

    Neg <= res(32 downto 32); --Negative, if signed 

    if res(31 downto 0) == (others => '0') then --Check if 32 bits are 0, dont care for extra bit
      Z <= 1;

    else

      Z <= 0;

    end if;

    P <= res(0 downto 0); -- just check if last bit is 1, if it is its odd.

  end process;

end ARCH; -- ARCH