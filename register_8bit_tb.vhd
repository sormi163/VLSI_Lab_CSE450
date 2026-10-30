library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_8bit_tb is
end register_8bit_tb;

architecture behavior of register_8bit_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT register_8bit
    PORT(
        clk : IN  std_logic;
        rst : IN  std_logic;
        en  : IN  std_logic;
        d   : IN  std_logic_vector(7 downto 0);
        q   : OUT std_logic_vector(7 downto 0)
    );
    END COMPONENT;

    -- Inputs
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal en  : std_logic := '0';
    signal d   : std_logic_vector(7 downto 0) := (others => '0');

    -- Outputs
    signal q   : std_logic_vector(7 downto 0);

    -- Clock period definitions
    constant clk_period : time := 20 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: register_8bit PORT MAP (
        clk => clk,
        rst => rst,
        en  => en,
        d   => d,
        q   :=> q
    );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin		
        -- Step 1: Apply Reset
        rst <= '1';
        en  <= '0';
        d   <= "10101010";
        wait for clk_period;  -- 20 ns

        -- Step 2: Enable Write & Latch First Data
        rst <= '0';
        en  <= '1';
        d   <= "10101010";
        wait for clk_period;  -- 40 ns

        -- Step 3: Dynamic Data Update (en stays HIGH)
        d   <= "11001100";
        wait for clk_period;  -- 60 ns

        -- Step 4: Disable Write (Hold State)
        en  <= '0';
        d   <= "11110000";    -- Input changes, but output should hold "11001100"
        wait for clk_period;  -- 80 ns

        wait;
    end process;

end behavior;
