--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:41:37 05/12/2020
-- Design Name:   
-- Module Name:   C:/Users/foxglove/Desktop/fpga-racing-game/vga_control_tb.vhd
-- Project Name:  fpga_racing_game
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vga_control
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
 
ENTITY vga_control_tb IS
END vga_control_tb;
 
ARCHITECTURE behavior OF vga_control_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vga_control
    PORT(
         Reset : IN  std_logic;
         Busy : IN  std_logic;
         NewData : IN  std_logic;
         X : IN  std_logic_vector(15 downto 0);
         Y : IN  std_logic_vector(15 downto 0);
         Z : IN  std_logic_vector(15 downto 0);
         Clk : IN  std_logic;
         Char_DI : OUT  std_logic_vector(7 downto 0);
         Char_WE : OUT  std_logic;
         Home : OUT  std_logic;
         NewLine : OUT  std_logic;
         Goto00 : OUT  std_logic;
         CursorOn : OUT  std_logic;
         ScrollEn : OUT  std_logic;
         ScrollClear : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Busy : std_logic := '0';
   signal NewData : std_logic := '0';
   signal X : std_logic_vector(15 downto 0) := X"1111";
   signal Y : std_logic_vector(15 downto 0) := X"2222";
   signal Z : std_logic_vector(15 downto 0) := X"3333";
   signal Clk : std_logic := '0';

 	--Outputs
   signal Char_DI : std_logic_vector(7 downto 0);
   signal Char_WE : std_logic;
   signal Home : std_logic;
   signal NewLine : std_logic;
   signal Goto00 : std_logic;
   signal CursorOn : std_logic;
   signal ScrollEn : std_logic;
   signal ScrollClear : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vga_control PORT MAP (
          Reset => Reset,
          Busy => Busy,
          NewData => NewData,
          X => X,
          Y => Y,
          Z => Z,
          Clk => Clk,
          Char_DI => Char_DI,
          Char_WE => Char_WE,
          Home => Home,
          NewLine => NewLine,
          Goto00 => Goto00,
          CursorOn => CursorOn,
          ScrollEn => ScrollEn,
          ScrollClear => ScrollClear
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
      wait for Clk_period/2;
		
		NewData <= '1';
		wait for Clk_period;
		NewData <= '0';
		wait for Clk_period * 200;
		NewData <= '1';
		wait for Clk_period;
		NewData <= '0';
		wait for Clk_period * 200;
		NewData <= '1';
		wait for Clk_period;
		NewData <= '0';
		wait for Clk_period * 200;
		NewData <= '1';
		wait for Clk_period;
		NewData <= '0';
		wait for Clk_period * 200;

      -- insert stimulus here 

      wait;
   end process;

END;
