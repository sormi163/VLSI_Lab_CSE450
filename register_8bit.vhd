library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_8bit is
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        en  : in  STD_LOGIC;
        d   : in  STD_LOGIC_VECTOR (7 downto 0);
        q   : out STD_LOGIC_VECTOR (7 downto 0)
    );
end register_8bit;

architecture Behavioral of register_8bit is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                q <= (others => '0');  -- Synchronous Reset: Output forced to 00000000
            elsif en = '1' then
                q <= d;                -- Enable HIGH: Latch input data d to output q
            end if;
            -- If en = '0', output q holds its previous value automatically
        end if;
    end process;
end Behavioral;
