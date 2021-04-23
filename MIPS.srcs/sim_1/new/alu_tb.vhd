-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity alu_tb is
end;

architecture bench of alu_tb is

  component alu
      Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
             B : in STD_LOGIC_VECTOR (31 downto 0);
             op : in STD_LOGIC_VECTOR (3 downto 0);
             result : out STD_LOGIC_VECTOR (31 downto 0);
             Z : out STD_LOGIC;
             O : out STD_LOGIC;
             C : out STD_LOGIC);
  end component;

  signal A: STD_LOGIC_VECTOR (31 downto 0);
  signal B: STD_LOGIC_VECTOR (31 downto 0);
  signal op: STD_LOGIC_VECTOR (3 downto 0);
  signal result: STD_LOGIC_VECTOR (31 downto 0);
  signal Z: STD_LOGIC;
  signal O: STD_LOGIC;
  signal C: STD_LOGIC;

begin

  uut: alu port map ( A      => A,
                      B      => B,
                      op     => op,
                      result => result,
                      Z      => Z,
                      O      => O,
                      C      => C );

  stimulus: process
  begin
  
    -- Put initialisation code here
    A <= x"00001f32";
    B <= x"00001234";
    op <= "0000";
    wait for 10ns;
    op <= "0001";
    wait for 10ns;
    op <= "0010";
    wait for 10ns;

    -- Put test bench stimulus code here

    wait;
  end process;


end;