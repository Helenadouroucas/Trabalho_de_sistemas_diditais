LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Divisao IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    N1         : IN  std_logic_vector(3 DOWNTO 0);
    N2         : IN  std_logic_vector(3 DOWNTO 0);
    seletor    : IN  std_logic;                    -- input bit example
    resultado  : OUT std_logic_vector(3 DOWNTO 0)  -- output vector example
    );
END Divisao;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF Divisao IS
signal quociente,resto,quocientesum,restosum,quocienteSC2,restoSC2:std_logic_vector(3 downto 0);
signal n1sum,n2sum,n1SC2,n2SC2,nn2SC2,asum1,asum2,asum3,asum4,sum1,sum2,sum3,sum4:std_logic_vector(3 downto 0);
signal ma1,ma2,ma3,ma4,mb1,mb2,mb3,mb4,ms1,ms2,ms3,ms4:std_logic_vector(2 downto 0);
signal coutq,coutr,coutn1,coutn2,cout1,cout2,cout3,cout4,cinq:std_logic;

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
	n1sum(0)<=N1(0) xor N1(3);
	n1sum(1)<=N1(1) xor N1(3);
	n1sum(2)<=N1(2) xor N1(3);
	n1sum(3)<='0';

	n2sum(0)<=N2(0) xor N2(3);
	n2sum(1)<=N2(1) xor N2(3);
	n2sum(2)<=N2(2) xor N2(3);
	n2sum(3)<='0';

	sumin1 : somador4bits port map (A=> n1sum,B=> "0000",cin=>N1(3),soma=>n1SC2,cout => coutn1);
	sumin2 : somador4bits port map (A=> n2sum,B=> "0000",cin=>N2(3),soma=>n2SC2,cout => coutn2);

	nn2SC2<= not n2SC2;

	sumdiv1 : somador4bits port map (A=> asum1,B=> nn2SC2,cin=>'1',soma=>sum1,cout => cout1);
	sumdiv2 : somador4bits port map (A=> asum2,B=> nn2SC2,cin=>'1',soma=>sum2,cout => cout2);
	sumdiv3 : somador4bits port map (A=> asum3,B=> nn2SC2,cin=>'1',soma=>sum3,cout => cout3);
	sumdiv4 : somador4bits port map (A=> asum4,B=> nn2SC2,cin=>'1',soma=>sum4,cout => cout4);

	asum1(0)<=n1SC2(3);
	asum1(1)<='0';
	asum1(2)<='0';
	asum1(3)<='0';

	asum2(0)<=n1SC2(2);
	asum2(1)<=ms1(0);
	asum2(2)<=ms1(1);
	asum2(3)<=ms1(2);

	asum3(0)<=n1SC2(1);
	asum3(1)<=ms2(0);
	asum3(2)<=ms2(1);
	asum3(3)<=ms2(2);

	asum4(0)<=n1SC2(0);
	asum4(1)<=ms3(0);
	asum4(2)<=ms3(1);
	asum4(3)<=ms3(2);

	ma1(0)<=asum1(0);
	ma1(1)<=asum1(1);
	ma1(2)<=asum1(2);

	ma2(0)<=asum2(0);
	ma2(1)<=asum2(1);
	ma2(2)<=asum2(2);

	ma3(0)<=asum3(0);
	ma3(1)<=asum3(1);
	ma3(2)<=asum3(2);

	ma4(0)<=asum4(0);
	ma4(1)<=asum4(1);
	ma4(2)<=asum4(2);

	mb1(0)<=sum1(0);
	mb1(1)<=sum1(1);
	mb1(2)<=sum1(2);

	mb2(0)<=sum2(0);
	mb2(1)<=sum2(1);
	mb2(2)<=sum2(2);

	mb3(0)<=sum3(0);
	mb3(1)<=sum3(1);
	mb3(2)<=sum3(2);
	
	mb4(0)<=sum4(0);
	mb4(1)<=sum4(1);
	mb4(2)<=sum4(2);

	with sum1(3) select ms1 <=
	mb1 when '0',
	ma1 when '1',
	ma1 when others;

	with sum2(3) select ms2 <=
	mb2 when '0',
	ma2 when '1',
	ma2 when others;

	with sum3(3) select ms3 <=
	mb3 when '0',
	ma3 when '1',
	ma3 when others;

	with sum4(3) select ms4 <=
	mb4 when '0',
	ma4 when '1',
	ma4 when others;
	

	restoSC2(0)<=ms4(0);
	restoSC2(1)<=ms4(1);
	restoSC2(2)<=ms4(2);
	restoSC2(3)<='0';

	restosum(0)<=N1(3)xor restoSC2(0);
	restosum(1)<=N1(3)xor restoSC2(1);
	restosum(2)<=N1(3)xor restoSC2(2);
	restosum(3)<=N1(3)xor restoSC2(3);

	sumres : somador4bits port map (A=> restosum,B=> "0000",cin=>N1(3),soma=>resto,cout => coutr);

	quocienteSC2(3)<=not sum1(3);
	quocienteSC2(2)<=not sum2(3);
	quocienteSC2(1)<=not sum3(3);
	quocienteSC2(0)<=not sum4(3);

	cinq<= N1(3)xor N2(3);

	quocientesum(0)<=cinq xor quocienteSC2(0);
	quocientesum(1)<=cinq xor quocienteSC2(1);
	quocientesum(2)<=cinq xor quocienteSC2(2);
	quocientesum(3)<=cinq xor quocienteSC2(3);

	sumquo : somador4bits port map (A=> quocientesum,B=> "0000",cin=>cinq,soma=>quociente,cout => coutq);
	
	with seletor select resultado <=
	quociente when '0',
	resto when '1',
	resto when others;

END TypeArchitecture;
