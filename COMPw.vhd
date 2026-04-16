library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity ENT is

  generic (
    N : natural := 32
  );

  port (
    cond_opcode     : in std_logic_vector(2 downto 0);
    rs1_value       : in std_logic_vector(N - 1 downto 0);
    rs2_value       : in std_logic_vector(N - 1 downto 0);
    branch_cond_pre : out std_logic_vector(N - 1 downto 0);

  );
end ENT;

architecture ARCH of ENT is

begin
  --000 – EQ
  --001 – NEQ
  --100 – LT
  --101 – GE
  --false otherwise

  process (cond_opcode, rs1_value, rs2_value)
  begin
    branch_cond <= '0';

    case cond_opcode is
      when "000" => -- EQ
        if signed(rs1_value) = signed(rs2_value) then
          branch_cond <= '1';

        end if;

      when "001" => -- NEQ
        if signed(rs1_value) /= signed(rs2_value) then --singed int
          branch_cond <= '1';

        end if;

      when "100" => -- LT
        if signed(rs1_value) < signed(rs2_value) then
          branch_cond <= '1';

        end if;

      when "101" => -- GE
        if signed(rs1_value) >= signed(rs2_value) then
          branch_cond <= '1';

        end if;

      when others =>
        branch_cond <= '0';

    end case;

  end process;

end ARCH; -- ARCH