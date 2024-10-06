----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:24:20 03/10/2024 
-- Design Name: 
-- Module Name:    gas_sensor - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gas_sensor is
Port ( sw : in  STD_LOGIC;
           led : out  STD_LOGIC);
end gas_sensor;

architecture Behavioral of gas_sensor is

begin
process (sw) 
begin 
if sw='0' then 
led <= '1'; 
else led <= '0'; 
end if; 
end process; 
end Behavioral;