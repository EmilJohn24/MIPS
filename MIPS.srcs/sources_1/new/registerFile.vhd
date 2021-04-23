----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2021 15:07:24
-- Design Name: 
-- Module Name: registerFile - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registerFile is
    Port ( readReg1 : in STD_LOGIC_VECTOR (4 downto 0);
           readReg2 : in STD_LOGIC_VECTOR (4 downto 0);
           writeReg : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           dataWrite : in STD_LOGIC_VECTOR (31 downto 0);
           dataRead1 : out STD_LOGIC_VECTOR (31 downto 0);
           dataRead2 : out STD_LOGIC_VECTOR (31 downto 0);
           write : in STD_LOGIC);
end registerFile;

architecture Behavioral of registerFile is
    type reg_array is array(31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    signal regs : reg_array;

begin
    WRITE_DATA : process(clk) is
    begin 
        if rising_edge(clk) then
            if write = '1' then
              regs(TO_INTEGER(UNSIGNED(writeReg))) <= dataWrite;
            end if;
        end if;
    end process;
    
    READ_DATA : process(clk) is
    begin
        if rising_edge(clk) then
            if write = '0' then
                dataRead1 <= regs(TO_INTEGER(UNSIGNED(readReg1)));
                dataRead2 <= regs(TO_INTEGER(UNSIGNED(readReg2))); 
            else
                dataRead1 <= (others => 'Z');
                dataRead2 <= (others => 'Z');
            
            end if;
        end if;
    end process;
end Behavioral;
