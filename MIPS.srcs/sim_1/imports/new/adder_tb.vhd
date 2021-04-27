-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity adder_tb is
end;

architecture bench of adder_tb is

  component adder
      Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
             b : in STD_LOGIC_VECTOR (31 downto 0);
             sumOut : out STD_LOGIC_VECTOR (31 downto 0));
  end component;

  signal a: STD_LOGIC_VECTOR (31 downto 0);
  signal b: STD_LOGIC_VECTOR (31 downto 0);
  signal sumOut: STD_LOGIC_VECTOR (31 downto 0);

begin

  uut: adder port map ( a      => a,
                        b      => b,
                        sumOut => sumOut );

  stimulus: process
  begin
  
    A <= x"00001f32";
    B <= x"00001234";
    wait for 10ns;
    A <= x"00001f31";
    B <= x"00001221";
    wait for 10ns;
    wait;
  end process;


end;