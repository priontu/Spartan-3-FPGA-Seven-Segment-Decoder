----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:24 03/26/2021 
-- Design Name: 
-- Module Name:    topdesign - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topdesign is
    Port ( switch0 : in  STD_LOGIC;
           switch1 : in  STD_LOGIC;
           switch2 : in  STD_LOGIC;
           switch3 : in  STD_LOGIC;
           switch4 : in  STD_LOGIC;
           switch5 : in  STD_LOGIC;
           switch6 : in  STD_LOGIC;
           switch7 : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           topselDispA : out  STD_LOGIC;
           topselDispB : out  STD_LOGIC;
           topselDispC : out  STD_LOGIC;
           topselDispD : out  STD_LOGIC;
           topsegA : out  STD_LOGIC;
           topsegB : out  STD_LOGIC;
           topsegC : out  STD_LOGIC;
           topsegD : out  STD_LOGIC;
           topsegE : out  STD_LOGIC;
           topsegF : out  STD_LOGIC;
           topsegG : out  STD_LOGIC);
end topdesign;

architecture Behavioral of topdesign is

component segmentdriver
	Port(
		   display_A : in  STD_LOGIC_VECTOR (3 downto 0);
           display_B : in  STD_LOGIC_VECTOR (3 downto 0);
           display_C : in  STD_LOGIC_VECTOR (3 downto 0);
           display_D : in  STD_LOGIC_VECTOR (3 downto 0);
           segA : out  STD_LOGIC;
           segB : out  STD_LOGIC;
           segC : out  STD_LOGIC;
           segD : out  STD_LOGIC;
           segE : out  STD_LOGIC;
           segF : out  STD_LOGIC;
           segG : out  STD_LOGIC;
           select_Display_A : out  STD_LOGIC;
           select_Display_B : out  STD_LOGIC;
           select_Display_C : out  STD_LOGIC;
           select_Display_D : out  STD_LOGIC;
           clk : in  STD_LOGIC;
			  rst : in STD_LOGIC
	);
end component;

SIGNAL Ai : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL Bi : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL Ci : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL Di : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL digit1 : UNSIGNED (4 DOWNTO 0);
SIGNAL digit2 : UNSIGNED (4 DOWNTO 0);
SIGNAL res: STD_LOGIC_VECTOR (7 DOWNTO 0);

begin
uut2: segmentDriver PORT MAP(
	display_A => Ai,
	display_B => Bi,
	display_C => Ci,
	display_D => Di,
	segA => topsegA,
	segB => topsegB,
	segC => topsegC,
	segD => topsegD,
	segE => topsegE,
	segF => topsegF,
	segG => topsegG,
	select_Display_A => topselDispA,
	select_Display_B => topselDispB,
	select_Display_C => topselDispC,
	select_Display_D => topselDispD,
	clk => clk,
	rst => rst
);

Ai(0) <= switch0;
Ai(1) <= switch1;
Ai(2) <= switch2;
Ai(3) <= switch3;
Bi(0) <= switch4;
Bi(1) <= switch5;
Bi(2) <= switch6;
Bi(3) <= switch7;

digit1 <= UNSIGNED("0"&Ai);
digit2 <= UNSIGNED("0"&Bi);
res <= "000"&(digit1 + digit2);


Di <= res(3 DOWNTO 0);
Ci <= res(7 downto 4);

end Behavioral;

