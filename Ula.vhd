
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Ula IS
  PORT (
    in1        : IN  std_logic_vector(3 DOWNTO 0); -- input vector example
    in2        : IN  std_logic_vector(3 DOWNTO 0);
    sel        : IN  std_logic_vector(2 DOWNTO 0);  
  ------------------------------------------------------------------------------
  --Insert output ports below
    overflow        : OUT std_logic;  
    zero        : OUT std_logic;  
    negativo        : OUT std_logic;  
    carry        : OUT std_logic;  
    resultado        : OUT std_logic_vector(3 DOWNTO 0)  -- output vector example
    );
END Ula;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF Ula IS
signal asum,bsum,sum,div,comp,result,muxdc:std_logic_vector(3 downto 0);
signal cin,over:std_logic;


component Divisao is
  PORT (
    N1         : IN  std_logic_vector(3 DOWNTO 0);
    N2         : IN  std_logic_vector(3 DOWNTO 0);
    seletor    : IN  std_logic;                    -- input bit example
    resultado  : OUT std_logic_vector(3 DOWNTO 0)  -- output vector example
    );
  end component;

  component Comparador4bit is
    Port ( in1 : in  STD_LOGIC_VECTOR(3 DOWNTO 0);           
 	      in2 : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           seletor : in STD_LOGIC;
           saida : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;


component somador4bits is
    PORT (
      A        : IN  std_logic_vector(3 DOWNTO 0);
      B        : IN  std_logic_vector(3 DOWNTO 0);
      cin      : IN  std_logic;   
      soma     : OUT std_logic_vector(3 DOWNTO 0); 
      cout     : OUT std_logic                    
    );
  end component;
BEGIN
asum(0)<=sel(1)and in1(0);
asum(1)<=sel(1)and in1(1);
asum(2)<=sel(1)and in1(2);
asum(3)<=sel(1)and in1(3);

bsum(0)<=sel(0)and in2(0);
bsum(1)<=sel(0)and in2(1);
bsum(2)<=sel(0)and in2(2);
bsum(3)<=sel(0)and in2(3);

cin<=sel(0) or (not sel(1));

divi : Divisao port map (N1=> in1,N2=> in2,seletor=>sel(0),resultado=>div);
compa : Comparador4bit port map (in1=> in1,in2=> in2,seletor=>sel(0),saida=>comp);


	with sel(1) select muxdc <=
	div when '0',
	comp when '1',
	comp when others;

soma: somador4bits port map (A=>asum,B=>bsum,cin=>cin,soma=>sum,cout=>carry);

	with sel(2) select result <=
	sum when '0',
	muxdc when '1',
	sum when others;

	over<=(not(asum(3)xor bsum(3)))and(sum(3)xor asum(3))and(not sel(2));

	resultado<=result;
	overflow<=over;
	zero<=not(result(0)or result(1)or result(2)or result(3)or over);
	negativo<=result(3) and (not over);

END TypeArchitecture;