library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_top is
    Port ( CLK   : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Q     : out STD_LOGIC_VECTOR(7 downto 0);
           Z     : out STD_LOGIC;
           PC_out: out STD_LOGIC_VECTOR(3 downto 0));
end cpu_top;

architecture Behavioral of cpu_top is
    signal pc_sig     : STD_LOGIC_VECTOR(3 downto 0);
    signal rom_sig    : STD_LOGIC_VECTOR(11 downto 0);
    signal alu_op_sig : STD_LOGIC_VECTOR(2 downto 0);
    signal acc_en_sig : STD_LOGIC;
    signal alu_res    : STD_LOGIC_VECTOR(7 downto 0);
    signal acc_reg    : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal z_reg      : STD_LOGIC := '1';
begin

    U_PC: entity work.pc port map (CLK => CLK, RESET => RESET, PC => pc_sig);
    U_ROM: entity work.program_rom port map (PC => pc_sig, ROM => rom_sig);
    U_CU: entity work.control_unit port map (Opcode => rom_sig(11 downto 8), ALU_Op => alu_op_sig, ACC_En => acc_en_sig);
    U_ALU: entity work.alu port map (ACC_In => acc_reg, Operand => rom_sig(7 downto 0), ALU_Op => alu_op_sig, Result => alu_res);

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                acc_reg <= "00000000";
                z_reg   <= '1';
            elsif acc_en_sig = '1' then
                acc_reg <= alu_res;
                if alu_res = "00000000" then
                    z_reg <= '1';
                else
                    z_reg <= '0';
                end if;
            end if;
        end if;
    end process;

    Q      <= acc_reg;
    Z      <= z_reg;
    PC_out <= pc_sig;

end Behavioral;
