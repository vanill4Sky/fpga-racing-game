----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:59:05 01/12/2020 
-- Design Name: 
-- Module Name:    vga_driver - Behavioral 
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

entity vga_driver is
    Port ( CLK_50MHz : in  STD_LOGIC;
           RGB : in  STD_LOGIC_VECTOR (2 downto 0);
           VGA_R : out  STD_LOGIC;
           VGA_G : out  STD_LOGIC;
           VGA_B : out  STD_LOGIC;
           VGA_HS : out  STD_LOGIC;
           VGA_VS : out  STD_LOGIC;
           PIX_X : out  STD_LOGIC_VECTOR (10 downto 0);
           PIX_Y : out  STD_LOGIC_VECTOR (9 downto 0));
end vga_driver;

------------------------------------
--Horizontal timing 
------------------------------------
--Scanline part	Pixels	Time [µs]
--Visible area		800		16
--Front porch		56			1.12
--Sync pulse		120		2.4
--Back porch		64			1.28
--Whole line		1040		20.8
------------------------------------
--Vertical timing
------------------------------------
--Frame part		Lines		Time [ms]
--Visible area		600		12.48
--Front porch		37			0.7696
--Sync pulse		6			0.1248
--Back porch		23			0.4784
--Whole frame		666		13.8528
------------------------------------

architecture Behavioral of vga_driver is
	constant H_FRONT_PORCH_START 	: positive := 800;
	constant H_SYNC_PULSE_START 	: positive := 800 + 56;
	constant H_BACK_PORCH_START	: positive := 800 + 56 + 120;
	constant H_LINE_WIDTH 			: positive := 1024;
	
	constant V_FRONT_PORCH_START 	: positive := 600;
	constant V_SYNC_PULSE_START 	: positive := 600 + 37;
	constant V_BACK_PORCH_START 	: positive := 600 + 37 + 6;
	constant V_LINE_WIDTH 			: positive := 666;
	
	signal h_cnt : integer range 0 to H_LINE_WIDTH - 1 := 0;
	signal v_cnt : integer range 0 to V_LINE_WIDTH - 1 := 0;

begin
	
	-- liczniki odchylenia poziomego i pinowego
	counters : process(clk_50mhz)
	begin
		if rising_edge(clk_50mhz) then
			if h_cnt = (H_LINE_WIDTH - 1) then
				if v_cnt = (V_LINE_WIDTH - 1) then
					v_cnt <= 0;
				else
					v_cnt <= v_cnt + 1;
				end if;
				h_cnt <= 0;
			else
				h_cnt <= h_cnt + 1;
			end if;
		end if;
	end process counters;

	-- otrzymywanie sygna³u synchronizacji poziomej
	-- na podstawie licznika odchylenia poziomego 
	h_sync : process(h_cnt)
	begin
		if h_cnt >= H_SYNC_PULSE_START and h_cnt < H_BACK_PORCH_START then
			VGA_HS <= '0';
		else
			VGA_HS <= '1';
		end if;
	end process h_sync;
	
	-- otrzymywanie sygna³u synchronizacji pionowej
	-- na podstawie licznika odchylenia pionowego 
	v_sync : process(v_cnt)
	begin
		if v_cnt >= V_SYNC_PULSE_START and v_cnt <= V_BACK_PORCH_START then
			VGA_VS <= '0';
		else
			VGA_VS <= '1';
		end if;
	end process v_sync;
	
	-- otrzymywanie wyjœciowych sygna³ów kolorów
	-- oraz wspó³rzêdnych bie¿¹cego piksela
	-- na podstawie licznika odchylenia poziomego i pionowego
	color_pixel : process(h_cnt, v_cnt, RGB)
	begin
		if h_cnt < H_FRONT_PORCH_START and v_cnt < V_FRONT_PORCH_START then
			VGA_R <= RGB(2);
			VGA_G <= RGB(1);
			VGA_B <= RGB(0);
			
			PIX_X <= std_logic_vector(to_unsigned(h_cnt, PIX_X'length));
			PIX_Y <= std_logic_vector(to_unsigned(v_cnt, PIX_Y'length));
		else
			VGA_R <= '0';
			VGA_G <= '0';
			VGA_B <= '0';
		
			PIX_X <= std_logic_vector(to_unsigned(H_FRONT_PORCH_START, PIX_X'length));
			PIX_Y <= std_logic_vector(to_unsigned(V_FRONT_PORCH_START, PIX_Y'length));
			
		end if;
	end process color_pixel;
	
end Behavioral;

