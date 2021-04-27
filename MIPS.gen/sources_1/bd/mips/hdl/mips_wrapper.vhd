--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Tue Apr 27 19:22:51 2021
--Host        : LAPTOP-H8A69KUR running 64-bit major release  (build 9200)
--Command     : generate_target mips_wrapper.bd
--Design      : mips_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mips_wrapper is
  port (
    clk : in STD_LOGIC
  );
end mips_wrapper;

architecture STRUCTURE of mips_wrapper is
  component mips is
  port (
    clk : in STD_LOGIC
  );
  end component mips;
begin
mips_i: component mips
     port map (
      clk => clk
    );
end STRUCTURE;
