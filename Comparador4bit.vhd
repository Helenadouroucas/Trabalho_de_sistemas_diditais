LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Comparador4bit is
    Port ( in1 : in  STD_LOGIC_VECTOR(3 DOWNTO 0);           
 	            in2 : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           seletor : in STD_LOGIC;
           saida : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end Comparador4bit;

architecture behave of Comparador4bit is

 SIGNAL maior: STD_LOGIC_VECTOR (3 downto 0);
 SIGNAL igual: STD_LOGIC_VECTOR (3 downto 0);

component Comparador1bit is
    Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;	
           maiorin : in  STD_LOGIC;
	   igualin : in  STD_LOGIC;
           maior : out  STD_LOGIC;
	   igual : out STD_LOGIC);
  end component;

begin

Comparador1bit_0: Comparador1bit
    port map (
        in1 => not in1(0),
        in2 => not in2(0),    
        maiorin => '0',
        igualin =>  '0',
        maior => maior(0),
        igual =>  igual(0)
);

Comparador1bit_1: Comparador1bit
    port map (
        in1 => in1(1),
        in2 => in2(1),    
        maiorin => maior(0),
        igualin =>  igual(0),
        maior => maior(1),
        igual =>  igual(1)
);

Comparador1bit_2 : Comparador1bit
    port map (
        in1 => in1(2),
        in2 => in2(2),    
        maiorin => maior(1),
        igualin =>  igual(1),
        maior => maior(2),
        igual =>  igual(2)
);

Comparador1bit_3: Comparador1bit
    port map (
        in1 => in1(3),
        in2 => in2(3),    
        maiorin => maior(2),
        igualin =>  igual(2),
        maior => maior(3),
        igual =>  igual(3)
);

with seletor xor maior(3) select saida <=
	in2  when '0',
	in1  when '1',
	in2  when others;

end behave;
