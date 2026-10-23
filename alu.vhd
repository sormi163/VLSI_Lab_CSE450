library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port ( ACC_In  : in  STD_LOGIC_VECTOR(7 downto 0);
           Operand : in  STD_LOGIC_VECTOR(7 downto 0);
           ALU_Op  : in  STD_LOGIC_VECTOR(2 downto 0);
           Result  : out STD_LOGIC_VECTOR(7 downto 0));
end alu;

architecture Behavioral of alu is
begin
    process(ACC_In, Operand, ALU_Op)
    begin
        case ALU_Op is
            when "000" => Result <= Operand; -- LDI
            when "001" => Result <= std_logic_vector(unsigned(ACC_In) + unsigned(Operand)); -- ADD
            when "010" => Result <= std_logic_vector(unsigned(ACC_In) - unsigned(Operand)); -- SUB
            when "011" => Result <= ACC_In xor Operand; -- XOR
            when "100" => Result <= '0' & ACC_In(7 downto 1); -- SHR
            when others => Result <= ACC_In;
        end case;
    end process;
end Behavioral;
