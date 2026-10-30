library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_8bit_tb is
end alu_8bit_tb;

architecture behavior of alu_8bit_tb is

    COMPONENT alu_8bit
    PORT(
        A      : IN  std_logic_vector(7 downto 0);
        B      : IN  std_logic_vector(7 downto 0);
        Opcode : IN  std_logic_vector(2 downto 0);
        Result : OUT std_logic_vector(7 downto 0);
        Zero   : OUT std_logic
    );
    END COMPONENT;

    -- Inputs
    signal A      : std_logic_vector(7 downto 0) := (others => '0');
    signal B      : std_logic_vector(7 downto 0) := (others => '0');
    signal Opcode : std_logic_vector(2 downto 0) := (others => '0');

    -- Outputs
    signal Result : std_logic_vector(7 downto 0);
    signal Zero   : std_logic;

begin

    uut: alu_8bit PORT MAP (
        A => A,
        B => B,
        Opcode => Opcode,
        Result => Result,
        Zero => Zero
    );

    stim_proc: process
    begin
        -- Test Inputs: A = 10 (00001010), B = 5 (00000101)
        A <= "00001010";
        B <= "00000101";
        
        -- Operation 1: Addition (Opcode = "000") -> Result: 15
        Opcode <= "000";
        wait for 20 ns;
        
        -- Operation 2: Subtraction (Opcode = "001") -> Result: 5
        Opcode <= "001";
        wait for 20 ns;
        
        -- Operation 3: AND (Opcode = "010") -> Result: 0, Zero = 1
        Opcode <= "010";
        wait for 20 ns;
        
        -- Operation 4: OR (Opcode = "011") -> Result: 15
        Opcode <= "011";
        wait for 20 ns;
        
        -- Operation 5: XOR (Opcode = "100") -> Result: 15
        Opcode <= "100";
        wait for 20 ns;

        -- Operation 6: NOT A (Opcode = "101") -> Result: 245
        Opcode <= "101";
        wait for 20 ns;

        -- Operation 7: Increment A (Opcode = "110") -> Result: 11
        Opcode <= "110";
        wait for 20 ns;

        -- Operation 8: Decrement A (Opcode = "111") -> Result: 9
        Opcode <= "111";
        wait for 20 ns;

        wait;
    end process;

end behavior;
