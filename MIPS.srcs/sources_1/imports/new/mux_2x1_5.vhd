library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2x1_5 is
    Port ( l0 : in STD_LOGIC_VECTOR (4 downto 0);
           l1 : in STD_LOGIC_VECTOR (4 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (4 downto 0));
end mux_2x1_5;

architecture Behavioral of mux_2x1_5 is

begin
    with S select
        Y <= l0 when "00",
             l1 when "01",
             l0 when others;  
end Behavioral;
