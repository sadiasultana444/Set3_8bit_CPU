library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port (
        OPCODE  : in  STD_LOGIC_VECTOR(3 downto 0);
        ACC_WE  : out STD_LOGIC;
        ALU_SEL : out STD_LOGIC_VECTOR(2 downto 0)
    );
end control_unit;

architecture Behavioral of control_unit is
begin
    process(OPCODE)
	 begin
        ACC_WE  <= '0';
        ALU_SEL <= "000";

        case OPCODE is
            when "0001" =>
                ACC_WE  <= '1';
                ALU_SEL <= "000";

            when "0010" =>
                ACC_WE  <= '1';
                ALU_SEL <= "001";

            when "0011" =>
                ACC_WE  <= '1';
                ALU_SEL <= "010";
when "0110" =>
                ACC_WE  <= '1';
                ALU_SEL <= "011";

            when "1001" =>
                ACC_WE  <= '1';
                ALU_SEL <= "100";

            when others =>
                ACC_WE  <= '0';
                ALU_SEL <= "000";
        end case;
    end process;
end Behavioral;