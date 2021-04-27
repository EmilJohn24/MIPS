--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Tue Apr 27 19:22:50 2021
--Host        : LAPTOP-H8A69KUR running 64-bit major release  (build 9200)
--Command     : generate_target mips.bd
--Design      : mips
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mips is
  port (
    clk : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of mips : entity is "mips,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=mips,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of mips : entity is "mips.hwdef";
end mips;

architecture STRUCTURE of mips is
  component mips_registerFile_0_0 is
  port (
    readReg1 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    readReg2 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    writeReg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    clk : in STD_LOGIC;
    dataWrite : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dataRead1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dataRead2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    write : in STD_LOGIC
  );
  end component mips_registerFile_0_0;
  signal clk_1 : STD_LOGIC;
  signal NLW_registerFile_0_dataRead1_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_registerFile_0_dataRead2_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  clk_1 <= clk;
registerFile_0: component mips_registerFile_0_0
     port map (
      clk => clk_1,
      dataRead1(31 downto 0) => NLW_registerFile_0_dataRead1_UNCONNECTED(31 downto 0),
      dataRead2(31 downto 0) => NLW_registerFile_0_dataRead2_UNCONNECTED(31 downto 0),
      dataWrite(31 downto 0) => B"00000000000000000000000000000000",
      readReg1(4 downto 0) => B"00000",
      readReg2(4 downto 0) => B"00000",
      write => '0',
      writeReg(4 downto 0) => B"00000"
    );
end STRUCTURE;
