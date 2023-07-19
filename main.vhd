library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( clock1 : in  STD_LOGIC;           
 	   clock2: in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
	   num1: out std_logic_vector(3 downto 0);
	   num2: out std_logic_vector(3 downto 0);
	   overflow : out  STD_LOGIC;
           zero : out  STD_LOGIC;
           negativo : out  STD_LOGIC;
	   carry : out STD_LOGIC;
	   resultado : out  STD_LOGIC_vector(3 downto 0)
);
end main;

architecture behave of main is

 SIGNAL in1: STD_LOGIC_VECTOR (3 downto 0);
 SIGNAL in2: STD_LOGIC_VECTOR (3 downto 0);

component Ula is
    Port ( in1 : in  STD_LOGIC_VECTOR (3 downto 0);
           in2 : in  STD_LOGIC_VECTOR (3 downto 0);	
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           overflow : out  STD_LOGIC;
           zero : out  STD_LOGIC;
           negativo : out  STD_LOGIC;
	   carry : out STD_LOGIC;
	   resultado : out  STD_LOGIC_vector(3 downto 0));
  end component Ula;

component contador_vhdl is
    Port ( clock : in STD_LOGIC;
	   S : out STD_LOGIC_VECTOR(3 downto 0));
  end component contador_vhdl;

begin

contador_1: contador_vhdl
    port map (
           clock => clock1,
           S => in1
);

contador_2: contador_vhdl
    port map (
           clock => clock2,
           S=> in2
);



Ula_IST: Ula
    port map (
           in1 => in1,
           in2 => in2,	
           sel => sel,
           overflow => overflow,
           zero => zero,
           negativo => negativo,
	   carry => carry,
	   resultado => resultado
);
num1<=in1;
num2<=in2;

end behave;
