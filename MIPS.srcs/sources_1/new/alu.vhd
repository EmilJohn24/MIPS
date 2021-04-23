----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2021 15:39:30
-- Design Name: 
-- Module Name: alu - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           op : in STD_LOGIC_VECTOR (3 downto 0);
           result : out STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC;
           O : out STD_LOGIC;
           C : out STD_LOGIC);
end alu;

architecture Behavioral of alu is
signal result_reg : STD_LOGIC_VECTOR(32 downto 0);

begin
    ALU_OP : process(op) is
    variable A_33 : STD_LOGIC_VECTOR(32 downto 0);
    variable B_33 : STD_LOGIC_VECTOR(32 downto 0);
    begin
        A_33 := '0' & A;
        B_33 := '0' & B;
        
        case op is
            when "0000" =>
                result_reg <= A_33 and B_33;
            when "0001" =>
                result_reg <= A_33 or B_33;
            when "0010" =>
                result_reg <= A_33 + B_33;
            when "0110" =>
                result_reg <= A_33 + (not B_33) + 1;
            when "0111" =>
                if (A < B) then result_reg(31 downto 0) <= x"00000001";
                else result_reg(31 downto 0) <= x"00000000";
                end if;
            when "1100" =>
                 result_reg <= A nor B;
            when others =>
                
        end case;
    end process;
    C <= result_reg(32);
    O <= result_reg(32);
    Z <= '1' when result_reg(31 downto 0) = x"0000" else '0';
    result <= result_reg(31 downto 0);
     
     
            

end Behavioral;
