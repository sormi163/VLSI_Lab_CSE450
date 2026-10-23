library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port ( Opcode : in  STD_LOGIC_VECTOR(3 downto 0);
           ALU_Op : out STD_LOGIC_VECTOR(2 downto 0);
           ACC_En : out STD_LOGIC);
end control_unit;

architecture Behavioral of control_unit is
begin
    process(Opcode)
    begin
        case Opcode is
            when "0001" => ALU_Op <= "000"; ACC_En <= '1'; -- LDI
            when "0010" => ALU_Op <= "001"; ACC_En <= '1'; -- ADD
            when "0011" => ALU_Op <= "010"; ACC_En <= '1'; -- SUB
            when "0110" => ALU_Op <= "011"; ACC_En <= '1'; -- XOR
            when "1001" => ALU_Op <= "100"; ACC_En <= '1'; -- SHR
            when others => ALU_Op <= "111"; ACC_En <= '0'; -- NOP
        end case;
    end process;
end Behavioral;
