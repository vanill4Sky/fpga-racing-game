--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:41:37 05/12/2020
-- Design Name:   
-- Module Name:   C:/Users/foxglove/Desktop/fpga-racing-game/vga_txt_driver_tb.vhd
-- Project Name:  fpga_racing_game
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vga_txt_driver
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
USE ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

LIBRARY std;
use std.textio.all;

ENTITY vga_txt_driver_tb IS
END vga_txt_driver_tb;
 
ARCHITECTURE behavior OF vga_txt_driver_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vga_txt_driver
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
   uut: vga_txt_driver PORT MAP (
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
	
	process(Clk, Char_WE)
	begin
		if rising_edge(Clk) then
			if Char_WE = '1' then
				case Char_DI is
					when X"30" =>
						write(output, "0");
					when X"31" =>
						write(output, "1");
					when X"32" =>
						write(output, "2");
					when X"33" =>
						write(output, "3");
					when X"34" =>
						write(output, "4");
					when X"35" =>
						write(output, "5");
					when X"36" =>
						write(output, "6");
					when X"37" =>
						write(output, "7");
					when X"38" =>
						write(output, "8");
					when X"39" =>
						write(output, "9");
					when X"41" =>
						write(output, "A");
					when X"42" =>
						write(output, "B");
					when X"43" =>
						write(output, "C");
					when X"44" =>
						write(output, "D");
					when X"45" =>
						write(output, "E");
					when X"46" =>
						write(output, "F");
					when X"3A" =>
						write(output, ":");
					when others =>
						write(output, " ");
				end case;
			end if;
		end if;
	end process;
	
	process(Clk, NewLine)
		variable L : line;
	begin
		if rising_edge(Clk) then
			if NewLine = '1' then
				writeline( output, L );
			end if;
		end if;
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Reset <= '1';
      wait for 1000 ns;
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
