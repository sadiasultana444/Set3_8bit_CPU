library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_top is
    Port (
        CLK    : in STD_LOGIC;
        RESET  : in STD_LOGIC;
        Q      : out STD_LOGIC_VECTOR(7 downto 0);
        Z      : out STD_LOGIC;
        PC_OUT : out STD_LOGIC_VECTOR(3 downto 0)
    );
end cpu_top;

architecture Structural of cpu_top is
signal pc_signal     : STD_LOGIC_VECTOR(3 downto 0);
    signal instr_signal  : STD_LOGIC_VECTOR(11 downto 0);
    signal acc_signal    : STD_LOGIC_VECTOR(7 downto 0);
    signal alu_signal    : STD_LOGIC_VECTOR(7 downto 0);
    signal acc_we_signal : STD_LOGIC;
    signal alu_sel_signal: STD_LOGIC_VECTOR(2 downto 0);

begin

    U_PC: entity work.pc
        port map (
            CLK => CLK,
            RESET => RESET,
            PC_OUT => pc_signal
        );
		   U_ROM: entity work.program_rom
        port map (
            ADDR => pc_signal,
            INSTR => instr_signal
        );

    U_CONTROL: entity work.control_unit
        port map (
            OPCODE => instr_signal(11 downto 8),
            ACC_WE => acc_we_signal,
            ALU_SEL => alu_sel_signal
        );
 U_ALU: entity work.alu
        port map (
            ALU_SEL => alu_sel_signal,
            ACC_IN => acc_signal,
            OPERAND => instr_signal(7 downto 0),
            ALU_OUT => alu_signal
        );

    U_ACC: entity work.acc_z
        port map (
            CLK => CLK,
            RESET => RESET,
            ACC_WE => acc_we_signal,
            ALU_OUT => alu_signal,
            ACC_OUT => acc_signal,
            Z => Z
				 );

    Q <= acc_signal;
    PC_OUT <= pc_signal;

end Structural;