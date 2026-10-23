library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pc is
    Port ( CLK   : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           PC    : out STD_LOGIC_VECTOR(3 downto 0));
end pc;

architecture Behavioral of pc is
    signal pc_reg : unsigned(3 downto 0) := "0000";
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                pc_reg <= "0000";
            else
                pc_reg <= pc_reg + 1;
            end if;
        end if;
    end process;
    PC <= std_logic_vector(pc_reg);
end Behavioral;
