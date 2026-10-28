library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cpu_top is
end tb_cpu_top;

architecture Behavioral of tb_cpu_top is

    signal CLK    : STD_LOGIC := '0';
    signal RESET  : STD_LOGIC := '1';
    signal Q      : STD_LOGIC_VECTOR(7 downto 0);
    signal Z      : STD_LOGIC;
    signal PC_OUT : STD_LOGIC_VECTOR(3 downto 0);

begin
DUT: entity work.cpu_top
        port map (
            CLK    => CLK,
            RESET  => RESET,
            Q      => Q,
            Z      => Z,
            PC_OUT => PC_OUT
        );

    clock_process: process
    begin
        while true loop
            CLK <= '0';
            wait for 5 ns;
            CLK <= '1';
            wait for 5 ns;
        end loop;
    end process;
	 stimulus_process: process
    begin
        RESET <= '1';
        wait until rising_edge(CLK);
        wait for 1 ns;
        RESET <= '0';

        -- Run all 7 instructions
        wait for 70 ns;

        assert Q = x"03"
            report "Final ACC value is incorrect"
            severity warning;

        assert Z = '0'
		   report "Final Zero flag is incorrect"
            severity warning;

        assert PC_OUT = x"7"
            report "Final PC value is incorrect"
            severity warning;

        wait;
    end process;

end Behavioral;