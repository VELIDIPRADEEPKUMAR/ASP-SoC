-------------------------------------------------------------------------------
-- Title      : Audio Flanger
-- Project    : ASP-SoC
-------------------------------------------------------------------------------
-- File       : tbFlanger-Bhv-ea.vhd
-- Author     : Haberleitner David
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2017 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2017-03-07  1.0      Haberleitner    Created
-- 2017-03-08  1.1      Steinbacher     Edited
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

use work.Global.all;

entity tbFlanger is
end tbFlanger;

architecture Bhv of tbFlanger is

  type aSineWave is array(480-1 downto 0) of real;

  constant cSigLen      : natural := 24;
  constant cRegisterLen : natural := 32;

  signal Clk       : std_ulogic := '1';
  signal nResetAsync : std_ulogic;
  signal Strobe    : std_ulogic;

  signal SelFlangeLen : unsigned(LogDualis(cRegisterLen)-1 downto 0) := to_unsigned(0, LogDualis(cRegisterLen));

  signal data_in  : sfixed(0-1 downto -24) := to_sfixed(0.0, -1, -24);
  signal data_out : sfixed(0-1 downto -24);

begin  -- Bhv


  SineGen : process (Strobe)
    variable vMySine : aSineWave := (0.000000, 0.000257, 0.001027, 0.002307, 0.004094, 0.006380, 0.009158, 0.012419, 0.016151, 0.020341, 0.024975, 0.030037, 0.035510, 0.041374, 0.047609, 0.054193, 0.061104, 0.068316, 0.075805, 0.083545, 0.091506, 0.099662, 0.107983, 0.116440, 0.125000, 0.133634, 0.142309, 0.150993, 0.159654, 0.168260, 0.176777, 0.185173, 0.193415, 0.201471, 0.209308, 0.216895, 0.224201, 0.231194, 0.237844, 0.244122, 0.250000, 0.255449, 0.260444, 0.264958, 0.268967, 0.272448, 0.275378, 0.277738, 0.279508, 0.280671, 0.281211, 0.281113, 0.280364, 0.278954, 0.276873, 0.274113, 0.270669, 0.266537, 0.261714, 0.256202, 0.250000, 0.243113, 0.235546, 0.227307, 0.218405, 0.208850, 0.198656, 0.187836, 0.176408, 0.164390, 0.151802, 0.138664, 0.125000, 0.110835, 0.096194, 0.081106, 0.065598, 0.049702, 0.033449, 0.016870, 0.000000, -0.017127, -0.034476, -0.052010, -0.069692, -0.087486, -0.105352, -0.123253, -0.141151, -0.159005, -0.176777, -0.194428, -0.211918, -0.229210, -0.246264, -0.263043, -0.279508, -0.295624, -0.311352, -0.326658, -0.341506, -0.355864, -0.369698, -0.382976, -0.395669, -0.407747, -0.419181, -0.429947, -0.440018, -0.449373, -0.457988, -0.465844, -0.472923, -0.479209, -0.484686, -0.489343, -0.493167, -0.496151, -0.498288, -0.499572, -0.500000, -0.499572, -0.498288, -0.496151, -0.493167, -0.489343, -0.484686, -0.479209, -0.472923, -0.465844, -0.457988, -0.449373, -0.440018, -0.429947, -0.419181, -0.407747, -0.395669, -0.382976, -0.369698, -0.355864, -0.341506, -0.326658, -0.311352, -0.295624, -0.279508, -0.263043, -0.246264, -0.229210, -0.211918, -0.194428, -0.176777, -0.159005, -0.141151, -0.123253, -0.105352, -0.087486, -0.069692, -0.052010, -0.034476, -0.017127, -0.000000, 0.016870, 0.033449, 0.049702, 0.065598, 0.081106, 0.096194, 0.110835, 0.125000, 0.138664, 0.151802, 0.164390, 0.176408, 0.187836, 0.198656, 0.208850, 0.218405, 0.227307, 0.235546, 0.243113, 0.250000, 0.256202, 0.261714, 0.266537, 0.270669, 0.274113, 0.276873, 0.278954, 0.280364, 0.281113, 0.281211, 0.280671, 0.279508, 0.277738, 0.275378, 0.272448, 0.268967, 0.264958, 0.260444, 0.255449, 0.250000, 0.244122, 0.237844, 0.231194, 0.224201, 0.216895, 0.209308, 0.201471, 0.193415, 0.185173, 0.176777, 0.168260, 0.159654, 0.150993, 0.142309, 0.133634, 0.125000, 0.116440, 0.107983, 0.099662, 0.091506, 0.083545, 0.075805, 0.068316, 0.061104, 0.054193, 0.047609, 0.041374, 0.035510, 0.030037, 0.024975, 0.020341, 0.016151, 0.012419, 0.009158, 0.006380, 0.004094, 0.002307, 0.001027, 0.000257, 0.000000, 0.000257, 0.001027, 0.002307, 0.004094, 0.006380, 0.009158, 0.012419, 0.016151, 0.020341, 0.024975, 0.030037, 0.035510, 0.041374, 0.047609, 0.054193, 0.061104, 0.068316, 0.075805, 0.083545, 0.091506, 0.099662, 0.107983, 0.116440, 0.125000, 0.133634, 0.142309, 0.150993, 0.159654, 0.168260, 0.176777, 0.185173, 0.193415, 0.201471, 0.209308, 0.216895, 0.224201, 0.231194, 0.237844, 0.244122, 0.250000, 0.255449, 0.260444, 0.264958, 0.268967, 0.272448, 0.275378, 0.277738, 0.279508, 0.280671, 0.281211, 0.281113, 0.280364, 0.278954, 0.276873, 0.274113, 0.270669, 0.266537, 0.261714, 0.256202, 0.250000, 0.243113, 0.235546, 0.227307, 0.218405, 0.208850, 0.198656, 0.187836, 0.176408, 0.164390, 0.151802, 0.138664, 0.125000, 0.110835, 0.096194, 0.081106, 0.065598, 0.049702, 0.033449, 0.016870, 0.000000, -0.017127, -0.034476, -0.052010, -0.069692, -0.087486, -0.105352, -0.123253, -0.141151, -0.159005, -0.176777, -0.194428, -0.211918, -0.229210, -0.246264, -0.263043, -0.279508, -0.295624, -0.311352, -0.326658, -0.341506, -0.355864, -0.369698, -0.382976, -0.395669, -0.407747, -0.419181, -0.429947, -0.440018, -0.449373, -0.457988, -0.465844, -0.472923, -0.479209, -0.484686, -0.489343, -0.493167, -0.496151, -0.498288, -0.499572, -0.500000, -0.499572, -0.498288, -0.496151, -0.493167, -0.489343, -0.484686, -0.479209, -0.472923, -0.465844, -0.457988, -0.449373, -0.440018, -0.429947, -0.419181, -0.407747, -0.395669, -0.382976, -0.369698, -0.355864, -0.341506, -0.326658, -0.311352, -0.295624, -0.279508, -0.263043, -0.246264, -0.229210, -0.211918, -0.194428, -0.176777, -0.159005, -0.141151, -0.123253, -0.105352, -0.087486, -0.069692, -0.052010, -0.034476, -0.017127, -0.000000, 0.016870, 0.033449, 0.049702, 0.065598, 0.081106, 0.096194, 0.110835, 0.125000, 0.138664, 0.151802, 0.164390, 0.176408, 0.187836, 0.198656, 0.208850, 0.218405, 0.227307, 0.235546, 0.243113, 0.250000, 0.256202, 0.261714, 0.266537, 0.270669, 0.274113, 0.276873, 0.278954, 0.280364, 0.281113, 0.281211, 0.280671, 0.279508, 0.277738, 0.275378, 0.272448, 0.268967, 0.264958, 0.260444, 0.255449, 0.250000, 0.244122, 0.237844, 0.231194, 0.224201, 0.216895, 0.209308, 0.201471, 0.193415, 0.185173, 0.176777, 0.168260, 0.159654, 0.150993, 0.142309, 0.133634, 0.125000, 0.116440, 0.107983, 0.099662, 0.091506, 0.083545, 0.075805, 0.068316, 0.061104, 0.054193, 0.047609, 0.041374, 0.035510, 0.030037, 0.024975, 0.020341, 0.016151, 0.012419, 0.009158, 0.006380, 0.004094, 0.002307, 0.001027, 0.000257);
    variable i       : integer   := 0;
  begin
    if falling_edge(Strobe) then

      data_in <= to_sfixed(vMySine(i), data_in'high, data_in'low);

      i := i+1;
      if i = 480 then
        i := 0;
      end if;
    end if;
  end process;


  Clk <= not Clk after 10 ns;           -- T/2 = 10ns; T = 20ns; f = 50 MHz

  -- Strobe
  Strobe_Gen : entity work.StrobeGen
    generic map(
      gStrobeCycleTime => 20800 ns)
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,

      oStrobe => Strobe);

  -- Flanger
  UUT : entity work.Flanger
    generic map (
      gSigLen      => cSigLen,
      gRegisterLen => cRegisterLen)
    port map (
      inResetAsync  => nResetAsync,
      iClk          => Clk,
      iEnable       => Strobe,
      iData         => data_in,
      iSelFlangeLen => SelFlangeLen,
      oData         => data_out);

  -- Test signals
  Stimuli : process
  begin  -- process Stimuli
    nResetAsync <= '0' after 0 us,
                   '1' after 10 ns;

    SelFlangeLen <= to_unsigned(10,SelFlangeLen'length) after 0 ns;

    wait;
  end process Stimuli;
end Bhv;