----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:00 10/02/2026 
-- Design Name: 
-- Module Name:    Full_adder_1bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_adder_1bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end Full_adder_1bit;

architecture Behavioral of Full_adder_1bit is
--Ayesha Alom Sormi
--22201163
Signal n1, n2, n3, n4, n5, n6, n7 : Std_logic;
begin

    n1 <= not (A and B);
    n2 <= not (A and n1);
    n3 <= not (B and n1);
    n4 <= not (n2 and n3);   
    n5 <= not (n4 and Cin);
    n6 <= not (n4 and n5);
    n7 <= not (Cin and n5);
	 
    Sum <= not (n6 and n7);

   
    Cout <= not (n1 and n5);

end Behavioral;

