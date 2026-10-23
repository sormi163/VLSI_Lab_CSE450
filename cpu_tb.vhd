library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_tb is
end cpu_tb;

architecture Behavioral of cpu_tb is
    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal Q     : STD_LOGIC_VECTOR(7 downto 0);
    signal Z     : STD_LOGIC;
    signal PC_out: STD_LOGIC_VECTOR(3 downto 0);

    constant CLK_PERIOD : time := 10 ns;
begin

    UUT: entity work.cpu_top
        port map (
            CLK => CLK,
            RESET => RESET,
            Q => Q,
            Z => Z,
            PC_out => PC_out
        );

    clk_process : process
    begin
        CLK <= '0';
        wait for CLK_PERIOD/2;
        CLK <= '1';
        wait for CLK_PERIOD/2;
    end process;

    stim_proc: process
    begin
        RESET <= '1';
        wait for CLK_PERIOD;
        
        RESET <= '0';
        wait for 10 * CLK_PERIOD;

        wait;
    end process;

end Behavioral;
