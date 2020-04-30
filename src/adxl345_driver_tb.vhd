--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:56:11 04/07/2020
-- Design Name:   
-- Module Name:   C:/Users/foxglove/Desktop/fpga-racing-game/src/adxl345_driver_tb.vhd
-- Project Name:  fpga_racing_game
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adxl345_driver
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
--USE ieee.numeric_std.ALL;
 
ENTITY adxl345_driver_tb IS
END adxl345_driver_tb;
 
ARCHITECTURE behavior OF adxl345_driver_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adxl345_driver
    PORT(
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         FIFO_DO : IN  std_logic_vector(7 downto 0);
         FIFO_Empty : IN  std_logic;
         FIFO_Full : IN  std_logic;
         DataRate : IN  std_logic_vector(3 downto 0);
			INT1 : in STD_LOGIC;
         Busy : IN  std_logic;
         Go : OUT  std_logic;
         FIFO_Push : OUT  std_logic;
         FIFO_Pop : OUT  std_logic;
         FIFO_DI : OUT  std_logic_vector(7 downto 0);
         ReadCnt : OUT  std_logic_vector(3 downto 0);
         Address : OUT  std_logic_vector(7 downto 0);
         Device_ID : OUT  std_logic_vector(7 downto 0);
         X : OUT  std_logic_vector(15 downto 0);
         Y : OUT  std_logic_vector(15 downto 0);
         Z : OUT  std_logic_vector(15 downto 0);
         NewData : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
   signal FIFO_DO : std_logic_vector(7 downto 0) := (others => '0');
   signal FIFO_Empty : std_logic := '0';
   signal FIFO_Full : std_logic := '0';
   signal DataRate : std_logic_vector(3 downto 0) := (others => '0');
   signal Busy : std_logic := '0';
	signal INT1 : STD_LOGIC := '1'; -- !!!

 	--Outputs
   signal Go : std_logic;
   signal FIFO_Push : std_logic;
   signal FIFO_Pop : std_logic;
   signal FIFO_DI : std_logic_vector(7 downto 0);
   signal ReadCnt : std_logic_vector(3 downto 0);
   signal Address : std_logic_vector(7 downto 0);
   signal Device_ID : std_logic_vector(7 downto 0);
   signal X : std_logic_vector(15 downto 0);
   signal Y : std_logic_vector(15 downto 0);
   signal Z : std_logic_vector(15 downto 0);
   signal NewData : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adxl345_driver PORT MAP (
          Reset => Reset,
          Clk => Clk,
          FIFO_DO => FIFO_DO,
          FIFO_Empty => FIFO_Empty,
          FIFO_Full => FIFO_Full,
			 INT1 => INT1,
          DataRate => DataRate,
          Busy => Busy,
          Go => Go,
          FIFO_Push => FIFO_Push,
          FIFO_Pop => FIFO_Pop,
          FIFO_DI => FIFO_DI,
          ReadCnt => ReadCnt,
          Address => Address,
          Device_ID => Device_ID,
          X => X,
          Y => Y,
          Z => Z,
          NewData => NewData
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      Reset <= '1';
		wait for 100 ns;
		Reset <= '0';

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
