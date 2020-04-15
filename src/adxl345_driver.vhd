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
use IEEE.NUMERIC_STD.ALL;

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
		push_addr_data, send_addr_data, busy_send_addr_data, 
		receive_data, busy_receive_data, read_data, pop_data, check_data, output_data,
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
	signal data_x_register : STD_LOGIC_VECTOR (15 downto 0);
	signal data_y_register : STD_LOGIC_VECTOR (15 downto 0);
	signal data_z_register : STD_LOGIC_VECTOR (15 downto 0);

	signal byte_count : integer range 0 to 5 := 0;

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
		-- TODO send both data bytes at once
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
					next_state <= push_addr_data;
				end if;
		-- read measurments
			when push_addr_data =>
				next_state <= send_addr_data;
			when send_addr_data =>
				next_state <= busy_send_addr_data;
			when busy_send_addr_data =>
				if Busy = '0' then
					next_state <= receive_data;
				end if;
			when receive_data =>
				next_state <= busy_receive_data;
			when busy_receive_data =>
				if Busy = '0' then
					next_state <= read_data;
				end if;
			when read_data =>
				next_state <= pop_data;
			when pop_data =>
				next_state <= check_data;
			when check_data =>
				if FIFO_Empty = '1' then
					next_state <= output_data;
				else
					next_state <= read_data;
				end if;
			when output_data =>
				next_state <= stop;
			when stop =>
				next_state <= stop;
		end case;
	end process fsm_transition;
	
	store_device_id : process(Clk, state, next_state)
	begin
		if rising_edge(Clk) then
			if state = read_id then
				device_id_register <= FIFO_DO;
			end if;
		end if;
	end process store_device_id;
	
	store_data : process(Clk, state, next_state)
	begin
		if rising_edge(Clk) then
			if state = read_data then
				case byte_count is
					when 0 =>
						data_x_register(7 downto 0) <= FIFO_DO;
					when 1 =>
						data_x_register(15 downto 8) <= FIFO_DO;
					when 2 =>
						data_y_register(7 downto 0) <= FIFO_DO;
					when 3 =>
						data_y_register(15 downto 8) <= FIFO_DO;
					when 4 =>
						data_z_register(7 downto 0) <= FIFO_DO;
					when 5 =>
						data_z_register(15 downto 8) <= FIFO_DO;
				end case;
			end if;
		end if;
	end process store_data;
	
   count_bytes : process(Clk)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				byte_count <= 0;
			end if;
			if state = pop_data then
				if byte_count = 5 then
					byte_count <= 0;
				else
					byte_count <= byte_count + 1;
				end if;
			end if;
		end if;
	end process count_bytes;
	
	FIFO_DI 		<=	DEVID_REG_ADDRESS when state = push_addr_id or next_state = push_addr_id else
						POWER_CTL_REG_ADDRESS when state = push_addr_pc or next_state = push_addr_pc else
						"00001000" when state = push_data_pc or next_state = push_data_pc else
						BW_RATE_REG_ADDRESS when state = push_addr_bwr or next_state = push_addr_bwr else
						"0000" & DataRate when state = push_data_bwr or next_state = push_data_bwr else
						DATAX0_REG_ADDRESS when state = push_addr_data or next_state = push_addr_data else
						X"00";
	FIFO_Push 	<= '1' when state = push_addr_id or state = push_addr_pc or state = push_data_pc 
							or state = push_addr_bwr or state = push_data_bwr or state = push_addr_data else
						'0';
	Address 		<= WRITE_ADDRESS when state = send_addr_id or next_state = send_addr_id
							or state = send_pc or next_state = send_pc 
							or state = send_bwr or next_state = send_bwr
							or state = send_addr_data or next_state = send_addr_data else
						READ_ADDRESS when state = receive_id or next_state = receive_id 
							or state = receive_data or next_state = receive_data else
						X"00";
	Go 			<= '1' when state = send_addr_id or state = receive_id or state = send_pc
							or state = send_bwr or state = send_addr_data or state = receive_data else
						'0';
	ReadCnt 		<= X"1" when state = receive_id or next_state = receive_id else
						X"6" when state = receive_data or next_state = receive_data else
						X"0";
	FIFO_Pop 	<=	'1' when state = pop_id or state = pop_data else
						'0';
	NewData 		<= '1' when state = output_data else
						'0';


	Device_ID <= device_id_register;
	X <= data_x_register;
	Y <= data_y_register;
	Z <= data_z_register;
	
end Behavioral;

