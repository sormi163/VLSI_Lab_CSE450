library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity acc_z is
    Port ( CLK    : in  STD_LOGIC;
           RESET  : in  STD_LOGIC;
           ACC_En : in  STD_LOGIC;
           D_in   : in  STD_LOGIC_VECTOR(7 downto 0);
           ACC    : out STD_LOGIC_VECTOR(7 downto 0);
           Z      : out STD_LOGIC);
end acc_z;

architecture Behavioral of acc_z is
    signal acc_reg : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal z_reg   : STD_LOGIC := '1';

begin
    process(CLK)
	 begin
    if rising_edge(CLK) then
            if RESET = '1' then
                acc_reg <= "00000000";
                z_reg   <= '1';
            elsif ACC_En = '1' then
                acc_reg <= D_in;
                if D_in = "00000000" then
                    z_reg <= '1';
                else
                    z_reg <= '0';
                end if;
            end if;
        end if;
    end process;
    ACC <= acc_reg;
    Z   <= z_reg;
end Behavioral;

