--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:22:28 03/18/2020
-- Design Name:   
-- Module Name:   C:/Users/nightshade/Desktop/ucisw2/fpga_racing_game/game_ctrl_tb.vhd
-- Project Name:  fpga_racing_game
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: game_ctrl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY game_ctrl_tb IS
END game_ctrl_tb;
 
ARCHITECTURE behavior OF game_ctrl_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT game_ctrl
    Port ( CLK_50Mhz : in  STD_LOGIC;
           PIX_X : in  STD_LOGIC_VECTOR (10 downto 0);
           PIX_Y : in  STD_LOGIC_VECTOR (9 downto 0);
           ADC_DOA : in  STD_LOGIC_VECTOR (13 downto 0);
			  AMP_Fetch : out STD_LOGIC;
			  AMP_Gain : out STD_LOGIC_VECTOR (7 downto 0);
			  ADC_START : out STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (2 downto 0));
    END COMPONENT;
    

   --Inputs
   signal CLK_50Mhz : std_logic := '0';
   signal PIX_X : std_logic_vector(9 downto 0) := (others => '0');
   signal PIX_Y : std_logic_vector(8 downto 0) := (others => '0');
   signal ADC_DOA : std_logic_vector(13 downto 0) := (others => '0');

 	--Outputs
   signal AMP_Fetch : STD_LOGIC;
	signal AMP_Gain : STD_LOGIC_VECTOR (7 downto 0);
	signal ADC_START : STD_LOGIC;
	signal RGB : STD_LOGIC_VECTOR (2 downto 0));

   -- Clock period definitions
   constant CLK_50Mhz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: game_ctrl PORT MAP (
          CLK_50Mhz => CLK_50Mhz,
          PIX_X => PIX_X,
          PIX_Y => PIX_Y,
          ADC_DOA => ADC_DOA,
          Busy => Busy,
          RGB => RGB
        );

   -- Clock process definitions
   CLK_50Mhz_process :process
   begin
		CLK_50Mhz <= '0';
		wait for CLK_50Mhz_period/2;
		CLK_50Mhz <= '1';
		wait for CLK_50Mhz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		for i in 0 to 16383 loop
			ADC_DOA <= std_logic_vector(to_unsigned(i, ADC_DOA'length));
			wait for 20ns;
		end loop;

      wait;
   end process;

END;
