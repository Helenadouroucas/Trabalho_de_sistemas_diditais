
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Divisao_tb IS

END Divisao_tb;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF Divisao_tb IS
  signal n1t   : std_logic_vector(3 downto 0);
  signal n2t   : std_logic_vector(3 downto 0);
  signal s     : std_logic;
  signal saida : std_logic_vector(3 downto 0);

  component Divisao IS
  PORT (
    N1         : IN  std_logic_vector(3 DOWNTO 0);
    N2         : IN  std_logic_vector(3 DOWNTO 0);
    seletor    : IN  std_logic;                    -- input bit example
    resultado  : OUT std_logic_vector(3 DOWNTO 0)  -- output vector example
    );
END component Divisao;

  
BEGIN
 divisao_teste : Divisao
    port map (
      N1    => n1t,
      N2    => n2t,
      seletor=> s,
      resultado => saida
      );

  process is
  begin
    n1t <= "0100";
    n2t <= "0010";
    s   <= '0';
    wait for 10 ns;
    n1t <= "0100";
    n2t <= "0010";
    s   <= '1';
    wait for 10 ns;
    n1t <= "1000";
    n2t <= "1000";
    s   <= '0';
    wait for 10 ns;
    n1t <= "1000";
    n2t <= "1000";
    s   <= '1';
    wait for 10 ns;
    n1t <= "1001";
    n2t <= "0010";
    s   <= '0';
    wait for 10 ns;
    n1t <= "0111";
    n2t <= "1110";
    s   <= '0';
    wait for 10 ns;
    n1t <= "1001";
    n2t <= "0010";
    s   <= '1';
    wait for 10 ns;
    n1t <= "0111";
    n2t <= "1110";
    s   <= '1';
    wait for 10 ns;
    n1t <= "0000";
    n2t <= "0010";
    s   <= '1';
    wait for 10 ns;
    n1t <= "0000";
    n2t <= "0010";
    s   <= '0';
    wait for 10 ns;     
  end process;

END TypeArchitecture;
