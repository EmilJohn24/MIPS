library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( addin : in STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           addout : out STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is
    signal prog_count : STD_LOGIC_VECTOR (31 downto 0);
begin
    pc_process : process (clk) is
    begin
        if falling_edge(clk) then
            prog_count <= addin;
        end if;
    end process;  
    addout <= prog_count;
end Behavioral;
