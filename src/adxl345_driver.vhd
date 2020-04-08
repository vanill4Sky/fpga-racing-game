----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:48:26 04/07/2020 
-- Design Name: 
-- Module Name:    adxl345_driver - Behavioral 
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

entity adxl345_driver is
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           FIFO_DO : in  STD_LOGIC_VECTOR (7 downto 0);
           FIFO_Empty : in  STD_LOGIC;
           FIFO_Full : in  STD_LOGIC;
			  DataRate : in  STD_LOGIC_VECTOR (3 downto 0);
           Busy : in  STD_LOGIC;
           Go : out  STD_LOGIC;
           FIFO_Push : out  STD_LOGIC;
           FIFO_Pop : out  STD_LOGIC;
           FIFO_DI : out  STD_LOGIC_VECTOR (7 downto 0);
			  ReadCnt : out STD_LOGIC_VECTOR (3 downto 0);
           Address : out  STD_LOGIC_VECTOR (7 downto 0);
           Device_ID : out  STD_LOGIC_VECTOR (7 downto 0);
           X : out  STD_LOGIC_VECTOR (15 downto 0);
           Y : out  STD_LOGIC_VECTOR (15 downto 0);
           Z : out  STD_LOGIC_VECTOR (15 downto 0);
           NewData : out  STD_LOGIC);
end adxl345_driver;

architecture Behavioral of adxl345_driver is

	type state_t is (
		init, 
		push_addr_id, send_addr_id, busy_send_addr_id, receive_id, busy_receive_id, read_id, pop_id, store_id,
		stop
	);
	
	subtype byte_t is std_logic_vector(7 downto 0);

	constant WRITE_ADDRESS 				: byte_t := X"3A";
	constant READ_ADDRESS 				: byte_t := X"3B";
	constant DEVID_REG_ADDRESS 		: byte_t := X"00";
	constant BW_RATE_REG_ADDRESS 		: byte_t := X"2C";
	constant POWER_CTL_REG_ADDRESS 	: byte_t := X"2D";
	
	signal state : state_t;
	signal next_state: state_t;
	
	signal device_id_register : STD_LOGIC_VECTOR (7 downto 0);

begin
	
	fsm_main : process(Clk)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				state <= init;
			else
				state <= next_state;
			end if;
		end if;
	end process fsm_main;
	
	fsm_transition : process(state, Busy)
	begin
		next_state <= state;
		
		case state is
			when init =>
				next_state <= push_addr_id;
			when push_addr_id =>
				next_state <= send_addr_id;
			when send_addr_id =>
				next_state <= busy_send_addr_id;
			when busy_send_addr_id =>
				if Busy = '0' then
					next_state <= receive_id;
				end if;
			when receive_id =>
				next_state <= busy_receive_id;
			when busy_receive_id =>
				if Busy = '0' then
					next_state <= read_id;
				end if;
			when read_id =>
            next_state <= pop_id;
         when pop_id =>
            next_state <= store_id;
         when store_id =>
            if FIFO_Empty = '1' then
					next_state <= stop;
            else
					next_state <= read_id;
				end if;
			when stop =>
				next_state <= stop;
		end case;
		
	end process fsm_transition;
	
	read_device_id : process(Clk, state, next_state)
	begin
		if rising_edge(Clk) then
			if state = read_id then
				device_id_register <= FIFO_DO;
			end if;
		end if;
	end process read_device_id;
	
	FIFO_DI 		<=	DEVID_REG_ADDRESS when state = push_addr_id or next_state = push_addr_id else
						X"00";
	FIFO_Push 	<= '1' when state = push_addr_id else
						'0';
	Address 		<= WRITE_ADDRESS when state = send_addr_id or next_state = send_addr_id else
						READ_ADDRESS when state = receive_id or next_state = receive_id else
						X"00";
	Go 			<= '1' when state = send_addr_id or state = receive_id else
						'0';
	ReadCnt 		<= X"1" when state = receive_id or next_state = receive_id else
						X"0";
	FIFO_Pop 	<=	'1' when state = pop_id else
						'0';
	NewData 		<= '0';


	Device_ID <= device_id_register;
	X <= X"0000";
	Y <= X"0000";
	Z <= X"0000";
	
end Behavioral;

