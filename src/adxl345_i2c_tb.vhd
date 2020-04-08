-- Vhdl test bench created from schematic C:\Users\foxglove\Desktop\fpga-racing-game\src\adxl345_i2c.sch - Tue Apr 07 17:06:23 2020
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

ENTITY adxl345_i2c_sch_tb IS
END adxl345_i2c_sch_tb;
ARCHITECTURE behavioral OF adxl345_i2c_sch_tb IS 

   COMPONENT adxl345_i2c
   PORT( DataRate	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          SDA	:	INOUT	STD_LOGIC; 
          SCL	:	INOUT	STD_LOGIC; 
          NACK	:	OUT	STD_LOGIC; 
          Reset	:	IN	STD_LOGIC; 
          Clk	:	IN	STD_LOGIC; 
          NewData	:	OUT	STD_LOGIC; 
          Device_ID	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          X	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          Y	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          Z	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   SIGNAL DataRate	:	STD_LOGIC_VECTOR (3 DOWNTO 0) := X"0";
   SIGNAL SDA	:	STD_LOGIC;
   SIGNAL SCL	:	STD_LOGIC;
   SIGNAL NACK	:	STD_LOGIC;
   SIGNAL Reset	:	STD_LOGIC := '0';
   SIGNAL Clk	:	STD_LOGIC;
   SIGNAL NewData	:	STD_LOGIC;
   SIGNAL Device_ID	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL X	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Y	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Z	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
	
			   -- Clock period definitions
   constant Clk_period : time := 20 ns;

BEGIN

   UUT: adxl345_i2c PORT MAP(
		DataRate => DataRate, 
		SDA => SDA, 
		SCL => SCL, 
		NACK => NACK, 
		Reset => Reset, 
		Clk => Clk, 
		NewData => NewData, 
		Device_ID => Device_ID, 
		X => X, 
		Y => Y, 
		Z => Z
   );
	
	clk_process : process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process clk_process;

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
