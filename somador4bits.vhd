
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY somador4bits IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
                      -- input bit example
    A        : IN  std_logic_vector(3 DOWNTO 0); -- input vector example
    B        : IN  std_logic_vector(3 DOWNTO 0);
    cin      : IN  std_logic;   
  ------------------------------------------------------------------------------
  --Insert output ports below
  soma        : OUT std_logic_vector(3 DOWNTO 0);  -- output vector example
    cout        : OUT std_logic                    -- output bit example
    
    );
END somador4bits;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF somador4bits IS
signal c1,c2,c3:std_logic;

BEGIN
soma(0)<=a(0)xor b(0) xor cin;
c1<=(a(0)and b(0)) or (cin and (a(0)xor b(0)));
soma(1)<=a(1)xor b(1) xor c1;
c2<=(a(1)and b(1)) or (c1 and (a(1)xor b(1)));
soma(2)<=a(2)xor b(2) xor c2;
c3<=(a(2)and b(2)) or (c2 and (a(2)xor b(2)));
soma(3)<=a(3)xor b(3) xor c3;
cout<=(a(3)and b(3)) or (c3 and (a(3)xor b(3)));
END TypeArchitecture;
