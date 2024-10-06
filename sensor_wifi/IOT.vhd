----------------------------------------------------------------------------------
---Transmitting Temperature and LDR output data through WiFi involves communication with cloud server using IP Address
-- We used an open source data logger website thingspeak.com to reduce the implementation cost. 
--Once we created our channel for entering the data into web site, the channel will be allocated with one API key
---We have created one thingspeak channel and used field 1 for Temperature data and field 2 LDR ouput data
--thingspeak server will automatically plots the data retrieving from the field which we have entered an integer data of temperature and LDR output. 
---Parallaly we can check the output from LCD display.
-------------------------------------------------------------------------------------------------------------------------
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

entity IOT is
 Port ( 	clk 	: in  STD_LOGIC;     -----clock signal
			txd 	: out  STD_LOGIC; -----transmitter data
			cs    : out std_logic;  ----chip selection
			sc  	: out std_logic;  ----serial clock
			do    : out std_logic;  ----ADC data out
			din   : in std_logic;   ----ADC data in
			gsw	: in STD_LOGIC;
			gas : out std_logic;
			ir	: in STD_LOGIC;
			mot : out std_logic;
			lcd_e  : out std_logic;   ----enable control
			lcd_rs : out std_logic;   ----data or command control
			data   : out std_logic_vector(7 downto 0)   ---data line
			);
end IOT;

architecture Behavioral of IOT is
----signal for channel selection
signal chsel : std_logic := '0';
---signals for ASCII conversion of temperature and LDR data
signal temp_data1,temp_data2,temp_data3:std_logic_vector(7 downto 0);  
signal ldr_data1,ldr_data2,ldr_data3:std_logic_vector(7 downto 0);
------ADC connection
component ADC 
  Port ( 	clk 	: in  STD_LOGIC;
				cs    : out std_logic;
				sc  	: out std_logic;
				do    : out std_logic;
				din   : in std_logic;
				chsel   : in std_logic;
				temp_data1,temp_data2,temp_data3: out std_logic_vector(7 downto 0); 
				ldr_data1,ldr_data2,ldr_data3:out std_logic_vector(7 downto 0));
end component;

----LCD connections
component LCD 
    Port ( 	clk 	: in  STD_LOGIC;
         	lcd_e  : out std_logic;   ----enable control
				lcd_rs : out std_logic;   ----data or command control
				data   : out std_logic_vector(7 downto 0);
				chsel :out std_logic;
				temp_data2,temp_data3: in std_logic_vector(7 downto 0); 
				ldr_data1,ldr_data2,ldr_data3:in std_logic_vector(7 downto 0));   ---data line
end component;
------UART connections
component WIFI 
Port ( 	clk 	: in  STD_LOGIC;
				txd 	: out  STD_LOGIC; --transmitter data
--				gas_st : in std_logic_vector(7 downto 0);
					temp_data1,temp_data2,temp_data3: in std_logic_vector(7 downto 0); 
				ldr_data1,ldr_data2,ldr_data3:in std_logic_vector(7 downto 0));
end component;
component gas_sensor is
Port ( sw : in  STD_LOGIC;
           led : out  STD_LOGIC);
end component;
component irmotor is
Port ( ir : in  STD_LOGIC;
           mot : out  STD_LOGIC);
end component;
begin
A1:ADC port map(clk,cs,sc,do,din,chsel,temp_data1,temp_data2,temp_data3,ldr_data1,ldr_data2,ldr_data3);
G1:gas_sensor port map (gsw,gas);
I1:irmotor port map (ir,mot);
L1:LCD port map(clk,lcd_e,lcd_rs,data,chsel,temp_data2,temp_data3,ldr_data1,ldr_data2,ldr_data3);
U1:WIFI port map(clk,txd,temp_data1,temp_data2,temp_data3,ldr_data1,ldr_data2,ldr_data3);

end Behavioral;

