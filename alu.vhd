library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port (
        ALU_SEL : in STD_LOGIC_VECTOR(2 downto 0);
        ACC_IN  : in STD_LOGIC_VECTOR(7 downto 0);
        OPERAND : in STD_LOGIC_VECTOR(7 downto 0);
        ALU_OUT : out STD_LOGIC_VECTOR(7 downto 0)
    );
end alu;
architecture Behavioral of alu is
begin
    process(ALU_SEL, ACC_IN, OPERAND)
    begin
        case ALU_SEL is
            when "000" =>
                ALU_OUT <= OPERAND;

            when "001" =>
                ALU_OUT <= std_logic_vector(
                    unsigned(ACC_IN) + unsigned(OPERAND)
                );

            when "010" =>
				ALU_OUT <= std_logic_vector(
                    unsigned(ACC_IN) - unsigned(OPERAND)
                );

            when "011" =>
                ALU_OUT <= ACC_IN xor OPERAND;

            when "100" =>
                ALU_OUT <= '0' & ACC_IN(7 downto 1);

            when others =>
                ALU_OUT <= (others => '0');
        end case;
		  end process;
end Behavioral;