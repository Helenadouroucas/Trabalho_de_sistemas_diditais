LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY contador_vhdl IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock      : IN  std_logic;                    -- input bit example
    S          : OUT std_logic_vector(3 DOWNTO 0)  -- output vector exampl
    );

END contador_vhdl;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF contador_vhdl IS

signal maior:std_logic;
signal D,Q:std_logic_vector(3 downto 0);
BEGIN
process(clock)

begin

if(rising_edge(clock))then
Q<=D;
end if;
end process;

with Q select D <=
"0001" when "0000",
"0010" when "0001",
"0011" when "0010",
"0100" when "0011",
"0101" when "0100",
"0110" when "0101",
"0111" when "0110",
"1000" when "0111",
"1001" when "1000",
"1010" when "1001",
"1011" when "1010",
"1100" when "1011",
"1101" when "1100",
"1110" when "1101",
"1111" when "1110",
"0000" when "1111",
"0000" when others;
S<=Q;
END TypeArchitecture;
