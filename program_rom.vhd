library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_rom is
    Port ( PC   : in  STD_LOGIC_VECTOR(3 downto 0);
           ROM  : out STD_LOGIC_VECTOR(11 downto 0));
end program_rom;

architecture Behavioral of program_rom is
    type rom_type is array (0 to 15) of std_logic_vector(11 downto 0);
    constant rom_data : rom_type := (
        0 => x"180", -- LDI 0x80
        1 => x"900", -- SHR
        2 => x"310", -- SUB 0x10
        3 => x"20F", -- ADD 0x0F
        4 => x"63F", -- XOR 0x3F
        5 => x"207", -- ADD 0x07
        6 => x"900", -- SHR
        others => x"000"
    );
begin
    ROM <= rom_data(to_integer(unsigned(PC)));
end Behavioral;
