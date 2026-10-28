library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_rom is
    Port (
        ADDR  : in  STD_LOGIC_VECTOR(3 downto 0);
        INSTR : out STD_LOGIC_VECTOR(11 downto 0)
    );
end program_rom;

architecture Behavioral of program_rom is
begin
    process(ADDR)
    begin
	 case ADDR is
            when "0000" => INSTR <= x"180";
            when "0001" => INSTR <= x"900";
            when "0010" => INSTR <= x"310";
            when "0011" => INSTR <= x"20F";
            when "0100" => INSTR <= x"63F";
            when "0101" => INSTR <= x"207";
            when "0110" => INSTR <= x"900";
            when others => INSTR <= x"000";
        end case;
    end process;
end Behavioral;