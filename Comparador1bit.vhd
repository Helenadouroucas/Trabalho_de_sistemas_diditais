LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Comparador1bit is
    Port ( in1 : in  std_logic;
           in2 : in  std_logic;	
           maiorin : in  std_logic;
	   igualin : in  std_logic;
           maior : out  std_logic;
	   igual : out std_logic);
end Comparador1bit;

architecture behave of Comparador1bit is
signal m:std_logic;
begin
m<=in1 AND (NOT in2);
with igualin select maior <=
    maiorin  when '0',
    m  when '1',
	maiorin when others;
igual <= (NOT (in1 XOR in2)) AND igualin;


end behave;
