----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:42:44 03/18/2020 
-- Design Name: 
-- Module Name:    game_ctrl - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity game_ctrl is
    Port ( CLK_50Mhz : in  STD_LOGIC;
           PIX_X : in  STD_LOGIC_VECTOR (10 downto 0);
           PIX_Y : in  STD_LOGIC_VECTOR (9 downto 0);
           ADC_DOA : in  STD_LOGIC_VECTOR (13 downto 0);
			  AMP_Fetch : out STD_LOGIC;
			  AMP_Gain : out STD_LOGIC_VECTOR (7 downto 0);
			  ADC_START : out STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (2 downto 0));
end game_ctrl;

architecture Behavioral of game_ctrl is

	constant SCREEN_WIDTH : positive := 800;
	constant SCREEN_HEIGHT : positive := 600;
	constant BORDER_LEFT : positive := 144;
	constant BORDER_RIGHT: positive := 655;
	
	constant SQUARE_SIZE : positive := 20;
	constant STEP : positive := 1;
	
	signal car_left : integer range 0 to SCREEN_WIDTH - 1 := 10;
	signal car_top : integer range 0 to SCREEN_HEIGHT - 1 := SCREEN_HEIGHT - 100;
	signal car_color : std_logic_vector (2 downto 0);

	signal prescaler : integer range 0 to 40 := 0;

begin
	
	AMP_Gain <= "00010000";
	AMP_Fetch <= '1';
	
	update : process(CLK_50Mhz)
	begin
		if rising_edge(CLK_50Mhz) then
			if prescaler = 40 then
				prescaler <= 0;
				ADC_START <= '1';
				car_left <= to_integer(unsigned(ADC_DOA(13 downto 5))) + 144;
			else
				prescaler <= prescaler + 1;
				ADC_START <= '0';
				car_left <= 0;
			end if;
		end if;				
	end process update;
	
	draw : process(PIX_X, PIX_Y, car_left, car_top)
	begin
		if to_integer(unsigned(PIX_X)) >= car_left 
			and to_integer(unsigned(PIX_X)) <= (car_left + SQUARE_SIZE)
			and to_integer(unsigned(PIX_Y)) >= car_top
			and to_integer(unsigned(PIX_Y)) <= (car_top + SQUARE_SIZE) then
			car_color <= "001";
		else
			car_color <= "000";
		end if;
	end process draw;
	
	RGB <= car_color;

end Behavioral;

