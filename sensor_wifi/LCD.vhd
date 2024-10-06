----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:27:22 12/26/2018 
-- Design Name: 
-- Module Name:    LCD - Behavioral 
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
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LCD is
    Port ( 	clk 	: in  STD_LOGIC;
         	lcd_e  : out std_logic;   ----enable control
				lcd_rs : out std_logic;   ----data or command control
				data   : out std_logic_vector(7 downto 0);
				chsel :out std_logic;
				temp_data2,temp_data3: in std_logic_vector(7 downto 0); 
				ldr_data1,ldr_data2,ldr_data3:in std_logic_vector(7 downto 0));   ---data line
end LCD;

architecture Behavioral of LCD is


constant N: integer :=35; 
type arr1 is array (1 to N) of std_logic_vector(7 downto 0); 
constant datas : arr1 :=    (X"38",X"0c",X"06",X"01",X"81",X"54",X"45",X"4d",X"50",X"45",X"52",x"41",x"54",x"55",x"52",x"45",x"3a",x"3a",x"3a",
										x"c1",x"4c",x"49",x"47",x"48",x"54",x"20",x"4c",x"45",x"56",x"45",x"4c",x"3a",x"3a",x"3a",x"3a"); --command and data to display                                              


begin
process(clk)
variable i : integer := 0;
variable j : integer := 1;
begin

if clk'event and clk = '1' then
	if i <= 1000000 then
		i := i + 1;
		lcd_e <= '1';
		if j < 18 then
			data <= datas(j)(7 downto 0);
		elsif j = 18 then
			data <= temp_data2;
		elsif j = 19 then
			data <=temp_data3;
			chsel <= '0';
		elsif j > 19 and j < 33 then
			data <= datas(j)(7 downto 0);
		elsif j = 33 then
			data <= ldr_data1;
		elsif j = 34 then
			data <= ldr_data2;
		elsif j = 35 then
			data <= ldr_data3;
			chsel <= '1';
		end if;
	elsif i > 1000000 and i < 2000000 then
		i := i + 1;
		lcd_e <= '0';
	elsif i = 2000000 then
		j := j + 1;
		i := 0;
	end if;
	if j <= 5  then
		lcd_rs <= '0';    ---command signal
	elsif j > 5 and j < 20 then
		lcd_rs <= '1';   ----data signal
    elsif j = 20 then
		lcd_rs <= '0';   ----command signal
	elsif j > 20 and j <= 35 then
		lcd_rs <= '1';   ----data signal
	end if;
	if j = 36 then  ---repeated display of data
		j := 5;
	end if;
end if;

end process;
end Behavioral;





