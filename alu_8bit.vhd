library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu_8bit is
    Port (
        A      : in  STD_LOGIC_VECTOR(7 downto 0);
        B      : in  STD_LOGIC_VECTOR(7 downto 0);
        Opcode : in  STD_LOGIC_VECTOR(2 downto 0);
        Result : out STD_LOGIC_VECTOR(7 downto 0);
        Zero   : out STD_LOGIC
    );
end alu_8bit;

architecture Behavioral of alu_8bit is
    signal alu_out : STD_LOGIC_VECTOR(7 downto 0);
begin

    process(A, B, Opcode)
    begin
        case Opcode is
            when "000" => alu_out <= A + B;          -- Addition
            when "001" => alu_out <= A - B;          -- Subtraction
            when "010" => alu_out <= A and B;        -- Logical AND
            when "011" => alu_out <= A or B;         -- Logical OR
            when "100" => alu_out <= A xor B;        -- Logical XOR
            when "101" => alu_out <= not A;          -- Logical NOT
            when "110" => alu_out <= A + 1;          -- Increment
            when "111" => alu_out <= A - 1;          -- Decrement
            when others => alu_out <= (others => '0');
        end case;
    end process;

    Result <= alu_out;
    Zero   <= '1' when (alu_out = "00000000") else '0';

end Behavioral;
