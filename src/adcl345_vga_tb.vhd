-- Vhdl test bench created from schematic C:\Users\foxglove\Desktop\fpga-racing-game\src\adxl345_vga.sch - Wed May 13 19:44:58 2020
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

LIBRARY std;
use std.textio.all;

ENTITY adxl345_vga_tb IS
END adxl345_vga_tb;
ARCHITECTURE behavioral OF adxl345_vga_tb IS 

   COMPONENT adxl345_vga
   PORT( Reset	:	IN	STD_LOGIC; 
          DataRate	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          INT1	:	IN	STD_LOGIC; 
          Char_DI	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          Char_WE	:	OUT	STD_LOGIC; 
          NewLine	:	OUT	STD_LOGIC; 
          Clk	:	IN	STD_LOGIC; 
          VGA_HS	:	OUT	STD_LOGIC; 
          VGA_VS	:	OUT	STD_LOGIC; 
          VGA_RGB	:	OUT	STD_LOGIC; 
          SDA	:	INOUT	STD_LOGIC; 
          SCL	:	INOUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL Reset	:	STD_LOGIC := '0';
   SIGNAL DataRate	:	STD_LOGIC_VECTOR (3 DOWNTO 0) := X"B";
   SIGNAL INT1	:	STD_LOGIC := '1';
   SIGNAL Char_DI	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL Char_WE	:	STD_LOGIC;
   SIGNAL NewLine	:	STD_LOGIC;
   SIGNAL Clk	:	STD_LOGIC;
   SIGNAL VGA_HS	:	STD_LOGIC;
   SIGNAL VGA_VS	:	STD_LOGIC;
   SIGNAL VGA_RGB	:	STD_LOGIC;
   SIGNAL SDA	:	STD_LOGIC;
   SIGNAL SCL	:	STD_LOGIC;

   constant Clk_period : time := 20 ns;
	constant min_new_data_period : time := 312.5 us;

BEGIN

   UUT: adxl345_vga PORT MAP(
		Reset => Reset, 
		DataRate => DataRate, 
		INT1 => INT1, 
		Char_DI => Char_DI, 
		Char_WE => Char_WE, 
		NewLine => NewLine, 
		Clk => Clk, 
		VGA_HS => VGA_HS, 
		VGA_VS => VGA_VS, 
		VGA_RGB => VGA_RGB, 
		SDA => SDA, 
		SCL => SCL
   );
	
	clk_process : process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process clk_process;

-------------------------
-- Output Data  
-- Rate (Hz) 	Rate Code
-------------------------
-- 3200 			1111
-- 1600 			1110
-- 800 			1101
-- 400  			1100
-- 200 			1011
-- 100 			1010
-- 50				1001
-- 25 			1000
-- 12.5 			0111
-- 6.25  		0110
-------------------------
	data_ready_int : process
		variable exp : std_logic_vector(3 downto 0) := not DataRate;
   begin
		INT1 <= '0';
		wait for min_new_data_period * (2 ** to_integer(unsigned(exp)));
		INT1 <= '1';
		wait for Clk_period;
   end process data_ready_int;
	
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
	
	SDA <= 'H';
   SCL <= 'H';
   process
      variable bAddr  : std_logic_vector( 7 downto 0 );             -- I2C adress received as the first byte
      variable bWrite : std_logic_vector( 7 downto 0 );             -- byte received in write transfers
      variable bRead  : std_logic_vector( 7 downto 0 ) := X"E5";    -- byte transmitted in read transfers
      variable Ack : std_logic;
      variable L: line;	-- simulation messages (textio)
   begin	
      SDA <= 'Z';
      loop
         -- wait for start condition
         wait until falling_edge( SDA ) and SCL /= '0';
         -- Report
         write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] START condition" );
         writeline( output, L );

         -- 8 bits of address
         for i in 0 to 8 loop
            wait until falling_edge( SCL );
            bAddr := bAddr( 6 downto 0 ) & SDA;
         end loop;
         -- Report
         write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] address byte: " ); hwrite( L, bAddr );
         writeline( output, L );
         
         -- pull down ACK for address byte
         wait for 2.5 us / 4;
         SDA <= '0';
         wait for 2.5 us;
         SDA <= 'Z';
         
         if bAddr( 0 ) = '0' then

            -- Master is writing
            loop
               -- Be prepared for Stop condition
               wait until rising_edge( SCL ); 
               wait until rising_edge( SDA ) or falling_edge( SCL );
               if rising_edge( SDA ) then
                  write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] STOP condition" );
                  writeline( output, L );
                  exit;
               end if;
               
               -- Another byte write, first bit (MSB)
               bWrite( 0 ) := SDA;
               
               -- another 7 bits of the write
               for i in 1 to 7 loop
                  wait until falling_edge( SCL );
                  bWrite := bWrite( 6 downto 0 ) & SDA;
               end loop;
               
               -- Report
               write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] byte received: " ); hwrite( L, bWrite );
               writeline( output, L );

               -- pull down for ACK the write
               wait for 2.5 us / 4;
               SDA <= '0';
               wait for 2.5 us;
               SDA <= 'Z';
             end loop;

         else

            -- Master is reading
            loop
               for i in 7 downto 0 loop
                  if bRead( i ) = '1' then
                     SDA <= 'Z';
                  else
                     SDA <= '0';
                  end if;
                  wait until falling_edge( SCL );
                  wait for 2.5 us / 4;
               end loop;
               SDA <= 'Z';
               
               -- Read ACK
               wait until rising_edge( SCL );
               wait for 2.5 us / 4;
               Ack := SDA;
               wait for 2.5 us / 2;
               
               -- Report
               write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] byte transmitted: " ); hwrite( L, bRead );
               if Ack = '0' then
                  write( L, " with positive ACK" );
               else
                  write( L, ", NACK in response" );
               end if;
               writeline( output, L );

               exit when Ack /= '0';

               -- Increment byte to be transmitted in the next read slot
               bRead := std_logic_vector( unsigned( bRead ) + 1 );
            end loop;
         end if;
      end loop;
   end process;

END;
