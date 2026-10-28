library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity acc_z is
    Port (
        CLK     : in STD_LOGIC;
        RESET   : in STD_LOGIC;
        ACC_WE  : in STD_LOGIC;
        ALU_OUT : in STD_LOGIC_VECTOR(7 downto 0);
        ACC_OUT : out STD_LOGIC_VECTOR(7 downto 0);
        Z       : out STD_LOGIC
    );
end acc_z;
architecture Behavioral of acc_z is
    signal acc_reg : STD_LOGIC_VECTOR(7 downto 0)
                     := (others => '0');
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                acc_reg <= (others => '0');
                Z <= '1';
            elsif ACC_WE = '1' then
                acc_reg <= ALU_OUT;
					 if ALU_OUT = "00000000" then
                    Z <= '1';
                else
                    Z <= '0';
                end if;
            end if;
        end if;
    end process;
	 ACC_OUT <= acc_reg;
end Behavioral;