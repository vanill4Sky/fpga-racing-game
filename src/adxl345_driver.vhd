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
    Port ( FIFO_Empty : in  STD_LOGIC;
			  FIFO_Full : in  STD_LOGIC;
			  FIFO_DO : in  STD_LOGIC_VECTOR (7 downto 0);
			  Busy : in  STD_LOGIC;
			  DataRate : in  STD_LOGIC_VECTOR (3 downto 0);
			  Reset : in  STD_LOGIC;
			  Clk : in  STD_LOGIC;
			  Go : out  STD_LOGIC;
			  Address : out  STD_LOGIC_VECTOR (7 downto 0);
			  ReadCnt : out STD_LOGIC_VECTOR (3 downto 0);
			  FIFO_Pop : out  STD_LOGIC;
			  FIFO_Push : out  STD_LOGIC;
			  FIFO_DI : out  STD_LOGIC_VECTOR (7 downto 0); 
		     NewData : out  STD_LOGIC;
			  Device_ID : out  STD_LOGIC_VECTOR (7 downto 0);
			  X : out  STD_LOGIC_VECTOR (15 downto 0);
			  Y : out  STD_LOGIC_VECTOR (15 downto 0);
			  Z : out  STD_LOGIC_VECTOR (15 downto 0));

end adxl345_driver;

architecture Behavioral of adxl345_driver is

	type state_t is (
		init, 
		push_addr_id, send_addr_id, busy_send_addr_id, receive_id, busy_receive_id, read_id, pop_id, store_id,
		push_addr_pc, push_data_pc, send_pc, busy_send_pc,
		push_addr_bwr, push_data_bwr, send_bwr, busy_send_bwr,
		stop
	);
	
	subtype byte_t is std_logic_vector(7 downto 0);

	constant WRITE_ADDRESS 				: byte_t := X"3A";
	constant READ_ADDRESS 				: byte_t := X"3B";
	constant DEVID_REG_ADDRESS 		: byte_t := X"00";
	constant BW_RATE_REG_ADDRESS 		: byte_t := X"2C";
	constant POWER_CTL_REG_ADDRESS 	: byte_t := X"2D";
	constant DATAX0_REG_ADDRESS		: byte_t := X"32";
	
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
	
	fsm_transition : process(state, Busy, FIFO_Empty)
	begin
		next_state <= state;
		
		case state is
		-- get slave device id
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
					next_state <= push_addr_pc;
            else
					next_state <= read_id;
				end if;
		-- configure accelerometer
			when push_addr_pc =>
				next_state <= push_data_pc;
			when push_data_pc =>
				next_state <= send_pc;
			when send_pc =>
				next_state <= busy_send_pc;
			when busy_send_pc =>
				if Busy = '0' then
					next_state <= push_addr_bwr;
				end if;
			when push_addr_bwr =>
				next_state <= push_data_bwr;
			when push_data_bwr =>
				next_state <= send_bwr;
			when send_bwr =>
				next_state <= busy_send_bwr;
			when busy_send_bwr =>
				if Busy = '0' then
					next_state <= stop;
				end if;
		-- read measurments
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
						POWER_CTL_REG_ADDRESS when state = push_addr_pc or next_state = push_addr_pc else
						"00001000" when state = push_data_pc or next_state = push_data_pc else
						BW_RATE_REG_ADDRESS when state = push_addr_bwr or next_state = push_addr_bwr else
						"0000" & DataRate when state = push_data_bwr or next_state = push_data_bwr else
						X"00";
	FIFO_Push 	<= '1' when state = push_addr_id or state = push_addr_pc or state = push_data_pc 
							or state = push_addr_bwr or state = push_data_bwr else
						'0';
	Address 		<= WRITE_ADDRESS when state = send_addr_id or next_state = send_addr_id
							or state = send_pc or next_state = send_pc 
							or state = send_bwr or next_state = send_bwr else
						READ_ADDRESS when state = receive_id or next_state = receive_id else
						X"00";
	Go 			<= '1' when state = send_addr_id or state = receive_id or state = send_pc
							or state = send_bwr else
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

