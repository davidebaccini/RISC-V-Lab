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

    --flags
    C   : out std_logic; --Carry out
    V   : out std_logic; --Overflow 
    Neg : out std_logic; --Negative
    Z   : out std_logic; --Zero 
    P   : out std_logic --Parity (Paride, if odd even)

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

    case alu_opcode is

      when "000" =>
        res := unsigned(resize(signed(A), N + 1) + resize(signed(B), N + 1));

      when "001" =>
        res := ('0' & unsigned(A)) + ('0' & unsigned(B));

      when "010" =>
        res := unsigned(resize(signed(A), N + 1) - resize(signed(B), N + 1));

      when "111" =>
        res(N - 1 downto 0) := unsigned(A and B);

      when "110" =>
        res(N - 1 downto 0) := unsigned(A or B);

      when "100" =>
        res(N - 1 downto 0) := unsigned(A xor B);

      when others    =>
        res := (others => '0');

    end case;

    O   <= std_logic_vector(res(N - 1 downto 0));

    C   <= res(N);

    V   <= res(N) xor res(N - 1);

    Neg <= res(N - 1);

    P   <= res(0);

    if res(N - 1 downto 0) = to_unsigned(0, N) then
      Z <= '1';

    else
      Z <= '0';

    end if;

  end process;

end ARCH; -- ARCH