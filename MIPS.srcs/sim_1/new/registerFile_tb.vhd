-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity registerFile_tb is
end;

architecture bench of registerFile_tb is

  component registerFile
      Port ( readReg1 : in STD_LOGIC_VECTOR (4 downto 0);
             readReg2 : in STD_LOGIC_VECTOR (4 downto 0);
             writeReg : in STD_LOGIC_VECTOR (4 downto 0);
             clk : in STD_LOGIC;
             dataWrite : in STD_LOGIC_VECTOR (31 downto 0);
             dataRead1 : out STD_LOGIC_VECTOR (31 downto 0);
             dataRead2 : out STD_LOGIC_VECTOR (31 downto 0);
             write : in STD_LOGIC);
  end component;

  signal readReg1: STD_LOGIC_VECTOR (4 downto 0);
  signal readReg2: STD_LOGIC_VECTOR (4 downto 0);
  signal writeReg: STD_LOGIC_VECTOR (4 downto 0);
  signal clk: STD_LOGIC;
  signal dataWrite: STD_LOGIC_VECTOR (31 downto 0);
  signal dataRead1: STD_LOGIC_VECTOR (31 downto 0);
  signal dataRead2: STD_LOGIC_VECTOR (31 downto 0);
  signal write: STD_LOGIC;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: registerFile port map ( readReg1  => readReg1,
                               readReg2  => readReg2,
                               writeReg  => writeReg,
                               clk       => clk,
                               dataWrite => dataWrite,
                               dataRead1 => dataRead1,
                               dataRead2 => dataRead2,
                               write     => write );

  stimulus: process
  begin
  
    -- Put initialisation code here
    write <= '1';
    for pos in 0 to 31 loop
        writeReg <= STD_LOGIC_VECTOR(TO_UNSIGNED(pos, 5));
        dataWrite <= STD_LOGIC_VECTOR(TO_UNSIGNED(pos * 2, 32));
        wait for clock_period;
    end loop;
    write <= '0';
    readReg1 <= STD_LOGIC_VECTOR(TO_UNSIGNED(1, 5));
    readReg2 <= STD_LOGIC_VECTOR(TO_UNSIGNED(3, 5));
    

    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  