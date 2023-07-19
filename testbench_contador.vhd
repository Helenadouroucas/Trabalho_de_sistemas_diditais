LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench_contador IS
END testbench_contador;

ARCHITECTURE testbench_arch OF testbench_contador IS

  -- Constants
  
  -- Signals
  SIGNAL clocks : STD_LOGIC := '0';        -- Clock signal
  SIGNAL Ss     : STD_LOGIC_VECTOR(3 DOWNTO 0);  -- Output signal

  -- Component declaration
  COMPONENT contador_vhdl
    PORT (
      clock : IN  STD_LOGIC;
      S     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

BEGIN

  -- Instantiate the contador_vhdl component
  UUT : contador_vhdl
    PORT MAP (
      clock => clocks,
      S     => Ss
    );

  -- Clock process
  PROCESS
  BEGIN
  -- Simulate for 1000 ns (adjust as needed)
      clocks <= '0';
      WAIT FOR 10 ns;
      clocks <= '1';
      WAIT FOR 10 ns;
      clocks <= '0';
      WAIT FOR 10 ns;
      clocks <= '1';
      WAIT FOR 10 ns;

  
  END PROCESS;

  -- Stimulus process


END testbench_arch;

